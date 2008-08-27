From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:31 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  fbdump
In-Reply-To: <20080827110117.2A7173C847@busybox.net> (laird@uclibc.org's
	message of "Wed\, 27 Aug 2008 04\:01\:17 -0700 \(PDT\)")
References: <20080827110117.2A7173C847@busybox.net>
Message-ID: <87myiy3dto.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laird" == laird  <laird@uclibc.org> writes:

Hi,

 laird> Added: trunk/buildroot/package/fbdump/Config.in
 laird> ===================================================================
 laird> --- trunk/buildroot/package/fbdump/Config.in	                        (rev 0)
 laird> +++ trunk/buildroot/package/fbdump/Config.in	2008-08-27 11:01:16 UTC (rev 23239)
 laird> @@ -0,0 +1,7 @@
 laird> +config BR2_PACKAGE_FBDUMP
 laird> +	bool "fbdump (Framebuffer Capture Tool)"
 laird> +	help
 laird> +	   fbdump is a simple tool to capture snapshots from the Linux kernel framebuffer
 laird> +	   device and write them out as a PPM file. Currently, most packed-pixel framebuffer
 laird> +       formats and the vga16 framebuffer are supported.

The last line is fubar'ed (should be tab + 2 spaces):

package/fbdump/Config.in:6: unknown option "formats"

The other lines are also indented 1 char too much (2 spaces, not 3).

While you're at it, please break up the lines after ~72 chars so it's
visible in kconfig on a normal 80 char terminal without scrolling.

 laird> +FBDUMP_VERSION:=0.4.2
 laird> +FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
 laird> +FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
 laird> +FBDUMP_AUTORECONF = NO
 laird> +FBDUMP_CONF_ENV = ac_cv_func_malloc_0_nonnull=yes
 laird> +FBDUMP_INSTALL_STAGING = YES

Why install into staging?

 laird> +FBDUMP_INSTALL_TARGET = YES
 laird> +FBDUMP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 laird> +
 laird> +$(eval $(call AUTOTARGETS,package,fbdump))
 laird> +

-- 
Bye, Peter Korsgaard
