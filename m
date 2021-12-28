Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FECC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 10:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2CC68199D;
	Tue, 28 Dec 2021 10:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUt2c4fhKq2a; Tue, 28 Dec 2021 10:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CEFA817BA;
	Tue, 28 Dec 2021 10:22:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3B891BF362
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 10:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE482403E7
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 10:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVaB1vVWgDLP for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 10:22:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9189940350
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 10:22:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w20so28441394wra.9
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 02:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwEqlWOdHJNNdGAh0nwcYBYbiFB88YHsKjD+v6tjsBo=;
 b=Sqyv8wD/Zr7CS2e32AJnk6UVrLr37my9NxJVf6K8zpWmc8xwslUBt6xB73SMidQTnH
 bCr18+uizb6NxNbbq5M3wkt4zLBm9r4++Ycnz9WESyjq+6da4KfjY2RuUPX3x33Nhu1e
 xFlNVfupj1DPcTEalIqAsBJM8qDYMKL4csN0xHaOJIu4Z01z5CJ375REig7dom7Eo1Zg
 hhsmdWs/V/+qXhRIk1hI42o8Lj44/4LXEh98OFsyI9jWqRq2tg+bJu4DKl/eVK5FPEry
 g70D8k6eGigsugu8Am5//k5d8p/C+pdoBxB6r5a/kmg4gEVLA2bU3Aphj9GDyemtqQn2
 vOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwEqlWOdHJNNdGAh0nwcYBYbiFB88YHsKjD+v6tjsBo=;
 b=lU4dVa5Qb2Kwuw8JwOMFWAh5X3XOW1qgvC+7WBplzpCXZHvSCGGOyQP7oQ9uIk7qcl
 n39+puUg8W8eL6yhbdPNq0f7DmDDtptpgzGYr7KZLyLvyUbyZD4u40gpOUnc7vTbr+pN
 VWZ6/kTEg0H8HiG0okl2ePbtUnOtYgcIHUfDj9a+SZYfLTpeSf9TcFVbeLxXhL2QNIwt
 ah6VrZiLqoAbkcsN7JgGEJc0RXgeMqgswQUdKqW8QARQVIrWNV12JY1zbr4JAVLzHIUI
 VeamMpadfLPkr8xq/8Zp+QJwxVqpoEDanm2F/VwT/JTcup6RAnOMztD6sv8uuM4jojUy
 /RsQ==
X-Gm-Message-State: AOAM5301o/R3HF+w9trQE6ejRTPEMuGwtD6xSJXrcTQ1mMqTcMdVEauN
 Ni2rAuw4kCW8kgbH2mJcznH66JuYPfn7ig==
X-Google-Smtp-Source: ABdhPJxv9Za9iMu52Kvpl1oAGAWretsNK8FdpD9xwPS2xgLDWQcSAowy3+izRzc3fSCAN08mg2waYw==
X-Received: by 2002:a5d:5746:: with SMTP id q6mr15908607wrw.163.1640686945720; 
 Tue, 28 Dec 2021 02:22:25 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id i8sm18635786wmq.4.2021.12.28.02.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 02:22:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 11:21:28 +0100
Message-Id: <20211228102130.3575690-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211228102130.3575690-1-fontaine.fabrice@gmail.com>
References: <20211228102130.3575690-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/cairomm: bump to version 1.16.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use gitlab to retrieve latest version
- Switch to meson-package as configure is not shipped anymore
- Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/cairo/cairomm/-/blob/1.16.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cairomm/cairomm.hash | 5 ++---
 package/cairomm/cairomm.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/cairomm/cairomm.hash b/package/cairomm/cairomm.hash
index 573104ec96..d14a65c2d6 100644
--- a/package/cairomm/cairomm.hash
+++ b/package/cairomm/cairomm.hash
@@ -1,4 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/cairomm/1.12/cairomm-1.12.0.sha256sum
-sha256	a54ada8394a86182525c0762e6f50db6b9212a2109280d13ec6a0b29bfd1afe6	cairomm-1.12.0.tar.xz
 # Locally computed
-sha256 bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
+sha256  bb86d855041bd46d31b03e43ea355d233de44034b39d4200725b1e0947e63e67  cairomm-1.16.1.tar.gz
+sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm/cairomm.mk b/package/cairomm/cairomm.mk
index 07aae971d0..856c9d67fc 100644
--- a/package/cairomm/cairomm.mk
+++ b/package/cairomm/cairomm.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-CAIROMM_VERSION_MAJOR = 1.12
-CAIROMM_VERSION = $(CAIROMM_VERSION_MAJOR).0
+CAIROMM_VERSION = 1.16.1
 CAIROMM_LICENSE = LGPL-2.0+
 CAIROMM_LICENSE_FILES = COPYING
-CAIROMM_SOURCE = cairomm-$(CAIROMM_VERSION).tar.xz
-CAIROMM_SITE = http://ftp.gnome.org/pub/gnome/sources/cairomm/$(CAIROMM_VERSION_MAJOR)
+CAIROMM_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM_VERSION)
 CAIROMM_INSTALL_STAGING = YES
 CAIROMM_DEPENDENCIES = cairo libglib2 libsigc host-pkgconf
+CAIROMM_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
