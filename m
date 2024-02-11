Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657A5C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 16:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05AF482162;
	Sun, 11 Feb 2024 16:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQR79gpP-Jdt; Sun, 11 Feb 2024 16:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C8AB82163
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C8AB82163;
	Sun, 11 Feb 2024 16:06:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E718A1BF33F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 16:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D41454028D
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 16:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sjoxLnJv7HdW for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 16:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 922B940227
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 922B940227
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 922B940227
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:06:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5116063585aso2948788e87.1
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 08:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707667558; x=1708272358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f4IURsEsN3EgIxIsZaro7CJgAA7api3JumH1ZXxjedE=;
 b=ftlQWsDa/WaRwzuiEiISIZlef8B9+xYNYBpBZdoTJNWC2RB3tA03a8R4bqeO2SVoWB
 lhzgK56C8RsvZdB3JM/cZUwGCiWkOP8V2DccjmopwbAS+knMiL4DyKzJABSiK9qqEUjY
 BjknN89H+cjopn5DPHt+g3idwcA6JHwwZ40itkqOomkzK9z2dMlIyFguo8Fn9WgLqKI4
 nvdpwPi5/sI113lTvMDuv+yOHU5/wqmYuv6aXjLnqQi9AF8Zf9/2vNn9/+1L1uuFx+rz
 sSXKswBGThPnVUHvICaZKTg1B5+gCa9mFstQHpunAAVTcUdc0qldFYlLZ1TCyNqDtJAM
 MRuA==
X-Gm-Message-State: AOJu0Ywg7/ECK0Ayf3C54O5rNq9ew6BBi+e0aXY015Nof62QNHwtmw17
 pq/zOUEoRVO6LuhDQ3g7gt2Db6wUcRbRD2Q3rOYjRPapyfJ7hi03x+PhMrjmgtE=
X-Google-Smtp-Source: AGHT+IGrwEhgc9FtjYEl9zLmzxMDvncUNu8zvGFbtu5il9VKF65lwD65ny0Mn6eemyMmnSRDrMTH2g==
X-Received: by 2002:ac2:4836:0:b0:511:5afc:f186 with SMTP id
 22-20020ac24836000000b005115afcf186mr2960548lft.26.1707667557719; 
 Sun, 11 Feb 2024 08:05:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWhVdCkDdMLaQmGIpEkAV/yNdtbrUDhY5XxkPoj/ar+fUI3j1WIoNLpyhlb9fqC3Iul09Uhe549VWw5NSVzG6KhV+VNdhZ27HYWTv1l6holobSJq1MwgfnoXG9TIHrVQkvWxY6fkbVV4M9puMvqZlPUL2VfSNI8BubhNYPtyninuP3UM1c=
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bp9-20020a5d5a89000000b0033b4796641asm4576830wrb.22.2024.02.11.08.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 08:05:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 17:05:53 +0100
Message-ID: <20240211160553.429144-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707667558; x=1708272358; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f4IURsEsN3EgIxIsZaro7CJgAA7api3JumH1ZXxjedE=;
 b=GX1f4Sk7qW/BjxDUVxEiyyP0Uy5jSRKFltFKlDpDwG398fLt/LEU7uA+XafUJV9hFg
 Pln9N1nkQ++GlMyVjMMCHaClNRD7J13ysvxoIy4MQhFiU6xH/jAjb4nHtIB00raFGTWF
 g1yAZvW6kNETYJy1jtQ6zEocXLZ+CDsM2saFvOjaqcUZ5AS0rSZOebAq0FChFQKh/sps
 0FARKG9NLke4fd6ZPEDX6eGevgnSzkgzWDTCVy5DdZAbUHwnI0LGgl7vaNnIT9QFtVzQ
 F/GXzHZukn16RB5pY3lAqsKykOC3iWz9PgIl7ifwaHNfYaIl2RbEzp3Rrsob+eXIqDIc
 X2+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GX1f4Sk7
Subject: [Buildroot] [PATCH 1/1] package:libselinux: replace
 PKG_PYTHON_DISTUTILS_ENV
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV as
libselinux uses setuptools instead of distutils since version 3.5 and
https://github.com/SELinuxProject/selinux/commit/2b5d5585754eb731a68158b613c7676fc3195ed9

This will avoid the following build failure raised since commit
09de823cbc7bd50a40e25f4166b4e42be94b0c7b:

In file included from /home/buildroot/autobuild/instance-0/output-1/per-package/libselinux/host/include/python3.12/Python.h:38,
                 from selinuxswig_python_wrap.c:168:
/home/buildroot/autobuild/instance-0/output-1/per-package/libselinux/host/include/python3.12/pyport.h:586:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  586 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3fbbb741de33310c8cacab753a32e79c5e531036

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libselinux/libselinux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 529745f82e..734084ba50 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -38,7 +38,7 @@ LIBSELINUX_DEPENDENCIES += \
 	host-swig
 
 LIBSELINUX_MAKE_OPTS += \
-	$(PKG_PYTHON_DISTUTILS_ENV) \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR)
 
 LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
@@ -85,7 +85,7 @@ HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	PREFIX=$(HOST_DIR) \
 	SHLIBDIR=$(HOST_DIR)/lib \
-	$(HOST_PKG_PYTHON_DISTUTILS_ENV) \
+	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR) \
 	USE_PCRE2=y
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
