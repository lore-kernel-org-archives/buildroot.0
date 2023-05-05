Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53EDC77B75
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 14:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E6B5429EE;
	Fri,  5 May 2023 14:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E6B5429EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKXQz1ZAMJMQ; Fri,  5 May 2023 14:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68D4241DF6;
	Fri,  5 May 2023 14:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D4241DF6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F87D1BF38E
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 14:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 219C342754
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 14:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219C342754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IJmFnOksePd for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 14:49:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 563BF42750
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 563BF42750
 for <buildroot@buildroot.org>; Fri,  5 May 2023 14:49:49 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1N7hw4-1qHiTj3WZG-014lOX; Fri, 05 May 2023 16:49:45 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Fri,  5 May 2023 16:49:17 +0200
Message-Id: <20230505144917.6077-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:S8Hf9M2YsQgnskQoR7xUEavBHrhFdiaqFvHTkWWtmis1jcQqbK8
 4ocR4aQWLKlHnBYuwFFef1u8t8yhb8bNgMGDqbCz7ZaRfpuR1bHczAAmpkhGTUUQo4BW8PL
 FgUUpkvJjPF6Jxumfa/qx6Ad0je/GtXiTZcQS6VdjrwamSsnUmWdWSfwqm1XYKaqZOaU87Q
 MGwGG30II1YshdYa+zKzw==
UI-OutboundReport: notjunk:1;M01:P0:vab0tUNI014=;jD8KaI8uZ6TSxwSZSJd7qFA4Cw9
 ziPSD0KAFn6jFfspgDA1yqlU2+8S1LIOT3b3Wcl9R36uZbJTRI3XvreAHyUwgZk8tKBx8SBDE
 Hph5zHkRIDmLoUzSXo4RyF/4WW5TaNgzhzMmXueTaOGoejcnPMS0+mfjIxganILU3bkQiONyl
 +PiUIghpEkpv0Z82/63XVx/gILcGQUSqwScAnjxyafbrDewoSWkGuYX1fYLnZryuA6NY5PO+M
 xQVCmt7CKK0nquO9FuqgdHH5CCXqWwmUhO4sRGUueAqyE3MjkUpxNJxjPzX5WpdX/dNrE13SD
 nDHpnMtXNpGAPGVE4mUiz/R7F8jyARBhmmA6YM7VRC5kjLBvpFal3z7d3QeHNL+8MEejQJKo+
 AHmkt7NMMIC9gduT0F/LwEIUGh2CWSVZOtBh2zr8FszkYoCfF46flioMXLXHm2DYK7bzvxeLw
 0xvgeDDA4TOQD698F5+wYHXA1dSuYXx0DNt9X2s5yoInJFKarNcKGlegI9xpCEMgD+SCrecIu
 ICqfEEnnnfgAk4jP/CD3yXA2kZQN7IQ9ubxeEC4OEaABveLSDLg2GzmL841MbgiTgIPbwSNFJ
 3u+jwIuESCqSgLjHw7ZhVcsAckUZymPiDAMiz94J2dVkeBNGuWwQ7IO7pgjaeho5Q6uTGJAlr
 OLNqv+q9WCCJDv3hly2Ogn0ZFN+D2groNMJhTtZlwg==
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.6.4
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
index baf43c66f7..4dd6519ca3 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d557fbf35557bb5df53cbf38ae0081edb4a36494ec0d19741fa673e509245f8f  libgit2-1.6.2.tar.gz
+sha256  d25866a4ee275a64f65be2d9a663680a5cf1ed87b7ee4c534997562c828e500d  libgit2-1.6.4.tar.gz
 sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index b31f5199e1..9ddf2374bb 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.6.2
+LIBGIT2_VERSION = 1.6.4
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
