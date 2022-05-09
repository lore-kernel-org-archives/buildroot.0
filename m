Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7E0C433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 20:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCB46814B4;
	Mon,  9 May 2022 20:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-HXJ5UmCDKG; Mon,  9 May 2022 20:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B841381489;
	Mon,  9 May 2022 20:48:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39A081BF232
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 20:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26DEC60E8A
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 20:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wNVocUe4kQXc for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 20:48:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3942960E77
 for <buildroot@buildroot.org>; Mon,  9 May 2022 20:48:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b19so21050430wrh.11
 for <buildroot@buildroot.org>; Mon, 09 May 2022 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RAdajHEfRRSarOZ/0O/BSbEdDf6hU+cLP7s3Q+Wce8Q=;
 b=nWSl0k1PoDTq+FvABBoOCnfkEYjRkPPfsOYLJdNOM/wpzmHMQ7YsMAJlfp/0fr+/wG
 odxgxewcGl0ZYcS8n7oUIRefvENCHYqlLTyAySNLtjXu4nV4G0cms40OzbSKVMwmH366
 oL+xo59s7LmYhW+EQ6PoJQHR6wHQkCPXMwP2OkHUIDxk1ejc9E+gK1abuxOcNZ2fIOuP
 1rPiV9TcD4Nppir3eoAWLNT309biv/2nwDOBb/Evi9UiN1TgyWVd7dxmWfEmol71u1zT
 G9aJeBA1hYMQ8DfBhVgj3IPYKXp66YemBmhYpza8yMc/TSSLIa5DClJwrIiCyJrdq+aW
 qp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RAdajHEfRRSarOZ/0O/BSbEdDf6hU+cLP7s3Q+Wce8Q=;
 b=frS+GLI2V8Ro4uQU1UV60ateQ5TS9L4+hs3v67VRVzf24reez2eWClE1vLcOBOeXEw
 2RIFdC463+yHxER8wVsIRim7/NZuSz6hxq5zOfpg+56FzG6L6mrKpJpzb8v3WvpYW8sv
 R16k2ZeCTpIP8HnopnfWRNnLbtpK09OcJlVq9jkgzwcOPxcotsJGPbXv9CndcYydtqTL
 u1zpWPuRqPXl2istMUHwrGd5LcD3BMjyYJO/vPs266LaM6VWeaZX6iYw/rg1mn2COTUW
 lO0o8PBuStjsvRPbbRgr74rp8BxDemjb4U5eP26cgjXcLU/fdgcH0yCaq5iFqbjdrw1K
 Yljg==
X-Gm-Message-State: AOAM533+ounuF+awjCwkJmz+bnWV2KXsJP7XE/X9UVXI0nn/dLWVvrhN
 4VlufcSs0kwV8p7nFMrZhYKPAnq2FnA=
X-Google-Smtp-Source: ABdhPJyijKJ3HR43W2aR8TQKz60a9labW0bhSOtu0Ah3nYG5zRKVOkOKeolZiDR6dHimhs8dwLJthg==
X-Received: by 2002:a05:6000:1f1b:b0:20c:9ea8:b650 with SMTP id
 bv27-20020a0560001f1b00b0020c9ea8b650mr15367053wrb.300.1652129333081; 
 Mon, 09 May 2022 13:48:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a05600c4e5600b003942a244f2csm392433wmq.5.2022.05.09.13.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 13:48:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 22:46:41 +0200
Message-Id: <20220509204641.464787-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcgi: disable tests
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

Disable tests to avoid the following static build failure on sh4aeb:

In file included from /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:20:
/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/include/libcgi/cgi.h:81:31: note: expected 'char *' but argument is of type 'const char *'
   81 | extern int slist_delete(char *name, formvars **start, formvars **last);
      |                         ~~~~~~^~~~
/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:352:1: error: unable to find a register to spill in class 'FPUL_REGS'
  352 | }
      | ^
/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:352:1: error: this is the insn:
(insn 1084 1081 1085 105 (set (reg:SI 4 r4)
        (mem/f:SI (post_inc:SI (reg:SI 76 fr12 [orig:343 ivtmp.286 ] [343])) [0 MEM[base: _414, offset: 0B]+0 S4 A32])) "/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c":323:3 189 {movsi_ie}
     (expr_list:REG_INC (reg:SI 76 fr12 [orig:343 ivtmp.286 ] [343])
        (nil)))

Fixes:
 - http://autobuild.buildroot.org/results/84a2339568d23b328af2416bfcec1ef41eccdce5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-CMakeLists.txt-honour-BUILD_TESTING.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch

diff --git a/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch b/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
new file mode 100644
index 0000000000..3ec674ae70
--- /dev/null
+++ b/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
@@ -0,0 +1,44 @@
+From 15ec267520efbe45193eb1df5361a4ab56164294 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 May 2022 17:54:42 +0200
+Subject: [PATCH] CMakeLists.txt: honour BUILD_TESTING
+
+Allow the user to disable tests through the standard BUILD_TESTING
+option: https://cmake.org/cmake/help/latest/module/CTest.html
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/rafaelsteil/libcgi/commit/15ec267520efbe45193eb1df5361a4ab56164294]
+---
+ CMakeLists.txt | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cbf0d97..e3329a1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -29,15 +29,21 @@ option(BUILD_SHARED_LIBS
+ 	"Global flag to cause add_library to create shared libraries if on."
+ 	ON
+ )
++option(BUILD_TESTING
++	"Build tests."
++	ON
++)
+ 
+ # subdirectories
+ add_subdirectory("include/libcgi")
+ add_subdirectory("src")
+ 
+ # test
+-enable_testing()
+-include(CTest)
+-add_subdirectory("test")
++if(BUILD_TESTING)
++	enable_testing()
++	include(CTest)
++	add_subdirectory("test")
++endif(BUILD_TESTING)
+ 
+ # cmake package stuff
+ configure_package_config_file(${PROJECT_NAME_LC}-config.cmake.in
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
