Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7C0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 17:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9D4883E84;
	Wed,  6 Apr 2022 17:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UaYngfcKuamh; Wed,  6 Apr 2022 17:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C911D83E69;
	Wed,  6 Apr 2022 17:31:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CC421BF4D7
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 17:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AF17418F6
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 17:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vikM0_De1b3O for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 17:31:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE000418DE
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 17:31:22 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso2090610wml.5
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YDPw9wkaaIHzgqihtSUKjrhPxp0xuti8Knh9bw7i6KI=;
 b=Q13UzPjcZ1AWI1BortGLj1PEv8vdYKhBycX3BERxOpkiI179rKFUU1XykC2Nih8Les
 l/rJZ7QkGc2g+6t5VOoE5mhOGkB31nHtWFXaT77MLmqtvnickVeUo1fvxNv3L1GI2dDy
 n/ia5S0fjO2ojLVnaFVCMEcpGQOW6q4FTY9lZVbFnS1tB7Icl6LgF/dyBOe5c4/T1LxM
 0nJ65FBhpeiLBmuUb4bdgDlcNrpQZ5Vius/GFk2aBrcxwzyDD5agb8pOyVIzkd50AGg4
 PpeeI8vElZwHneQx9QgL9ZYRHya0va7rMsk4Ly71V77vKfkUB/RvhCDBLH6j6zQFXbko
 J5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YDPw9wkaaIHzgqihtSUKjrhPxp0xuti8Knh9bw7i6KI=;
 b=F/0aIaWxCXpQHxgVQZLC2xPwiJEZczF+wsfP7cfwA4S2RP6mztsyypqGKczesQ1eZq
 z/JoUhqCxuZEl48QyEpwsRAgSK5lWBL5REJL76vkiRR61wfk4TllijJ3H8EyGjEphotv
 ZLNhcZ1ARzCMFijPsEcDPEuPc0Jqlwes6oUGDxfWoFQ41Dz53QAsqMKIoqDJ4LICEgdm
 7RyPgTO6VbRJfZp05fOHWAII5lr86zwpKz3ZEVU8SQHE6vyNz5SrRIAjVuz1pXFHOjtn
 6gFlfvofq5nEUxPmWqpK/Yh3rqBi4f+fMGI7cbTMyNRWQICrVE8ot/ZvKf2nxbC38Iq4
 sw3A==
X-Gm-Message-State: AOAM533AACOmkFC5RMyd4sdhyAZ97+4gfeP9/aWJt3fcaviUI/npizU/
 +Pya2i8CKD+/QJFsYvFnTIIK9JSP1zk=
X-Google-Smtp-Source: ABdhPJzr+2GMxVIt8MRqWWxbFxJOWqGXUF3XIJefLuiKh5imeU5n5P3bV87sS1yQBRndOnlTw4JcnQ==
X-Received: by 2002:a1c:e911:0:b0:38e:6c5d:40e5 with SMTP id
 q17-20020a1ce911000000b0038e6c5d40e5mr8530367wmc.116.1649266280858; 
 Wed, 06 Apr 2022 10:31:20 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b0038cfb1a43d6sm5478116wmr.24.2022.04.06.10.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 10:31:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 19:29:34 +0200
Message-Id: <20220406172934.4009018-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boost: drop versioned layout
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

boost.m4 embedded by cc-tool is not able to find boost libraries when
they are versionned (e.g. libboost_program_options-gcc9-mt-sd-1_78.a):

configure: error: cannot find the flags to link with Boost program_options

azmq and i2pd also have the same issue:

CMake Error at /nvmedata/autobuild/instance-8/output-1/host/share/cmake-3.18/Modules/FindPackageHandleStandardArgs.cmake:165 (message):
  Could NOT find Boost (missing: Boost_INCLUDE_DIR system date_time thread
  chrono random) (Required is at least version "1.48")

So drop versioned layout option

Fixes:
 - http://autobuild.buildroot.org/results/4ae98aed925fbb1d54023075deda9a864f52cee6
 - http://autobuild.buildroot.org/results/de35ca0156d4b6f465e440ed9a3effd471f657fa
 - http://autobuild.buildroot.org/results/c3d2a066429d5f2889c2232d62e5950eb6a89311

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy        | 9 +++++++++
 package/boost/Config.in | 7 -------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 48c5ebb81e..27f19f14e7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2022.05"
+
+config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
+	bool "boost versioned layout removed"
+	select BR2_LEGACY
+	help
+	  Boost versioned layout isn't handled by a number of autotools
+	  and cmake packages (e.g. azmq, cc-tool, i2pd).
+
 comment "Legacy options removed in 2022.02"
 
 config BR2_PACKAGE_LIBCURL_LIBNSS
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 16c3ef8465..f039d68b1e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -36,19 +36,12 @@ config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
 	  and version, or Boost version. This option is useful if you
 	  build several variants of Boost, using the same compiler.
 
-config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
-	bool "versioned"
-	help
-	  Boost binary names include the Boost version number, name
-	  and version of the compiler and encoded build properties.
-
 endchoice
 
 config BR2_PACKAGE_BOOST_LAYOUT
 	string
 	default "system" if BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
 	default "tagged" if BR2_PACKAGE_BOOST_LAYOUT_TAGGED
-	default "versioned" if BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
 
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
