Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12E8C79FA0
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A42E405BF;
	Mon,  7 Sep 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94eILwKygjLK; Mon,  7 Sep 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E37E540547
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788796446;
	b=D1gOZkuYtIU6DzUfuLLcHvsnsJAvMMG64SQhdybPQsJQ4pwTXe7JUpLG7jzB1OFYhG4O
	 xKdpyxZNIWbv49xYZ2j5ujgecaWPNgVhcd2vSt5W7iSk9BK6QHBlWK23SRl4GahlG977Y
	 8SgYIiL74bEEExblHNlkl1ZYrDecLmMuRWcv8uZWrkHlMMcanvwWpwD7y7R4ji+g7sfgX
	 INm+nlBcZBX/eDU+2IrFm+6j1Ypc+Hf+V6DRhI7chwZNfAJeD/nrEjCOtLNgwQ1EGDwJb
	 becu0k3Fqs49hz684/kbGGdtFW/9g46AriibR4sEAmoIHaWsoiwIaZoXxtlhhAtr8Tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788796446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gfqKSF8j3jXhVsv6YO+PY922jU66ZfXH54Kpoc3muEw=;
	b=grd0N9GHINwvOfHDpaiRjjDCYWkKknuIKz5aedznsXM7A1TS3huyZyRn8ZlypSD3xFk6
	 y2dDos4VGK4QujX6ns9nlLGyfIz+JJGPH2mmhXNZLiJrPjbSIfbvpUcr4VmOJdytNlL0i
	 T/nZbMQP74rU59UMBh2Q3gNokojz/QZPjvochGbLiLpwcHpRMWLbV6cuqLR5dctfGo8jC
	 o9kdkxeXJwfztz+E9/wGStyr94REJ5KC8BAbJXHY64g5QDukaBzek9qai/NcwT/x3W7Yb
	 J3H0//ePz/jIviSC6OgtXIRGsjQutG5LnSHYXg+dyV2mH6iCqRbGsrJHSz6g1v0geTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788796446;
	bh=gfqKSF8j3jXhVsv6YO+PY922jU66ZfXH54Kpoc3muEw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YVVCHrk57+54DHW2N2eZDyNVH2M6cu4FGL2raM1phAIZ5Ybdo1qvJx7D5e5D/eNrw
	 ggResRZMbpKn59hgBPH2JmPwhdi36/woI7OcVOpxmLKTbMTLdmW59uiSLAhDsgut2B
	 66dYOXwU6e1+KiNd+qbgV162pf7cf9H6ZvxiYB9iVYBwiTJOaOhy0EREvBW5ZoYOQz
	 a6DySV4MDrJKtnU54FREo4zv97r22wTh2eifzP1kCSdhWb52JUp84dVJy6XvqozebD
	 7crBO+moGudqpqYIpUpuhOPIg87Zk0oV4iwqbsU+k15fCzXAe0HQfTgWd9ahIFRKFz
	 xZ1BOWuM02Wew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E37E540547;
	Mon,  7 Sep 2026 15:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75A08A48
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A3576061E
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wM0fM-f0P3Fu for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 15:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CA32A6066E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788796443;
 b=Zv1DzgEuuzz1wkt+oDLl3erTN8L4xqihnl0YhsF1Zdctm6oP02toC75x9K04qTEJKgFo
 qXl76dcAA+uZEo4zHBBMuC9rvpFwI4A9VqtySuLIrF0mFRV7dwz3/SazMwIEc/60L4Oe2
 QXSdlKbfU2mrOxuwQpoBstKjj4mSpemlqhCtKWqWH5o5TgRRmVPxPQmbf3cwn7c3w5Hrh
 aFaILeMkWcALHo1l52dg7qebjvfpoN8Fq4FaElaTgTHE9sdOHaTRwcCKHauy3UXMp8Y4C
 AgnwsWEg8SUNF/Iz07OBFsI9FiAGXpZ8X5yf9Oc4BMulqnUB+0QfVVFYv0/FWFV8eJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788796443;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zgJ5upmh5itG83gb6HQkYRN3I6CNia6eTSfXzRJU3lc=;
 b=syiGgPKHtdkLRXQ3pQhh5iPuuhNwD7RmT7htS1tcLlPg6G/99tQSqDGw2djTyMUIs8wZ
 5x2LL209HKirdgS4sdTwhIIpNODK8wy0k8ddLdHF2xh4FDVuCmYyWgJcnYnhycD7uLzIZ
 dgzMFMQ3BiOjQHPqaHxvFFEMbvcN4joaa12r93EmdK5jE77+rFR2fDQnePxBoi69YGZts
 +yikonJsCwRHbRWb7xavb+CcQUaoV4kecv7bFFYIM2iJ91I11hRFN2sNL9xC5tHv63PGU
 YJulNSFIDNHEUX/5xNZztKI9nYpEOlB/Ds73CvLaeAaQHkLoDxE7qwpHEBdd1YhS1qw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ll1hebnA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ll1hebnA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA32A6066E
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788796425;
 bh=zgJ5upmh5itG83gb6HQkYRN3I6CNia6eTSfXzRJU3lc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ll1hebnAmczMDRGj2S9Z/Bbf3Cz70nivAUv1Inuap2fwUDOrKvPkadZtIIM0wIMa0
 FQKl42ZeQo/Myo/NqA6vZFs8zljXOTm3RJDBdDkcx9/GNLe0rGF7aM+lre1N0ogV14
 4HMauLLXmSY0Fvxwf8NGrLhA9T7tM9OZFNkfL0pqEIGCF5Y7gncwJusQucPBuLlK9D
 UU2LIGB4yo05ja/B/f63d7loiw8rinsvCaiwLo1zpjSSSomc1u8YSGrnxublGyHsCV
 I4cga1iQCxvk72xsaAciZnKr/2sCAdIpB2PSZVXG49qr7dHmwTzuRnB1NYBowa8dJP
 aDGRVuzvr98mQ==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 29D8DA4C38E6;
 Mon,  7 Sep 2026 17:53:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49438)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3bfF-000000001FY-0CTh;
 Mon, 07 Sep 2026 15:53:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Mon,  7 Sep 2026 17:53:43 +0200
Message-ID: <20260907155344.3755749-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907155344.3755749-1-bernd@kuhls.net>
References: <20260907155344.3755749-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/3] package/spirv-llvm-translator: bump version
 to 23.1.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v23.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index c511c79785..cc6a188eeb 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8d3d5c31c1ff355dbbf87046f1b94cd1ab5390439a817679ec71484df74cac18  spirv-llvm-translator-22.1.3.tar.gz
+sha256  9e0bf1beb0ab7edca6cd8c17fd9bbb7ce3dcd520f3e969e0485ff5b00931f929  spirv-llvm-translator-23.1.1.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 98e8f45037..21d0b2cf85 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.3
+SPIRV_LLVM_TRANSLATOR_VERSION = 23.1.1
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
