Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DC9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YsbvEY0E
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E357360A41;
	Fri, 30 Oct 2026 14:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gM_t2zo8Jks2; Fri, 30 Oct 2026 14:18:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2270A60B7C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369908;
	b=UwBPVsxNZT77Hd1TXlJN5WJykcjsDYaKCKEBefAsJhDTO/OV5ETl1JJkz8PPeQYToGe1
	 DTp9rdaQpJaSllthBEgqUtqAKIW/jg26AwctRvX9JTpsFo24ojWMmZkTn/6WLeszbTu5q
	 aNXH8htqfJs83azJ7X89hAXFVweq8AUH95rQtq2HV2jY6Xf4JzPyOoAoc4pTxv7g7eKI5
	 xT3sWBdb8mu7RS78BA+ZTbx3qpbPo161h+Vl2Iz4Ct2xMpMdC5v7ZPGOcs1LWD2QIIojr
	 MbXUNqVOzkix++SDMU1AOIDyJS2/nOzU+ETAayAm6E75lryGfvdmgWXobnBp1QiSy1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369908;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=TmqycV7pSfClo6vb4VQwdT2GmCgBGfMCdb1mTTJ7k6A=;
	b=EUolLWF8DyfCgI7azn2al784Oesx9dpN2HBDDXofC2U5OBmU3ZY4e52azXZyG7UKwdOH
	 /Y0zoppXJfdOixi0YRYtdKAVJi3p9p0xYXD/ndJkqFqT+ag3AeWViFl08OW6f2rT3E2Qf
	 OFbHsth/+TVoha+3nX5RA8o/jz05o03p7E1yF6+EINVeTZV2D94eVGCUCR8GQIqUcUuFO
	 OZHPVeZtlj2lknbjga+S72i7Cqvmn1zlmEccBb9RX1b7Gfqz9/2eB7YjuLB6SfqTWDcuS
	 Ik+RXtO7Eh/OC/COeZWMjYtIKzyii0e9HIZKQGxgeDu9IUXGRi3gc1YPOzjvtiH8UBQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369908;
	bh=TmqycV7pSfClo6vb4VQwdT2GmCgBGfMCdb1mTTJ7k6A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YsbvEY0E4tkFYYyy2QKaPQc5hB7tw5x5bdBZGnOoi6wg7+CVzqQPQL/bRhdsFM5uT
	 GggwGeZ0OeQZHWKsW1Mp2WHX8IBJ0Cf10cAfTixFMaO0pWadOEhSqKNrHmUQNX7EZa
	 BS9nXKebKc+kXHMG9XC62Y96eLoq8lGA/YMtPYhWlaPXq0XyAPX1Gu6sRH7uYd7AxY
	 ATH+1vvQiGEz1aGYH5+m+uLnApQFkBE7428RuV6iP3qfsWTS3Zu1LCnCePhheRZNDF
	 Ca9J2gXV7pmECPpSAsIYYz9sjnm8h31sGRNA95246SHKZhc0QyQ5l8VOBr6nyKg8mK
	 5DZhPbgw+3NLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2270A60B7C;
	Fri, 30 Oct 2026 14:18:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43C90D48
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34D9C81283
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBGE8qcIKBdW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 50FDE812C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=gyZtL45wP7OgDp2i0DslOa/Dzb5j4s090eOYHPf2J2lHyP/yrZGu4FAO+4JcBXdE3QF2
 tfb8/CnKc9s9cnjfcghKnmVziRbzMGgM1jc99wkU+MQzT6B9EBiVNc9Eh/Gzv3sBz3xPt
 H9OwRTKm1b/sNuE6tIhCsE9toiolngT8YfL7G8Nh2LsBv7qeRMLVNG2oj20I0VRdg8ejx
 QPpSCVqEGDzM5/eMLDGpB6S6akVCuo2fNMEnOoiPTbILRfqpaXdwdfXouYhwmEKx5kgKj
 xIMiKsOq18+4+IQBfDXKp59TGx9ecP1pczoND97jB0Kck6jbvZ6oPGceXDRq77yeVEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=49fAMUj5gU2/2RQUEUkuRhncBwYzyJsFW6+TRChuX5Q=;
 b=nJYVpdKxyGW06rzK/q6gm7szO45tOqlmDH4VH79EJKeSIq7DTAqJWkfLtpRV8H06qzKe
 deK0yR3XmtXu0F/o46PcdMTIu3f3OBvaghdsuwz5qjeWW4TlzpYZarT/mJ7C2MAkCJL+V
 CIOEXkxfLbIPw+2QcC5gukpNYCI/Uos2Bm/RW1/uMvpfQ0BO8PjVOG+O/904i/AppA5fm
 ZwQ+Uaxm2aZnkeCgOCbP2Q573T2c3QtgxzF/RptgTGDWxg2rz52i/yxIHbvHkEgSsOxxg
 IkjttVf+9+ikPItsz3oF0kgSAQiq3NAQRWI7dvlFPa7K/L0rtMkzgKqnkZO9hqWequg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50FDE812C6
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FA529D38A; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 13212eaef075c524d130f969cac3e61fe22c6a30
X-Git-Newrev: 48327395a78bc9da561a32d1ee1f97b418ee872f
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.6FA529D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sdl3_ttf:
 explicitly disable plutosvg support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4892780991184287725=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4892780991184287725==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48327395a78bc9da561a32d1ee1f97b418ee872f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since we don't have the corresponding package in Buildroot yet.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1db985afe7988e1170b817a43740c0dbb3998777)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sdl3_ttf/sdl3_ttf.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
index 04a5a9a098..6bcaccfaa1 100644
--- a/package/sdl3_ttf/sdl3_ttf.mk
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -16,7 +16,8 @@ SDL3_TTF_DEPENDENCIES = sdl3 freetype host-pkgconf
 SDL3_TTF_CONF_OPTS = \
 	-DSDLTTF_VENDORED=OFF \
 	-DSDLTTF_SAMPLES=OFF \
-	-DSDLTTF_INSTALL_MAN=OFF
+	-DSDLTTF_INSTALL_MAN=OFF \
+	-DSDLTTF_PLUTOSVG=OFF
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 SDL3_TTF_DEPENDENCIES += harfbuzz

--===============4892780991184287725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4892780991184287725==--
