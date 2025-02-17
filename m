Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A03C021A0
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 07:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2FE64083A;
	Mon, 17 Feb 2025 07:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wufZoOGoxVvO; Mon, 17 Feb 2025 07:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 844054083B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 844054083B;
	Mon, 17 Feb 2025 07:07:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFBF672
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 07:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0952403DC
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 07:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pe9lAM86g5v8 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 07:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.242;
 helo=send147.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D74A1401B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D74A1401B2
Received: from send147.i.mail.ru (send147.i.mail.ru [89.221.237.242])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D74A1401B2
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 07:07:32 +0000 (UTC)
Received: from [10.113.239.67] (port=55792 helo=send220.i.mail.ru)
 by exim-fallback-c85fcfddd-94xpv with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1tjvE1-00000000Kar-31eP
 for buildroot@buildroot.org; Mon, 17 Feb 2025 10:07:29 +0300
Received: by exim-smtp-844687bc8-llwwk with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tjvDi-00000000J2x-3icr; Mon, 17 Feb 2025 10:07:11 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 17 Feb 2025 10:07:08 +0300
Message-ID: <20250217070708.189713-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93899CACFFF273C59BC2F89675253D90E41C313177E70635D182A05F538085040730338D578FCED003DE06ABAFEAF670514DD40694ED806B2991452F35976177A22153E7FBF342507
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AD2F2D6F6013FF7FC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE781307CBDB76B677BEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BC08E230531AC9C90AE94E91B60F9FAD99489E51094A032375845B3ADD0613FE81DF9E95F17B0083B26EA987F6312C9ECB28585415E75ADA9CB629EEF1311BF91D2E47CDBA5A96583C09775C1D3CA48CFC3194D76C41E9723117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE76CD001D47D3CCD289FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B6D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5E8820290D5F4CCC75002B1117B3ED696E29E5ABE21A5EF796E5F408120975D33823CB91A9FED034534781492E4B8EEAD5C5DFC4BFF39B799F36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF4E00CA6B6E9D646EDBB53E6A602CF38B9A2CA1BF17B2FA170B9FE527852BB4D9CEAE7BAE235C0E40F7DAF9EE0634D236755FE7C3996CA75B320AEF7E0E5A7A8BC9D59B85D4E13266111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWiyXSWEEqdr26jearu20D0=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219471C1328615752C4647C6F9414F12F39862B4B167F9FF0A690DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4BA09097AEF4FF40FD82BE83A5A2F87B73E75B41C4F5E2321049FFFDB7839CE9EAA552FCEFCAD8FCC3111E4E8050ECAD5759C534901D57133712AC59E73F40298ACBBE21A65185C0E
X-7FA49CB5: 0D63561A33F958A51A408B6C55A3738C5002B1117B3ED6962509CD57C6F30FA4984B9450E8916CCD02ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZFL8KAnZcEw5oC4MsZPonxQ==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=P7aNv07CCcuFmDreJd/j2Zs0Qj/xHfJHj3l50TycZW8=; t=1739776053; x=1739866053; 
 b=vV0FY5b1vhfcm6HUtL3fzmaWY5QbedUZF5LPO0sKFUSiYMcENfuNh0IApfW6kWsQtltaxXzyIPa
 ynQkIX7MgT3jW//BluMCAlTIlu+0J1q+IV5/kUlRLGx5vdmRc3n4QhJ/FbiR3NUkPaPSLBtNL8+bd
 iN5cRukdUZukobYxnhNeiqMd2XV1fk454KGzw/6TG8UZ9AO5S+mk9gq95V5U3s2QYdTBuJdm5rmJx
 8qAjhMud/mK7wHpyTUpeL/PLOt73uQqeWfykEf0/TjNZqJKdTXoM6BXrttvKytGYoD/Tq2i2/3bKX
 9sIDDi1BBvwo/kgr9WfUWR0HCOdLmwY7EfCA==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=P7aNv07CCcuFmDreJd/j2Zs0Qj/xHfJHj3l50TycZW8=; t=1739776049; x=1739866049; 
 b=qNtahdnvHqm6+V3P1oHE/cRcdUrVtula6zpAf+wO9lQwqFb/ZcAgdt8FmkC5udM5ixzpEoyJigh
 wOeh/oeh9dpEgvDTYxuvbhWISmau0agWwRd7BmNvNazROQ1iwXq+B/K5RkW/K5U8rgJFQJIk4iBXE
 UcIuOyIJ7YsZnqTR5lSHq3jKkUPeJYFknJIEGnhNdZjbgNl1pBCazK5RMHCb5wnhxOg1pU4uRMC6U
 9almNXNerhx3MxMNW0L0iCxreFRQeWvI/n8p3E+0zAhV9M4MnL8vl9u3gUTNuo1wRYe6MfJMkiqu/
 Rnpji39cEh85VFbyFfFFQ95n+/JKUEj1NlDA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=vV0FY5b1; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=qNtahdnv
Subject: [Buildroot] [PATCH 1/1] package/libosmium: bump version to 2.21.0
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

Release-notes: https://github.com/osmcode/libosmium/releases/tag/v2.21.0

Bump minimal GCC version to 5. (Switched to C++14 as minimum requirement)
https://github.com/osmcode/libosmium/commit/a83fbf8852b00e57bf30fe3f69c37f575726c7d7

Remove support for projection using the Proj library
https://github.com/osmcode/libosmium/commit/711721cb1f37dff18bcfb2e5fbd7667c7a22bbf0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libosmium/Config.in      | 6 +++---
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 6 +-----
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/libosmium/Config.in b/package/libosmium/Config.in
index 825e2b7e33..c2e905cd37 100644
--- a/package/libosmium/Config.in
+++ b/package/libosmium/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBOSMIUM
 	bool "libosmium"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
@@ -13,6 +13,6 @@ config BR2_PACKAGE_LIBOSMIUM
 
 	  https://osmcode.org/libosmium/
 
-comment "libosmium needs a toolchain w/ C++, wchar, threads, gcc >= 4.7"
+comment "libosmium needs a toolchain w/ C++, wchar, threads, gcc >= 5"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index 37bcdd267c..82657d7fe7 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3d3e0873c6aaabb3b2ef4283896bebf233334891a7a49f4712af30ca6ed72477  libosmium-2.20.0.tar.gz
+sha256  5a222e555865f742102d2802a7ad7ef91d6e1c8944c097c70a924214e079c858  libosmium-2.21.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index c39e7d0152..e5392b06e9 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.20.0
+LIBOSMIUM_VERSION = 2.21.0
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
@@ -23,10 +23,6 @@ ifeq ($(BR2_PACKAGE_LIBGEOS),y)
 LIBOSMIUM_DEPENDENCIES += libgeos
 endif
 
-ifeq ($(BR2_PACKAGE_PROJ),y)
-LIBOSMIUM_DEPENDENCIES += proj
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBOSMIUM_DEPENDENCIES += zlib
 endif
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
