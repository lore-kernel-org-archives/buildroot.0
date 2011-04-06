From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:12 +0200
Subject: [Buildroot] [PATCH 58/63] xfont_encodings: version bump to 1.0.4
	and add --with-fontrootdir option
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-59-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/xfont_encodings/xfont_encodings.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index ed94e49..3d66dd6 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-XFONT_ENCODINGS_VERSION = 1.0.3
+XFONT_ENCODINGS_VERSION = 1.0.4
 XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
 XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_AUTORECONF = NO
 XFONT_ENCODINGS_MAKE_OPT =
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 HOST_XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
+HOST_XFONT_ENCODINGS_CONF_OPT += --with-fontrootdir=$(HOST_DIR)/usr/share/fonts
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_encodings))
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_encodings,host))
+
-- 
1.7.3.4
