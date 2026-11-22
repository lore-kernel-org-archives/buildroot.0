Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8DA606A330
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kcuzMz0g
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B003080D48;
	Sun, 22 Nov 2026 15:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9H5XrKYmhKy; Sun, 22 Nov 2026 15:16:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7336180D3F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795360578;
	b=ZGkzcq6wSwSRCKWUQ3ubw2sMscz5Ei0hZ1c20mZANwjvXgYblpmHTp+ZXBHxPQD9y080
	 jbIn4FXjq4W0aJE+oFEWZLi83rPzkD2SN2q5bTW46U4/bF4C/g5mQXchQaDBATy+qiaJ0
	 2qJ/aaUx0ltGvQYblQ/IYEo6410SH5osZJPRdUT0uN8XBP/M+C3ogNAg4ZngjPBDeUfLr
	 V8rGZlF7/LvHRB2tfX/cuSWsGr6AG+YUw1uBGpSSpjuBhXS7G/BRGcMtF3LpHu2WqvMWZ
	 +jNCqJHiRrLnxe8E0ThAhAffqBMpRb9od9FHZ3XEwKBeuV1vLOETR4OxWIId0fbE42A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795360578;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=DU6qzvwR4JpN9NsfbgE52Fag4rb+G/S8FdRxhzYtCWY=;
	b=QuLUMtpA31FICKS2JlBHOG2Ne1pvWzXU7f4aNeb8FGrPTZMZ8ndsQw55tWxXxePJeypH
	 BQYMalgEq73pALUNFwybUsGrxemXmZ1kzFcSw5AhNnU9Hd9OFn3103lYi5bEFxL85+qYG
	 VTymsWtGF6siI81wPdh04cbQKH9eatFF6q52UIHtN2qbZxJgIA3O2Cf8YV9jmusJNDMAP
	 Th0QJEjUoQNt21ziu51oQAh8jAOjGy4nPTSy3/cgYhbnr66Uf1hqPRipFtl8ID4zgrWfc
	 zLUKWYJ6dPMRBMhMmDuIUfapFrpzDkWpYSLXlj+O/+s5p+Vduaolfrjk0mDQADPmYlw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795360578;
	bh=DU6qzvwR4JpN9NsfbgE52Fag4rb+G/S8FdRxhzYtCWY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kcuzMz0ghQaLgUuwIx4zhyuPqLRePgXTwPg/vR3eSOi4DmUKl3ujzdnMzdfz6CTYG
	 TO1VPSjrVcGWlyydXa0ndGaPi3HVw+O8d5jS4VoDGGB0rjUT9PjffFnvWfey92V5EN
	 BZC6EjkckjC8VajP8Wf69WX6pvKkzCGrz4ku+LriZ1mGs11LZr/51CY75hW0COnfBW
	 YwMHGeDtykG7/7qkSD6tHSftvPw1AyDg6aPkZ5RJDl83qi56QB2zhFmCVI2JTog/E8
	 MkhthXvK/ehRN8L9kxW1sH0Og/NhDS50i3HAFKmr/Xrcw629FDxqWt77hCLl4ikMvP
	 qC/JZr7xU86vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7336180D3F;
	Sun, 22 Nov 2026 15:16:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 920CB22B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 15:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 837936060E
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 15:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JtZWxvuX0Iaa for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 15:16:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D444060601
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D444060601
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 15:16:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D1BD3C69140;
 Sun, 22 Nov 2026 15:16:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3935C60512;
 Sun, 22 Nov 2026 15:16:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7374D11E62401; Sun, 22 Nov 2026 16:16:09 +0100 (CET)
To: buildroot@buildroot.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Sun, 22 Nov 2026 16:16:07 +0100
Message-ID: <20261122151607.287365-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/bpftool: enable on loongarch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All the requirements to get bpftool to build on loongarch are there,
there's proper kernel support, all the syscalls are implemented, let's allow
compiling it for this architecture.

This was tested on Loongson 2K0300 (on a Banana Pi BPI-2K0300), that I'm
using to run networking tests for the stmmac driver, and bpftool is
required there for some kselftests.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/bpftool/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index 55b31c6174..34cfae01c9 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_loongarch64
 	default y if BR2_riscv
 	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_s390x
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
