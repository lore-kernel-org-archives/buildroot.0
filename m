Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D6DCA101F
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 05:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2922815AB;
	Fri, 12 Sep 2025 05:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIKzIVwQl7LH; Fri, 12 Sep 2025 05:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3A5819B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3A5819B8;
	Fri, 12 Sep 2025 05:40:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6795D92E
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 05:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 593404038B
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 05:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XGmGDY-ErVK for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 05:40:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.116;
 helo=send277.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80E7540389
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80E7540389
Received: from send277.i.mail.ru (send277.i.mail.ru [95.163.59.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80E7540389
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 05:40:39 +0000 (UTC)
Received: by exim-smtp-6658775494-cr58c with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1uwwWS-00000000RS3-0fxZ; Fri, 12 Sep 2025 08:40:36 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 12 Sep 2025 08:40:34 +0300
Message-ID: <20250912054034.35961-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD99F281FB5F96F126DD54A957D496A47047E8CCEE0122D3A5700894C459B0CD1B9F08EE34F12248AA103AAE3001806DF10BF61B09735D93E742B5F926CAF0A993E6C831481B6BD6C10
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78887611F2F2455C9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566A5F354E88FC47EC0EA430F1152703224269920C1099F3093A9C03B27EC15F62E8EEF46B7454FC60B9742502CCDD46D0D062BEEFFB5F8EA3EF6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249691691B2CB2A81D8CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C921661749BA6B97735B272A53F9BBAC8E28941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3FB9365559B687AC835872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A53A7D996474297F3C5002B1117B3ED696438FDA5C183DAD7D5D145BB8EF0DE66B823CB91A9FED034534781492E4B8EEAD577AE849BCD98940C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF52F271A89078BFEC84CF66A2AD960A55D25DA9AEE869C527C187442378FA47213066587AC4ADAE8203AE5C37BC66C6296398EACA26CAE7904D4498F698053757F8A680EE4D55EA70111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtbATchRlX+To4DXAfvz8pNQ==
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB67CF4B389D33AA3F816AAE10946E0378D75CB9E0E55DA3E0D90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=xzE+uKA0jIh6EyjQEYZeOUzG3uWAGcTDgydroo6uIew=; t=1757655640; x=1757745640; 
 b=iW892yEU8MzPVhWBlOrPwETR0r86vAfQPMIzMVrJbG9Lja8Ge2SkSYUqVLwF6FHOO3BVq1GDzAu
 KVznK8nP0DfU6Ko+S2spr6yJL5+F6sC1FrSJofN5q0SPtRjpJzRQgoj9YZ6bDPVGn/k4EoiTNvAUq
 +VCbtMP289h/G7lAeJqIjoCG6xrRkTTvssUhjX5oBrHbPB62uvu/Qn2U99D2gLP/tOH1wgV1huNig
 d0c6idWBhfiwpO9pMQh0Jx/6p5BEPO8EPIWDZEBe7PSj5hS9ypk0IdgH5MovP6o/qVEPGdhaXwasl
 tqv4G1uS2pexrUgHFZX97YBukzmqKYnPexQw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=iW892yEU
X-Mailman-Original-Authentication-Results: exim-smtp-6658775494-cr58c;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.14.0
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/libgeos/geos/releases/tag/3.14.0

Bump minimal GCC version to 7. (Switched to C++17 as minimum requirement)
https://github.com/libgeos/geos/commit/e142764b77f4b8d0c36ec88406300c5f876743fb

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/Config.in    | 6 +++---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 package/postgis/Config.in    | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 76cbb9bdcd..ff88f7254d 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBGEOS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
 	  JTS Topology Suite (JTS). It aims to contain the complete
@@ -13,7 +13,7 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads"
+comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 7, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index f404b267e2..538933873b 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  df2c50503295f325e7c8d7b783aca8ba4773919cde984193850cf9e361dfd28c  geos-3.13.1.tar.bz2
+sha256  fe85286b1977121894794b36a7464d05049361bedabf972e70d8f9bf1e3ce928  geos-3.14.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 475a54f79f..0de73e2688 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.13.1
+LIBGEOS_VERSION = 3.14.0
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 593c0dc1f3..a0f64bd76a 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_POSTGIS
 	bool "postgis"
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgeos
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libgeos
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # libgeos, proj
 	select BR2_PACKAGE_LIBGEOS
@@ -17,6 +17,6 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
