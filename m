From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 16 Feb 2021 13:50:30 +0100
Subject: [Buildroot] [PATCH] package/tcpdump: remove duplicated binary
Message-ID: <20210216125031.2244-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Since tcpdump 4.99.0, the 'tcpdump' binary is no longer installed in
/usr/sbin but in /usr/bin. This change invalidates the Buildroot hook
'TCPDUMP_REMOVE_DUPLICATED_BINARY', causing a fairly large rootfs size
increase as a result.

Update the path inside this hook.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/tcpdump/tcpdump.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index f8ea6576ee..c562034a4e 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -22,7 +22,7 @@ TCPDUMP_SELINUX_MODULES = netutils
 
 # make install installs an unneeded extra copy of the tcpdump binary
 define TCPDUMP_REMOVE_DUPLICATED_BINARY
-	rm -f $(TARGET_DIR)/usr/sbin/tcpdump.$(TCPDUMP_VERSION)
+	rm -f $(TARGET_DIR)/usr/bin/tcpdump.$(TCPDUMP_VERSION)
 endef
 
 TCPDUMP_POST_INSTALL_TARGET_HOOKS += TCPDUMP_REMOVE_DUPLICATED_BINARY
-- 
2.26.2
