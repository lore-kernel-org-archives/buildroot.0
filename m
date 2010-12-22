From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 18:25:21 +0100
Subject: [Buildroot] [PATCH 2/7] imagemagick: remove *-config scripts from
	TARGET_DIR
In-Reply-To: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3f29fe94726ed9c3c04e46626f138dd026b7b9b7.1293038710.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index aecf7ae..035ab7a 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -80,4 +80,12 @@ else
 IMAGEMAGICK_CONF_OPT += --without-tiff
 endif
 
+define IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
+	$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,	\
+		   $(addsuffix -config,			\
+		     Magick MagickCore MagickWand Wand))
+endef
+
+IMAGEMAGICK_POST_INSTALL_TARGET_HOOKS += IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
+
 $(eval $(call AUTOTARGETS,package,imagemagick))
-- 
1.7.0.4
