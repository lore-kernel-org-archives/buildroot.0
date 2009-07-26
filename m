From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jul 2009 00:15:55 +0200
Subject: [Buildroot] [git commit] target/device/xtensa: only override
	makedevs target for xtensa builds
Message-ID: <20090726221821.63C7877806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b471c096d1f76a2d112eb4c9a5c3d53d861d8e22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/device/xtensa/Makefile.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/target/device/xtensa/Makefile.in b/target/device/xtensa/Makefile.in
index f324896..7c95c23 100644
--- a/target/device/xtensa/Makefile.in
+++ b/target/device/xtensa/Makefile.in
@@ -1,3 +1,5 @@
+ifeq ($(BR2_xtensa),y)
+
 ifeq ($(strip $(BR2_TARGET_XTENSA_XTAV60)),y)
 # UCLIBC_CONFIG_FILE:=target/device/xtensa/xtav60/uClibc.config
 # BR2_PACKAGE_BUSYBOX_CONFIG:=target/device/xtensa/xtav60/busybox.config
@@ -12,3 +14,4 @@ makedevs:
 	cp -f $(OLD_TARGET_DEVICE_TABLE) $(TARGET_DEVICE_TABLE)
 	patch -p1 -g 0 < target/device/xtensa/device_table.diff
 
+endif
-- 
1.6.3.3
