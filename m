From: Reuben Dowle <reuben.dowle@4rf.com>
Date: Thu, 14 Feb 2013 01:12:02 +0000
Subject: [Buildroot] [PATCH] dmalloc: Stop libdmalloc*.so files from being
 deleted from staging directory
Message-ID: <069B5A25F9844945B625ADE7258AC94C061E73B0@4rf-nz-orion.local.4rf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix libdmalloc*.so files being deleted from the staging directory as the
package is installed into the target.

Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com>
---
 package/dmalloc/dmalloc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 8623829..ee7799b 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -47,7 +47,7 @@ define DMALLOC_INSTALL_STAGING_CMDS
 endef

 define DMALLOC_INSTALL_TARGET_CMDS
-       mv $(STAGING_DIR)/usr/lib/libdmalloc*.so $(TARGET_DIR)/usr/lib
+       cp -dpf $(STAGING_DIR)/usr/lib/libdmalloc*.so $(TARGET_DIR)/usr/lib
        cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/usr/bin/dmalloc
 endef

--
1.7.10.4
The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
