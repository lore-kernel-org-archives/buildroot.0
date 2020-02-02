From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  2 Feb 2020 01:55:26 -0700
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: add backporting
 requirement note to bitcoin package
Message-ID: <20200202085526.35742-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bitcoin/bitcoin.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 040c55b8a6..c58bd9797c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,6 +4,10 @@
 #
 ################################################################################
 
+# Major version updates must be backported unconditionally, if backporting
+# is not feasible the bitcoin package must be removed from any such branches.
+# Details:
+# https://bitcoinmagazine.com/articles/linux-distribution-packaging-and-bitcoin-1374549783
 BITCOIN_VERSION = 0.19.0.1
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_AUTORECONF = YES
-- 
2.20.1
