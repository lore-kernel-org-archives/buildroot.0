From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 22:22:45 +0100
Subject: [Buildroot] [PATCH 1/6] imagemagick: remove *-config scripts from
	TARGET_DIR
In-Reply-To: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50e73c6f783d38c17d7bafc4bcfd9a6e826b0d73.1299532965.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 97c0041..7955db7 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -80,4 +80,14 @@ else
 IMAGEMAGICK_CONF_OPT += --without-tiff
 endif
 
+define IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
+	$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,	\
+		   $(addsuffix -config,			\
+		     Magick MagickCore MagickWand Wand Magick++))
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+IMAGEMAGICK_POST_INSTALL_TARGET_HOOKS += IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
+endif
+
 $(eval $(call AUTOTARGETS,package,imagemagick))
-- 
1.7.0.4
