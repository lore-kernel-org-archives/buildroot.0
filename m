Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52A2CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 633E2606E3;
	Tue,  3 Sep 2024 20:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kclwmDLc4FfH; Tue,  3 Sep 2024 20:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75CF16072A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75CF16072A;
	Tue,  3 Sep 2024 20:16:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D92F1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B21440083
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ft6xY4h3UQ6Z for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C11B40028
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C11B40028
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:16:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3364E86C52; Tue,  3 Sep 2024 20:16:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:01:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 848d2614bf46999358b941c261d5c429e6471820
X-Git-Newrev: f577d8218f3f18016aa084255e337a7f589eeed1
X-Patchwork-Hint: ignore
Message-Id: <20240903201636.3364E86C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_15
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

commit: https://git.buildroot.net/buildroot/commit/?id=f577d8218f3f18016aa084255e337a7f589eeed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since we're going to introduce external toolchains that are based on
GCC 14.x, we will need them to "depends on
!BR2_ARCH_NEEDS_GCC_AT_LEAST_15", so let's introduce this symbol
first.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index f39c33ef7f..2e7ac080ef 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -312,6 +312,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
