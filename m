From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Nov 2017 00:08:43 +0100
Subject: [Buildroot] [PATCH 6/8] packages: fix trailing spaces and slash
In-Reply-To: <cover.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <aefa5c8ef3aac130f3a536e692e520affede8e4e.1511996903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... as reported by utils/check-package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/busybox/busybox.mk | 2 +-
 package/ntp/ntp.mk         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1aeeeef4bf..8b720b30b8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -65,7 +65,7 @@ define BUSYBOX_PERMISSIONS
 # Set permissions on all applets with BB_SUID_REQUIRE and BB_SUID_MAYBE.
 # 12 Applets are pulled from applets.h using grep command :
 #  grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE" \
-#  $(@D)/include/applets.h 
+#  $(@D)/include/applets.h
 # These applets are added to the device table and the makedev file
 # ignores the files with type 'F' ( optional files).
 	/usr/bin/wall 			 F 4755 0  0 - - - - -
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 6605c3b85b..05619aef7c 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -17,7 +17,7 @@ NTP_CONF_OPTS = \
 	--disable-tickadj \
 	--disable-debugging \
 	--with-yielding-select=yes \
-	--disable-local-libevent \
+	--disable-local-libevent
 
 # 0002-ntp-syscalls-fallback.patch
 # 0003-ntpq-fpic.patch
-- 
2.11.0
