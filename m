From: Andreas Ziegler <br015@umbiko.net>
Date: Tue,  8 Jun 2021 10:53:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpcbind fix version number
Message-ID: <20210608085332.19296-1-br015@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d13b292cec8166c4712cf4a0defbeee827ffaf78 introduced a patch for rpcbind but also changed the version number to a non-existing value. 

Change rpcbind to last released version and adapt hash value. 

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/rpcbind/rpcbind.hash | 2 +-
 package/rpcbind/rpcbind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index 1960b86c13..6ab7d89265 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 2ce360683963b35c19c43f0ee2c7f18aa5b81ef41c3fdbd15ffcb00b8bffda7a  rpcbind-1.2.5.tar.bz2
+sha256 5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de  rpcbind-1.2.6.tar.bz2
 sha256 2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index fea2103794..d9f25e698e 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 1.3.2
+RPCBIND_VERSION = 1.2.6
 RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
-- 
2.25.1
