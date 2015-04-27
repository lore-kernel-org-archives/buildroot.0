From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Apr 2015 23:26:06 +0200
Subject: [Buildroot] [git commit] gcc/4.8.4: fix aarch64 vmlaq_lane_s32 typo
Message-ID: <20150427212617.9225C800D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=326a681f1ee23b40db2637dc8dfe3e49cd58cd80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes webp build:
http://autobuild.buildroot.net/results/656/6563be62557ab6c1bdd4152523774316dc09c9ce/
http://autobuild.buildroot.net/results/e31/e31e782d927215dde87b2f3174d70b8eb70085fd/
http://autobuild.buildroot.net/results/e2e/e2e627dd6fdfa58ee07fd3aaca43e1731cc8b6e4/
http://autobuild.buildroot.net/results/26e/26ed07fe917e1af21b5c5c3e4f6c2b39d78a8aff/

And many more.

Upstream bug report and patch:
https://code.google.com/p/webp/issues/detail?id=230
https://android-review.googlesource.com/#/c/99470

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../4.8.4/843-aarch64-vmlaq_lane_s32-typo.patch    |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/gcc/4.8.4/843-aarch64-vmlaq_lane_s32-typo.patch b/package/gcc/4.8.4/843-aarch64-vmlaq_lane_s32-typo.patch
new file mode 100644
index 0000000..afa650c
--- /dev/null
+++ b/package/gcc/4.8.4/843-aarch64-vmlaq_lane_s32-typo.patch
@@ -0,0 +1,24 @@
+From 845478644ba54a6947e9b224f2e5cd342e8257a9 Mon Sep 17 00:00:00 2001
+From: Andrew Hsieh <andrewhsieh@google.com>
+Date: Wed, 25 Jun 2014 22:13:48 -0700
+Subject: [PATCH] Fix a typo in vmlaq_lane_s32
+
+BUG=15526898
+
+Change-Id: I4e35a764d369d378808dab29beefe34d1f93249b
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+
+diff --git a/gcc/config/aarch64/arm_neon.h b/gcc/config/aarch64/arm_neon.h
+index 73c7e7d..92b0119 100644
+--- a/gcc/config/aarch64/arm_neon.h
++++ b/gcc/config/aarch64/arm_neon.h
+@@ -9984,7 +9984,7 @@
+ #define vmlaq_lane_s32(a, b, c, d)                                      \
+   __extension__                                                         \
+     ({                                                                  \
+-       int32x4_t c_ = (c);                                              \
++       int32x2_t c_ = (c);                                              \
+        int32x4_t b_ = (b);                                              \
+        int32x4_t a_ = (a);                                              \
+        int32x4_t result;                                                \
