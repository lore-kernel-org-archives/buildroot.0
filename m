Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7C4C3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A691760826;
	Mon,  8 Jul 2024 20:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQRKTJ6C4N-f; Mon,  8 Jul 2024 20:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7FA2608D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7FA2608D8;
	Mon,  8 Jul 2024 20:21:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8991BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED0C34033A
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVMPRCSFX3a9 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0B8F40133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0B8F40133
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0B8F40133
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:21:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.165]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf0U-1s1EpY0YPC-00ka3r; Mon, 08
 Jul 2024 22:21:34 +0200
To: buildroot@buildroot.org
Date: Mon,  8 Jul 2024 22:21:17 +0200
Message-ID: <20240708202117.3607581-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Uobeow4lbWc/Ay8tLc3TTeEgRTsUFdRAd7j9hGatTzqiZN0haVy
 n8qrWgA5XIxyYh8c0gEmFw7zeFAVCbO2h/E64gFsNHjtcx3/1fm+Hvf0XiwjVUdnBhkdCYf
 HkQiNoh99o73xRxtu6/vyL5Ba4Oiq/13R+1oFw2wUC4KYzEbpk2KRMF7W+czdIdYFtQ6sbE
 tjxQ2pp9lgs21mKbWTb1w==
UI-OutboundReport: notjunk:1;M01:P0:xGm2wewtcQE=;rKe/QDkahw4uDl2SVMmkkwPl7vU
 OSsUmMOa82nv9wc/9dJMbmT2LAInTfe59i2ozJQA7aCYPdKi7RLtfgR5TvIVrXtkrBV4CCsgG
 oN36X0K3Su74t9PEUnMVfGJN+ca8GHrU+xAbhxTt1ZvfxJE2lNtFOsGKAwN6r+qBh1xAVmENP
 khZasBDVzEmavM9qRDVcN5KJsuRU/bBy1S6RkBVsTtE15HRAKTkfIdM8w6wL+sz2vl0OBTQbr
 +YHyKhIxKn2bmVaZINhkxDWaaJHw5FtAKb4Q1xA1XGCLHcfHXUO6qRsz0cPOhKkWT6uO21Qvs
 Wre4/qePSL9EbTge/jrgBsLYo9pqfk3XAiZkywpY10zEqh+bvXt1nHBMIxaBRzd2il3rPds30
 jk3L6ZKLVgCvBacXAJtZMZXMh9dj1BFwCWh19Uz4fLbxjMOT6GJWVGaQ2eCD/8HAWJd6R/Qij
 7Ukk+DVzQEsplOiP2Bm7voUZ83RmhKseSEhpsvUdyKk/N3VWZ7t3+opPkPQxsOXUebUrBM13A
 our2o+VkEmXncPIxsRhpx+6HibS/fa1Ppw9A9E4K7zkM1xbsgrq6nAeB/Hs/sfUqxHAmQa8vM
 iJB0/qI71gvvwI1zUs+nCeA5eWG9FMb/MdCB0xf9ypJPp6YUGHXE4BVkOWIG37Kfn96pTSIyW
 wVjNiFIvIM6rdiF4NfyE84++QZge5zfkJvhK+CBwlTvdyjDjNkywce1l5Db6SzJ8bVR2wLgUK
 bEOLmvvh1614Bhi0fpBWWLpfQ0nguQ5TKaohDQcTqfC8ri/+v0o6i1IzQv8WlNpAPiv7VKjc8
 xuwoVbay8uC6rjWhKI8ahyCOpc4Oxk6MAvHNT1uiaxXRU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720470094; x=1721074894; i=fiona.klute@gmx.de;
 bh=A0+mX/EbTLTaOi7GmCFDHj/lFLxp9+/l0JDjbO7iK4U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gOUs5aszZn6LOmz7kHI2nwQE5g0w8MurNWfFBYa+O85QKl8t4hJ+9CjTrQjOIIUU
 wppMgjgZoBz7O3ElvE1rCXP+ccyP0lAvlVyYSCGpmss1cjJJcqJZP6VFSl8R/9Oxa
 3UijIxVL5DWeJ+oAsi6Gqf1tIORD+9hXG/ILNmdDsx7k0EFzwr/M3cUE/5w5NE2ZK
 wxyK7cUmdvFu8AkDcZHzIQMlA1WL9yNSXBxzEx/078u74z+iRVCaU1G1GjmkZ7hVU
 nXHehsYsGPregVGRZUofPSsWJuHDX4TYC4/Z/TWkl0H5HD+JNJzlnpc5/a1plozlo
 QINQWE53NlVTBEdUXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=gOUs5asz
Subject: [Buildroot] [PATCH 1/1] package/network-manager: allow building
 with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

NetworkManager officially supports building with musl since version
1.30, so the restriction to glibc toolchain is no longer necessary.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/4f7c04eaf94849d0455e97ba9bcfdd0b84e6459d/NEWS#L615

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/network-manager/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 57d7543131..a2b225879d 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
-	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS
@@ -59,10 +59,11 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	  This option enables support for OpenVSwitch
 endif

-comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
+comment "NetworkManager needs udev /dev management and a glibc or musl toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6 || \
-		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL || \
+		BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
