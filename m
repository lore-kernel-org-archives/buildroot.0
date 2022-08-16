Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AF0C32771
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 06:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDC97408A8;
	Tue, 16 Aug 2022 06:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDC97408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ub2wOuJivL0W; Tue, 16 Aug 2022 06:43:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC796408CD;
	Tue, 16 Aug 2022 06:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC796408CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02FC51BF2B8
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 06:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AD9960E7B
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 06:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AD9960E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sa6xKYsrP0O for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 06:43:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B42C60E7C
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 06:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B42C60E7C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8BDDB876FF; Tue, 16 Aug 2022 06:28:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 08:42:27 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 1e2d8041e1e655bf67d90f61ba900a6eeea65aa7
X-Git-Newrev: d952378f3ea89f94fc163587b0f1fa639f60bd09
X-Patchwork-Hint: ignore
Message-Id: <20220816062850.8BDDB876FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libbsd: fix
 sh4aeb build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d952378f3ea89f94fc163587b0f1fa639f60bd09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following sh4aeb build failure:

In file included from nlist.c:44:
nlist.c: In function '__elf_is_okay__':
local-elf.h:223:25: error: 'ELFDATA2LMSB' undeclared (first use in this function); did you mean 'ELFDATA2LSB'?
  223 | #define ELF_TARG_DATA   ELFDATA2LMSB
      |                         ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2980fb79c208454195d77383f1ece9afbd7f981b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bb2e5e2f76508cfccf6315e142601d3ccc790522)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-src-local-elf.h-fix-big-endian-sh.patch   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch b/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
new file mode 100644
index 0000000000..8612d268f8
--- /dev/null
+++ b/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
@@ -0,0 +1,39 @@
+From 93c9f8aa72349a4fe33e2a732100c76f3904eb80 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 7 Jun 2022 19:27:13 +0200
+Subject: [PATCH] src/local-elf.h: fix big endian sh
+
+Fix the following build failure with big endian sh (e.g. sh4aeb):
+
+In file included from nlist.c:44:
+nlist.c: In function '__elf_is_okay__':
+local-elf.h:223:25: error: 'ELFDATA2LMSB' undeclared (first use in this function); did you mean 'ELFDATA2LSB'?
+  223 | #define ELF_TARG_DATA   ELFDATA2LMSB
+      |                         ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2980fb79c208454195d77383f1ece9afbd7f981b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/19]
+---
+ src/local-elf.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/local-elf.h b/src/local-elf.h
+index 1dd3b42..8c4794f 100644
+--- a/src/local-elf.h
++++ b/src/local-elf.h
+@@ -230,7 +230,7 @@
+ #if defined(__LITTLE_ENDIAN__)
+ #define ELF_TARG_DATA	ELFDATA2LSB
+ #elif defined(__BIG_ENDIAN__)
+-#define ELF_TARG_DATA	ELFDATA2LMSB
++#define ELF_TARG_DATA	ELFDATA2MSB
+ #else
+ #error Unknown SH endianness
+ #endif
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
