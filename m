From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 23:14:01 +0100
Subject: [Buildroot] [PATCH] wireguard: bump to version 0.0.20171111
Message-ID: <20171113221401.26694-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contains a number of important fixes. From the relase notes:

https://lists.zx2c4.com/pipermail/wireguard/2017-November/001935.html

  * netlink: plug memory leak
  * qemu: check for memory leaks

  There was a small memory leak on the netlink configuration layer that's now
  been fixed.

  * netlink: make sure we reserve space for NLMSG_DONE

  A rather important change - due to an upstream kernel bug, that's existed
  since the advent of netlink itself, sometimes wg(8) failed to receive valid
  data back from kernelspace, resulting in "ENOBUFS" when trying to dump all
  peers. This patch works around it while we wait for upstream to commit the
  fix.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 050d466471..3749456cb0 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2017-November/001881.html
-sha256 096b6482a65e566c7bf8c059f5ee6aadb2de565b04b6d810c685f1c377540325  WireGuard-0.0.20171101.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2017-November/001935.html
+sha256 d9347786a9406ac276d86321ca64aadb1f0639cb0582c6e0519c634cf6e81157  WireGuard-0.0.20171111.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 63d536681a..2eacb22a4b 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20171101
+WIREGUARD_VERSION = 0.0.20171111
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.11.0
