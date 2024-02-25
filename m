Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2811CC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 17:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD42560737;
	Sun, 25 Feb 2024 17:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UohOfSQU6rDO; Sun, 25 Feb 2024 17:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C989A6074A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C989A6074A;
	Sun, 25 Feb 2024 17:12:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAF3B1BF37C
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 17:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4E91406D8
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 17:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQB1Tk8yAxug for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 17:11:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FC01406C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FC01406C8
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FC01406C8
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 17:11:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-412a4a932f4so1506635e9.0
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 09:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708881115; x=1709485915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kS0n8FT5KUcB5Tv349+Ac10nDCA5D/xAsBofp7yKwEU=;
 b=myfuPPzjDc4BXYhkrtEOTgmVHW7jB4MgYiVFnPMZ4+d08EfavnzZjHHEbEAIQm6OPg
 aUZDYsy5CCq8P4/RwuDOBkBP9+GmCJRln0UNOUilZdyI1/xI529GIiW4NrZKAFBRG6rn
 Ci+1XobLSWHTj+QU6CJqEU3Z49ozga+DbnIr3FFXM7SCd5Lego55JhSma9IH0iXo4G52
 QZ9RKYTGQahoxKheDwj3qt0Sh5Vas3iOo71Td6EO6kK6RIBcWrDSDA6DJN4looWHf6C0
 3FYKLRLW2Dj3qSKycdtgRrD1oXFaLXpodLdQlmHWD5GAtAwY1uugM7iwFal6KevbkOAi
 qhAQ==
X-Gm-Message-State: AOJu0Yx8BDu8Ark7KTt8IZk9ahUbw3I52rcSby54pKi8TlBHryofnF7S
 FYtqFM7njdJbGaJbpxjfwYKONmXloZztxNm9qw8nK4JbeiF6yAzr9gvYkokU
X-Google-Smtp-Source: AGHT+IEvDQp7lQuFpsV65c8DW6rAX+pByh82JM/hhdmQ3zIiCesS9l6s8Ylr5HFadVSJxSJdmDb5qg==
X-Received: by 2002:a05:600c:4293:b0:412:10a1:25e5 with SMTP id
 v19-20020a05600c429300b0041210a125e5mr3517841wmc.36.1708881114533; 
 Sun, 25 Feb 2024 09:11:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m20-20020a7bcb94000000b004129f28e2cdsm4471397wmi.3.2024.02.25.09.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 09:11:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 18:11:49 +0100
Message-ID: <20240225171149.1447606-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708881115; x=1709485915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kS0n8FT5KUcB5Tv349+Ac10nDCA5D/xAsBofp7yKwEU=;
 b=YIshmf6ySUBjIvY5utFE0qYRaCm7MFxGiMF9LdT3pSfQL8wLavyLx2T9nPdfPKO3b8
 0aIP5gqnlUUMIqZocVs6vovix4kZtQH75UBVpoAxRPW2pQIj6YbWCdEujNlAjtXmdmKR
 HpIdMHU5VuPJw8TNxDCSCmhArWGcnEBSekaG4/AAzPoLpDv+lIdrVzeZAwLpBkDTO4gj
 GzUOuRSz7Xo2pztXHz7UEC/6f8Y0X7dsAf6kRN/KSTHfsALCs/iureiRpbwFNVH6GwZO
 yb1rb1/mQASVnBP8noNRFrOEFMqNColC/csf6LcGDraPKX1GWyBGOJItrnKswDpPvmMY
 wb1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YIshmf6y
Subject: [Buildroot] [PATCH 1/1] package/libtracefs: disable utest
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable utest to avoid the following build failure raised since the
addition of the package in commit
b1dbd3f679e6660325472e3fdca72127d74e6929 if cunit is found:

../utest/tracefs-utest.c: In function 'test_uprobes_instance':
../utest/tracefs-utest.c:2492:19: error: 'PATH_MAX' undeclared (first use in this function)
 2492 |         char self[PATH_MAX] = { 0 };
      |                   ^~~~~~~~

Fixes: b1dbd3f679e6660325472e3fdca72127d74e6929
 - http://autobuild.buildroot.org/results/1a01883231dbc8a7688de26db9a08751165fe8fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-meson-add-utest-option.patch         | 40 +++++++++++++++++++
 package/libtracefs/libtracefs.mk              |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 package/libtracefs/0002-meson-add-utest-option.patch

diff --git a/package/libtracefs/0002-meson-add-utest-option.patch b/package/libtracefs/0002-meson-add-utest-option.patch
new file mode 100644
index 0000000000..90f73a7ea0
--- /dev/null
+++ b/package/libtracefs/0002-meson-add-utest-option.patch
@@ -0,0 +1,40 @@
+From 7a09e2d414959075e2177c50ef1d4bf606b9ccdc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 15 Feb 2024 21:20:29 +0100
+Subject: [PATCH] meson: add utest option
+
+Add utest option to allow the user to disable utest
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/rostedt/libtracefs/pull/2
+---
+ meson.build       | 2 +-
+ meson_options.txt | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 3156f1c..d4cfd53 100644
+--- a/meson.build
++++ b/meson.build
+@@ -35,7 +35,7 @@ incdir = include_directories(['include'])
+ 
+ subdir('src')
+ subdir('include')
+-if cunit_dep.found()
++if get_option('utest') and cunit_dep.found()
+     subdir('utest')
+ endif
+ if get_option('samples')
+diff --git a/meson_options.txt b/meson_options.txt
+index 8450992..a48efea 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -18,3 +18,5 @@ option('doc', type : 'boolean', value: true,
+        description : 'produce documentation')
+ option('samples', type : 'boolean', value: true,
+        description : 'build samples')
++option('utest', type : 'boolean', value: true,
++       description : 'build utest')
+-- 
+2.43.0
+
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index ed45fcbc50..21cb8e84e3 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -14,6 +14,7 @@ LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
 
 LIBTRACEFS_CONF_OPTS = \
 	-Ddoc=false \
-	-Dsamples=false
+	-Dsamples=false \
+	-Dutest=false
 
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
