From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 13 Apr 2017 08:07:26 +0300
Subject: [Buildroot] [PATCH] trinity: fix glibc/kernel headers conflict
Message-ID: <0c3077fb3a4c82ea2570106a3357e9cae19cdd3d.1492060046.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch that fixes conflicting definitions of ax25 related structs.

Fixes:
http://autobuild.buildroot.net/results/b40/b40d045f41dc4dbc66d5092ea5e9e045cd825e31/
http://autobuild.buildroot.net/results/367/367199b6071c450159aa2ea74d6d1b4b7cb89a88/
http://autobuild.buildroot.net/results/35e/35e97e51a6f7184d7b708c62a726ab91a0f546b2/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/trinity/trinity.hash | 1 +
 package/trinity/trinity.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
index e290a40920af..5bf9992dca84 100644
--- a/package/trinity/trinity.hash
+++ b/package/trinity/trinity.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 3ef7ae05dba14f8bb626121983a08bb09d1d51a19de38bd9a8e0f29b11d9e3c9  trinity-v1.6.tar.gz
+sha256 5601474b10973b99f6f4ecc67c8ac54000754d7110553cc81c7648bd7e73c810  b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index fa5a280b1e43..c9f09b1e019e 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -9,6 +9,8 @@ TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
 TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
 
+TRINITY_PATCH = https://github.com/kernelslacker/trinity/commit/b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch
+
 define TRINITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.sh)
 endef
-- 
2.11.0
