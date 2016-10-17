From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:05:56 -0300
Subject: [Buildroot] [PATCH 09/93] zip: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-10-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/zip/zip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index d2487b7..66d94b3 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -39,14 +39,14 @@ define ZIP_INSTALL_TARGET_CMDS
 endef
 
 define HOST_ZIP_BUILD_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(HOST_CFLAGS) $(ZIP_CFLAGS)" \
 		AS="$(HOSTCC) -c" \
 		-f unix/Makefile generic
 endef
 
 define HOST_ZIP_INSTALL_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
 		prefix=$(HOST_DIR)/usr
 endef
 
-- 
2.7.3
