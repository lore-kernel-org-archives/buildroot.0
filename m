From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Nov 2012 22:46:31 +0100
Subject: [Buildroot] [PATCH v2] imlib2: add license info
In-Reply-To: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
References: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1354311995-21598-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
v2: fix license according to Arnout's comments
---
 package/imlib2/imlib2.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 3c6c473..fa0f578 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -6,6 +6,9 @@
 IMLIB2_VERSION = 1.4.5
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
+IMLIB2_LICENSE = imlib2 license
+IMLIB2_LICENSE_FILES = COPYING
+
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
 IMLIB2_CONF_OPT = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
@@ -61,4 +64,3 @@ endef
 IMLIB2_POST_INSTALL_STAGING_HOOKS += IMLIB2_FIXUP_IMLIB2_CONFIG
 
 $(eval $(autotools-package))
-
-- 
1.8.0.1
