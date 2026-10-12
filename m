Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04A4CA9ED0
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 16:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74EB960670;
	Mon, 12 Oct 2026 16:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05wUa_AQJf26; Mon, 12 Oct 2026 16:38:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B2BD606A7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791823119;
	b=Vlk8N3ZFaqA1v56HeLXHSmVHtYz277o12/T1Dek29zZA9jltyO5fd3XJeixuMyowBrMJ
	 r1fGTvEd/1NRJEAQaXoFfPiTRqTQDBOj6/70KFGzNQua6+4QwcT3LZyIm1hZx7of/3xLa
	 Z65OhWOJmz3DXJzBXaLB7lyHpVFGHO2gZeDiF2YL3GJ6myS/dbyX38HJoHXrqjgHJOvA3
	 9IKtb+uN6T+oy3fyG7HcCUa4lhEUlG5zy2lpDpe47f5G8+zB+EJcowqJPLbCJPzrV1/Ro
	 hJjgKKVfxCxDmWqc0qUptE/J0fUvc6MDpwtxKsLsZ3gvAqXBy045TWC9Kq+o5ir1WNQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791823119;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vKV6AWkR/hHIWAVjOcQfqxS12Ir88UguxyHSeXFA9sA=;
	b=c8wYJs6zahiunMINirtSwfYmvUfBsnE2rKK4SPb/eJm6jJlsOZ7/6EpAjtF8BfxoduvJ
	 BL9qcyn74KDGK8/CUqazq74u1eAZxVBfwEWNLL6c+Gy3PrUeXCD488V7nBdKidYS60CZs
	 1AA9WlO7mWIIQ+Lkc9aA0OLLO63nkf/DExLHKCfAsJ3eVgGj8iaQWahgI+ge7dXftOK96
	 ifWOz0mD9fVDaj8gGefxAJY7O+r/JNinMdb+M8oQR8soP4fnqnWE8kn2ZkKQ1XRhVoBtm
	 UNfiB7v/82AGtcDetbVB99z5an6LuMDsHf7tGa9N10KNUVLFRQtUUGAi39pYLBtYKuw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791823119;
	bh=vKV6AWkR/hHIWAVjOcQfqxS12Ir88UguxyHSeXFA9sA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=flihPtPqRnRgp9NX7ebvehpKdmzc+pEXykuDMeD4lTXeufyYvuPyFkolcJZ8NZHF4
	 aDzR9QRElKZsWZKXAJVMDqPjPlx6Sn0ccwg3g8cIcbeY03zgDgVyaiprQTaHPjAQyp
	 +yaghn3HKvlBHe9wPu/gqtxOS3TtjdvYHluNAVunUVKxeCNhMgonax3KV30NJcy57Y
	 UtP7iUk/X6lk3QIWrM4Dd2L3NSiUbkdq8lzyCXSsDvJHMm65fYXZcsAD0SEWDCLU5Y
	 9tKtzN31Hi3iYgxv3tb5edhvhJM/CZ1WXvbOGPn438+S9JPejioBpuzGeDFFs3ey+3
	 311//wyk/c7IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B2BD606A7;
	Mon, 12 Oct 2026 16:38:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D71A6156
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 16:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF2440201
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 16:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFfOMjgLD9jC for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 16:38:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 367D4400D7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791823116;
 b=VUewkEKzxVQnVB1RISr75romtWT4J4TdB78ghK/B8pG8hX1CbCIVL/R0tD81Ks/do4Pd
 FwVBNRwQ6piV/hrv0fQkPEpVVGbQ23T8ZBqulCzzockyj91pblrvZdxXW5VXAJCj3KYOU
 1fLVhf1TpwZ6RZYtcNGT+hmRXtlLYbhrmipm0/tul/tbVZ2pNDPCOqFuQxDetvsba1gie
 WWl37uuhSv7vg0xQo1P5uxSZRFdGeq2vwGWsRT24TdQhr/ejXQyy4D+HGPEv5jQwVplwO
 gI3xy3Gi7FdglNGX3bn4TmH86f/GASTNSW7KgHWzels51NDHn6+e4ZNQVPM6HMYNsaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791823116;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=w9TByyBg2y4L5gLcMpghfCnERsjf3YR0ejRL+5WJ84w=;
 b=dspJIK89XG1J5HNHcU3DXWOEYLZtdWlXn9UPN9N7loxlfrmg2iz3G6a1AT+n5KsgONPr
 +SAe9QoWfc9UWOYxIndNehjGAWlD3BvqEerdZbbreBhrjfXdGE3jS4PW6k1JxSJNs3yuN
 /CiIQhevZGusktEuEuQgzGqgj7kr/IZdrWDVoaTPfSNRJyNA2YuN/qa+kK2eTTZwSKMOb
 UMEXgKw64y/TvJmttGQEuE4Eq5xE/KFikkJafRoxoeDnXOaWUlMm2e88qV3MRaUsPOnnW
 puOOWfz+QeaIiGI5KLSSJUlawrg///UiGRWH/SMC4f/erSsy/mvJyaSrFzQc/DU04VQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=mUUXLqq1; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 367D4400D7
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 16:38:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQT9-1wOKuj2G6X-015WuB; Mon, 12
 Oct 2026 18:38:32 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon, 12 Oct 2026 18:38:12 +0200
Message-ID: <20261012163812.1213902-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:5bSD+sG/LylS/eOD22s+xZkE+/mUbtB/EeHhwB7M4QdBPTaQo4S
 aX3aYrwrL6JpOxflCWTlu2XTFQdZ1ys9eu3vSrnSInYE09o6eFxXj/oI+kF6GfN8S0s/eF1
 tXw6bV+1lseRIKN2rsKfRS7/zjJxcCVzaUVEkuvIQaO8NqneZQ49lIX3uTqoIqHv2ywyaOT
 eqeJjoS5f9OxqWR01Uc8w==
UI-OutboundReport: notjunk:1;M01:P0:cDRF6vPByd8=;7iY2aCEtEujizzz3SWNCofFYqjg
 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
Subject: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2026.10
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Release announcement:
https://lists.u-boot-project.org/pipermail/u-boot/2026-October/634075.html

As described in the announcement, release archives are now published
on https://git.u-boot-project.org/, so update UBOOT_SITE
accordingly. Note that old releases have been added there, too, so
downloading old U-Boot releases should still work with the new
UBOOT_SITE.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
The release archives and signatures for old releases are the actually
old ones (including expired signing keys for releases before 2025.10),
and match the ones I have in my Buildroot download dir (oldest one
2024.01). I stopped looking through the release listings at 2019.10, I
hope nobody is using older ones any more.

 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 boot/uboot/uboot.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1eabd10407..d4e77fd0f8 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2026.07"
+	bool "2026.10"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2026.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2026.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -368,7 +368,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2026.07/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2026.10/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index e992835582..2142f0c67c 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5b3f46ac74..96b8cd0d2e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -34,7 +34,7 @@ UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = svn
 else
 # Handle stable official U-Boot versions
-UBOOT_SITE = https://ftp.denx.de/pub/u-boot
+UBOOT_SITE = https://git.u-boot-project.org/u-boot/u-boot/-/releases/v$(UBOOT_VERSION)/downloads
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
