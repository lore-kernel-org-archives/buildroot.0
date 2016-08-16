From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 16 Aug 2016 10:21:10 -0500
Subject: [Buildroot] [PATCH] skeleton: /etc/network/interface.d/* support
Message-ID: <1471360870-53982-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/skeleton/skeleton.mk                    | 2 ++
 system/device_table.txt                         | 1 +
 system/skeleton/etc/network/interfaces.d/.empty | 0
 3 files changed, 3 insertions(+)
 create mode 100644 system/skeleton/etc/network/interfaces.d/.empty

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 1000161..c9dce10 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -151,6 +151,8 @@ define SKELETON_SET_NETWORK_LOCALHOST
 		echo ;                                               \
 		echo "auto lo";                                      \
 		echo "iface lo inet loopback";                       \
+		echo ;                                               \
+		echo "source interfaces.d/*";                        \
 	) > $(TARGET_DIR)/etc/network/interfaces
 endef
 
diff --git a/system/device_table.txt b/system/device_table.txt
index dc1af51..69b1d46 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -17,5 +17,6 @@
 /etc/network/if-pre-up.d		d	755	0	0	-	-	-	-	-
 /etc/network/if-down.d			d	755	0	0	-	-	-	-	-
 /etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
+/etc/network/interfaces.d		d	755	0	0	-	-	-	-	-
 # uncomment this to allow starting x as non-root
 #/usr/X11R6/bin/Xfbdev		     	f	4755	0	0	-	-	-	-	-
diff --git a/system/skeleton/etc/network/interfaces.d/.empty b/system/skeleton/etc/network/interfaces.d/.empty
new file mode 100644
index 0000000..e69de29
-- 
1.9.1
