From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 14:53:02 +0100
Subject: [Buildroot] [git commit] lshw: add upstream patch to fix build on
	Blackfin
Message-ID: <20160220135307.5A9748081D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0500c7c603e8f384daf380a56ab2b6703b988d06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Blackfin, the build fails due to the use of the L suffix instead of
LL. To fix this, this commit adds an upstream patch from the project
Github repository.

Fixes:

  http://autobuild.buildroot.org/results/6d7d2034836e0d8705bba2f2597d3e1cde2c43b8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lshw/lshw.hash | 1 +
 package/lshw/lshw.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lshw/lshw.hash b/package/lshw/lshw.hash
index 416d496..8dfc7d3 100644
--- a/package/lshw/lshw.hash
+++ b/package/lshw/lshw.hash
@@ -2,3 +2,4 @@
 sha256	eb9cc053fa0f1e78685cb695596e73931bfb55d2377e3bc3b8b94aff4c5a489c	lshw-B.02.17.tar.gz
 sha256	2e5a3d63da8475db17fd90969bcb1930cf19d2b8da7be41edeea5c2a53878382	no-private-uint.patch
 sha256	c8365f7ac8fc7a751c78d89ab446111bb1a235bc977a1b21e1b826c2e62361d1	basename-limits-long-bits.patch
+sha256	9eba284061574e02a6b162ab20dff07c48693e00f781220ee974ba5c90d1cca9	988f5449791ebf869ab9fa7520463dab4eae3404.patch
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index a4a2603..e8e67e2 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -8,7 +8,8 @@ LSHW_VERSION = B.02.17
 LSHW_SITE = http://ezix.org/software/files
 LSHW_PATCH = \
 	http://git.alpinelinux.org/cgit/aports/plain/testing/lshw/basename-limits-long-bits.patch \
-	http://git.alpinelinux.org/cgit/aports/plain/testing/lshw/no-private-uint.patch
+	http://git.alpinelinux.org/cgit/aports/plain/testing/lshw/no-private-uint.patch \
+	https://github.com/lyonel/lshw/commit/988f5449791ebf869ab9fa7520463dab4eae3404.patch
 LSHW_LICENSE = GPLv2
 LSHW_LICENSE_FILES = COPYING
 
