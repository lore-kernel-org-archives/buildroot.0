Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853A8C61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 489AC81155;
	Fri, 28 Aug 2026 14:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyqCWQPNK0o8; Fri, 28 Aug 2026 14:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927159;
	bh=pgKD5d2DhECapw7Q+bTMZ4sV2nnyib0ShX44U89Ee9c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lCoYu4Ovbd2NnUC08rTSWB3TMci5hEE2bV5Te6iSVjp/vjCaHMPcdBww9iFPr1dkS
	 6XeelArLL+zvG6LrZl7Y0VLgwRx3tTlPhkL4izWatr6aG/UL7oaeHp0OxknMqoNZ5i
	 mGrJOlE5TKfLmHlhtqbpkyY5bno+U4Lr1UGV+sCOytnGKKxitoeh52Wlq5Y51Z9AAJ
	 UrAljZ4HtPIqtVNkIinaW8Wk0pbQRmM3G6MIl+gVqG5r2wodeorYRSjpOo2ijpkiKj
	 4/BBoSrz9eG7iga29ldgJHrVJ/rJp3mRAVFVHR+ELUgS5Ud9+PO2vZ7f4qGT9ucj5J
	 B+5HDuu5+eECA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BC6781141;
	Fri, 28 Aug 2026 14:25:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11321127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E911F60836
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CX6iZ_tREAvw for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5505C60825
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 536EF921F9; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: c1bfd5d5ab0a42572ec8e66ca28a04fb44195d3d
X-Git-Newrev: 79cfcaf399307d671dbefa3b69aee67591897484
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.536EF921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] DEVELOPERS: add Yann E.
 MORIN (work) for distribution-registry
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79cfcaf399307d671dbefa3b69aee67591897484
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0480567def9c99b6228b32c0f3638998b372ab4f)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e114be1677..bf30c344c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3477,6 +3477,7 @@ F:	package/tpm2-pkcs11/
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/amazon-ecr-credential-helper/
+F:	package/distribution-registry/
 F:	package/docker-credential-acr-env/
 F:	package/docker-credential-gcr/
 F:	package/gpsd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
