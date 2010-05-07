From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 May 2010 00:11:46 +0200
Subject: [Buildroot] [git commit master] xapp_bdftopcf: enable for the host
Message-ID: <20100507223515.25B768F341@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=34fec71532c29942e5b971b87ba7518963149730
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compiling xfonts require having bdftopcf installed on the
host. Therefore, enable host support for this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 5af94ee..0350a87 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -9,5 +9,7 @@ XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
 XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BDFTOPCF_AUTORECONF = NO
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
+HOST_XAPP_BDFTOPCF_DEPENDENCIES = host-xlib_libXfont
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_bdftopcf))
+$(eval $(call AUTOTARGETS,package/x11r7,xapp_bdftopcf,host))
-- 
1.6.3.3
