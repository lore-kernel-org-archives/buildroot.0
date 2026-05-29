Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2314CD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 865AA614BD;
	Fri, 29 May 2026 08:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hG7SczHpAKcy; Fri, 29 May 2026 08:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B78B614AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780044467;
	bh=MwAFdwf9R4w0tAqO+CFC2p3I0+tkjpMwjfwmWFgXbiQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nzOfXJPn/8qpld+hlo4WxOQhvysQVcwBPTuKVB2yUGz/saSaTNVB9ypPaKuz5C0Zn
	 4LlHUvXoe+3991kdsh2t3BkR73mYyEnMTnQzuMCvyunu1dvCK76r4+N8sn+G3vAPau
	 j51HmkC1yu/mAddyV+36U43QZlfP79FDCcwVmKJmEW/JwtFD874H/YK2smgWPQE9Zb
	 XAhocgehrhlKSAWzwBRC4x0YZpg5nL28hCcvJQUAIXP4Xj77rCnFE6OYQn1O5lhrEL
	 ytxvbxg6w7orF1npOdvtUhxGZ1/F0ukEVY2aKeBWVrfOmz6xTLEq+eF0RpIIyAgqNP
	 fcVJbVffbhlfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B78B614AA;
	Fri, 29 May 2026 08:47:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3CA728E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3C2B61483
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_C-7RI9QJ1P for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3EA661470
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3EA661470
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CE0A873AC; Fri, 29 May 2026 08:47:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:40:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 665d4c5b3d6065a3b6ecb301678fa09f90f4a998
X-Git-Newrev: c45594868330134a4515819e48fff70225be0722
X-Patchwork-Hint: ignore
Message-Id: <20260529084732.7CE0A873AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/containerd: remove
 lvm2 !BR2_STATIC_LIBS entry
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c45594868330134a4515819e48fff70225be0722
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Remove lvm2 !BR2_STATIC_LIBS dependency

(It still depends on !BR2_STATIC_LIBS by BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS)

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/containerd/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index f014c56e10..9712b11b1c 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -32,14 +32,13 @@ config BR2_PACKAGE_CONTAINERD_DRIVER_DEVMAPPER
 	bool "devmapper snapshot driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
-	depends on !BR2_STATIC_LIBS # lvm2
 	select BR2_PACKAGE_LVM2
 	help
 	  Build the devmapper snapshot driver for containerd.
 
-comment "devmapper snapshot driver needs a toolchain w/ threads, dynamic library"
+comment "devmapper snapshot driver needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_CONTAINERD_DRIVER_ZFS
 	bool "zfs snapshot driver"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
