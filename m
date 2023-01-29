Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA477C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D6DF6FB7B;
	Tue, 21 Feb 2023 01:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D6DF6FB7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-tgdh4NuPCL; Tue, 21 Feb 2023 01:21:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A26396F9C8;
	Tue, 21 Feb 2023 01:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A26396F9C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BB321BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E81656FBEA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81656FBEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-mRQDjNw23W for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 292476FBC4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 292476FBC4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E1CC828C8; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 22:59:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ee399a868957fbf963db525adeeb4ab2dd3f04fb
X-Git-Newrev: 1e645ff7475710f4af9341602471dbeac387c776
X-Patchwork-Hint: ignore
Message-Id: <20230220205244.0E1CC828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/neon-2-sse: add
 missing coment
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e645ff7475710f4af9341602471dbeac387c776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

That was missed when applying ee399a8689 (package/neon-2-sse: new
package)...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/neon-2-sse/neon-2-sse.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/neon-2-sse/neon-2-sse.mk b/package/neon-2-sse/neon-2-sse.mk
index 0e9d066abd..3e87c62e21 100644
--- a/package/neon-2-sse/neon-2-sse.mk
+++ b/package/neon-2-sse/neon-2-sse.mk
@@ -9,6 +9,7 @@ NEON_2_SSE_SITE = $(call github,intel,ARM_NEON_2_x86_SSE,$(NEON_2_SSE_VERSION))
 NEON_2_SSE_LICENSE = BSD-2-Clause
 NEON_2_SSE_LICENSE_FILES = LICENSE
 NEON_2_SSE_INSTALL_STAGING = YES
+# Only installs a header
 NEON_2_SSE_INSTALL_TARGET = NO
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
