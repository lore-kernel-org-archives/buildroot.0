From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 10:14:27 +0200
Subject: [Buildroot] [v4 06/13] support/download: make sure the download
 folder is created
In-Reply-To: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402081434.4411-6-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the moment, it means that we make sure that BR2_DL_DIR is created, in
the future, it will make sure that BR2_DL_DIR/PKG_NAME/ is created.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 151b2e5423..e88d3f9fda 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -88,7 +88,8 @@ endif
 endif
 
 define DOWNLOAD
-	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1));) \
+	$(Q)mkdir -p $($(PKG)_DL_DIR)/
+	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1))) \
 	$(EXTRA_ENV) $(DL_WRAPPER) \
 		-c $($(PKG)_DL_VERSION) \
 		-f $(notdir $(1)) \
-- 
2.16.2
