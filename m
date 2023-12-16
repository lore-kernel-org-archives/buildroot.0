Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E891CC46CA2
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 16:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B150417E2;
	Sat, 16 Dec 2023 16:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B150417E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7Grh5UGWDfQ; Sat, 16 Dec 2023 16:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B7484177B;
	Sat, 16 Dec 2023 16:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B7484177B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4926C1BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 302FA81ED7
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 302FA81ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBr3yLzK9zhM for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 16:10:05 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 632C481EAA
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 16:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 632C481EAA
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c60dfa5bfso20044195e9.0
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 08:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743003; x=1703347803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C9PPUDxcRIdiJVn5GuGiptaf8upR5QlBKQ2O8IXZdY8=;
 b=w6LywhJ0iLM4Jd7w+/dx0h3+xj/M6hKNqZjyqeCoTjfEJVhT2DrGj84QoCxOPtvq/v
 fS3YjRkLpoSNbSL4oNhfTaHNcfeD9F9n+P6PBKeAhvuQ9dMvhkREUg3kOJ4/cDnWzQgb
 jcSjPAdQtGWbkeCukU3aaM9yiM8LaiGE527QoUV1JCC9hM0jg6lZH8M3Ug5oec6u09w8
 LlwT9NUyFk1LTm1G8lEi9UUjPhkWcxuKHce2flAg5Wk4Yn74TDI2JMavorSoq2yUda7M
 zCyzelHHO2UqQZl5SlhjhNmWCNdjP2IZ3nueMymxqkNDnsg+WJZ/MLnNjmIAtpG2BSH3
 Or6A==
X-Gm-Message-State: AOJu0YwT6Eui4/1X6v+EeLsaJC1pBMtF6Tz4JPt8yxelZMzk2xGp/D4+
 +W9CpjbAR4ox8ky9HhGtbe570glcnCE=
X-Google-Smtp-Source: AGHT+IFq/wQlB6yE88voYViS+EtC7IPdESqevKIrqkW8X4hABS1eO/sGpHQfAoPNVpVgpb0wvYTalg==
X-Received: by 2002:a05:600c:204c:b0:40c:2788:28f3 with SMTP id
 p12-20020a05600c204c00b0040c278828f3mr7148437wmg.79.1702743003340; 
 Sat, 16 Dec 2023 08:10:03 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm36319926wms.33.2023.12.16.08.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 08:10:03 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 17:09:55 +0100
Message-ID: <678f73c0753eb09e05301df347c75928b4444f26.1702742998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702742998.git.yann.morin.1998@free.fr>
References: <cover.1702742998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702743003; x=1703347803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C9PPUDxcRIdiJVn5GuGiptaf8upR5QlBKQ2O8IXZdY8=;
 b=SoC33cuZEzpxOaCrPpl7GCCzfEkV+qHHVoKAhp3Drpw9KwVXP95yuXzP9MZPq2v02D
 vUvYwsEVUnFN62fpNRZztO+0JqrfXlAtLeTwH5o1F6Xb1y9Bouu7++cpuRM27pA5ZOyW
 xQET8swvyU7a1Z0gUerx2pZVdh/C75n0+OZA/VDwurWhAMf3MQGPlsUbrgmMCLq/Bxa0
 hs9BmaCUsl53zjrKW5tjOjzzf20ALmRcu9+x370iRamJnbXyhhokmsU6XGP0FoYAkrXH
 NucuBndSdTs04x9KMqS0IDAh2H3WT6l/j7UgOUbCn7jw650jwo2BLu6RY71DdXs4FnA4
 bQ4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SoC33cuZ
Subject: [Buildroot] [PATCH 2/9] support/dependencies: make git a mandatory
 dependency
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we only require wget as a download tool. However, git is very
pervasive and used in many of the packages, making it a de facto
requirement.

Act on that situation and promote git from an optional dependency to a
mandatory dependency.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/prerequisite.adoc        | 2 +-
 package/pkg-generic.mk               | 8 --------
 support/dependencies/dependencies.sh | 2 +-
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index 262a5153f5..6f07cba551 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -41,6 +41,7 @@ between distributions).
 
 * Source fetching tools:
 ** +wget+
+** +git+
 
 [[requirement-optional]]
 
@@ -76,7 +77,6 @@ corresponding tool on the host system:
 +
 ** +bazaar+
 ** +cvs+
-** +git+
 ** +mercurial+
 ** +scp+
 ** +sftp+
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 577a148c1e..87931f09c1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1240,7 +1240,6 @@ endif
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
 else ifeq ($$($(2)_SITE_METHOD),git)
-DL_TOOLS_DEPENDENCIES += git
 ifneq ($$($(2)_GIT_LFS),)
 DL_TOOLS_DEPENDENCIES += git-lfs
 endif
@@ -1254,13 +1253,6 @@ else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
 endif # SITE_METHOD
 
-# cargo/go vendoring (may) need git
-ifeq ($$($(2)_DOWNLOAD_POST_PROCESS),cargo)
-DL_TOOLS_DEPENDENCIES += git
-else ifeq ($$($(2)_DOWNLOAD_POST_PROCESS),go)
-DL_TOOLS_DEPENDENCIES += git
-endif
-
 DL_TOOLS_DEPENDENCIES += $$(call extractor-system-dependency,$$($(2)_SOURCE))
 
 # Ensure all virtual targets are PHONY. Listed alphabetically.
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 6e7d067ccd..e18e799922 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -154,7 +154,7 @@ fi
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
+for prog in perl tar wget git cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
 	if ! which $prog > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
