From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:21:04 +0200
Subject: [Buildroot] [git commit] package/gflags: include TARGET_CXXFLAGS to
	the overloaded CXXFLAGS
Message-ID: <20161022144115.8E879819CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b353ce1315270e228d8c24f209f2037eec41b601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gflags/gflags.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
index 9dc4e15..89111ed 100644
--- a/package/gflags/gflags.mk
+++ b/package/gflags/gflags.mk
@@ -11,7 +11,8 @@ GFLAGS_LICENSE = BSD-3c
 GFLAGS_LICENSE_FILES = COPYING.txt
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF -DCMAKE_CXX_FLAGS=-DNO_THREADS
+GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DNO_THREADS"
 endif
 
 $(eval $(cmake-package))
