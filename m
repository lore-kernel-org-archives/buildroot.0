Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118DAC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 06:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82D1E60BB2;
	Fri,  4 Sep 2026 06:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bs0MxFb7vZd; Fri,  4 Sep 2026 06:54:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8359E60816
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788504878;
	b=IkouTjsnaoifF2TLFsMZSBOXY+gQupCgiiJarZgKmd+I6tcLuPh+fZDPo8hG6xyd/PKz
	 trnzS5tN9kFwgjK2nl1xd5Q2wo/KVTxoedY3HoP9au1rHnE74zl3djcllVIdqNngTDMER
	 X+S96700aTOlwxuPs+sMjshTGUkUN4UsWYWPE0FtSupEYlt1pMKwUJKETvJAv4M/0EMzR
	 K3StMoj2l8fg7erHmDcCDDFTMQml0+QQwH1ShJQpWP5JY6IkpbL3LHyFyOJ8JHEfYB+pK
	 2dEhIOSnFqbjXR4hFDUgSoxV1HQvngqAMK/xrd5KPhfwXF/ub0v/txPpZ5aGCXx8+hA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788504878;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=wFMWHH8UpzQXQK/jEc+6Vc62cFHIxMRt91lMmNMQ4XI=;
	b=flYY+pRDnu4oaqXDPAfdJYiPdUU/S7jdZAxLJFxavjlZbfLbX0n13e2+ZlrVGOAX0CN0
	 FiylNaP1QCxe6jdvl+u4f7m7OFO7ezxZ2NMBopgqyYubiE72jFiOYCEiGcMG3EHsRXuVu
	 TJz3b3n9+BMqUzggr63IGtrCJbiYYfbDKLnZbWCxsMdCd4qQcEeLUN4lZwdbxN7mSfOhf
	 WssdvAhRUQDkcouIDMDx7ZWaSZ6MmUCP+2H1BrWA0L7ymIrXt8jxFDpGfr+JqZkOBT4Vg
	 +WWJ6ET29zOmm6Xl1qCcgZ96VtTo/ayKhHpQezOJqxMruJC2u0VO1gZb3gy3G10WVmg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788504878;
	bh=wFMWHH8UpzQXQK/jEc+6Vc62cFHIxMRt91lMmNMQ4XI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I/HRpZ0NwRGpDCHZDdPKyrTh5umFaa0Ppqa0+Fkx/e1uYEjZr10bAvsJECvXfxkdQ
	 4NfUjy2zS7xv76tFbUQH11KtKrNeurH45gTyr48BrDh+Gjj6buOkaeR7XhB/hOKfGR
	 qE/jgAiWEDtb2mYsI4xL1mB00XSFacz9VDH/C9BSbOT1+KzEUjRje4NspHF7ox51SZ
	 GAvO04nCgYfkh+TXtbtSTw7m3Jj9+jE3vvWEJqwdo4FRzyMhOz6W5xRx12RilMSCxu
	 vcWsE7iVHj1ynn+41EtYSK7LrIOEcSvC0avn4/8zcPvUyVOtEbXUKnK3mRfSDQFMLs
	 TxZSMMGM37PrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8359E60816;
	Fri,  4 Sep 2026 06:54:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C21E2FD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 06:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE715406BE
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 06:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVq_ajvOV6hM for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 06:54:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9C06B405D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788504876;
 b=FSVLLI4ZPHZPJwOVlTJ6q25skRsZ9341fLKZcfh09RtuXiQKTsOnWGPMNpNNGjJ1qMjY
 mpagXE/O2HvdD/+mf1sf4RzGYpVD2gYUOd5iEWuHF/o24ABifLeNqNrWVfHhsf4NUQIbs
 9qoo53YE+V1FDs+do5R8qQyHNGkBIkpihwJGKtiRa8X9FNRYTim1LSnuZsUj4+ZrogmlZ
 jOrRNxqNOG/VNhRCJJQQTXgX/YX1kdYCgvTfQCkciepFwb/0qVrQWWsKXueBIPKeeoltW
 d1gd74IDLOY7QhRWr3iIotAVPMejfmIv9EUODMqk+7n6Nt/0a2nIIAbq4bN8N6Otm2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788504876;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=swWcjZV+pI1HZJJeXXcbEJ2FYVvCioRv23tVr8fWdgQ=;
 b=Sz63G90A5o9ARZDUz1oX0LgWAsr97Pt8fodEvag3ZaffoNhlGF5rd5kTz11zhA/5YaoQ
 uCC0TyZh8AANOxzaK0Bpz1b0+zYRJ5RuidLNGodk23kxPDv/aUkAOphV81y3pSZtmAPCP
 +lX0Rllh+Hc/+l7fJs64DzzTCS2C2Gs5NPVuBGxzC2atroVnZt1FTexzlocPhYj1Cbw7E
 sjg6jar7ZVzeuIh0rE/9eZl2N61M/Sw2V+Egn/c67x7AJeJgvZMbhMw+cPylXWaVK+7NL
 7ElIsbjEoPiWBNDkYezLOgCFx5R31C5usvw8VECV0vYcXw+VwXZqIpeksup/iV0ck9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=vt863kBs; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
X-Greylist: delayed 84578 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 04 Sep 2026 06:54:35 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C06B405D6
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 06:54:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 48AE31814BC; Fri, 04 Sep 2026 08:54:30 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 08:52:55 +0200
Message-ID: <20260904065305.575693-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.16.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.16.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 0c205fa30b..35c3d52eea 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  be23a52b85cf04cd9587612147a10b023d59ed9757fa1843cc99e615d6c0893c  catch2-3.15.1.tar.gz
+sha256  0957cae5821b17ce07f0833aaa52b5137643a8382203221f363a8303c109af34  catch2-3.16.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index f62eda71f6..d33ec8e289 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.15.1
+CATCH2_VERSION = 3.16.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
