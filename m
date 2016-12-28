From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Dec 2016 00:15:07 +0100
Subject: [Buildroot] [PATCH 2/2] collectd: fix riemann write plugin
	dependencies
In-Reply-To: <20161228232135.2946638d@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 28 Dec 2016 23:21:35 +0100")
References: <20161228221806.32321-1-peter@korsgaard.com>
 <20161228221806.32321-2-peter@korsgaard.com>
 <20161228232135.2946638d@free-electrons.com>
Message-ID: <87lguzabno.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 28 Dec 2016 23:18:06 +0100, Peter Korsgaard wrote:

 >> -	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),libtool protobuf-c) \
 >> +	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),libtool riemann-c-client) \

 > libtool is still needed ?

Yes, it still contains an #include <ltdl.h> line at least:

src/write_riemann_threshold.c:#include <ltdl.h>

I haven't looked closer to see if that include is still really needed
though.

-- 
Bye, Peter Korsgaard
