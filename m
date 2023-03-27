Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CB9C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 12:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA89240AF7;
	Mon, 27 Mar 2023 12:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA89240AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHuZlTlWoYUr; Mon, 27 Mar 2023 12:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2781D40AF9;
	Mon, 27 Mar 2023 12:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2781D40AF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FEB91BF34A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 12:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59EEA40AEE
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 12:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59EEA40AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r6yywmpRXvgH for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 12:22:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C918440AA8
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C918440AA8
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 12:22:34 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MGQf5-1pfRPc1m29-00Gq7R; Mon, 27 Mar 2023 14:17:25 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 14:17:02 +0200
Message-Id: <20230327121702.30959-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:LkqkSxeucoNPQd0cNbP32cMC/XDgLMv63DOaEOvcgtqrAhBe1FC
 M1hfUiqmGqObCh7PFrs1pKJ7LsOmMGCprtCGnqPfsoBXOlLCILdYDzmm6/86lydU2pl2AGa
 Ck+2yf/8apmdfd63y42i41pXNOvPRJLPXSCcXKr0ufes56BH677mqTmI+/nsoCK9D+F17X6
 K8rsXYQhGn85LXuVvCZFg==
UI-OutboundReport: notjunk:1;M01:P0:6/EYCKDztBA=;1gj/7HUXRwBgXqIl4+wMq6IULyT
 unxrkcDhtLWMJrVW44k1tSgWC7rnssmkzomGgZJ9P0GyJT1xRrUGEwfqbVmUycNOzToSKImkI
 cwz/gMT2HMQu5pC3VSmMu6JsL/9iUaItNJboI7poVXhS7+/49Kod7T8CuBn7w1dx/h1ORbSLs
 rrZ6DwVInyI9vNXbfM9BsbnP4MCe1XDWAAt38pXN5kYcImKu//9W9d8h8/K5TOHtu80Js6pan
 Qb4YdUyEtZmkRo230XrizeEJu2L+X5RK5g2dRkTQpjFEs4MNbVKemxGEpg0ofJnK6fskFhhht
 8YvuiLdgdaV+DQXHcXZyj5c8ufdKQy+7aYOD1FuWy4x8VruTNy8D79L2Xc6MpfwVIBbUd3grx
 iZO1QZByD922eKFRWfLaVNyeo5+t7RdJswe55tf8PW2rK/s9zvq0b5x2Yfh+5DDT4uCFFkUU+
 /VdqHcHXgehSG5n8ETPnyg2wPjgzU5s2r1Cm8dgMqT78gq2BdmjKGilyNy31Q8sPl2eiLevh8
 o/9kSGLlAv5jYlohzywtyMfY6iQwApnQqJbwJYlhPMnskM+NaitDB/z4c7pgOPbW4pehpxdpJ
 ffAm26DVjDIKz0RAfFBqdTHK5vBZ/pKGj04KfyjLpdWeh46g32bX8ytr4Lpt4YmeT1yttDNqn
 Ay8C1QhC6v0Lz0F289Tmr4T11RxmvczqWWIXstT3WQ==
Subject: [Buildroot] [PATCH v2 1/1] package/libgit2: bump version to 1.6.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* Remove patch applied upstream.
* Upstream fixed building inside the source tree, but still does not
  recommend it, so keep LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

---

v2: fix hash file
---
 ...clare-win32-functions-on-non-win32-p.patch | 35 -------------------
 package/libgit2/libgit2.hash                  |  2 +-
 package/libgit2/libgit2.mk                    |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch

diff --git a/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch b/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
deleted file mode 100644
index 6be66ffee3..0000000000
--- a/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 20811c5aa9c528405eaa3f88ff22a9adebafa9e6 Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Wed, 8 Mar 2023 14:00:52 +0100
-Subject: [PATCH] sysdir: Do not declare win32 functions on non-win32 platforms
-
-These declaration poses problems on some embedded or retro Linux systems
-that deliberately disable support for wchar_t from their libc.
-
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-[Retrieved from:
-https://github.com/libgit2/libgit2/commit/20811c5aa9c528405eaa3f88ff22a9adebafa9e6]
----
- src/libgit2/sysdir.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/libgit2/sysdir.h b/src/libgit2/sysdir.h
-index 1d15bbf43..03f59e1de 100644
---- a/src/libgit2/sysdir.h
-+++ b/src/libgit2/sysdir.h
-@@ -134,10 +134,12 @@ extern int git_sysdir_set(git_sysdir_t which, const char *paths);
-  */
- extern int git_sysdir_reset(void);
- 
-+#ifdef GIT_WIN32
- /** Sets the registry system dir to a mock; for testing.  */
- extern int git_win32__set_registry_system_dir(const wchar_t *mock_sysdir);
- 
- /** Find the given system dir; for testing. */
- extern int git_win32__find_system_dirs(git_str *out, const char *subdir);
-+#endif
- 
- #endif
--- 
-2.39.2
-
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index baf43c66f7..0c23944b6d 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d557fbf35557bb5df53cbf38ae0081edb4a36494ec0d19741fa673e509245f8f  libgit2-1.6.2.tar.gz
+sha256  a8e2a09835eabb24ace2fd597a78af182e1e199a894e99a90e4c87c849fcd9c4  libgit2-1.6.3.tar.gz
 sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index b31f5199e1..11f04042de 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.6.2
+LIBGIT2_VERSION = 1.6.3
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
