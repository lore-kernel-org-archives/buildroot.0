From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Sep 2019 23:50:52 +0200
Subject: [Buildroot] [PATCH] package/bitcoin: fixup the 'v' prefix in the
 version
Message-ID: <20190905215052.20486-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for the bitcoin version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
BITCOIN_SITE and not BITCOIN_VERSION.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bitcoin/bitcoin.hash | 2 +-
 package/bitcoin/bitcoin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 96edd22959..2a71084d97 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c8557b6df5f5cdf67b3ddf6fe501cfc6e0be698f175f16927dd08d6040df7d9f  bitcoin-v0.16.3.tar.gz
+sha256 c8557b6df5f5cdf67b3ddf6fe501cfc6e0be698f175f16927dd08d6040df7d9f  bitcoin-0.16.3.tar.gz
 sha256 70223369f70e8cb550e75aa74eb86bfa5220fb09c0ba0549d91c36587d15d1a0  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 78170abcc7..eefde1df96 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = v0.16.3
-BITCOIN_SITE = $(call github,bitcoin,bitcoin,$(BITCOIN_VERSION))
+BITCOIN_VERSION = 0.16.3
+BITCOIN_SITE = $(call github,bitcoin,bitcoin,v$(BITCOIN_VERSION))
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
-- 
2.21.0
