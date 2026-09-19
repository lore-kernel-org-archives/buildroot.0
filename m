Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB792C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C8940B9F;
	Sat, 19 Sep 2026 16:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8aRDAmOCPFf; Sat, 19 Sep 2026 16:07:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C6CE040B93
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834019;
	b=cRniy7NjiLcTyXjBFBAMdXYcnBODxG07szPaDI9hLUfBNrGjwrM1tILZD3sgctkdNnn6
	 /p320EhsVJBIXkTAnF19oJcYvL+ala8pLpt+I189je9znwakz18n+y2i+dGjxtYv3BiM6
	 X7B3sX97yd/7A0rq5y96VDVc2/zu2/cuuHOclOnkWjq3FCyOV4nfy+TU6V7oxYEqn2wpM
	 9/Hjx4Q6LdXRGUaUCzVtzyBprzAVegGgEyLz94EAFDFACdMXSyRU/SE2Z+xlNrdxR0xr4
	 6vF1wxvg16ti+DD63SlYA5FMHxsaeOjemoxGX+tn8QIQQl0RSU2NtzRrpPMbJ9YMR3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834019;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	b=jpoNuDSY0cgTO0kD43RFyia0caQCH/zFiWs5hA6xM+bGOq24vR1bBIIo0DlAMhRzvcsk
	 gxOnbYkqr/xCsqYIh9UKBiwp3bePLH0nKF/ushdCmshr6dpNQnoDikSVBlEgsqQAyRX58
	 +5XZsfncuCfuxKXrGwG9RHv7J79+k5e9HSJKPJt/IHwf8HZC8GO3tRI2IZ8uUyAnv0dgM
	 eYt8LTHnfXr0261FGx5KLbr2g7sduTIaKYYCurEBBTioTHI8axCfnGHb5Pvmf4+sv3MDn
	 kdDoFtvW1Q2QUV9m7HHRy+r5ivcKMfnv9nR3xJArxP1gX77tGtzL1BRm9hU9KnwTmug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834019;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aubUY7P+5huMWx9NPfqK0tWxdzSQIcuht7DATvgPz8muZ58xSwh5+5w87GawRM7rj
	 txt6nkpZB7iQVk6bkmfBdcNvUNOutuvfG28mDfXkxR8if+9e8cr+SbyBt39UYYN83q
	 rb32bV5RIoYcK3qpqlSiOGkNUUDrmpRBVheCSVO6eUOS72k98z+32CbzXYq7GBSgL1
	 +icPXXR8G0N0n4+DdrBf2BsPRacC1MhiMznb0iSIE/34MTOGMsDig8S2cYKBqGxqTS
	 oYsOsWrhT+tFx/v6CZccZ1SdzkP0Px/ZDIssGr1i9s2HL7GB/B6tuDomSK2piHHexP
	 8FwUQ1SBTmiXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6CE040B93;
	Sat, 19 Sep 2026 16:06:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53C2D24D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45CF4400BA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKg_4WnCOsnk for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:06:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 51D5840026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834017;
 b=gMnWtsgKMVjZJW3AldvmSN7PsBoCi+DfrdEORipozIaYLwAEOaX70hPhQRnGLj/a6Sb9
 lR0aRyBkdHVkUmXO3x3uk/9l+jzRYAAuM3mpauCvrYWvd35Q2pYFSf6pyp2Y7TDWrPU74
 OzO/F1WuXJ5rUicwW2zRfjJDS/HL5AwpzhHjU0va3MdJ7Trs1LE3KmmHqXqLcIS62bBvP
 7iL0mNTPTMyctBCVVke1OEZz37anPVvMHXDVkmNhOJoC958ey7kDwhilN74Qo6OJJC7fw
 mNeBZziXvnvFkNvXMwVCxXf3lfRyR8ByfZvBNCbhcixxGo87BG+fYZ5w/lARjU7zJKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834017;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 b=qw/1nVIlrMXxvSpXYC7mNhv2RoMsYSBW9lL3RgIM02gRbkCLrrG2iSuQu0Z4CjMG67sj
 9SlfQXfUs6IeCs+0vYzdGWTXdm5cTEqaxNJCEIgWbL4s1uGRC3kFWvxCJcRgqeJMCI274
 CmK3/lSTQqbKChvyLLrtJK2vgDkZ32TaeaALohiVuezTCigzxCICYr5DidZVcRACqW513
 Jf6fj8AyNzWMCZKbFAWkAW94rSyd6cprORK3Si0ZMCGykhytWk57b9MvfWtPnEbsWkP8X
 SFcBQCTrwq6TfIy9Be4OlImWxNQ6Z8GPnghCXf9uDNWAe8xrH2M2Oux6SepwktnTkDA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kQJG66lJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kQJG66lJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51D5840026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833548;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kQJG66lJ1QbL8RHVjrgKMJ4afCHM6rDHBOnqU4mqu8u/785gQI5W6zsdt+lweXM+Y
 ZVPDnqdyjzmDtkoh6PBt3dgKJWCQoxVeZD6/pOPRDksdgs8S7L26UZJzPExzEYkDAL
 c7OEGBFrXxsCARbsyuitbtNMopQp3mBmcjjuj1Jx3nlBrRE8pSnj4HdXZeuCefvGFI
 xIKYMQPKgba0E8pE+d1MehzxTIlH4jadu5lrzBWkfkTKKJFFWy08GmHX+lLOEXLv1W
 mBL2arEL0899UyniNTnSEZpxjaZrRmO/Qv9EZItcmQb2hSIDINyt5cZH2QwAnEB/vf
 Mmw2B5osHo4Jw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:3W5xJpYY/nDEvLciG/AzwVC2wzLqSn88DX1dlTmYK+fZzd6apcXijtaG+xw6NlW3z/CU6wmqnLvVICa3oFno/I8rshWZcD0Ja/4U/261kU+AL2AhhEXv5HudufcbdmH2WOLZdeuUiVI1OZQjJNMEj43leVhbcRQw+jB4wt5XYsVuOXJ/o1k8qbzcHE+LORHKWjGB4bjOnIvyPfpcyjdLgxLogiTiQbgOChov5rgEN030U4uxz2NfrsIqhaHLnkkplQ5qqXXH2i6vi+xs/7X1FbUZiqypX7oGdmWhA7RGQjO8tweAFi0//mi5R6go4+8D+MeqVEWE+Brakxe/eNECftL0D/eHgL8nz+HZJD3RRkCyd9/+srGnSSOxc9y45LEBhws0PkZ2GbEtRG9bNm0inMrqFDONoo9jhXhSS8+QMpUy3Rwd5FY2wHyyer4Qjv4VCNG99IzV1srdHwayvmAf7PIydBZKtfONd9UjgxI0s7YLuPzwFjBAFI+vBZme8W/Y5HXO4Jprmo0lfMCeLv++wTBSke8xeA6hGvNfNrjXL2DpDKh/tXoNf1rH8xFFbdCtSqTM8AiCvBrnG3gspRZigHKByP+WjgETpusvwGbh8Y1pIL
 7c1YCXvkRzy8+nE8pf5vfgAdWM2Wpo9RWS7/+0YvGbAMm6ZDJv2f7oD13Nri25xoxvnKk=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A640A4C47C4;
 Sat, 19 Sep 2026 17:59:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSp-000000005Jx-1yD5;
 Sat, 19 Sep 2026 15:58:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:59 +0200
Message-ID: <20260919155845.5776-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 34/77] package/ca-certificates: Replace
 c_rehash with openssl rehash
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

"* Removed `c_rehash` script tool.  Use `openssl rehash` instead."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ca-certificates/ca-certificates.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f5675b754d..0f88df3eec 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
@@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
