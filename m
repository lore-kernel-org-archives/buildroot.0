From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Dec 2013 20:33:01 +0100
Subject: [Buildroot] [PATCH] nodejs: Bump to version 0.10.12
In-Reply-To: <1387242975-5074-1-git-send-email-paul@crapouillou.net> (Paul
 Cercueil's message of "Tue, 17 Dec 2013 02:16:15 +0100")
References: <1387242975-5074-1-git-send-email-paul@crapouillou.net>
Message-ID: <87iounp91u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > This makes building on mipsel possible (hard-float variant only).
 > Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
 > ---
 >  package/nodejs/Config.in                 |  3 ++-
 >  package/nodejs/nodejs-v8-gregs-fix.patch | 29 -----------------------------
 >  package/nodejs/nodejs.mk                 |  4 +++-
 >  3 files changed, 5 insertions(+), 31 deletions(-)
 >  delete mode 100644 package/nodejs/nodejs-v8-gregs-fix.patch

 > diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
 > index 0258460..7c08f83 100644
 > --- a/package/nodejs/Config.in
 > +++ b/package/nodejs/Config.in
 > @@ -4,7 +4,8 @@ config BR2_PACKAGE_NODEJS
 >  	depends on BR2_LARGEFILE
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 >  	depends on BR2_INSTALL_LIBSTDCPP
 > -	depends on BR2_arm || BR2_i386 || BR2_x86_64
 > +	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 > +	depends on !BR2_MIPS_SOFT_FLOAT
 >  	# ARM needs BLX, so v5t+
 >  	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 >  	# uses fork()

You forgot to adjust the arch dependency on the comment below.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
