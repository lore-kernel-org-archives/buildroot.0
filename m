Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB83C54E4A
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 01:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C23486088E;
	Thu,  7 Mar 2024 01:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3Hlcjlbpa6E; Thu,  7 Mar 2024 01:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB68360FD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB68360FD9;
	Thu,  7 Mar 2024 01:51:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 608381BF5B5
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 01:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D2EE400B3
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 01:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AB897Qvb92_R for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 01:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6085400AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6085400AE
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6085400AE
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 01:51:13 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1dbae7b8ff2so3168085ad.3
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 17:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709776273; x=1710381073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYsQRoWG6gdM0czsDmOWeG4mF1pfmvTBfgEci9NsXSU=;
 b=c2/k3NPeMj7LuMEyraFJka0IHNWD6vKq+oca1V6lL5t2Yy34GIgbm7hcNlhOd5S2sl
 ul/ZpZpNjMmml6p9hbdYnE7JTu2CE+/aF++0aAuZS/FI3kpF8SjATOYjrgczFVUbNTJn
 dSg/LKpovnJMtEGJjMal7TDlXxBv6klQK8dHLbjpUBB8L+qBN16eE8ILAW63DsxIiaYB
 11sbPIKD0l8peGuI8NT/Nk5oFj46zh6vy+YAAAz21H3rvI0zeIsAxJ+2SbMlvKdFXLye
 ZVjwr1HER3lEajBPdCJddlbGROJuxvRO0HZHdMwZdWptjO/u3dwws0ESUy4+dtpHidKZ
 yRGA==
X-Gm-Message-State: AOJu0YzqwPCnymPATjAiVRMLmGtZ2Hvq9I1oy5pdo9TuNIP0MIFXap3U
 9a+HaNF3ovjjJveaOjwFb96+Dd52tdxUvDUDx3TfEan2ySTxxvKfnGQzqJ//5CmSf9XZaIaZSUr
 fzco=
X-Google-Smtp-Source: AGHT+IHeEjaBr9CB5P3z6kZXvastSCWScJUuvnWJgG/QzlhSVXsZ4pGjuuvU5fshCQirrWaczriC2A==
X-Received: by 2002:a17:902:6e10:b0:1dd:2bc8:a56c with SMTP id
 u16-20020a1709026e1000b001dd2bc8a56cmr6361407plk.7.1709776272905; 
 Wed, 06 Mar 2024 17:51:12 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d8-20020a170903230800b001db5bdd5e33sm13280662plh.48.2024.03.06.17.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 17:51:12 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 17:51:07 -0800
Message-ID: <20240307015107.2908128-3-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307015107.2908128-1-christian@aperture.us>
References: <20240307015107.2908128-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1709776273; x=1710381073; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYsQRoWG6gdM0czsDmOWeG4mF1pfmvTBfgEci9NsXSU=;
 b=kjNkL/tuPnNFpV7lei4vVQlEnnYugo3hbSZeN1n8ZZXiwPQ8KKVEnsnQvetMCp/Q1m
 ukwIfcT8DNDkTxZ3MldqbZ1aQOa0m51RzBjhF6XbsHapV1aRoWuu9KsuOCHf2UDXU+Lq
 jansD/jS3c1+P5luTrDGmpIuCwjgpLU9yD1LI9HCSEHS5suahguQL5hZJoNzHlJRClma
 +HaZG7tVcvQTzHg5yoXxQNRKBDg9QxQhNqUaT9imQ/FfyrtbfYRrXmGZ+Pi3g20moxnb
 pZO8vHDsgn7blX0UNbt+PYBFUh5mIX8glgrYW3g/G7XMU+RiH0Dckr0Jkl7wW9vpxjnf
 b3Ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=kjNkL/tu
Subject: [Buildroot] [PATCH v1 3/3] package/go: bump to version go1.22.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upgrade Go to the latest v1.22.x point release, go1.22.1.

This requires go-bootstrap-stage3 at version go1.21.8:

See: https://go.dev/doc/go1.22#bootstrap

https://go.dev/doc/devel/release#go1.22.1

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/Config.in.host | 4 ++--
 package/go/go.hash        | 2 +-
 package/go/go.mk          | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index b87b862cec..0d89e875ad 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
@@ -30,4 +30,4 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
diff --git a/package/go/go.hash b/package/go/go.hash
index b1aed10c7c..06d8776db2 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  dc806cf75a87e1414b5b4c3dcb9dd3e9cc98f4cfccec42b7af617d5a658a3c43  go1.21.8.src.tar.gz
+sha256  79c9b91d7f109515a25fc3ecdaad125d67e6bdb54f6d4d98580f46799caea321  go1.22.1.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 3ca055b25d..a8ec5d95a0 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.8
+GO_VERSION = 1.22.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
@@ -12,7 +12,7 @@ GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 GO_CPE_ID_VENDOR = golang
 
-HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
+HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
@@ -128,7 +128,7 @@ HOST_GO_HOST_ENV = \
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
