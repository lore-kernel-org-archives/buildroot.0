Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D403C74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 07:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A52560B23;
	Sun, 26 Mar 2023 07:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A52560B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zf6ylgAH5gZk; Sun, 26 Mar 2023 07:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 527D56066D;
	Sun, 26 Mar 2023 07:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 527D56066D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BAAB1BF2B6
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 07:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0E4E40998
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 07:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E4E40998
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uo8VvrMIsmjn for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 07:48:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2827740627
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2827740627
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 07:48:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.192]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MkHMZ-1qLgLs1HxZ-00kjn4; Sun, 26 Mar 2023 09:48:21 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 09:48:20 +0200
Message-Id: <20230326074820.12583-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:aZ+YwgnkhF244uoZCtWZP9X6xj6apP5JCu3vAaNFTCUOEtiiK8K
 Zmq+I+YMpC9qJLx/s5XUe70vM2c+inHcI1Y25WPYSy7BXu2uwgWddPwTgKSTGJSV2uddhDU
 jZoYZRpAU9O1vvatwj/yjZnHDsNgvbvU4HatlrB+kIy91B1Uz+0sY/9bxv48Gi322lShGu6
 qAvCK4QG29ixVL6ohQGvQ==
UI-OutboundReport: notjunk:1;M01:P0:H8yammSaJ2E=;5Qs/6BcXvMGczq+UutTKU2yr145
 D8x4KwfgV76/KiBY+rr8cHbiB0xiht3QplAsRLrusvcVC8QBiP4GnUynFxEFczxysMcvUoLY6
 Tz8SSzKw1n7I4PBFOcXDbPmiiHPCZsJcREcwVdXdOQMh85frkNq+2NqfnaJomglVLswYsNUBN
 sCp8IBAAooyY+AYPUGQ5I8d6o+XSY6uZqEg7Dj+Q6bX6fnHJIPxyInsoxPyeQXIJju+5mBPOt
 g8Esj4aOd42lF6P2zccz5XLc1pvMC/wKp1EIGmihZEGXg/rouGKGkLS6dXRda4lllvBQdTeUE
 qrH0cm0KSXILfFfYuUoBqF7046u5XGMgD5fzavP2Rk0W6el8HCSc/unWevUJXPDzMxXUGIOnJ
 SBbLVS/hPex2hB97UbW5RkhKhuam8Uvdnqn7utO9H0Eta5q4bYKKy7yxHQCN/acEaz+BfZ2Wa
 ER0kg/ON9MIZzGYCedgy41R5LCP35kRIgUnv2UfVxAg4OJtIkfS5xwK3/kD6YUU2gaJnJ+7x6
 t+FLZvXTbMdeFByugz7SJfDt6JKKUY7ut+Xhr/8XDuayVnsgLzOG/gbPLNny2aNO45o5cRAuX
 vf3UYObRAZF5XAs5RvyTXhfQn9r+KGqzVXGSq+JYwFX0FqhtctNz0GLCv7giCny5DsN1Ra3Kw
 o78KzGc/2uYtmr3I+HymttfOpJPBpdInS44g+WbBLF6rz4Tt2cb4pC0dIb6bPCWko4amj+O1e
 IonUENiyguwfRUbNZrzKOL1P+QHhFAQmYA9RljpyfW8h7JaUvs/Zrj1aR3fIEoxYslxbW+fc8
 LfDmV8LDBFXG6TWRSKwvB4+qF8Vay2bn4CMo0jfZGmuxn26aqM1fsNwofuE6ZsTK+VQivPELe
 frOu/r565AXRg2RfF4zi//AGIwAdnQ3+Yh+Bg/Yo984vpe2qHeLo0AsiGw31j//U1xvJcPKNn
 hwpzAxQziVe75jyUEAmizwom1aU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679816901; i=ps.report@gmx.net;
 bh=e8cyIbJS9rmu5globQL8NR5f3rfhc578M7DqPfhh2AQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Bh05N2rPruiLDcahopA/SZzoo9tLWJpCRUz1a2ywSKEt9l6eQNoEMrC+FX8LajDqq
 +bzgl0kYHU8QCrz2oxkzvk6EDfA4LV38J+brLeZrn775hlnB0C/zX9/V60I1h7wcy4
 4VdJD0YEO4gCITC6IEa/y+6hHFX2VmP94mdeOuNdjS1GD66nSMhz0YmjDi5vDlrGtT
 nG4O8mtL7JGbpiPqAjumna8lGHCI36z2zIRIsHIDWh25woyTEKuOZEhzYnXTea1IS/
 xdCtPGN9xJmJAUXWxgynRf0KUDuRu8lGtKhYxCrBfXIqF2jUv5b0cylF/ppK3co6dm
 Bamw5JLzbaiQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Bh05N2rP
Subject: [Buildroot] [PATCH v1] package/flann: needs C++11 support
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
Cc: Davide Viti <zinosat@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

  - http://autobuild.buildroot.net/results/c92a3df1bc73e00e1e4493500bfb7277cf5064ee

  .../build/flann-1.9.2/src/cpp/flann/util/lsh_table.h:367:5: error: 'random_device' is not a member of 'std'
     std::random_device rd;
     ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/flann/Config.in | 6 ++++--
 package/flann/flann.mk  | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/flann/Config.in b/package/flann/Config.in
index 180d7eae8a..8b32e9077c 100644
--- a/package/flann/Config.in
+++ b/package/flann/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FLANN
 	bool "flann"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	select BR2_PACKAGE_LZ4
 	help
 	  FLANN is a library for performing fast approximate nearest
@@ -22,5 +23,6 @@ config BR2_PACKAGE_FLANN_EXAMPLES
 
 endif
 
-comment "flann needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "flann needs a toolchain w/ C++, dynamic library, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index d1a622e685..dc75b977af 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -18,7 +18,7 @@ FLANN_CONF_OPTS = \
 	-DUSE_OPENMP=$(if $(BR2_TOOLCHAIN_HAS_OPENMP),ON,OFF) \
 	-DCMAKE_DISABLE_FIND_PACKAGE_HDF5=TRUE
 
-FLANN_CXXFLAGS = $(TARGET_CXXFLAGS)
+FLANN_CXXFLAGS = $(TARGET_CXXFLAGS) -std=c++11
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 FLANN_CXXFLAGS += -O0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
