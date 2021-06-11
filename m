From: John Keeping <john@metanate.com>
Date: Fri, 11 Jun 2021 19:00:27 +0100
Subject: [Buildroot] [PATCH] package/connman: security bump to 1.40
Message-ID: <20210611180027.1861091-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2021-33833 which is a stack buffer overflow in dnsproxy.

Release notes:
https://lore.kernel.org/connman/20210610113503.ob45lhssqy5hk4ki at beryllium.lan/

Signed-off-by: John Keeping <john@metanate.com>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 338e1919de..797448337c 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256  9f62a7169b7491c670a1ff2e335b0d966308fb2f62e285c781105eb90f181af3  connman-1.39.tar.xz
+sha256  1a57ae7ce234aa3a1744aac3be5c2121d98dce999440ef8ab9cc4edfd5edcb12  connman-1.40.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 77073f984e..0355426e92 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.39
+CONNMAN_VERSION = 1.40
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
-- 
2.32.0
