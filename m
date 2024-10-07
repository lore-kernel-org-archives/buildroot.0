Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC961CFB452
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 18:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71132607C7;
	Mon,  7 Oct 2024 18:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EPfe2p97bSh; Mon,  7 Oct 2024 18:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 556C7607D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 556C7607D0;
	Mon,  7 Oct 2024 18:45:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FEF51BF34B
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 18:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F47C80D2D
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 18:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AErr_IJJSeOa for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 18:45:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.84;
 helo=smtp46.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD46580D24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD46580D24
Received: from smtp46.i.mail.ru (smtp46.i.mail.ru [95.163.41.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD46580D24
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 18:45:11 +0000 (UTC)
Received: by exim-smtp-57dbb65494-26dtd with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1sxsjD-00000000Qmx-3w0o; Mon, 07 Oct 2024 21:45:08 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Mon,  7 Oct 2024 21:45:06 +0300
Message-ID: <20241007184506.2459716-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9B01871A0ED523BBFE56F99792CC1187A2EC73447709F4BD8182A05F5380850409003E8A79E0041363DE06ABAFEAF67055BB64621A627F7B30C78AF624C592BACCAD80AB92358092F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AE0F15972A9DD0A8EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370D24454B2F95E3848638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83C1A4BF37A2B49E0EC9615ADAFF4F8B18508554D8769C07120879F7C8C5043D14489FFFB0AA5F4BF1661749BA6B9773575C7CEC5ECBFD96D8941B15DA834481FA18204E546F3947CA85A14DF5F041C99F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637006720155ACF5028389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FCF1175FABE1C0F9B6E2021AF6380DFAD18AA50765F7900637F09814068C508CC822CA9DD8327EE4930A3850AC1BE2E735D2D576BCF940C736C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A513DB4A62DE05A69B5002B1117B3ED69633D5D33229BE8C659E040399BDE4761E823CB91A9FED034534781492E4B8EEAD5C661552D0158648C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF14CBC6CA37863E99B9A2DF6778AFC9D93827DAF34C7802D04BE8CF83FE0BF155C6BFA615E6C3782A4C7633FC567861F3E0AD5C13967656CCBAFCC3DC6FAE48229C1B74D308D1022F111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj/pBY5inp/EZCt/Kv/bDOwg==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B653A7AA65F98A44AE0974AF810423B924D2CFF60833335D090DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=A4yEFcL28OgQIo+2xh42eD7TSbNyTAjVtqj2n8uv5IM=; t=1728326711; x=1728416711; 
 b=Xo/Z4u6cuydpC5cR+zzEXwfgJXjk4dezhMXaDucZFdSOyhs+EOl2bIz7iKoYP9bPV0n7z/sil4w
 AImDIBb5pHCmnnN8F3vYWxws6DPlvUufcFzD0aWjhAQlyv0KKSC7t3b1xkwLYf8jZ8WtGZ1szYpSP
 B+alkX7NSX/hB3Y8yn1+AW4eW11dJaTQg7IWY9pcNuSzREX1Ragp8k4+nfrnOyS9RSJCuytdkQQQh
 UCLxw0SgKZlJDqX/NbHoYocq4H6zhXvWd9va5xrvi/U2tYeTZlAqWffjVYUhPyu5NnS6dJZvcyVmd
 WiaMxopY577TVmNTCVTYvyQvXdfS0SUdFxzQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=Xo/Z4u6c
X-Mailman-Original-Authentication-Results: exim-smtp-57dbb65494-26dtd;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 2.0.0
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

osm2pgsql now use std::filesystem instead of boost::filesystem. So
drop BR2_PACKAGE_BOOST_SYSTEM, BR2_PACKAGE_BOOST_FILESYSTEM
dependencies and set BR2_TOOLCHAIN_GCC_AT_LEAST_8.
Lua is not optional now. So add lua or luajit as dependencies.
Legacy Proj interface (Proj 4) was dropped and option was renamed
from USE_PROJ_LIB to WITH_PROJ

Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/2.0.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/Config.in      | 11 ++++-------
 package/osm2pgsql/osm2pgsql.hash |  2 +-
 package/osm2pgsql/osm2pgsql.mk   | 14 ++++++--------
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index 439309df95..3b081af616 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -2,14 +2,12 @@ config BR2_PACKAGE_OSM2PGSQL
 	bool "osm2pgsql"
 	depends on BR2_ARCH_IS_64
 	depends on BR2_INSTALL_LIBSTDCPP # boost, libosmium, protozero
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14, filesystem
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_USE_WCHAR # boost, libosmium
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
+	depends on BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
@@ -24,11 +22,10 @@ config BR2_PACKAGE_OSM2PGSQL
 
 	  https://osm2pgsql.org
 
-comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 8"
 	depends on BR2_ARCH_IS_64
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_ARCH_IS_64
diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index df3302b2c7..cc0d91f98f 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b46313813b816f15ce906c04cd4108bbb05362740e0a1a8889055f4e25977d2  osm2pgsql-1.11.0.tar.gz
+sha256  05c2355b4a59d03a0f9855b4234a3bdc717b078faee625e73357947d1a82fe89  osm2pgsql-2.0.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 846a4ea242..7b54e4c0d2 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 1.11.0
+OSM2PGSQL_VERSION = 2.0.0
 OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
@@ -22,19 +22,17 @@ OSM2PGSQL_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 OSM2PGSQL_DEPENDENCIES += luajit
-OSM2PGSQL_CONF_OPTS += -DWITH_LUA=ON -DWITH_LUAJIT=ON
-else ifeq ($(BR2_PACKAGE_LUA),y)
-OSM2PGSQL_DEPENDENCIES += lua
-OSM2PGSQL_CONF_OPTS += -DWITH_LUA=ON -DWITH_LUAJIT=OFF
+OSM2PGSQL_CONF_OPTS += -DWITH_LUAJIT=ON
 else
-OSM2PGSQL_CONF_OPTS += -DWITH_LUA=OFF -DWITH_LUAJIT=OFF
+OSM2PGSQL_DEPENDENCIES += lua
+OSM2PGSQL_CONF_OPTS += -DWITH_LUAJIT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_PROJ),y)
 OSM2PGSQL_DEPENDENCIES += proj
-OSM2PGSQL_CONF_OPTS += -DUSE_PROJ_LIB=auto
+OSM2PGSQL_CONF_OPTS += -DWITH_PROJ=ON
 else
-OSM2PGSQL_CONF_OPTS += -DUSE_PROJ_LIB=off
+OSM2PGSQL_CONF_OPTS += -DWITH_PROJ=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
