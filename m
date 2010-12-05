From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:44 +0100
Subject: [Buildroot] [PATCH 13/55] Re-add target/generic/Config.in options
	to menuconfig
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a7b87d06d5a2eb049c226f638c4ccd777295cc81.1291582351.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The options to customize the hostname, the banner and the serial port
configuration are now inside a menu named 'System configuration'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                |    2 ++
 target/generic/Config.in |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 4214112..1c647d2 100644
--- a/Config.in
+++ b/Config.in
@@ -326,6 +326,8 @@ endmenu
 
 source "toolchain/Config.in"
 
+source "target/generic/Config.in"
+
 source "package/Config.in"
 
 source "fs/Config.in"
diff --git a/target/generic/Config.in b/target/generic/Config.in
index 54ff1d6..81ac011 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -1,4 +1,4 @@
-if !(BR2_TARGET_ATMEL||BR2_TARGET_KWIKBYTE||BR2_TARGET_VALKA)
+menu "System configuration"
 
 config BR2_TARGET_GENERIC_HOSTNAME
        string "System hostname"
@@ -166,4 +166,4 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 
 endif # BR2_TARGET_GENERIC_GETTY
 
-endif
+endmenu
-- 
1.7.0.4
