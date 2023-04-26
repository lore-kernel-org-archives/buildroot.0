Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A84BC7618E
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 07:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1704840B6D;
	Wed, 26 Apr 2023 07:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1704840B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_EqDGimtWnE; Wed, 26 Apr 2023 07:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36C69405D6;
	Wed, 26 Apr 2023 07:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36C69405D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0E61BF35F
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 07:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05858821F5
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 07:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05858821F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJWxGGhpS8Ew for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 07:51:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7C0282194
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7C0282194
 for <buildroot@busybox.net>; Wed, 26 Apr 2023 07:51:08 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3003b97fa12so4066867f8f.2
 for <buildroot@busybox.net>; Wed, 26 Apr 2023 00:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682495467; x=1685087467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kqVDE5ORwVYjRiSwC0Bu5tgBml3uCxjt1SZ/MDD3FOM=;
 b=JNQbMsxN4cjdsdiDBvP1APpPHmWaAU6Q3BhTdqm2Y5+e0GXqM70WFxOU/eBOzPhH1o
 w1C0hXx5HVPfVigZSWkfkeSF0hwCJ62YWxpn1+hCuIxsZeVdNsEU5c5KZK7JjaifHaZ2
 6RHsdpBCizh6ZSHCNBtfi7WctaI9qM+1pyeWZpovFGP4aQfsqRT8I5p9ywRHPJLgdQUG
 kFN0UykbV6pN7Vf9RxO9lESSPDRb6Af+SDYIolFOe8srg8lmHh5QfM7cGddEfw1KbGas
 2YBOX3VGjMHJGcKWdEwLKZK1KxGXh44BsGJTuJv6TdpZ3Om9VSB43xYhiLw1yFcS2h9O
 mEUQ==
X-Gm-Message-State: AAQBX9eQgcJXzOPRvnyU5pTcQfVU8//yEqeHmygncgUJL2VrzYCJ3BwW
 2sNqLI1ppR5AtC+mct6L92qQHbGmrZo=
X-Google-Smtp-Source: AKy350ZXkvDVigT+Kq6dXxpJcJipIfIkLqRi/4d9OQ5y2rm4PWjA67D/NIM1m8q9M+q1wUthWpsGiQ==
X-Received: by 2002:adf:f6cf:0:b0:2f5:3fa1:6226 with SMTP id
 y15-20020adff6cf000000b002f53fa16226mr14380281wrp.14.1682495466900; 
 Wed, 26 Apr 2023 00:51:06 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b002ff1751ec79sm14951423wrm.65.2023.04.26.00.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 00:51:05 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 26 Apr 2023 09:50:59 +0200
Message-Id: <20230426075059.142479-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682495467; x=1685087467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kqVDE5ORwVYjRiSwC0Bu5tgBml3uCxjt1SZ/MDD3FOM=;
 b=iWSPHr09X93/SJCnqUp5e8B8Wefn6ovqHNvg5DE549fX7TiKPvk7z63feQsAGvlo4v
 0l++RWVPRFw74iHUpqDxqQXqXVNsnMxy31F0OC1J9RzkpuDbfEgVogUwcEWCRokm47he
 rH81ErZFEBAhTGcnZpLy7f3W3xk4zjiq9m8YDg2+nsfcutVWOVWvObzswFq0I0wZuOxB
 dOHUU28ZXv/43gG+34LRLD7TFFzhM1op/jki02jiYKO6VzOEY+lwES02K/P8fOnETrsz
 dALcTufCdHaha2O+j4lPj5UW87fkWZVL/YadQuuo9sPtKp39Ykk0wGa0GGFY3XkE3zUN
 lcfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iWSPHr09
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.36.1
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
-Perl is Copyright (C) 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000,
-2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012,
-2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022
-by Larry Wall and others.
+Perl is Copyright (C) 1993 - 2023 by Larry Wall and others.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 14 +++++++-------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index b21023f73..3ae9ecec5 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.0.tar.xz.{md5,sha1,sha256}.txt
-md5  826e42da130011699172fd655e49cfa2  perl-5.36.0.tar.xz
-sha1  938c56a77ae094eb7f5019318a5e4efb2d9c74fa  perl-5.36.0.tar.xz
-sha256  0f386dccbee8e26286404b2cca144e1005be65477979beb9b1ba272d4819bcf0  perl-5.36.0.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.1.tar.xz.{md5,sha1,sha256}.txt
+md5  825f6b1d7e03b22522e0bdb992fbb728  perl-5.36.1.tar.xz
+sha1  7b766266af08a6cef0487308e80b40d5d8069df7  perl-5.36.1.tar.xz
+sha256  bd91217ea8a8c8b81f21ebbb6cefdf0d13ae532013f944cdece2cd51aef4b6a7  perl-5.36.1.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.4/perl-cross-1.4.hash
-sha256  be9d9f9f7148edff7a2f9695ba3cb7e3975eff6b25a9a81dd311725fd757aa91  perl-cross-1.4.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.4.1/perl-cross-1.4.1.hash
+sha256	3e14bb4f28c83586c668c5f9f6b4e57b138b4ec2fae0271086e29d4e352670ca perl-cross-1.4.1.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  06bab256e2e039c59d2ca3c5853425317b4a0f251fe4e5d5201a987b11fc4f78  README
+sha256  810c97bea10842d2e47bc79e51acdfa1628cfee34fa0d89330f4eb3a44e3def9  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 9be00e1b2..734e8efec 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 36
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.4
+PERL_CROSS_VERSION = 1.4.1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
