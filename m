From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 15:09:27 +0200
Subject: [Buildroot] [v5 04/11] support/download: make sure the download
 folder is created
In-Reply-To: <20180402130934.19274-1-maxime.hadjinlian@gmail.com>
References: <20180402130934.19274-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402130934.19274-4-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the moment, it means that we make sure that BR2_DL_DIR is created, in
the future, it will make sure that BR2_DL_DIR/PKG_NAME/ is created.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index d309f7612c..e88d3f9fda 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -88,6 +88,7 @@ endif
 endif
 
 define DOWNLOAD
+	$(Q)mkdir -p $($(PKG)_DL_DIR)/
 	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1))) \
 	$(EXTRA_ENV) $(DL_WRAPPER) \
 		-c $($(PKG)_DL_VERSION) \
-- 
2.16.2
