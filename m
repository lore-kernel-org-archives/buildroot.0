From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Feb 2016 16:53:29 +0100
Subject: [Buildroot] [PATCH v6 01/13] package/linux-headers: cleanup
	installation
In-Reply-To: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1454342021-22960-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch removes unnecessary files generated during installation.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v5 -> v6:
- new patch
---
 package/linux-headers/linux-headers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 1b8b81b..872ef8f 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -53,6 +53,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
 			HOSTCXX="$(HOSTCXX)" \
 			INSTALL_HDR_PATH=$(STAGING_DIR)/usr \
 			headers_install)
+	find $(STAGING_DIR)/usr \( -name .install -o -name ..install.cmd \) -delete
 endef
 
 ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
-- 
2.7.0
