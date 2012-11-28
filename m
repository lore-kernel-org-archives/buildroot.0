From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Nov 2012 10:58:52 -0800
Subject: [Buildroot] [PATCH v2] libpcap: fix static build
In-Reply-To: <1354113758-23544-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 28 Nov 2012 15:42:38 +0100")
References: <1354113758-23544-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87boehzh8z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The libpcap package contained some interesting attempts to support a
 Thomas> static-only build, but it was not working:

 Thomas>  http://autobuild.buildroot.org/results/01038d3b970092d894d2bae80679247e65722785/build-end.log

 Thomas> In fact the configure.in of libpcap has provision to support
 Thomas> --enable-shared/--disable-shared, but the generated configure script
 Thomas> in the libpcap package has not been regenerated with the configure.in
 Thomas> changes.

 Thomas> So basically, enabling LIBPCAP_AUTORECONF=YES ensures that the
 Thomas> configure script gets generated, which brings us a working
 Thomas> --enable-shared / --disable-shared.

Committed, thanks.

-- 
Bye, Peter Korsgaard
