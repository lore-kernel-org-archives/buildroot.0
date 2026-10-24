Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6249606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=D8oorBhV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C3604067C;
	Sat, 24 Oct 2026 21:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWjTI0vwE5oY; Sat, 24 Oct 2026 21:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5BF4A40642
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792878846;
	b=Sdf+uoDosXuWinX60wOGUU4Yb7WM7OXBSfDWY4McuPgyVB4a1MlGdsQxpbD1KRT/1xaS
	 tb54iRmahn3HVY5tGSo3H7NexjjeMMzHBDLhfTolHOjDDKBr5XnSHgjA4plDJwQju5d1S
	 nWJfG8j9DA/uv9/yx9t0XUnPqwHpnnpmin2au7G1fDonCaohyBhfeQXJaFkkHSSzBINeD
	 5eEU0C6P4SnJ3T3JfTOKF98VjHHd42M5EZI+64EPoRZRhwX4rJuX5RXc033wH21vsgblr
	 JxXmZxgVy+fyDMJ0dx8ZHuJ4mlGooH4iLnnYrMXiRIyNJ+Vp3wF9+VBO+KVzvTJT7uQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792878846;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UzeiS8aopUG7MY/hTUhFB17lGruiv6qWAnY8MA/a/+A=;
	b=BANYSduU/LUlUMGO0lZ7cCvw2vPJwT0L7xFRRHpiZYPZS5h6sGI7SfLMwRnEaKELEkxJ
	 X1KrPqqNbLQClAyE1qYN3kYptoZ0W1pfpMA5Axd6ZipDOiFJuuGNgBbo8Eo9UVASLTuj/
	 C+bSmGsnJwgqcnPUxomJ5h2dI3lFBt9FwBP0auriF5J4MMxcu/8gqhoqtTCFr3ryNE2mA
	 HWO+n3llGS7Dg0mxhWZLwMVB1Pyc3zGAmslCtDvMJ77fb+ki5pl4ehINIXVXP96EKorhs
	 vkdYCG3fQNRBJ5m2jBIng+dlQ87z5qigrMFANWlCvhcECqFx6wo/pagjS2UGjDFX6hw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792878846;
	bh=UzeiS8aopUG7MY/hTUhFB17lGruiv6qWAnY8MA/a/+A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D8oorBhVm/b02xZHfjAoJmWO2skb7WhXLkHVBIRu99z+zbA3mWa2Oh2O+KbmiHg8D
	 tnChFTgsvpB6DyLM8ioI8E+47SrIbV9i8je2c1NPhaL/RsfHZJqaAzsfl7RnjBEzVN
	 Qp7yyGqOOZQxvVSVcsJg/mMGkrjfcsIdVbd0myoY1g2/fm1XvK9UbewpxRX3Kjs2/R
	 uAmhHDrcKEVb+QEuW70oJ0O+2EnO4AokVLfhVDBpGYxMaIveilEiV+a3s14Mh1fhVI
	 Hz4QIWIZBQoCkawwxl/4v4p6Qrr1mO/SaUupX10bxNUbtu0gVLjWUMv+kXKaRnSQkk
	 h1c84h+wB3MOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BF4A40642;
	Sat, 24 Oct 2026 21:54:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47B473D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DC7980D2C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCrRy2KsrSLD for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:54:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EDF8180D15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792878841;
 b=Ev33Xt06+RgKap3rh5HegANGHSF0yIAfIQLfOO5vXjrFcsPVF2yY7JmFvkFzJl79ude4
 YlaLuarBcbjuyTrHin0UZXU5E1vuDbvWccKkpPuojtjtTsNFfhU1ST6ljOX1C1gIVBRYm
 hTNyXTN0JkDBmrwsMiJJHlF8KpMRf48MeTS35xcgYBMXHo7Uy/UI5+txudWfRpiFtTpcc
 EDz7m8YaclqRfVBk8+mDTmpBT9QzN7XaTeCT3KdTzeSdR2pdwIffdKbSRpolJLQdnsXCA
 o6EmvwfEYZyRfoU4LSO4iZReWQTeWruGN04eLs0JMRljfID+SKeupT7/F4en+FwjAdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792878841;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=tnwW3wPF5TNPhJctyi0a1PKb12v/6PTx98+Z/wt1y9Y=;
 b=FQ7j4vsaf615PuYaQrFKv1+0XLlnaJdIuvaCcElQBIMVPirG8l33fl7I0aDg5TZgNnTX
 N8Ha5S/5d12SPAwgYb/QngHK7EwkAk10DQ6oqKzF0OPgTkO6m1+1/engzKXgBco6DU0xk
 3Ae2Wqnk6rYUHaurYLPGc36rhl5N/N8fwzGEuyEzKeTWXAbnQtlN3I/NMT7I3FQahhCWf
 XxX6ubwvjrBtMaQauklYcYzMsyHQm0TIobvkMd2ZqRvIjCGo5ueAaN/OHja9eRzekslrJ
 R0g5LGDP770YcM4q3btv40OhtcbjCmjDbZQvnBou9PYvvBbU4aL4u1My7nKigjLf+Ew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jj0HEB1E; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDF8180D15
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:54:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0JM-1wsEPn2nnM-00fW9g; Sat, 24
 Oct 2026 23:53:51 +0200
To: buildroot@buildroot.org
Cc: Meena Murthy <meena.murthy@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 24 Oct 2026 23:53:30 +0200
Message-ID: <20261024215330.2067282-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261024215330.2067282-1-fiona.klute@gmx.de>
References: <20261024215330.2067282-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:p6DNQXc1DKaWMz8j9zQfkGHYTsV9bIfh/3h8drD3DKraRQXYo3L
 H22Y3d1+QuShbMJJXgxpvS7g6kAlBGSgtME8ZqDC4xXBF0o7pUVFZWc2b00gY//Z1oA4/R8
 uEvwHcxXmWzxlDg5y5IHpi1zdiASoGNJWKMV1PXmHq/+ob8fS8nzUEi7iXhAqmmtS9a9SFq
 GATa8ZiH6r9AuDuyKLc2Q==
UI-OutboundReport: notjunk:1;M01:P0:5kKjGNFg+Sk=;R0NHFZ0zI43QSvdevOkjLvSypuL
 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
Subject: [Buildroot] [PATCH v2 2/2] configs/engicam_px30_core_defconfig:
 require pkg_resources for binman
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The defconfig uses U-Boot 2025.04, so binman fails without
pkg_resources.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Compile-tested only to verify the U-Boot option, I do not have the
board.

Changes v1 -> v2:
* drop kernel version bump

 configs/engicam_px30_core_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/engicam_px30_core_defconfig b/configs/engicam_px30_core_defconfig
index be5c56e19f..b25d536488 100644
--- a/configs/engicam_px30_core_defconfig
+++ b/configs/engicam_px30_core_defconfig
@@ -36,6 +36,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
+BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
