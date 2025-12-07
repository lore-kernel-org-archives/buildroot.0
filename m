Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14052D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB01440703;
	Sun,  7 Dec 2025 16:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LIgaETqqpjC; Sun,  7 Dec 2025 16:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEAA140669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123350;
	bh=7hWKeHBojv7NggnvKH8ajGr7ukhGDw1UwJ1iNae5YvY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hltJUqg/w38DZj13dnFhLfzcxqOSICo6dXx6UUnd92hU7PesMi9eflwL9xleiUp3L
	 XifhGquPqr35DVFSQpvCaZ/2AdKXEUE2Dxvtx/qo4MWB/mtqSZmsCoydln3J8yUrx2
	 ZMj+KEPXNPiyAubf98/dv+RgRCUKND4L83C/rI8fz+s2m4zWTZI9unWnm++sOOWZPV
	 CwAEWtt7+jkq5zAkQNzdn/mxtRrnvHnoZUXCmeTlgj2liNqV2cA/SGATcRa1pZYyXQ
	 63IrPcaGBtGaDIyARJigWhTeQMZWyQwIK7Z40PV3CQgM7k8CLSxOVyewYad7i3GFR5
	 zSjIWr83N1ANQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEAA140669;
	Sun,  7 Dec 2025 16:02:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D4FA2F1
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FE74403E5
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTpnh7ajyMMd for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A77340296
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A77340296
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33B9D86717; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:20:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ababaabb05b26a800622789f87408a038f956045
X-Git-Newrev: fa5f4abdc34e8749babbf82847dcbaf4ec5650ba
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.33B9D86717@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flann: fix cmake 4
 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa5f4abdc34e8749babbf82847dcbaf4ec5650ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...cy_max-to-3.10-in-cmake_minimum_required-.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/flann/0001-Set-policy_max-to-3.10-in-cmake_minimum_required-.patch b/package/flann/0001-Set-policy_max-to-3.10-in-cmake_minimum_required-.patch
new file mode 100644
index 0000000000..d11b35a805
--- /dev/null
+++ b/package/flann/0001-Set-policy_max-to-3.10-in-cmake_minimum_required-.patch
@@ -0,0 +1,24 @@
+From a6803c235c0107f3690010c2fc429e3875c4b7c6 Mon Sep 17 00:00:00 2001
+From: Silvio Traversaro <silvio@traversaro.it>
+Date: Thu, 22 May 2025 19:26:16 +0200
+Subject: [PATCH] Set policy_max to 3.10 in cmake_minimum_required to support
+ CMake 4.0
+
+Upstream: https://github.com/flann-lib/flann/pull/526
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to 1.9.2]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f79d173a..85d5a560 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 2.8.12...3.10)
+ 
+ if(COMMAND cmake_policy)
+     cmake_policy(SET CMP0003 NEW)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
