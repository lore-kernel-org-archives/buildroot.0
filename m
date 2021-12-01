Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961BEC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 22:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F10261C06;
	Wed,  1 Dec 2021 22:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtVba8gn7GxL; Wed,  1 Dec 2021 22:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61AEA61BF1;
	Wed,  1 Dec 2021 22:11:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2F01BF30F
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 22:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C74961BF1
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 22:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rTKNheBCsLW for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 22:11:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25F1D607AD
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 22:11:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t9so38448594wrx.7
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 14:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06njwsv9VSsbn4t+M82/dP0ojMm4iveXJxHjv1T49Rg=;
 b=eet50akPO9su2oOEkQzsvqiBLMYEt4mlY5ZXMJeTJNIUoXIUjsW3VmlJvpBDwqLOzJ
 GuRBZyQI/6o4xl1M8UIwQtU3Hy7S4SLquEn+OfprO2YxK2s27BHjwh/9iE1r+wyjV8QI
 +l8YQ9479vWWr+oTx74D68mky+oeivDMCGI10coNm9m0UQRj9IGlGggKBspWkR/d4H0m
 aiVQRYgCF5K5U0x5692/Xq0pERnzfOuPT3TD5bCxsCI5/tsO2suu6ei/1Cdng6ZWBHY1
 43hW2zbpG3UULzFlc/w6Hb+KLT2/VMpOUGFPvm24PfiMtukaXT+ZSWBfunIKzuazV5OT
 sogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06njwsv9VSsbn4t+M82/dP0ojMm4iveXJxHjv1T49Rg=;
 b=e4BlVBQ7fcd5lblY8FW2xWUnFWALSkdADrzm5AUT0sc7ZWzHb6e8bYe0n1LrOt6Np3
 30DNUNyBs/8fo2kYuJiNCRBTzCS//TBprqKlbVrQnaCk7STs7i821yFJpTPpWfCcxC5v
 0sBJn2ph+syt6nsCUAruqbS3RO5V6DEdFnFjaY7DmQK1FfXfQ8WaLPNri4lmqr1U2klB
 RBMqhmG/Req8K2HH/+GczL9QjTsxjOcug7n81wuTTw59b9n2ceZuLKnScjk2MZSwGznr
 nv84xVLRbW7fNbZeOijmSxK7q7D0wEMr96yIvto2k7lv0u05xRuO+ThVrltJK3HxAMFa
 POHQ==
X-Gm-Message-State: AOAM530/z9Fom3BvGdUVcvt0I2bC70NFQ73Se7o6KjfdagQyTMweW0LW
 7fq+pCyWI9KjtciaTjhutZ840hqMHQ70cA==
X-Google-Smtp-Source: ABdhPJwQcqbFoJJAdGuITObJZSVLBpn7QSfF5yhzNy8qJOWhFul8w4OMYVpooFAiJ2Ph1CrmbzQgog==
X-Received: by 2002:adf:dc12:: with SMTP id t18mr10031133wri.566.1638396668086; 
 Wed, 01 Dec 2021 14:11:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id s24sm425126wmj.26.2021.12.01.14.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:11:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 23:11:14 +0100
Message-Id: <20211201221114.1371808-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireshark: fix build failure with
 -latomic
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 3.4.10 in
commit 0ce776942d34d5d3bea6c11913cac38ea3e52f8b:

/usr/bin/ld: cannot find /usr/lib64/libatomic.so.1.0.0
collect2: error: ld returned 1 exit status
make[3]: *** [run/lemon] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/02ea7d76a683b039fb37e005578644108bd1e3b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch} | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)
 rename package/wireshark/{0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch => 0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch} (56%)

diff --git a/package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch b/package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
similarity index 56%
rename from package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch
rename to package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
index 51875fd267..edf24fc6d0 100644
--- a/package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch
+++ b/package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
@@ -1,26 +1,27 @@
-From 982e5ab072816e29f6f2dc84d9a00ee7c4fdee40 Mon Sep 17 00:00:00 2001
+From 33270f56477542dedf978e660cf8d08464f28797 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 26 Nov 2021 17:45:23 +0100
-Subject: [PATCH] cmake: lemon: wipe CMAKE_SYSROOT if needed
+Subject: [PATCH] cmake: lemon: wipe CMAKE_{EXE_LINKER_FLAGS,SYSROOT} if needed
 
-Wipe CMAKE_SYSROOT when LEMON_C_COMPILER is set to avoid a build failure
-when cross-compiling (e.g. with buildroot)
+Wipe CMAKE_{EXE_LINKER_FLAGS,SYSROOT} when LEMON_C_COMPILER is set to
+avoid a build failure when cross-compiling (e.g. with buildroot)
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status:
 https://gitlab.com/wireshark/wireshark/-/merge_requests/5224]
 ---
- tools/lemon/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
+ tools/lemon/CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
 
 diff --git a/tools/lemon/CMakeLists.txt b/tools/lemon/CMakeLists.txt
-index 8742aa9fc9..7c8cc23a35 100644
+index 8742aa9fc9..7a9263fe0d 100644
 --- a/tools/lemon/CMakeLists.txt
 +++ b/tools/lemon/CMakeLists.txt
-@@ -12,6 +12,7 @@ add_executable(lemon lemon.c)
+@@ -12,6 +12,8 @@ add_executable(lemon lemon.c)
  if(DEFINED LEMON_C_COMPILER)
  	set(CMAKE_C_COMPILER "${LEMON_C_COMPILER}")
  	set(CMAKE_C_FLAGS "")
++	set(CMAKE_EXE_LINKER_FLAGS "")
 +	set(CMAKE_SYSROOT "")
  endif()
  
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
