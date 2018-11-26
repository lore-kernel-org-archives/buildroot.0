From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 12:51:41 +0100
Subject: [Buildroot] [PATCH-2018.02.x] mosquitto: fix build on uClibc
In-Reply-To: <20181126082534.20928-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 26 Nov 2018 09:25:34 +0100")
References: <20181126082534.20928-1-peter@korsgaard.com>
Message-ID: <87va4kxdiq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/c42/c425eb496cc5422ff1e2e51e59d4baf377bcbeed/

 > The memory tracking feature of mosquitto (which is enabled by default on
 > systems defining __GLIBC__) uses malloc_usable_size() which was only added
 > to uClibc-ng in 1.0.29.

 > 2018.02.x still uses 1.0.28, so disable this feature when building on
 > uClibc.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
