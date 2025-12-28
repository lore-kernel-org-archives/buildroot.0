Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6571CE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29F7D80E1E;
	Sun, 28 Dec 2025 21:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiPE_u0pcmkr; Sun, 28 Dec 2025 21:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4702180E59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959055;
	bh=GIVZ2Y5BNnRgccAOOiG2rDOev+SxjXWLeHDGo5ZrbGk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YPw2WXtnHzB4XfslPYsqdzb0hONnkjECaHjbXzFPs15OsHLmUj7MjqDJXcBpN9GwG
	 97jIPZKqyjoQjZyQBgXrecWabMck9A22U/YOWGHV/Nt812bGgk01Xe9yskQcgFHITU
	 xSKo0K2Qz1cF7gyvR/3nXKcnZoer+z1hwjiVXb/Gie67OXkquhMI2YCNzsDUI3a2tR
	 T+ErXPo3Z6WvdaOP14ijXRt0o9tiGV4VD8UkoLZ52m/XnSDIUCSS9W+sPFK2BKFRkY
	 GC9SCWnWscoqzSb1LMKFVHzdw+RSMFuneCm2qgeOfBKxxvBBs2/ngCSXLxmIJjeVTh
	 rlfaKJ2zEmEUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4702180E59;
	Sun, 28 Dec 2025 21:57:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFDB430D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0DA040540
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0710VYkA4Fge for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D34104053D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D34104053D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0F0A879C3; Sun, 28 Dec 2025 21:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:56:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96ba06347b33231a79541db516a3e45408a8ed68
X-Git-Newrev: 5a40d54cc330e2f10b3fb7d5f7dfdf66e0083d00
X-Patchwork-Hint: ignore
Message-Id: <20251228215731.C0F0A879C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tio: Config.in: add missing
 selection of libglib2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5a40d54cc330e2f10b3fb7d5f7dfdf66e0083d00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit [1] (package/tio: bump to 3.5) added the libglib2 in
the .mk file without selecting it in Config.in.

This commit fixes that.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/3d85e9df431af790930e03d860bfa098108888a0

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tio/Config.in b/package/tio/Config.in
index 953b26a349..ef9a129e73 100644
--- a/package/tio/Config.in
+++ b/package/tio/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_TIO
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  "tio" is a simple TTY terminal application which features a
 	  straightforward commandline interface to easily connect to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
