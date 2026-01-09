Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D83D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E5C283D19;
	Tue, 13 Jan 2026 19:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5d8hANFMONY; Tue, 13 Jan 2026 19:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AD0883D5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333053;
	bh=iHpA5c3TV/FdYDOq/lL80Y1tFoglCMhrRIuWPYAW9Jo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YEO1irlx4JZ8b6WYSw06t+cJUi7U4CC29guUVK5RXFFXKVS4ssq3GP2T1MXV/oy+B
	 Eg0WVFzLo65jKLxGuKGHKa/0RacYSYRJAmMPu99OXFMPjC2u3Z6jSx3PcuL20gfyY4
	 FiU1oFYUUyOX2Ad0cUUGcrMnf1u2vkBIKNrIjSbdOsZ9m/KPEjoDsB+oIzEqOPGN2z
	 iHDwDhk/9yccNncpLE6Isy4F+049KxzmDT+FNmdxx88BUCt+Al/U5gfIWLsmwWN1dU
	 ZRL1roeEEo2deb36JHxxrRFcYymUl9vNGiZU9N2FRceKjJiL+pq15g0PUPznqxEqQ5
	 7Cv6WLNU6ELOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD0883D5D;
	Tue, 13 Jan 2026 19:37:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 155491C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 181E94056A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKzQFFQ0MThd for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD9E440409
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD9E440409
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCFB686184; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:23:12 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7dd431c0d82ff363c64fe181a8b1b0419d29520b
X-Git-Newrev: 5d3880e9f35edf34fafaca07bf7026a54c3ac74f
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.BCFB686184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/opencv4-contrib:
 fix Config.in comments
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d3880e9f35edf34fafaca07bf7026a54c3ac74f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The comments saying that dnn_objdetect and dnn_superres need a glibc
or musl toolchain should be shown when a uClibc toolchain is selected,
not when a toolchain NOT using uClibc is selected (as this is exactly
what's needed).

Fixes: a2e01b23fc441a4be4416e68d91e331e00db3bbd ("package/opencv-contrib: propagate opencv4 dependencies")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3b84ec3ee24d0000be339b66b1f1f93735d8757f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/opencv4-contrib/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index d992c6d1ac..ad61c3fbe8 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -84,7 +84,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
 
 comment "dnn_objdetect needs a glibc or musl toolchain"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 	bool "dnn_superres"
@@ -97,7 +97,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 
 comment "dnn_superres needs a glibc or musl toolchain"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 	bool "dnns_easily_fooled"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
