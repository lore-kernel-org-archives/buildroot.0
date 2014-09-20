From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 19:09:47 +0200
Subject: [Buildroot] [PATCH 01/10] package/libinput: bump version
In-Reply-To: <cover.1411232859.git.yann.morin.1998@free.fr>
References: <cover.1411232859.git.yann.morin.1998@free.fr>
Message-ID: <c999e0a0cf43f65190bf74289b299b959557b0d0.1411232859.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...put-01-rename-log_msg-to-libinput_log_msg.patch | 54 +++++++++++++---------
 package/libinput/libinput.mk                       |  2 +-
 2 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
index c10d8af..2ada150 100644
--- a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
+++ b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
@@ -9,6 +9,8 @@ of the log_msg() symbol.
 http://autobuild.buildroot.net/results/c13/c133b7c706ee31302125df8ca94f4d0f0152c6c6/build-end.log
 
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+[yann.morin.1998 at free.fr: rebase on-top of 0.6.0]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  src/libinput-private.h | 14 +++++++-------
  src/libinput.c         |  2 +-
@@ -18,42 +20,48 @@ diff --git a/src/libinput-private.h b/src/libinput-private.h
 index f9d2f87..ac1e1c4 100644
 --- a/src/libinput-private.h
 +++ b/src/libinput-private.h
-@@ -81,15 +81,15 @@ typedef void (*libinput_source_dispatch_t)(void *data);
+@@ -116,15 +116,15 @@ typedef void (*libinput_source_dispatch_t)(void *data);
+ typedef void (*libinput_source_dispatch_t)(void *data);
  
- struct libinput_source;
  
--#define log_debug(...) log_msg(LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
--#define log_info(...) log_msg(LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
--#define log_error(...) log_msg(LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
--#define log_bug_kernel(...) log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
--#define log_bug_libinput(...) log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__);
--#define log_bug_client(...) log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__);
-+#define log_debug(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
-+#define log_info(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
-+#define log_error(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
-+#define log_bug_kernel(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
-+#define log_bug_libinput(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__);
-+#define log_bug_client(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__);
+-#define log_debug(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
+-#define log_info(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
+-#define log_error(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
+-#define log_bug_kernel(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
+-#define log_bug_libinput(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__);
+-#define log_bug_client(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__);
++#define log_debug(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
++#define log_info(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
++#define log_error(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
++#define log_bug_kernel(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
++#define log_bug_libinput(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__);
++#define log_bug_client(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__);
  
  void
--log_msg(enum libinput_log_priority priority, const char *format, ...);
-+libinput_log_msg(enum libinput_log_priority priority, const char *format, ...);
+-log_msg(struct libinput *libinput,
++libinput_log_msg(struct libinput *libinput,
+ 	enum libinput_log_priority priority,
+ 	const char *format, ...);
+ 
+ void
+-log_msg(struct libinput *libinput,
++libinput_log_msg(struct libinput *libinput,
+ 	enum libinput_log_priority priority,
+ 	const char *format, ...);
  
- int
- libinput_init(struct libinput *libinput,
 diff --git a/src/libinput.c b/src/libinput.c
 index eec9efb..4e3f6fa 100644
 --- a/src/libinput.c
 +++ b/src/libinput.c
 @@ -110,7 +110,7 @@ static struct log_data log_data = {
- };
+ }
  
  void
--log_msg(enum libinput_log_priority priority, const char *format, ...)
-+libinput_log_msg(enum libinput_log_priority priority, const char *format, ...)
+-log_msg(struct libinput *libinput,
++libinput_log_msg(struct libinput *libinput,
+ 	enum libinput_log_priority priority,
+ 	const char *format, ...)
  {
- 	va_list args;
- 
 -- 
 1.9.3
 
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index b52101a..345b3c3 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 0.3.0
+LIBINPUT_VERSION = 0.6.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
-- 
1.9.1
