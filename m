Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E418EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E7241B86;
	Wed, 14 Jun 2023 13:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E7241B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSoEVmSPyhz9; Wed, 14 Jun 2023 13:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AD3541E15;
	Wed, 14 Jun 2023 13:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AD3541E15
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 943031BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAA5E41783
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAA5E41783
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3Up3KZOMs82 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:34:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B7F2415BF
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B7F2415BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 683ED8368B; Wed, 14 Jun 2023 13:34:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 15:32:23 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ac5af7b883dc162a590795114b14bd54c7e2d502
X-Git-Newrev: e9a74dd240741ae61a2c0ad6e6e71230caa53400
X-Patchwork-Hint: ignore
Message-Id: <20230614133442.683ED8368B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/vdr: reformatted
 patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e9a74dd240741ae61a2c0ad6e6e71230caa53400
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

git-formatted patches due to the upstream repo using git:
http://git.tvdr.de/?p=vdr.git

Sent patches upstream and added Upstream: tags.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c9b2e252ca2eb76fc49eb7aafe0dfbc674b2c743)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...musl-compat.patch => 0002-Fix-musl-build.patch} | 49 ++++++++++++++-------
 package/vdr/0003-Include-limits.h.patch            | 51 ++++++++++++++++++++++
 package/vdr/0003-include-missing-limits.patch      | 30 -------------
 ...msg_cat_cntr-is-an-internal-symbol-of-som.patch |  2 +
 4 files changed, 87 insertions(+), 45 deletions(-)

diff --git a/package/vdr/0002-musl-compat.patch b/package/vdr/0002-Fix-musl-build.patch
similarity index 77%
rename from package/vdr/0002-musl-compat.patch
rename to package/vdr/0002-Fix-musl-build.patch
index b6f8f414a9..8c0b8d663b 100644
--- a/package/vdr/0002-musl-compat.patch
+++ b/package/vdr/0002-Fix-musl-build.patch
@@ -1,12 +1,28 @@
-Fix musl build
+From fb44386acc2497ac250364bc08cebc26ded816cf Mon Sep 17 00:00:00 2001
+From: Carlo Landmeter <clandmeter@gmail.com>
+Date: Tue, 16 May 2023 19:57:39 +0200
+Subject: [PATCH] Fix musl build
 
 Downloaded from
 https://git.alpinelinux.org/aports/tree/community/vdr/musl-compat.patch
 
+Initial commit:
+https://git.alpinelinux.org/aports/commit/?id=140248605cee4a0160f80b47ce77a823be2f740a
+
+Upstream: https://www.linuxtv.org/pipermail/vdr/2023-May/029744.html
+
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ i18n.h   |  2 +-
+ osd.c    |  2 +-
+ thread.c |  4 +++-
+ tools.c  |  4 ++--
+ tools.h  | 14 ++++++++++++--
+ vdr.c    |  6 ++++++
+ 6 files changed, 25 insertions(+), 7 deletions(-)
 
 diff --git a/i18n.h b/i18n.h
-index f8ad9de..b002bbf 100644
+index 03deb6f2..85ce4077 100644
 --- a/i18n.h
 +++ b/i18n.h
 @@ -46,7 +46,7 @@ const cStringList *I18nLanguages(void);
@@ -19,7 +35,7 @@ index f8ad9de..b002bbf 100644
     ///< the current language. If no translation is available, the original
     ///< string will be returned.
 diff --git a/osd.c b/osd.c
-index 524700a..ef975f5 100644
+index 47bda686..0d360c81 100644
 --- a/osd.c
 +++ b/osd.c
 @@ -12,7 +12,7 @@
@@ -32,10 +48,10 @@ index 524700a..ef975f5 100644
  #include "tools.h"
  
 diff --git a/thread.c b/thread.c
-index 47eb977..58dba43 100644
+index 93eb8c0d..6e854541 100644
 --- a/thread.c
 +++ b/thread.c
-@@ -155,7 +155,9 @@ cRwLock::cRwLock(bool PreferWriter)
+@@ -160,7 +160,9 @@ cRwLock::cRwLock(bool PreferWriter)
    writeLockThreadId = 0;
    pthread_rwlockattr_t attr;
    pthread_rwlockattr_init(&attr);
@@ -45,7 +61,7 @@ index 47eb977..58dba43 100644
    pthread_rwlock_init(&rwlock, &attr);
  }
  
-@@ -205,7 +207,7 @@ cMutex::cMutex(void)
+@@ -210,7 +212,7 @@ cMutex::cMutex(void)
    locked = 0;
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
@@ -55,10 +71,10 @@ index 47eb977..58dba43 100644
  }
  
 diff --git a/tools.c b/tools.c
-index 754673d..fef9d2d 100644
+index d04033b1..8b161eec 100644
 --- a/tools.c
 +++ b/tools.c
