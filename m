From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 29 Mar 2013 20:16:32 +0000
Subject: [Buildroot] TOP_SRCDIR:  Where is it defined?
Message-ID: <F9C551623D2CBB4C9488801D14F864C610C1A21F@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Within the pkg-generic file, TOP_SRCDIR is used to define
$(PKG)_DIR_PREFIX:

buildroot-2013.02$ grep -R "TOP_SRCDIR" .
grep: ./system/skeleton/dev/log: No such file or directory
grep: ./system/skeleton/etc/resolv.conf: No such file or directory
./package/pkg-generic.mk:$(2)_DIR_PREFIX                        = $(if $(4),$(4),$(TOP_SRCDIR)/package)

This would be a problem only for some entity (which didn't set $4 to
$(call pkgparentdir)) directly calling inner-generic-package as
generic-package does do the call to pkgparentdir.

I'm just thinking this should be changed, however, I'm clueless about
the vision the developer who added this had in mind for TOP_SRCDIR, so
I have no suggestion how to change it.

FWIW,
Andy
