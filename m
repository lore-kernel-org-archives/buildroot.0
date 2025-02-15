Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75BAC021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 06:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A32083A73;
	Sat, 15 Feb 2025 06:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Uogk9TjyEei; Sat, 15 Feb 2025 06:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3914683294
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3914683294;
	Sat, 15 Feb 2025 06:25:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 49267DF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 06:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36653427A7
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 06:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0mipv-LGTwP for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 06:25:24 +0000 (UTC)
X-Greylist: delayed 5478 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 15 Feb 2025 06:25:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7443742644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7443742644
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.195;
 helo=send100.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send100.i.mail.ru (send100.i.mail.ru [89.221.237.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7443742644
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 06:25:23 +0000 (UTC)
Received: from [10.113.101.156] (port=48482 helo=send217.i.mail.ru)
 by exim-fallback-c85fcfddd-2mvvf with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1tjBc8-00000000Vsi-1dVn
 for buildroot@buildroot.org; Sat, 15 Feb 2025 09:25:20 +0300
Received: by exim-smtp-844687bc8-k86vx with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tjBbu-00000000L4b-40Tr; Sat, 15 Feb 2025 09:25:07 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Sat, 15 Feb 2025 09:25:04 +0300
Message-ID: <20250215062504.329826-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93899CACFFF273C5956E6C16324CD68F914FC7F4F17E45ABD182A05F5380850404F5720209331D57A3DE06ABAFEAF6705795AC169AA19CB6C1B732CD748A3BE48CFEC41F7248C3CD5
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE755BE8F535441E38CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372094AD700861FA748638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D876A80B2B6EAFA502580E203E217297D732F368161DFF648920879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C084ED00A64A654CBE8941B15DA834481FA18204E546F3947C724336BCC0EE1BA8F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637B0838A0F9EFBA1249FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B6D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5555ACF181E7153A35002B1117B3ED696A234AD526A4A454A6E5F408120975D33823CB91A9FED034534781492E4B8EEADB0A1B66E9F5C9ED4C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF353F18584B8C376E28DB42FBBF1C4B112539F7AF4BB0F450D3A9A2FB35F6C8B2EBD4E4314DA78065F7DAF9EE0634D2361DC3BFF965406FB1181E98F1A48678A7544D644AD9275498111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWiyXSWEEqdrU8C6+tvexf0=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219A87E00247B8B4B4B5B17A4CC28C87C20078C2116472D978C90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4BA09097AEF4FF40FD82BE83A5A2F87B7D4531E66AC6DE876049FFFDB7839CE9EAA552FCEFCAD8FCC34169CFAB39EE39DCC5C45CB1EAF2AFDD5972B537B94980971B6C1FF0C78D1B4
X-7FA49CB5: 0D63561A33F958A5D0F0C08513969D305002B1117B3ED696CBF170CDBB301BFFA690C08FA91CD20B02ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZbg3E5Lc5/qUGfcEsSAZpZg==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=L6YDPvpyaTnpjckVgq7LJq8ITf8m2F9iiIobtZq40Go=; t=1739600723; x=1739690723; 
 b=hhAh3Nxo2m8tWAmwqerx8onnaO0pDtuLPKuQNJ+osIsiZjzldvH9n8kXYe8foAo51yprA0gkLhG
 j8xr9g2CkeRpPzDpU70eDu7qgHBuolHcSgl30zZ1PXJ5Kt+VV5FrFFk7x27J7BxrsoU3voafQX/yP
 5jWt5nLbHHanRTLZ44dW2MCzJ621kE0F5+PM6rrckUL5A6qLwZCURJ9LOXCB6/QaMFDWkGf/k65TY
 NI8z2eYdrgDoe8NXaTX8J4JFTfHsdzLvD8oA14nSPO6NinD7AyL4RxJBs2cF57Z7KBOpSkKvs5pjU
 A3AKgnitSmTs1ez+3Q2E8M6GgCm0XvNWpj0g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=L6YDPvpyaTnpjckVgq7LJq8ITf8m2F9iiIobtZq40Go=; t=1739600720; x=1739690720; 
 b=G0w74CmHp00UG8MNZzmp6l0N6fOgIieB6LymwnYYOHiQqDjTm4eAu3YoK61go4kRrS3yAotHcZO
 ay/nZolEO6rjiVlxfm1OgApQT6VQsbiuhwEVnzJpTsQj0VUFwv3K5W7UYQWPsvL+GAS0Lpv49Z0oo
 kKCXUeuU898e90110geyw9mGTOKZPYTZygYfGwHJ9do7YLxqWE9keV0NraF72RHN9sMw1OphmoN9r
 /YDDhVCj5bOGyhh+2Ost81XSb2TmtciJKwNNG0//QheQcuDSWjKBwHBNZzJxykRB3kjIo5k22i4Jn
 SUntbElXr9Af2OZpaaiqg6D38PBFWh9+d1sA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=hhAh3Nxo; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=G0w74CmH
Subject: [Buildroot] [PATCH 1/1] package/protozero: bump version to 1.8.0
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

Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.8.0
Drop upstream patch.
Updated license hash due to copyright year bump:
https://github.com/mapbox/protozero/commit/e91587f4bb1a0c443c663f4d1fcfd1ace674616f

Bump minimal GCC version to 5. (Switched to C++14 as minimum requirement)

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 ...xt-protobuf-is-only-needed-for-tests.patch | 35 -------------------
 package/protozero/Config.in                   |  2 +-
 package/protozero/protozero.hash              |  4 +--
 package/protozero/protozero.mk                |  2 +-
 4 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch

diff --git a/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch b/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
deleted file mode 100644
index 3033e24aa2..0000000000
--- a/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1c16d3ffccd9e415c6ea3681f23231cd5184043c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 16 Feb 2022 00:11:38 +0100
-Subject: [PATCH] CMakeLists.txt: protobuf is only needed for tests
-
-Don't check for protobuf if tests are disabled. As a side effect, this
-will avoid a build failure if clang-tidy and protobuf are found but
-tests are disabled
-
-Fix #109
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mapbox/protozero/pull/110]
----
- CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b975d49..df2ca15 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -52,7 +52,9 @@ endif()
- #
- #-----------------------------------------------------------------------------
- 
--find_package(Protobuf)
-+if(BUILD_TESTING)
-+    find_package(Protobuf)
-+endif()
- 
- 
- #-----------------------------------------------------------------------------
--- 
-2.34.1
-
diff --git a/package/protozero/Config.in b/package/protozero/Config.in
index e6347e6f7f..b2c253c5a0 100644
--- a/package/protozero/Config.in
+++ b/package/protozero/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PROTOZERO
 	bool "protozero"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	help
 	  Minimalistic protocol buffer decoder and encoder in C++.
 	  Designed for high performance. Suitable for writing zero copy
diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
index f0b8e39009..217e18a7c9 100644
--- a/package/protozero/protozero.hash
+++ b/package/protozero/protozero.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  27e0017d5b3ba06d646a3ec6391d5ccc8500db821be480aefd2e4ddc3de5ff99  protozero-1.7.1.tar.gz
-sha256  1f4d477e3c2d74d8706c8f05437bd86804abe46853b1f233ce1549a4de76fa49  LICENSE.md
+sha256  d95ca543fc42bd22b8c4bce1e6d691ce1711eda4b4910f7863449e6517fade6b  protozero-1.8.0.tar.gz
+sha256  254c0e9f18d261bfc55ff277cf12e3c1ca25839d56af17fba65d142396021466  LICENSE.md
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
index a46e37d69b..e5160d3f04 100644
--- a/package/protozero/protozero.mk
+++ b/package/protozero/protozero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOZERO_VERSION = 1.7.1
+PROTOZERO_VERSION = 1.8.0
 PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
 PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
 PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
