From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:34:58 +0100
Subject: [Buildroot] [git commit] binutils: use binutils 2.25.1 by default
Message-ID: <20160310223546.CE0BE818DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=457eb9c9ae6857c5c635f1d2576cd098acbdc5ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent commit 5eb37d6adcfef996f1cd71effec8c2af42c0aed3 broke the build
by default to binutils 2.25 for the target, while we only have hashes
for 2.25.1. Use 2.25.1 instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index a40fdb7..66ee247 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2015.12
 else
-BINUTILS_VERSION = 2.25
+BINUTILS_VERSION = 2.25.1
 endif
 endif # BINUTILS_VERSION
 
