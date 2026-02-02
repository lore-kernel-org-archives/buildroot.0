Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486CAE7DEF9
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F37A040660;
	Mon,  2 Feb 2026 15:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWW2sM_-C3RY; Mon,  2 Feb 2026 15:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28FF9407BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770046822;
	bh=Hs33ZGcqvjd4FFJH0dkZ3vJZN5w+QVHOQrWMPdCBT3c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eetcTuLTzFQ5lreLy6jgfh3h18TRN8nt7m4bn3gTd2VoiWnqbAgjIDJoC+S6/PiL8
	 QeXqDp20+AQ0jr7tkaq/5ynDaxsokY08aMv4SBqbyQrdBF+LI8L6joobP0e52wKsWJ
	 eFs2N4I6qeLU3hARv2dmtzMLwskRqzqikvm776OG7NMyaLTWPxom1RB74V+iRP9CJz
	 Q92c0LyQCHqmuI1s0I9qgFP/I3Xy2dDnRDighP6PpVNVdKMdzwNYNVzIrTXUWmKg3/
	 1w9BYV38F24k7iW2yvD8cCPafLTFcHikkC1x7kKmylLgblxHLHYLMejC4abhaHOQ7o
	 tRaEY93bobKMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28FF9407BB;
	Mon,  2 Feb 2026 15:40:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C77D34E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2769D814B5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DC6UkT3DxDFi for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19A4C814A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19A4C814A1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 008DB83875; Mon,  2 Feb 2026 15:40:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 16:21:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1822f07e94951c5a37f78c1009d54fc95d01d39c
X-Git-Newrev: 6b327cb7f2a1b0bcbca632c6a8dbe001b01565cb
X-Patchwork-Hint: ignore
Message-Id: <20260202154017.008DB83875@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: enable host-qemu hppa support
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
Content-Type: multipart/mixed; boundary="===============2079730095028512063=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2079730095028512063==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6b327cb7f2a1b0bcbca632c6a8dbe001b01565cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support in host-qemu for HPPA.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qemu/Config.in.host | 1 +
 package/qemu/qemu.mk        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 090204d90c..c7dd5876e5 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -3,6 +3,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_aarch64
+	default y if BR2_hppa
 	default y if BR2_i386
 	default y if BR2_loongarch64
 	default y if BR2_m68k
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index df81ea6486..73517cb214 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -369,6 +369,7 @@ HOST_QEMU_DEPENDENCIES = \
 #       -------         ----
 #       arm             arm
 #       armeb           armeb
+#       hppa            hppa
 #       i486            i386
 #       i586            i386
 #       i686            i386

--===============2079730095028512063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2079730095028512063==--
