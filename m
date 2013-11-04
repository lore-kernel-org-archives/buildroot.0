From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon,  4 Nov 2013 16:41:30 +0800
Subject: [Buildroot] [PATCH] libnl: FLAT: Avoid build feature cli when flat
	binary format is selected.
Message-ID: <1383554490-10749-1-git-send-email-sonic.zhang@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Feature cli depends on runtime library loader head dlfcn.h.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/libnl/libnl.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 5c884d7..90e588b 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -14,6 +14,10 @@ LIBNL_BINARIES = class-add class-delete class-list classid-lookup cls-add \
 	cls-delete cls-list link-list pktloc-lookup qdisc-add qdisc-delete \
 	qdisc-list
 
+ifeq ($(BR2_BINFMT_FLAT),y)
+LIBNL_CONF_OPT = --disable-cli
+endif
+
 define LIBNL_UNINSTALL_TARGET_CMDS
 	rm -r $(TARGET_DIR)/usr/lib/libnl.* $(TARGET_DIR)/usr/lib/libnl-*.*
 	rm -rf $(TARGET_DIR)/usr/lib/libnl
-- 
1.7.9.5
