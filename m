From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:10:27 +0200
Subject: [Buildroot] [git commit] Revert "package/automake: bump version to
 1.16.1"
Message-ID: <20180716111040.6033088510@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c699f5ab5a9d86d4416647a3ba9405476bf6bb9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit d36a01273b4d6be2758682784c47ee4e2e610090, which
causes several build breakage. The squid build breakage has a proposed
fix, but it has some comments from Arnout.

In order to reduce the build failure noise in the autobuilders, let's
revert back to the previous version of automake.

Fixes (or rather avoids):

  http://autobuild.buildroot.net/results/2f6ac1663681b702538a2163a02e030880075eda/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/automake/automake.hash | 2 +-
 package/automake/automake.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.hash b/package/automake/automake.hash
index 9ff55a4bae..b194c3c2bc 100644
--- a/package/automake/automake.hash
+++ b/package/automake/automake.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 5d05bb38a23fd3312b10aea93840feec685bdf4a41146e78882848165d3ae921  automake-1.16.1.tar.xz
+sha256 af6ba39142220687c500f79b4aa2f181d9b24e4f8d8ec497cea4ba26c64bedaf  automake-1.15.1.tar.xz
 # License files, locally calculated
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 92e7d64666..270337712e 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.16.1
+AUTOMAKE_VERSION = 1.15.1
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPL-2.0+
