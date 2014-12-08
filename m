From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 21:04:52 +0100
Subject: [Buildroot] [git commit] libinput: bump version to 0.7.0
Message-ID: <20141208202829.0518F800FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf2c169c233e0925817766a3ecaf7f111421f3ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See [1] for a detailed list of changes.

Additional renamed (and rebased) the single patch.

[1] http://lists.freedesktop.org/archives/wayland-devel/2014-December/018750.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ... 0001-rename-log_msg-to-libinput_log_msg.patch} |   30 ++++++++-----------
 package/libinput/libinput.mk                       |    2 +-
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
similarity index 76%
rename from package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
rename to package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
index 2ada150..433b29e 100644
--- a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
+++ b/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
@@ -1,7 +1,7 @@
-From 89a3ae2de21e528b8feb80dbea3928d43982d3be Mon Sep 17 00:00:00 2001
+From bf4a4a4e2b0479322fe16c9e1f15f146daa893ee Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@openwide.fr>
 Date: Thu, 21 Aug 2014 18:18:16 +0200
-Subject: [PATCH 1/1] rename log_msg to libinput_log_msg
+Subject: [PATCH] rename log_msg to libinput_log_msg
 
 This fixes a conflict between libevdev and libinput on the definition
 of the log_msg() symbol.
@@ -11,16 +11,18 @@ http://autobuild.buildroot.net/results/c13/c133b7c706ee31302125df8ca94f4d0f0152c
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 [yann.morin.1998 at free.fr: rebase on-top of 0.6.0]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[ps.report at gmx.net: rebase on top of 0.7.0]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  src/libinput-private.h | 14 +++++++-------
  src/libinput.c         |  2 +-
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/libinput-private.h b/src/libinput-private.h
-index f9d2f87..ac1e1c4 100644
+index b36dc95..98f91b3 100644
 --- a/src/libinput-private.h
 +++ b/src/libinput-private.h
-@@ -116,15 +116,15 @@ typedef void (*libinput_source_dispatch_t)(void *data);
+@@ -179,15 +179,15 @@ struct libinput_event_listener {
  typedef void (*libinput_source_dispatch_t)(void *data);
  
  
@@ -28,20 +30,14 @@ index f9d2f87..ac1e1c4 100644
 -#define log_info(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
 -#define log_error(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
 -#define log_bug_kernel(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
--#define log_bug_libinput(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__);
--#define log_bug_client(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__);
+-#define log_bug_libinput(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__)
+-#define log_bug_client(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__)
 +#define log_debug(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
 +#define log_info(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
 +#define log_error(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
 +#define log_bug_kernel(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
-+#define log_bug_libinput(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__);
-+#define log_bug_client(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__);
- 
- void
--log_msg(struct libinput *libinput,
-+libinput_log_msg(struct libinput *libinput,
- 	enum libinput_log_priority priority,
- 	const char *format, ...);
++#define log_bug_libinput(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__)
++#define log_bug_client(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__)
  
  void
 -log_msg(struct libinput *libinput,
@@ -50,10 +46,10 @@ index f9d2f87..ac1e1c4 100644
  	const char *format, ...);
  
 diff --git a/src/libinput.c b/src/libinput.c
-index eec9efb..4e3f6fa 100644
+index 279cce0..5748e5e 100644
 --- a/src/libinput.c
 +++ b/src/libinput.c
-@@ -110,7 +110,7 @@ static struct log_data log_data = {
+@@ -107,7 +107,7 @@ log_msg_va(struct libinput *libinput,
  }
  
  void
@@ -63,5 +59,5 @@ index eec9efb..4e3f6fa 100644
  	const char *format, ...)
  {
 -- 
-1.9.3
+2.1.2
 
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 2ea30ed..bf4537b 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 0.6.0
+LIBINPUT_VERSION = 0.7.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
