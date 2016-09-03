From: Chris Packham <judge.packham@gmail.com>
Date: Sat,  3 Sep 2016 21:15:35 +1200
Subject: [Buildroot] [RFC PATCH] micropython: fix build failures
Message-ID: <20160903091535.7833-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.net/results/061c66987e9c33a6641c8183f5e0badae516fc1d
  http://autobuild.buildroot.net/results/62e5b5c6d9dca0f41fb4e7d462ebfbb02f8d29da
  http://autobuild.buildroot.net/results/a6437a49659a7b2983269e758dba9fa5a29240d7

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
I'll look at getting this fix upstream so consider this patch temporary.

 ....c-provide-mp_raw_code_load_file-for-any-.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/micropython/0002-py-emitglue.c-provide-mp_raw_code_load_file-for-any-.patch

diff --git a/package/micropython/0002-py-emitglue.c-provide-mp_raw_code_load_file-for-any-.patch b/package/micropython/0002-py-emitglue.c-provide-mp_raw_code_load_file-for-any-.patch
new file mode 100644
index 0000000..8465ce9
--- /dev/null
+++ b/package/micropython/0002-py-emitglue.c-provide-mp_raw_code_load_file-for-any-.patch
@@ -0,0 +1,27 @@
+From 4177e71862a2817d2555abd8d0bc9a8a361dad8a Mon Sep 17 00:00:00 2001
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+Date: Sat, 3 Sep 2016 20:44:12 +1200
+Subject: [PATCH] py/emitglue.c: provide mp_raw_code_load_file for any unix
+ architecture
+
+Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
+---
+ py/emitglue.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/py/emitglue.c b/py/emitglue.c
+index 1b9992b..2e79d5f 100644
+--- a/py/emitglue.c
++++ b/py/emitglue.c
+@@ -381,7 +381,7 @@ mp_raw_code_t *mp_raw_code_load_mem(const byte *buf, size_t len) {
+ // here we define mp_raw_code_load_file depending on the port
+ // TODO abstract this away properly
+ 
+-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || (defined(__arm__) && (defined(__unix__)))
++#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || defined(__unix__)
+ // unix file reader
+ 
+ #include <sys/stat.h>
+-- 
+2.9.2.518.ged577c6.dirty
+
-- 
2.9.2.518.ged577c6.dirty
