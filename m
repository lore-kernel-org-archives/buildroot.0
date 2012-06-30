From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Jun 2012 10:32:14 +0200
Subject: [Buildroot] [git commit] mii-diag: link statically if
	configured to do so
In-Reply-To: <20120629121602.1b0fecd6@skate> (Thomas Petazzoni's message of
 "Fri, 29 Jun 2012 12:16:02 +0200")
References: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
 <20120629121602.1b0fecd6@skate>
Message-ID: <87txxt42up.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Le Wed, 27 Jun 2012 22:03:59 +0200,
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

 >> +MII_DIAG_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
 >> +
 >> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
 >> +MII_DIAG_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -static"
 >> +endif

 Thomas> I am not fully sure I like this. Do we want to have the same
 Thomas> stuff in all packages, or should we think about doing this
 Thomas> globally in some way?

Agree, I've added it globally now.

-- 
Bye, Peter Korsgaard
