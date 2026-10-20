Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10BE606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YJqZe0ZL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=fTp0FLQC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76DF280D62;
	Tue, 20 Oct 2026 10:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7owuaoEjaQfB; Tue, 20 Oct 2026 10:29:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1091E80F21
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792492162;
	b=NNqeCYTeq9uuN8gJI9gYV6XM6Q4Ci+7EKRjzd3VoHSWHlVmVC+gyq+pLI8WyN6kQjkbQ
	 xpOdY/uNnC/rP8Aa5ewWFg5RGRGvbG2u9iyAmhPBOyKea/wxuCcLi8JHfWLI49agjkro3
	 12puoU6h8jZKkCHHhqJZ2Me9uS32L/+pfaj1JEwhrKk9O9lJ1sGaknURfi6MT0fdrR2R6
	 zXRK6FB0MABl5jCCjvtkud3IEBvNpBiB/BVA8hV6dbQUlcgGiDCjKxQ/oE5y7MbAwNiPs
	 Ynp3YMnboSaIZV07Hf1z/5H2UAaalPJFprzSfaXoFgnbOlwQhDLbxQ55xRQhV+CFE6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792492162;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=X0PS4RwjvtK6Uxp2CmSjzDAxCrIsAkFiBl+yW0IfWJc=;
	b=F5G3KybY/9c0rxG+Paeke6Y/pg+7uCE0IMKxsuRWXtDncEw/UIjsh1haEurhF0/tvzUr
	 mIN6d8xr26hBlqtUkYDOy7O/dK5UR8C+DQXU645a7Il3SKQLUAb2tJM9VSukP/GMkGnyR
	 LN1GgSFqDztbKMdmBLrmUSuUx76V8cJop3WniYTKb1dPtyItngTl4ZkYfPsAlFp/jzKms
	 oLKf9xquBLH/vA+mqykSnwo6HfzGN5+/OPSaGiiRIo7eyh49ayc+54tFm0cSiMmQlkBnR
	 la2BV5CwAEKneIKGzTnMsPMgrgGv8nZ7rO7fNPnCgOgzJg6Hju8dEHynxLmWCKhQMcg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792492162;
	bh=X0PS4RwjvtK6Uxp2CmSjzDAxCrIsAkFiBl+yW0IfWJc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YJqZe0ZL5of6y+1Q77WflN0ynTfB3B2Jqc8M0jnK36nDhcFLkeiBbgYPDUwpwb5xt
	 GSDGTyZqe2fvKWrwWadQhxfV56IiHtYg1Dm39qpTiuvc0T1DyUvyaV7PSDT9Fcc/Rm
	 zIiM/CkR33pBX14GpavAsngRSswfMrEdOGIy7/xGDAXxthXMvKP8Oh4xVLAPQd8r59
	 GK1xRxxznSmkG0KopfAbKFipm7IIJ9XVB+1i7+s8HHT06MIpZ246l0b3XMgFHm1It5
	 G5fFIxU1Ww1+GIwTw98JvW1Lw7BLIEXssXN7Rn5huCvwRtNOj80M8LfORwBJyj5lra
	 215OsfqKWQ1rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1091E80F21;
	Tue, 20 Oct 2026 10:29:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 344771E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B03460822
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lPzQDhwTslT for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:29:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C3ED60825
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792492155;
 b=A4mWAvOm0QK/wIZjV8GRTNyWintOkzFcD9nJoeMRlZ34Gd+Ss5fINlPnA/kwuv1ppPPS
 hddYcWJhxd8d1n4jgkRAOVZ7MMXSIOta57zS44sU8Xcc7jG398e30LXyXV3jUDOqPdDDw
 RrykfuW569w1qUExbBP3R94LH38LQhYPSNcton0IZ0h8+diw5xWvOP9s4BiEOgNrsrZab
 XifURWtiSmH6W5hZ3jtxBavsnhTDBM7lOvIkije0SFZBxVL+qeuE/oi13bME7BN+MVDyc
 AnCqYXBStft6oQciPwz8WS/6a/q9zwJ0J1dWawolHIeORtYKk6mvphFhyGYyGdChdsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792492155;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=DiUHTHgdN32mD1RTWCzkWwDegFs/Se/0C0OwmVYqZeU=;
 b=jSb7IJ3eJEXhRjQaxXRZ99MlGHfCCRkrmpnaU7nmzJZt8RVReKDLrWDFR3M3Jb7XDCNw
 0BnFkWBbFm5K5g3Xd5ulTj0FWZDB1PCl73ppD6f4CpGUhipXA47bgUoaO0xncPSXP8sjv
 ou6g7vXQ2ok8s+FhveNYVtzkpSzYvPdq/DD60R5ffRSG/PztECiNFTR+uuLv2qyp1eWls
 060J51t6fVsU9QbBzZJlDV0uPOn0Cjq1UUPgW/e/P/qjWl+tt0imX5hbP3NH5dK6ys3Jy
 pcwC4WbCmK/WN7x6uL2Lp4IpiwizAJSRFk4yWekcSXtb9YjvgyH5k7/DFB5kkiOfFnw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=fTp0FLQC; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=fTp0FLQC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C3ED60825
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=fTp0FLQCksIpXpLybNtjMnt3ebn7oW7N8mvNcDTWLejBkddnE3eDG4aae8pvtD50qKfWreF7AqO0wlqq1vMpGpTC4Jmg3pTOalEho2vabNmcrTzNNEgtBFxxsS4fIg/L4QkydB7aQ8Dvt72AqrAZEF37oxkwn9c0OTb/rrRz2JN84HTKGwCAFsl4VKOjlTH5T5RosQv5CrY1/S2sq78G+YjvVQD+U8sc19JkoJUrLSPZQaPkW+BEE8lkkvMqFylGwhE+0kcHVywB7/38halNvK3eMcBBY1J4xfrrkJStVAMAC6meCFbsQRIBoTRCeN6SekEe9e2xUpY5dCpOB1c6vQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=DiUHTHgdN32mD1RTWCzkWwDegFs/Se/0C0OwmVYqZeU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1511301766; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:29:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xJ75j-0000000833Z-3wGw;
 Tue, 20 Oct 2026 12:29:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:29:00 +0200
Message-ID: <20261020102906.1918308-6-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020102906.1918308-1-peter@korsgaard.com>
References: <20261020102906.1918308-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 6/7] configs/imx93-evk_defconfig: switch to
 Bootlin glibc toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As recommended since:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx93-evk_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/imx93-evk_defconfig b/configs/imx93-evk_defconfig
index 05ab4ae7af..8c85c0e7cc 100644
--- a/configs/imx93-evk_defconfig
+++ b/configs/imx93-evk_defconfig
@@ -1,7 +1,9 @@
 BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx93-evk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
