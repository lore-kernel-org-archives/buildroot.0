Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A173FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 17:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 449E940A65;
	Tue, 15 Mar 2022 17:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhkrq0wA8nxz; Tue, 15 Mar 2022 17:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28ECB40A69;
	Tue, 15 Mar 2022 17:34:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F2521BF574
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 17:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E4518419E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 17:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEVkYvVasi9k for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 17:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1408C8419F
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 17:34:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d7so3081578wrb.7
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 10:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQqWn1J4//qJFFPzq7dt0MP35Hie/VxfdWtTUkqlFNQ=;
 b=VlQAA9zLNP2Q1kJ6B8F8gvgsQqCbj+CeUIn2wjd6pmOr9YMB2tRXxr+RpyxNwcaWan
 NDNfvkGbitoJudJ+D6aUjRzzbAqyNnMBz6IAIbcN/on9hrHrbPtuGpbjZB7MapPqAy7K
 dGnCm85AGvWCO0O3zT5Fspx9hANSqOI1gKsKcc68F87ufwjDXOkHb59P/Druk12TP7cl
 gARVvILGtWkFktzq3WjpfTDXx/nyK8deGg0jejtb3R56ihOBHmQPC4+PAB6G3B4fNOyZ
 Fn+v73wez6RxtvlcCnqA4x1rwzucJIivMths4Pf7VyKNc3lNx3cBP9RoRhz2w63fN2kB
 ixAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQqWn1J4//qJFFPzq7dt0MP35Hie/VxfdWtTUkqlFNQ=;
 b=q+2JxFr10LUssj9A4wSMiXiN8DwMd55UkrEYIwgzjP1Pdop0UiiuUKsJ/tVfvX1ChR
 trJOHN/q0ljffkcplwcWwkvFpO935XQ+QGBo8IQ+c+32X8Qv50DG+z/zGT+EZXrVaHJA
 ADpRmXZva0E92TLD3b5Ngc41gv8Qv7ZM5Hhv9qiSoubxIKiz50Bj/72sAQIvp42FxfJs
 uTJTXUq1ph99jZuxVBFnQcUsF4EnWLHoRQzUa6cF2HtfGWr4PfRI5tBXZpE2KrXX5ecr
 VnxO9QhK+6Cj6CkVUwU80R7GXSRx75Sniad0oEWXkOGkdBaama+tWo8C4zPjsBmitgMf
 um3Q==
X-Gm-Message-State: AOAM533ykI5puHvniTGEA6v/oqbst52nl5fk6iKt1U7QJilVjl77EE4M
 UzDhvbkisYtMo++GL+T9S0ZqD0/gfws=
X-Google-Smtp-Source: ABdhPJzSebHBQ3HYLiOP2MRherBC0mRub3yHdfDDDMbH3KxIdko8LFo3NEFp0zRAKUZpw4Hvpm/ZiA==
X-Received: by 2002:a05:6000:10cf:b0:203:d8da:129c with SMTP id
 b15-20020a05600010cf00b00203d8da129cmr2294910wrx.300.1647365641232; 
 Tue, 15 Mar 2022 10:34:01 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056000170200b001f1e16f3c53sm16344216wrc.51.2022.03.15.10.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 10:34:00 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 15 Mar 2022 18:33:24 +0100
Message-Id: <20220315173324.1113174-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.34.1
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

diff README:
-2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021 by Larry Wall and others.
+2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022
+by Larry Wall and others.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 14 +++++++-------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index b0f60ef6f..d8344d975 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz.{md5,sha1,sha256}.txt
-md5  df7ecb0653440b26dc951ad9dbfab517  perl-5.34.0.tar.xz
-sha1  d461e206a1dca5e79d39e77debf0b564f6d77d37  perl-5.34.0.tar.xz
-sha256  82c2e5e5c71b0e10487a80d79140469ab1f8056349ca8545140a224dbbed7ded  perl-5.34.0.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.1.tar.xz.{md5,sha1,sha256}.txt
+md5  7d2ece7f50775ea1ff739831935a24bd  perl-5.34.1.tar.xz
+sha1  e7dbef3c1ea7caa73e2c705bba9e4bfb92ea98f0  perl-5.34.1.tar.xz
+sha256  6d52cf833ff1af27bb5e986870a2c30cec73c044b41e3458cd991f94374039f7  perl-5.34.1.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.6/perl-cross-1.3.6.hash
-sha256  4010f41870d64e3957b4b8ce70ebba10a7c4a3e86c5551acb4099c3fcbb37ce5  perl-cross-1.3.6.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.7/perl-cross-1.3.7.hash
+sha256  77f13ca84a63025053852331b72d4046c1f90ded98bd45ccedea738621907335  perl-cross-1.3.7.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  df6ad59aefea68676c38325f25f6707f026ddde6c71291b2ca231b6247859907  README
+sha256  06bab256e2e039c59d2ca3c5853425317b4a0f251fe4e5d5201a987b11fc4f78  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index d7f9c58dd..392fb8b6e 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 34
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.3.6
+PERL_CROSS_VERSION = 1.3.7
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
