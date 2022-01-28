Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A90EC4332F
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 04:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941D84170A;
	Fri, 28 Jan 2022 04:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUri1jNkg44o; Fri, 28 Jan 2022 04:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 731F14154A;
	Fri, 28 Jan 2022 04:51:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07FDA1BF86D
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 04:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E99BD60ABB
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 04:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZxtw3QSTLKs for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 04:51:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C740860810
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 04:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=vklKrp5ozAdRQJJS963hh+BIghu4BOn+kNAoHyA6j3o=; 
 t=1643345506;x=1643950906; 
 b=mmJ368QlY3ducstMZEDZNVStbw+zAM0CCbRhNWwHkLrympME9zIhbF6PJx1VfDvHdJV9L/82jyg8BPRySnboqThHbCNZOhKRe610wvuqfFj2BG6nZ90HlquvRFquaYeaBQZhBOeX7rFJuRjZKzAZ4/zGLOyZE7jfjVPGKBXH2jzIaLqGvKukRo678xfc7o3erENWKsEolYBZyM+FpoeDeJOX5l9iPwjoQhg7iyIGBzg8gCoOnCtbUsU7hRl2LiHs82hx4PcQnTjzwavFDIp0jsEnH8y4FhPKrVGnXQDcQp5ueLkESUipqPXwGi87ZvWBZogXAXnXiFVletBDE3LZbw==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1nDJEd-0001nD-DL; Fri, 28 Jan 2022 07:51:43 +0300
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 07:51:40 +0300
Message-Id: <20220128045140.272465-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9AA78FDF62ECAE61FBB8882B9C1ED1FCA269E871F1A847370182A05F538085040FDF5ADBFA3F965992D56C779C6A87A69DA1870F5A1D7EE4FAAFA06293917FB6A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7678D195E6F08FCA2EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063795DC1BB912715AE68638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85473A3FF328E3FAACA1C220BE500E5BF6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A4F00A9E8C511CEB9FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6AC294AFEFA671E80089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C86C5B328D8C3BEB6DBD1ECF7A682B2D1ADC66B84B842D0499C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359ADBCB5631A0A9D21F69F8FEF10F1C2C2993EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D343536C6A4332D8B8A44FB8079D7E6E79A6E03D25947FD0DEE3A885DD93CB8D4A7AA9DBC6BBF8CB6D91D7E09C32AA3244C726F5B3866281C78DF13818397B9626324AF4FAF06DA24FD729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqLK0kLh8sGc5CrtDwmdalw==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D644367A1E3395B98B289B3BDCB271856B98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/protozero: bump version to 1.7.1
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop upstream patch.
Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.7.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 ...CMakeLists.txt-respect-BUILD_TESTING.patch | 47 -------------------
 package/protozero/protozero.hash              |  2 +-
 package/protozero/protozero.mk                |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch

diff --git a/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch b/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
deleted file mode 100644
index d0267e3283..0000000000
--- a/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 03daae49c8fa94513b508bd12f1597e8e5e086f2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 17 Apr 2021 13:06:44 +0200
-Subject: [PATCH] CMakeLists.txt: respect BUILD_TESTING
-
-Don't build tests if the standard cmake BUILD_TESTING variable is set to
-OFF.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mapbox/protozero/pull/105]
----
- CMakeLists.txt | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f9702d6..7a40212 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -23,6 +23,7 @@ set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
- 
- #-----------------------------------------------------------------------------
- 
-+option(BUILD_TESTING "Build tests" ON)
- option(WERROR "Add -Werror flag to build (turns warnings into errors)" ON)
- 
- if(MSVC)
-@@ -134,13 +135,13 @@ install(DIRECTORY include/protozero DESTINATION include)
- 
- #-----------------------------------------------------------------------------
- 
--enable_testing()
--
- add_subdirectory(doc)
- 
- add_subdirectory(tools)
- 
--add_subdirectory(test)
--
-+if(BUILD_TESTING)
-+    enable_testing()
-+    add_subdirectory(test)
-+endif()
- 
- #-----------------------------------------------------------------------------
--- 
-2.30.2
-
diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
index 5453e01ecf..f0b8e39009 100644
--- a/package/protozero/protozero.hash
+++ b/package/protozero/protozero.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  beffbdfab060854fd770178a8db9c028b5b6ee4a059a2fed82c46390a85f3f31  protozero-1.7.0.tar.gz
+sha256  27e0017d5b3ba06d646a3ec6391d5ccc8500db821be480aefd2e4ddc3de5ff99  protozero-1.7.1.tar.gz
 sha256  1f4d477e3c2d74d8706c8f05437bd86804abe46853b1f233ce1549a4de76fa49  LICENSE.md
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
index 80d16192e3..a46e37d69b 100644
--- a/package/protozero/protozero.mk
+++ b/package/protozero/protozero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOZERO_VERSION = 1.7.0
+PROTOZERO_VERSION = 1.7.1
 PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
 PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
 PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
