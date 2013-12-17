From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Dec 2013 20:44:54 +0100
Subject: [Buildroot] [git commit] libroxml: fix staging install directory
	path
Message-ID: <20131217194503.CB4689C0CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cf02e6bfec9bfdb9d06081537b928e54623857c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libroxml/libroxml.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 3eefd9d..ca32bf9 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -13,7 +13,7 @@ define LIBROXML_BUILD_CMDS
 endef
 
 define LIBROXML_INSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
+	$(MAKE) DESTDIR=$(STAGING_DIR)/usr/ -C $(@D) install
 endef
 
 define LIBROXML_INSTALL_TARGET_CMDS
