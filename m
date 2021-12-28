Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAFFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 10:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0237781B23;
	Tue, 28 Dec 2021 10:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0X_e35Dpo8ZM; Tue, 28 Dec 2021 10:35:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D78B81B48;
	Tue, 28 Dec 2021 10:35:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89A701BF362
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 10:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A96281B48
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 10:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J10s0ilncJhe for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 10:35:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7515E81B23
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 10:35:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t26so37484413wrb.4
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 02:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OAdDHjwV92cUC0cjPTecZBLqRcZU9WG1Ksn+Qr/Zl4c=;
 b=SHvAtnKtGa8eAksc00SxCDo0VLeQD5b9vYpstBW/FFNe0M1rV+2nkuiVUxDRXTt3BW
 ZO2N6kxYJojzr0q3aJWLcB6tJIg/oY8lpVnTDoX2ldBh+J3rovDdT2vr56MxZiwvwh2n
 aiL9jKCkcFKdjPBU7YeLaOzJToP7nuItlm9D3G766WKG3B3TjM9/CAiPnw3upcMbkI18
 O8ZClbeHUx+L+B8PqVRfPvUdfb5cNyrlkkK45yKPo8vvo0hbnWSlEsvXf6nneAJVO5Eb
 +HiYHtmY0Uyi8csDiQGFMGfVcTsJ3l27CvZFRdtSXRr0m1HHPKq2jg8dg8KzbePQyxev
 82fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OAdDHjwV92cUC0cjPTecZBLqRcZU9WG1Ksn+Qr/Zl4c=;
 b=4cBfIDLWANHRIfFjkjWxmJ3KFQz1kdWxdD+fKvwQIgV6jLeGIZpGm64oDs8xsCxVlL
 99H31+WwK13FYQ80ACVvObfpeiRo0kQ+OwG5W93+f3KDPhSWYv7t28QiAJHC8NERqImq
 yrMPFOG3ATe3nHE5Vu9jhVAwHBQ72FSVgbv+99f/VNq45dpIzUYEMZbo1Q8JvmhANc32
 C105OeLqtFewT+fO3B0bzBGVhLwjummG313dYxEGW+hW5s8oF+9h10OMiCX7CTsoy2ON
 00pAyJ6tN5THLGUQd5QzJxc5Vyx5wEQOQh2Su4UqLnmzbi3eP7cKe0S9ZkA/BLnd3zpl
 FA3A==
X-Gm-Message-State: AOAM533UlixuX2avmWAD6+sp8yDy1QabTYccmCZhf5JjxwZpaYNUJbxG
 k+sxlXyjSpw+Ng+3Aq+JOgeVYmhtqU97Sw==
X-Google-Smtp-Source: ABdhPJyxMuFqeJEuAayKHghhJemYeyo7joFQUVXsmqoDqVJs0mVukmbVMR/E00WDOnw58PkPKcVRNQ==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr15982856wrn.378.1640687743511; 
 Tue, 28 Dec 2021 02:35:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l8sm18217571wrv.25.2021.12.28.02.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 02:35:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 11:35:01 +0100
Message-Id: <20211228103501.3645778-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zchunk: needs argp
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit c618da772df32679fdd338b99f44133655c9113f:

../output-1/build/zchunk-1.1.16/meson.build:35:4: ERROR: C shared or static library 'argp' not found

Fixes:
 - http://autobuild.buildroot.org/results/f82d06e95ac497aa8215268a7a58e929a05b32e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zchunk/Config.in | 1 +
 package/zchunk/zchunk.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
index d610e15997..2c8db434ce 100644
--- a/package/zchunk/Config.in
+++ b/package/zchunk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ZCHUNK
 	bool "zchunk"
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBCURL
 	help
 	  A file format designed for highly efficient deltas while
diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
index d8538542f1..6f7ac799a0 100644
--- a/package/zchunk/zchunk.mk
+++ b/package/zchunk/zchunk.mk
@@ -9,7 +9,9 @@ ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
 ZCHUNK_LICENSE = BSD-2-Clause
 ZCHUNK_LICENSE_FILES = LICENSE
 ZCHUNK_INSTALL_STAGING = YES
-ZCHUNK_DEPENDENCIES = libcurl
+ZCHUNK_DEPENDENCIES = \
+	libcurl \
+	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ZCHUNK_DEPENDENCIES += openssl
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
