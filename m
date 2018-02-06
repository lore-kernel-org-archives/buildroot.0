From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 09:07:45 +0100
Subject: [Buildroot] [git commit] lightning: fix build issue by bumping to
 2.1.2
Message-ID: <20180206083307.9D86B88479@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c08a2d5fd310fb2f5fd03c7c8f534c0db8b8045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current version of lightning doesn't build with recent versions of
binutils. Since this has been fixed upstream in a dot release, let's
bump to the upstream version that has the fix.

While at it, add a hash for the license file.

Fixes:

  http://autobuild.buildroot.net/results/51424c044e11b89544824dbdf1af45b05b499ba4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lightning/lightning.hash | 3 ++-
 package/lightning/lightning.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lightning/lightning.hash b/package/lightning/lightning.hash
index 4805686e98..8e78ef4f81 100644
--- a/package/lightning/lightning.hash
+++ b/package/lightning/lightning.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	1fa3a2421852598b3162d6765645bb3cd0fccb5f0c105d0800c64c8428b749a6	lightning-2.1.0.tar.gz
+sha256	9b289ed1c977602f9282da507db2e980dcfb5207ee8bd2501536a6852a157a69	lightning-2.1.2.tar.gz
+sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LESSER
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 2b4931becc..b93946146d 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIGHTNING_VERSION = 2.1.0
+LIGHTNING_VERSION = 2.1.2
 LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
