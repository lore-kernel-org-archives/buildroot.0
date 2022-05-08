Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAF4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 13:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9096981321;
	Sun,  8 May 2022 13:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KcYlXXnwbycb; Sun,  8 May 2022 13:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DA40812EC;
	Sun,  8 May 2022 13:36:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AFDE1BF40B
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 13:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A7DC812EC
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 13:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xTnUUQC472X for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 13:36:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 171EE812CB
 for <buildroot@busybox.net>; Sun,  8 May 2022 13:36:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e2so16083791wrh.7
 for <buildroot@busybox.net>; Sun, 08 May 2022 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BsNs9b7f5EPNKYng3uByKQIbRJXPyylH84r/Vt0Pqno=;
 b=GLI42KoFbQtFu/SyMdHQCF4zda/WtXjODqxLWFww6ZuWG2Bvnnt5heylbsW30NbL+L
 Wc/5xl9wcohXMb75bN+Xh5Es4VGgborj2CfT9WMcJHHLKD2lyCsOev2nXU+WYDbS6hir
 6h/HOTICSqYuldBAowYJL3lFSXzsMDC31FPOjkwG1J6+9KsMJMo4URNdGczC4IU+OSGi
 zSbxgE+QXpBYp1SP/kSXiuvHzhVVNT2Vr+r2r1tcqqIhb9/xu7fMMNSPVJ3ZMmUpVnkO
 CPJqmyL/ZdI6n1GhIlaAgnDjc2eBpQ2HtWtn+fgV0qJ9+bXs/BBoIZC91MSAQt0fHa+F
 4mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BsNs9b7f5EPNKYng3uByKQIbRJXPyylH84r/Vt0Pqno=;
 b=kc7qNRdm70sglqSdauy+SmdjmibuCl0w00ERTVmVZIDoC35JJFDohxCMaphRcjcBFv
 ZPthfEWuswiBPF6zvmhzfx4FvUcYPAIfV7XUo8us5MLvEEYqkpQxFyb9q/t1NZR5x7KY
 7V8i3+JMAne90A4YQOuaasDhKgvSzYKA8WNCUaujvpjRs1k6MzLEkW3dVoiEx9zBIWvK
 GdyMy+g1WIralqHJAYlOaIqdfI2AjrjYIfZtDp1bv3CvdFuCkqQG3Grj3jzvpViWaRpA
 ZpvWkrG27cof/U83jYx2o/Fkkz9Ldq8funepEj3Z8v6VyjBcUriprfaERl2eyM0AZXls
 8Hyg==
X-Gm-Message-State: AOAM532lrlIOJhqxIelNolYIzlC467Bnn3fj668jUZxcatRaLoAtP3Sg
 u7J6xDcon9NwxiZmTWoc7hhNjFmkznY=
X-Google-Smtp-Source: ABdhPJwOnkCd1+WyxR1CIVwEQteAqdiu9d2LfrfWcCSIxQ3TpUdgK3gI5qExZCcP9TaMJ6sM/qjy5g==
X-Received: by 2002:a05:6000:1a8c:b0:20c:bd6b:ecaf with SMTP id
 f12-20020a0560001a8c00b0020cbd6becafmr3473876wry.341.1652016985923; 
 Sun, 08 May 2022 06:36:25 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8d0sm8061749wrb.28.2022.05.08.06.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 06:36:25 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  8 May 2022 15:36:12 +0200
Message-Id: <20220508133612.150132-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.2.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch         | 8 ++++----
 package/open62541/Config.in                               | 2 +-
 package/open62541/open62541.hash                          | 2 +-
 package/open62541/open62541.mk                            | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
index f912445b7..9e6dda26e 100644
--- a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
+++ b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
@@ -29,16 +29,16 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index bc839f27..963460d0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -292,6 +292,8 @@ if(UA_FORCE_CPP)
+@@ -257,6 +257,8 @@ if(UA_FORCE_CPP)
      add_definitions(-D__STDC_CONSTANT_MACROS) # We need the UINT32_C define
  endif()
  
 +option(UA_FORCE_WERROR "Force compilation with -Werror" ON)
 +
  #General PubSub setup
- option(UA_ENABLE_PUBSUB "Enable the PubSub protocol" OFF)
- 
-@@ -589,7 +591,9 @@ if(NOT UA_FORCE_CPP AND (CMAKE_COMPILER_IS_GNUCC OR "x${CMAKE_C_COMPILER_ID}" ST
+ option(UA_ENABLE_PUBSUB "Enable publish/subscribe" OFF)
+ mark_as_advanced(UA_ENABLE_PUBSUB)
+@@ -526,7 +528,9 @@ if(NOT UA_FORCE_CPP AND (CMAKE_COMPILER_IS_GNUCC OR "x${CMAKE_C_COMPILER_ID}" ST
      check_add_cc_flag("-Wall")      # Warnings
      check_add_cc_flag("-Wextra")    # More warnings
      check_add_cc_flag("-Wpedantic") # Standard compliance
diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index a835595e8..220fb3dfa 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_OPEN62541
 	help
 	  open62541 is an open source and free implementation of OPC UA.
 
-	  http://open62541.org
+	  https://open62541.org/
 
 if BR2_PACKAGE_OPEN62541
 
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 5aa340ac1..3257bfe47 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c59c85b519a18350f5014b6e7b7545ee144ceeb15094e75b0b7ecec7dce43dd0  open62541-v1.2.2-br1.tar.gz
+sha256  e2e1b8e6285c4fd6d8e07f37d61a8728376d525e169fadb3d61918fa6a7c271a  open62541-v1.2.4-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 627c29e95..87bd3449b 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.2.2
+OPEN62541_VERSION = v1.2.4
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
