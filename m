Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9950AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 10:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EED9260AB3;
	Sun,  2 Jan 2022 10:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pDqW-LkCyvhJ; Sun,  2 Jan 2022 10:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B11D60AAE;
	Sun,  2 Jan 2022 10:43:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6591BF2A5
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 10:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BFD181362
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 10:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyku_7-5LROB for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 10:43:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA47B8135F
 for <buildroot@busybox.net>; Sun,  2 Jan 2022 10:43:30 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id n30so13069849eda.13
 for <buildroot@busybox.net>; Sun, 02 Jan 2022 02:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kuf92exwr0yX3Cvr4igztDGlGXArqkl2rjCvkSKGrvU=;
 b=Ou+ioGUR229PsZ1V5Gz4cas+MKmu3M0VvNG8iSuRdP8gHyI64aWma1wHH0k3N2pm3R
 hYVrdY2xUt8UzQU1PmfoJHR0Ea4AuZ45Yc/+4E6g5LxZQS3I+WyIUOScTvD9Wf5nodf9
 MAPBm9cxkUOEKx3p7kryNrX8VqdOtB542VUy/cINhVOlMdvQXljdbUPMd9s2UhxrjwIQ
 moVlWwfmiH+i7IcSrFYwxm/H9E7q94ehkJwJbX0MmKrZvkrn02P82oUypLdFdbBVXyfl
 0dgSBRbntxKQ3snI0dxsM53kmZkGMZ4Li9OIF5Rrx9RFFlIaLfGaptnKeyiQ41UhyiPA
 cUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kuf92exwr0yX3Cvr4igztDGlGXArqkl2rjCvkSKGrvU=;
 b=XpB85IFo/hL2G7Z7oLcQ1qQZNjxMuzwiBAhq2Nxv42hcZ1vxEXfDi5rDe/6hidJsRD
 r/+FjLrhTwhSFcfZaiCnG18sDWYDW3XwkgMnj21wkXncVdHlESgM/vfjVnD2xK3Wt6gS
 3n1+TPiYOXKKZLz7Wd9tbNAoigT4N9Yhir6mWHPZUUK42e4GpOuD8E0Xlb9xB2GvOSnV
 D/ci623fz5ppe2Tl7+W0YiBxk1VDIU/I6QgNiqy/RyZ0EnsKUali2Ogv3c21W9UpQ8rs
 CSShu5IbYgVNYiE/5K+hBh6J2xuAD+Khjtupnk34LNGlXAGD3ujDZ7soOn6G4FTIH3Lo
 cIVg==
X-Gm-Message-State: AOAM532Enogtim3p+64pVsSlsayNR/i70g1SPL9ScoYa/NhoUrOVLF8W
 byQwEsvkikG+8RdOrtOWmSAuMyR4aoY=
X-Google-Smtp-Source: ABdhPJwyvg+MaeUkCjL+JSZAj4YuY7i9nEqyNc4obM7vz45rwHLoJOHzK+nIaS+uZfOeAiaFatvtbw==
X-Received: by 2002:a17:907:3da3:: with SMTP id
 he35mr33747428ejc.195.1641120208620; 
 Sun, 02 Jan 2022 02:43:28 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id u16sm12427501edr.43.2022.01.02.02.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 02:43:28 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  2 Jan 2022 11:43:18 +0100
Message-Id: <20220102104318.2631-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.34.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 42b7cc66c..b0f60ef6f 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.32.1.tar.xz.{md5,sha1,sha256}.txt
-md5  7f104064b906ad8c7329ca5e409a32d7  perl-5.32.1.tar.xz
-sha1  1fb4f710d139da1e1a3e1fa4eaba201fcaa8e18e  perl-5.32.1.tar.xz
-sha256  57cc47c735c8300a8ce2fa0643507b44c4ae59012bfdad0121313db639e02309  perl-5.32.1.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz.{md5,sha1,sha256}.txt
+md5  df7ecb0653440b26dc951ad9dbfab517  perl-5.34.0.tar.xz
+sha1  d461e206a1dca5e79d39e77debf0b564f6d77d37  perl-5.34.0.tar.xz
+sha256  82c2e5e5c71b0e10487a80d79140469ab1f8056349ca8545140a224dbbed7ded  perl-5.34.0.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.hash
-sha256  91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25  perl-cross-1.3.5.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.6/perl-cross-1.3.6.hash
+sha256  4010f41870d64e3957b4b8ce70ebba10a7c4a3e86c5551acb4099c3fcbb37ce5  perl-cross-1.3.6.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f661fef01..d7f9c58dd 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 32
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION_MAJOR = 34
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.3.5
+PERL_CROSS_VERSION = 1.3.6
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
