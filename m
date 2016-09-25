From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:16:48 +0200
Subject: [Buildroot] [git commit] wayland: bump to version 1.12.0
Message-ID: <20160925211748.ABAA7818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=939e827d924dc73a688ef3c1d235466151d1fd82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0002-scanner-Use-uint32_t-instead-of-uint.patch | 31 ----------------------
 package/wayland/wayland.hash                       |  4 +--
 package/wayland/wayland.mk                         |  2 +-
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch b/package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch
deleted file mode 100644
index 1d05f25..0000000
--- a/package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6750b47d9e0d3074d2e56aa36c476493f533d696 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Jul 2016 16:23:48 -0700
-Subject: [PATCH 1/1] scanner: Use uint32_t instead of uint
-
-uint32_t is C99 defined stdint type
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Daniel Stone <daniels@collabora.com>
-[Rahul Bedarkar: Backported from: 6750b47d9e0d3074d2e56aa36c476493f533d696]
-Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
----
- src/scanner.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/scanner.c b/src/scanner.c
-index 6e2c3a3..ebae4cc 100644
---- a/src/scanner.c
-+++ b/src/scanner.c
-@@ -819,7 +819,7 @@ find_enumeration(struct protocol *protocol,
- 	struct interface *i;
- 	struct enumeration *e;
- 	char *enum_name;
--	uint idx = 0, j;
-+	uint32_t idx = 0, j;
- 
- 	for (j = 0; j + 1 < strlen(enum_attribute); j++) {
- 		if (enum_attribute[j] == '.') {
--- 
-2.6.2
-
diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index be1b6b5..9a58c56 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-June/029163.html
-sha256  9540925f7928becfdf5e3b84c70757f6589bf1ceef09bea78784d8e4772c0db0	wayland-1.11.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-September/031121.html
+sha256  d6b4135cba0188abcb7275513c72dede751d6194f6edc5b82183a3ba8b821ab1	wayland-1.12.0.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index d4b4664..a862394 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.11.0
+WAYLAND_VERSION = 1.12.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
