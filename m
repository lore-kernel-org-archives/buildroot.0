Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2B6C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A85429DE;
	Fri,  7 Jan 2022 21:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLn62GJzyy-8; Fri,  7 Jan 2022 21:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5774429D0;
	Fri,  7 Jan 2022 21:39:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43DEB1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 321D1823C6
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4jnwJ065NmH for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:39:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4996381DA3
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:39:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l10so13458704wrh.7
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 13:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNnTZklVhnWOG93V5MN6q9/SqZkuaHxL9OwSRn5WjgU=;
 b=GcJbsRrvXjigI7OxojIAFbJHGTA2wqvqCwqwnAIdyqQkIrdld5u1nX54yi8kOU6CbL
 DLAEPUd9sVY3GRxqTdvPG4vb9CvUm5zOv2omspoekBckBaidGl+unTasrQVYTWBfSI0V
 /q8L6g1Frukk/bvfmXWlGVvQDZ9zlQJcR6UMeXSYuOqm0Ah5wNdDXDMlzqkYtDZeXEGS
 vVC2ZH/seH9ZeF7hACzzRi7Gs10po78riO40TPMRXnfYDzZkA2MDCE8E3cMSpUgVFQ1n
 CFk7GJ0KYjXBLy+8J1vp4e7o+dLUrZMjRPfgzhvd1q9oPB99JOmVTRIGRkZ2OX3jsw40
 Nyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNnTZklVhnWOG93V5MN6q9/SqZkuaHxL9OwSRn5WjgU=;
 b=aH+PLGGPl3b+SSKDxST3p8xBAdvg5osAERSG+mHVrfTZdvSFSRNsLHB6vSnwEpVFtw
 /I8gMFFlwxsnCo4j4R3A/wDIuEiRabPCDXyHVsemIuchcXK1uJwT0pC6iSmYpleuY+AZ
 hOe1Pz1n6G8eLxEnf/kMR/ZFGikEI66DWY6DLVTHKB1LwhxSM88YlunprX1db7JYsSQi
 EZvRXfzAVVxZZyZnyJ8VpUoh49uSLEVnlVSXfP6FFBm8DWhdRdPQjGPwhQYAkX2n4bGG
 XNpETHOWfEVZgkHY2VQn7xuAVbaXYGjnEjkShD3SOnEdeeg+PTgmVdFlJuWPNQlgSGmR
 QW+Q==
X-Gm-Message-State: AOAM5320RLJe7Rfu4cOkSy9JWjZOvEfZKKFlEqx6yXf6pJcG4wHgVrHa
 kWcVksywGNUWd6bZVc4Pzl2GVGtZ9CA=
X-Google-Smtp-Source: ABdhPJzXH4WCgkHBG4uscGI44u/JwXpv3kZp09+Qor5gZ4keBjP0qjvgeL9X6GAcWoOwmWRKF2c9Kg==
X-Received: by 2002:a5d:6d4f:: with SMTP id k15mr42082297wri.345.1641591540489; 
 Fri, 07 Jan 2022 13:39:00 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id b13sm5773947wrf.64.2022.01.07.13.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:39:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 22:37:41 +0100
Message-Id: <20220107213741.1668818-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107213741.1668818-1-fontaine.fabrice@gmail.com>
References: <20220107213741.1668818-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/matchbox-fakekey: bump to version
 0.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use src/libfakekey.c as the license file because there is no COPYING in
the git tarball

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/matchbox-fakekey/matchbox-fakekey.hash | 5 ++---
 package/matchbox-fakekey/matchbox-fakekey.mk   | 9 ++++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/matchbox-fakekey/matchbox-fakekey.hash b/package/matchbox-fakekey/matchbox-fakekey.hash
index 516e0b6362..3627b13913 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.hash
+++ b/package/matchbox-fakekey/matchbox-fakekey.hash
@@ -1,4 +1,3 @@
-# From http://downloads.yoctoproject.org/releases/matchbox/libfakekey/0.1/libfakekey-0.1.tar.bz2.md5
-md5	83dbde4d77e8baf0176fe4291d8a2303	libfakekey-0.1.tar.bz2
 # Locally computed
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  4e2fdc9bc20df469d53885c40e104122140131e06d4c184902070ec0b0f2ca9f  libfakekey-0.3.tar.bz2
+sha256  3271662131760e9b30dd92495a0ea0b598fc457798cc67948947365299dd607d  src/libfakekey.c
diff --git a/package/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
index e607c48c15..99921ef8e7 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox-fakekey/matchbox-fakekey.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-MATCHBOX_FAKEKEY_VERSION = 0.1
+MATCHBOX_FAKEKEY_VERSION = 0.3
 MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
-MATCHBOX_FAKEKEY_SITE = http://downloads.yoctoproject.org/releases/matchbox/libfakekey/$(MATCHBOX_FAKEKEY_VERSION)
+MATCHBOX_FAKEKEY_SITE = \
+	http://git.yoctoproject.org/cgit/cgit.cgi/libfakekey/snapshot
 MATCHBOX_FAKEKEY_LICENSE = GPL-2.0+
-MATCHBOX_FAKEKEY_LICENSE_FILES = COPYING
+MATCHBOX_FAKEKEY_LICENSE_FILES = src/libfakekey.c
+# From git
+MATCHBOX_FAKEKEY_AUTORECONF = YES
 MATCHBOX_FAKEKEY_INSTALL_STAGING = YES
 MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
 MATCHBOX_FAKEKEY_CONF_OPTS = --enable-expat
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
