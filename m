From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Nov 2011 21:03:46 +0100
Subject: [Buildroot] [PATCH] Bump version of htop to 1.0.
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60DA8AE@ex-mb1.corp.adtran.com>
 (ANDY KENNEDY's message of "Wed, 23 Nov 2011 18:36:48 +0000")
References: <F9C551623D2CBB4C9488801D14F864C60DA8AE@ex-mb1.corp.adtran.com>
Message-ID: <87mxbiirbx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

 ANDY> htop 1.0 was released 11-2011.  Bumping version in BuildRoot
 ANDY> from 0.9 to 1.0.

 ANDY> Signed-off-by:  Andy Kennedy <Andy.Kennedy@Adtran.com>
 ANDY> ---
 ANDY> diff -Naur a/package/htop/htop.mk b/package/htop/htop.mk
 ANDY> --- a/package/htop/htop.mk      2011-11-22 13:59:37.000000000 -0600
 ANDY> +++ b/package/htop/htop.mk      2011-11-23 12:25:53.000000000 -0600
 ANDY> @@ -4,10 +4,11 @@
 ANDY>  #
 ANDY>  #############################################################

 ANDY> -HTOP_VERSION = 0.9
 ANDY> +HTOP_VERSION = 1.0
 ANDY>  HTOP_SOURCE = htop-$(HTOP_VERSION).tar.gz
 ANDY>  HTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/htop/$(HTOP_VERSION)
 ANDY>  HTOP_DEPENDENCIES = ncurses
 ANDY>  HTOP_AUTORECONF = YES
 ANDY> +HTOP_CONF_OPT += --disable-unicode

 ANDY> -$(eval $(call AUTOTARGETS))
 ANDY> +$(eval $(call AUTOTARGETS,package,htop))

Don't change this. The package dir / name arguments are no longer
needed.

Other than that it looks fine, committed to next - Thanks.

-- 
Bye, Peter Korsgaard
