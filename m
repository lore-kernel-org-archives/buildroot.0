From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:22:24 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 2.5.0
Message-ID: <20190714102157.E3D337FB36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2f52044d577b2e66e23193e6eb95191aaca88cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream:
https://github.com/intel/libva/commit/6724011e8b52901f13dded130f0b47e8bdbd4dda

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...a-va_trace-unbreak-with-C89-after-b369467.patch | 35 ----------------------
 package/libva/libva.hash                           |  6 ++--
 package/libva/libva.mk                             |  2 +-
 3 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch b/package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch
deleted file mode 100644
index 19192742c8..0000000000
--- a/package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6724011e8b52901f13dded130f0b47e8bdbd4dda Mon Sep 17 00:00:00 2001
-From: Jan Beich <jbeich@FreeBSD.org>
-Date: Wed, 10 Apr 2019 11:37:28 +0000
-Subject: [PATCH] va/va_trace: unbreak with C89 after b3694671c784
-
-va/va_trace.c: In function 'va_TraceVAEncMiscParameterBuffer':
-va/va_trace.c:3281: error: 'for' loop initial declaration used outside C99 mode
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/intel/libva/commit/6724011e8b52901f13dded130f0b47e8bdbd4dda]
----
- va/va_trace.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/va/va_trace.c b/va/va_trace.c
-index 0a17e5cd..d41f62c1 100755
---- a/va/va_trace.c
-+++ b/va/va_trace.c
-@@ -3271,6 +3271,7 @@ static void va_TraceVAEncMiscParameterBuffer(
-     }
-     case VAEncMiscParameterTypeROI:
-     {
-+        int i;
-         VAEncMiscParameterBufferROI *p = (VAEncMiscParameterBufferROI *)tmp->data;
- 
-         va_TraceMsg(trace_ctx, "\t--VAEncMiscParameterBufferROI\n");
-@@ -3278,7 +3279,7 @@ static void va_TraceVAEncMiscParameterBuffer(
-         va_TraceMsg(trace_ctx, "\tmax_delta_qp = %d\n", p->max_delta_qp);
-         va_TraceMsg(trace_ctx, "\tmin_delta_qp = %d\n", p->min_delta_qp);
-         va_TraceMsg(trace_ctx, "\troi_flags.bits.roi_value_is_qp_delta = %d\n", p->roi_flags.bits.roi_value_is_qp_delta);
--        for (int i = 0; i < p->num_roi; i++) {
-+        for (i = 0; i < p->num_roi; i++) {
-             va_TraceMsg(trace_ctx, "\troi[%d].roi_rectangle.x      = %d\n", i, p->roi[i].roi_rectangle.x);
-             va_TraceMsg(trace_ctx, "\troi[%d].roi_rectangle.y      = %d\n", i, p->roi[i].roi_rectangle.y);
-             va_TraceMsg(trace_ctx, "\troi[%d].roi_rectangle.width  = %d\n", i, p->roi[i].roi_rectangle.width);
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 661eedf16a..4a62a9450a 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.4.1/libva-2.4.1.tar.bz2.sha1sum
-sha1 5aeffc9929b4a9a5ebbed94adf065d08fc50bcf9  libva-2.4.1.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.5.0/libva-2.5.0.tar.bz2.sha1sum
+sha1 5bd2b0bc9d1e49cf1e21d9a63696f13a1483bd86  libva-2.5.0.tar.bz2
 # Locally computed
-sha256 e9e053908591b121793eaa5d8aa37675b4cd3af4b12f1f377dff4767f39cee70  libva-2.4.1.tar.bz2
+sha256 3aa89cd369a506ac4dbe5de7c0ef5da4f3d220bf986403f02fa1f6f702af6878  libva-2.5.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index e876a1a3d0..7bf1839f4c 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.4.1
+LIBVA_VERSION = 2.5.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
