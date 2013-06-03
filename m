From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Jun 2013 16:37:26 +0200
Subject: [Buildroot] [PATCH] libbsd: doesn't have any license files
In-Reply-To: <1370264608-2698-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 3 Jun 2013 10:03:28 -0300")
References: <1370264608-2698-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a9n7i7kp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fixes autobuilder error:
 Gustavo> http://autobuild.buildroot.net/results/ccd/ccd2f3fe69a3e0321685daf95f85eca5ba2d64cf/

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/libbsd/libbsd.mk | 1 -
 Gustavo>  1 file changed, 1 deletion(-)

 Gustavo> diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
 Gustavo> index 3af1002..d5a4c39 100644
 Gustavo> --- a/package/libbsd/libbsd.mk
 Gustavo> +++ b/package/libbsd/libbsd.mk
 Gustavo> @@ -8,7 +8,6 @@ LIBBSD_VERSION         = 0.4.2
 Gustavo>  LIBBSD_SOURCE          = libbsd-$(LIBBSD_VERSION).tar.gz
 Gustavo>  LIBBSD_SITE            = http://libbsd.freedesktop.org/releases
 Gustavo>  LIBBSD_LICENSE         = BSD-3c MIT
 Gustavo> -LIBBSD_LICENSE_FILES   = LICENSE

No, but it does have COPYING:

ls output/build/libbsd-0.4.2
aclocal.m4  ChangeLog    configure.ac  include      Makefile.in  src
autogen     config.h.in  COPYING       m4           man          test
build-aux   configure    get-version   Makefile.am  README       TODO

I've changed it to use that instead and committed, thanks.

-- 
Bye, Peter Korsgaard
