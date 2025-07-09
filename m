Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAB6C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 19:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B90DF80C04;
	Wed,  9 Jul 2025 19:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFQiaOleTITx; Wed,  9 Jul 2025 19:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF5CA80C99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF5CA80C99;
	Wed,  9 Jul 2025 19:28:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E572435
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FCCD606CE
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVpEZEVd_VuW for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 19:28:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B59C3606C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B59C3606C6
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:28:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3F7B863D3; Wed,  9 Jul 2025 19:28:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Jul 2025 21:16:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1db8472c398a64273f5080ce180ec274bd73c176
X-Git-Newrev: 009559d42cb4f4f65e762f8bff1cf2585cae4382
X-Patchwork-Hint: ignore
Message-Id: <20250709192853.A3F7B863D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblo: bump to version 0.32
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=009559d42cb4f4f65e762f8bff1cf2585cae4382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Drop upstreamed local patch
* Add local patch pending upstream to fix build failure as static
  library
* Re-enable ipv6 support since it's been fixed upstream[1]

Release notes:
https://liblo.sourceforge.net/NEWS.html

[1]:
https://sourceforge.net/p/liblo/git/ci/968dff4d576ca102525c81beddb36a623890424b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...01-Fix-use-after-free-warning-in-server.c.patch | 29 ------------------
 ...ver.c-fix-build-failure-as-static-library.patch | 34 ++++++++++++++++++++++
 package/liblo/liblo.hash                           |  8 ++---
 package/liblo/liblo.mk                             |  5 +---
 4 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch b/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch
deleted file mode 100644
index be815a0a61..0000000000
--- a/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8187a8456c14eeb3af08c86ffa1228823c9ef1c5 Mon Sep 17 00:00:00 2001
-From: Guido Aulisi <guido.aulisi@gmail.com>
-Date: Sun, 25 Jun 2023 15:58:30 +0200
-Subject: [PATCH] Fix use-after-free warning in server.c
-
-That assignment is not necessary before returning
-
-Upstream: https://sourceforge.net/p/liblo/git/ci/8187a8456c14eeb3af08c86ffa1228823c9ef1c5/
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/server.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/server.c b/src/server.c
-index ba02d8e..35c9ba5 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -2289,7 +2289,6 @@ int lo_server_del_lo_method(lo_server s, lo_method m)
-             free((void *) it->path);
-             free((void *) it->typespec);
-             free(it);
--            it = prev;
-             return 0;
-         }
-         prev = it;
--- 
-2.39.2
-
diff --git a/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch b/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch
new file mode 100644
index 0000000000..caeee536a0
--- /dev/null
+++ b/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch
@@ -0,0 +1,34 @@
+From 74b228c74c7821dbe16d7730040030eed2f01a28 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 7 Jul 2025 22:58:10 +0200
+Subject: [PATCH] server.c: fix build failure as static library
+
+As static library strncpy() can't determine precise maximum characters
+because strlen() is variable, so to fix build failure let's convert 3
+lines into one by using strdup() that does the same as the actual code.
+
+Upstream: https://sourceforge.net/p/liblo/patches/9/
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/server.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/server.c b/src/server.c
+index 130f6d5..1236279 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -2062,10 +2062,7 @@ static void dispatch_method(lo_server s, const char *path,
+                     char *tmp;
+                     char *sec;
+ 
+-                    int tmplen = (int) strlen(it->path + len) + 1;
+-                    tmp = (char*) malloc(strlen(it->path + len) + 1);
+-                    strncpy(tmp, it->path + len, tmplen);
+-                    tmp[tmplen-1]=0;
++                    tmp = strdup(it->path + len);
+                     sec = strchr(tmp, '/');
+                     if (sec)
+                         *sec = '\0';
+-- 
+2.39.5
+
diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index a3d34d796c..a87b6233dd 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.31/
-sha1  d188a62df51e29fa98861daec1db0fdae400410d  liblo-0.31.tar.gz
-md5  14378c1e74c58e777fbb4fcf33ac5315  liblo-0.31.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.32/
+sha1  e660cf3f630f9255a626102b4ff5082114ebd8a1  liblo-0.32.tar.gz
+md5  a93a7a9da084e6a0937bde6fc324a52a  liblo-0.32.tar.gz
 
 # Locally computed
-sha256  2b4f446e1220dcd624ecd8405248b08b7601e9a0d87a0b94730c2907dbccc750  liblo-0.31.tar.gz
+sha256  5df05f2a0395fc5ac90f6b538b8c82bb21941406fd1a70a765c7336a47d70208  liblo-0.32.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 27dba1f99f..c47e06c0a3 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.31
+LIBLO_VERSION = 0.32
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
 LIBLO_LICENSE_FILES = COPYING
 LIBLO_INSTALL_STAGING = YES
 
-# IPv6 support broken, issue known upstream
-LIBLO_CONF_OPTS = --disable-ipv6
-
 # Liblo uses atomic builtins, so we need to link with libatomic for
 # the architectures who explicitly need libatomic.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
