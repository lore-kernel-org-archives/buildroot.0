Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF7CC47074
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC8E740192;
	Wed,  3 Jan 2024 00:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC8E740192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSAWhVFHVw0W; Wed,  3 Jan 2024 00:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7CEA40A96;
	Wed,  3 Jan 2024 00:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7CEA40A96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 727111BF311
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B9C140A92
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B9C140A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WY0mkyPbv34f for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:00:20 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 029B740192
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 029B740192
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-28be024282bso5020513a91.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 16:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704240019; x=1704844819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1RbBjNDEr8JiuIyPzbdsGzh/JpkO0Z31sTfcxr4jZ1o=;
 b=JQ7odOCFUv6v5TOZxQVSbn3fqT0Lk7bEKnz3Drmoa5xMrlAhAnMrnRIy5VvW69wH2Z
 kUj7YA4q+WP/pCjhDExEeMEsIOHM4YOtuEnMrzlZDb3BrOkMog/l1TKe1acQwulqdv1k
 sCvjclMHj9geLbDYDNJKSOGeqVTX7tzUSjqKqubWVv6yhOhqroJvPJEU9dOMYLGbGGPC
 KJHgoMT1WoCIV1j56KVfXgF925E6shUr6yASZRQ98ooJVyMwp2zy/EBNptez+kylmyB0
 NCxCTCPPoS3XQSQGaMvWFF+s+k6gUy51eE5rR0qOukxD4Z1frFKygQNvyuaM0AVG5mA9
 ce8g==
X-Gm-Message-State: AOJu0Yw9moX+k5HlcG3gzDTzTG6hnhwP6COQHtTp1NrHiLF/aKJNciHM
 gXeOnMzA/czWR2wgpPfdYmpm0l65L0KAci4cLcZU6oSZ4Xg=
X-Google-Smtp-Source: AGHT+IHLxZJWDRGVNLPRiecfYUBrB5gikq2+A0OnRNawyywrW7ywQ63VawcqChjOyCIo5tdOwKQBFQ==
X-Received: by 2002:a17:90a:f98a:b0:28c:6446:2dde with SMTP id
 cq10-20020a17090af98a00b0028c64462ddemr4621673pjb.52.1704240018938; 
 Tue, 02 Jan 2024 16:00:18 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0028b8499dc80sm181824pjb.39.2024.01.02.16.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 16:00:18 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 16:59:33 -0700
Message-ID: <20240102235957.3072102-12-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704240019; x=1704844819;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RbBjNDEr8JiuIyPzbdsGzh/JpkO0Z31sTfcxr4jZ1o=;
 b=N5R0bBQOBg+X1f1vXkEl+kPTE6/kNJj7fp/gmfI0wcdUWTFn7JNNdFlNFDNqQ+UFJL
 5YnKg73CwFH95/JwYF4T2tHeCIablcW3910aaqiVPQUNufbei0yzthSLxyRMrjr+8Uqq
 q90v5XVztdNwUiXjgzwGJrcxhmbqVIz8Qn518=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=N5R0bBQO
Subject: [Buildroot] [PATCH v3 11/11]
 package/flutter-sdk-bin/Config.in.host: add pub-cache location option
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When running the command "flutter pub get," the plugins are stored in the
pub-cache directory along with their sha256sum hashes. The default location of
the pub-cache directory is current $(HOST_DIR)/share/flutter/sdk/.pub-cache,
which is not an acceptable choice by default because every plugin is
re-downloaded during every build of a flutter application either during a new
build or when building with the per-package-directory option enabled.
Furthermore, keeping the pub-cache in its current location prevents users from
committing the pub-cache directory to git for faster rebuilds of a
Buildroot-based system, as a user cannot store the pub-cache for later use.

To fix the above issue, add a new option to flutter-sdk-bin/Config.in.host,
BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION and set the default to
$(DL_DIR)/br-flutter-pub-cache. While hard-coding the location is generally
preferable, a developer may already have a working pub-cache at a different
location. Setting this option to a string provides no downsides, and the
default location is now set to a sane default, providing an optimal solution
to the problem above.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/Config.in.host     | 11 +++++++++++
 package/flutter-sdk-bin/flutter-sdk-bin.mk |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
index 181a2ee6e5..a1ac5835d9 100644
--- a/package/flutter-sdk-bin/Config.in.host
+++ b/package/flutter-sdk-bin/Config.in.host
@@ -13,3 +13,14 @@ config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
 	  free and open source.
 
 	  https://flutter.dev/
+
+if BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+
+config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION
+	string "pub-cache location"
+	default "$(DL_DIR)/br-flutter-pub-cache"
+	help
+	  Directory to store cached packages used by Pub with
+	  Dart/Flutter.
+
+endif
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index e7fd09cb56..5edd53df28 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -105,4 +105,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN = \
 $(eval $(host-generic-package))
 
 # For target packages to locate said pub-cache
-FLUTTER_SDK_BIN_PUB_CACHE = $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
+FLUTTER_SDK_BIN_PUB_CACHE = $(call qstrip,$(BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
