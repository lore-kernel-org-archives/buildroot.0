From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] Re-add target/generic/Config.in
	options to menuconfig
Message-ID: <20101217160158.125AA8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=beb43c7d26eff220acb6de98300f4e0865352154
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The options to customize the hostname, the banner and the serial port
configuration are now inside a menu named 'System configuration'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in                |    2 ++
 target/generic/Config.in |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 874c20a..ff77449 100644
--- a/Config.in
+++ b/Config.in
@@ -334,6 +334,8 @@ endmenu
 
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
1.7.2.2