-@@ -640,7 +640,7 @@ char *ReadLink(const char *FileName)
+@@ -672,7 +672,7 @@ char *ReadLink(const char *FileName)
  {
    if (!FileName)
       return NULL;
@@ -67,7 +83,7 @@ index 754673d..fef9d2d 100644
    if (!TargetName) {
       if (errno == ENOENT) // file doesn't exist
          TargetName = strdup(FileName);
-@@ -1528,7 +1528,7 @@
+@@ -1562,7 +1562,7 @@ cReadDir::~cReadDir()
  struct dirent *cReadDir::Next(void)
  {
    if (directory) {
@@ -77,7 +93,7 @@ index 754673d..fef9d2d 100644
  #else
       while ((result = readdir(directory)) != NULL) {
 diff --git a/tools.h b/tools.h
-index 73cca5a..03f5fd1 100644
+index ff6169ee..60eda179 100644
 --- a/tools.h
 +++ b/tools.h
 @@ -28,6 +28,16 @@
@@ -97,7 +113,7 @@ index 73cca5a..03f5fd1 100644
  typedef unsigned char uchar;
  
  extern int SysLogLevel;
-@@ -400,7 +410,7 @@
+@@ -444,7 +454,7 @@ class cReadDir {
  private:
    DIR *directory;
    struct dirent *result;
@@ -106,7 +122,7 @@ index 73cca5a..03f5fd1 100644
    union { // according to "The GNU C Library Reference Manual"
      struct dirent d;
      char b[offsetof(struct dirent, d_name) + NAME_MAX + 1];
-@@ -738,7 +748,7 @@ public:
+@@ -818,7 +828,7 @@ public:
          data[i] = T(0);
      size = 0;
    }
@@ -116,10 +132,10 @@ index 73cca5a..03f5fd1 100644
      qsort(data, size, sizeof(T), Compare);
    }
 diff --git a/vdr.c b/vdr.c
-index 8a49471..c2a82aa 100644
+index 1bdc51ab..0f426e61 100644
 --- a/vdr.c
 +++ b/vdr.c
-@@ -670,12 +670,18 @@ int main(int argc, char *argv[])
+@@ -661,12 +661,18 @@ int main(int argc, char *argv[])
          }
       }
    else if (Terminal) {
@@ -137,4 +153,7 @@ index 8a49471..c2a82aa 100644
 +#endif
       }
  
-   isyslog("VDR version %s started", VDRVERSION);
+   // Set user id in case we were started as root:
+-- 
+2.39.2
+
diff --git a/package/vdr/0003-Include-limits.h.patch b/package/vdr/0003-Include-limits.h.patch
new file mode 100644
index 0000000000..7ddfd1703c
--- /dev/null
+++ b/package/vdr/0003-Include-limits.h.patch
@@ -0,0 +1,51 @@
+From a4a3d9b012c12cd8aaa2526f0eacdcffcdd9f8f1 Mon Sep 17 00:00:00 2001
+From: Roberto Oliveira <robertoguimaraes8@gmail.com>
+Date: Tue, 16 May 2023 20:01:18 +0200
+Subject: [PATCH] Include limits.h
+
+vdr package uses some macros like HOST_NAME_MAX, NAME_MAX, which are defined
+in limits.h.
+Needs to be explicitly included on ppc64le and for all archs for debug build.
+
+Downloaded from
+https://git.alpinelinux.org/aports/tree/community/vdr/include-missing-limits.patch
+
+Initial commits:
+https://git.alpinelinux.org/aports/commit/?id=c9d8942ccf4825fd734b5f37157a49fc4f0b4339
+https://git.alpinelinux.org/aports/commit/?id=47965644c390b1be1117769b1e08b31858267e9a
+
+Upstream: https://www.linuxtv.org/pipermail/vdr/2023-May/029743.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ config.h | 1 +
+ tools.c  | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/config.h b/config.h
+index 72dd3d2a..b9ea769f 100644
+--- a/config.h
++++ b/config.h
+@@ -19,6 +19,7 @@
+ #include "i18n.h"
+ #include "font.h"
+ #include "tools.h"
++#include <limits.h>
+ 
+ // VDR's own version number:
+ 
+diff --git a/tools.c b/tools.c
+index 8b161eec..56a2e0dd 100644
+--- a/tools.c
++++ b/tools.c
+@@ -27,6 +27,7 @@ extern "C" {
+ #include <utime.h>
+ #include "i18n.h"
+ #include "thread.h"
++#include <limits.h>
+ 
+ int SysLogLevel = 3;
+ 
+-- 
+2.39.2
+
diff --git a/package/vdr/0003-include-missing-limits.patch b/package/vdr/0003-include-missing-limits.patch
deleted file mode 100644
index c2efe291e6..0000000000
--- a/package/vdr/0003-include-missing-limits.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-vdr package uses some macros like HOST_NAME_MAX, NAME_MAX, which are defined
-in limits.h.
-Needs to be explicitly included on ppc64le and for all archs for debug build.
-
-Downloaded from
-https://git.alpinelinux.org/aports/tree/community/vdr/include-missing-limits.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-----
-
---- a/config.h
-+++ b/config.h
-@@ -19,6 +19,7 @@
- #include "i18n.h"
- #include "font.h"
- #include "tools.h"
-+#include <limits.h>
- 
- // VDR's own version number:
- 
---- a/tools.c
-+++ b/tools.c
-@@ -27,6 +27,7 @@
- #include <utime.h>
- #include "i18n.h"
- #include "thread.h"
-+#include <limits.h>
- 
- int SysLogLevel = 3;
- 
diff --git a/package/vdr/0004-i18n.c-_nl_msg_cat_cntr-is-an-internal-symbol-of-som.patch b/package/vdr/0004-i18n.c-_nl_msg_cat_cntr-is-an-internal-symbol-of-som.patch
index 9cc45a96c1..7b1a4c2c05 100644
--- a/package/vdr/0004-i18n.c-_nl_msg_cat_cntr-is-an-internal-symbol-of-som.patch
+++ b/package/vdr/0004-i18n.c-_nl_msg_cat_cntr-is-an-internal-symbol-of-som.patch
@@ -10,6 +10,8 @@ anything because musl has a basic NLS implementation. Even
 gettext-tiny defines _nl_msg_cat_cntr as a dummy symbol in its stub
 libintl-musl implementation.
 
+Upstream: https://www.linuxtv.org/pipermail/vdr/2023-May/029745.html
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
  i18n.c | 2 ++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
