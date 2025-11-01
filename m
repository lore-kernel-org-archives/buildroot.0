Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E495CCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 18:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA40084C45;
	Sat,  1 Nov 2025 18:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQ0S2ny0YXXP; Sat,  1 Nov 2025 18:18:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08ABA84C48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08ABA84C48;
	Sat,  1 Nov 2025 18:18:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6148393D
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EA0584C48
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZTgP2dREcZD for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 18:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9412884C45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9412884C45
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:18:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FC9A837AA; Sat,  1 Nov 2025 18:18:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Nov 2025 19:15:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 355106eaa46c43d125521181693c608e159a1856
X-Git-Newrev: 7d826e90f1fdd849b03e9fb381c692085f11fa8a
X-Patchwork-Hint: ignore
Message-Id: <20251101181841.7FC9A837AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: bump to version 1.39.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d826e90f1fdd849b03e9fb381c692085f11fa8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since version 1.35.2, see:
https://github.com/janet-lang/janet/releases

remove upstream patch

diff LICENSE:
    -Copyright (c) 2023 Calvin Rose and contributors
    +Copyright (c) 2025 Calvin Rose and contributors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-check-for-glibc-instead-of-gnu-source.patch | 26 ----------------------
 package/janet/janet.hash                           |  4 ++--
 package/janet/janet.mk                             |  2 +-
 3 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch b/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
deleted file mode 100644
index 5ee021e658..0000000000
--- a/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a5d6b2283834422a9fa9e79b5c7ad9b932b52568 Mon Sep 17 00:00:00 2001
-From: Calvin Rose <calsrose@gmail.com>
-Date: Fri, 21 Jun 2024 17:17:22 -0500
-Subject: [PATCH] Check for __GLIBC__ instead of _GNU_SOURCE
-
-musl doesn't obey this behavior.
-
-Upstream: https://github.com/janet-lang/janet/commit/a5d6b2283834422a9fa9e79b5c7ad9b932b52568
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/core/util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/util.c b/src/core/util.c
-index 4bb37abc5..6cb5676e0 100644
---- a/src/core/util.c
-+++ b/src/core/util.c
-@@ -972,7 +972,7 @@ const char *janet_strerror(int e) {
- #ifdef JANET_WINDOWS
-     /* Microsoft strerror seems sane here and is thread safe by default */
-     return strerror(e);
--#elif defined(_GNU_SOURCE)
-+#elif defined(__GLIBC__)
-     /* See https://linux.die.net/man/3/strerror_r */
-     return strerror_r(e, janet_vm.strerror_buf, sizeof(janet_vm.strerror_buf));
- #else
diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index a35835a54e..15516a4cdc 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  947dfdab6c1417c7c43efef2ecb7a92a3c339ce2135233fe88323740e6e7fab1  janet-1.35.2.tar.gz
+sha256  a43489328b88846e5cddbdad9274f25ee9854e337e52490a74bb7955de03c650  janet-1.39.1.tar.gz
 
 # Locally calculated
-sha256  95fca700e8dce9699248e7cc80ac88ce2357874c8352cd2be4d18f183dc9710b  LICENSE
+sha256  805858acec1df54018879efc78ee3ff7bab5e69908c58e46bbc2d94520f29023  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 9bf5322d16..e076f7c461 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.35.2
+JANET_VERSION = 1.39.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
