Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16E5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 13:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A3E340215;
	Tue, 21 Dec 2021 13:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YyZ_S9MDTVWl; Tue, 21 Dec 2021 13:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A61F0401BC;
	Tue, 21 Dec 2021 13:21:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8B891BF5DC
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 13:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8B2C812F3
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 13:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phTXdKg79Ib9 for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 13:21:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8484681310
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 13:21:40 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 a203-20020a1c7fd4000000b003457874263aso1690984wmd.2
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 05:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4zLedJ56cHLg3UjNx+PWJAW/zd4plY+Z8jU8lK1deX8=;
 b=N593kpxypiNeLliRjoMhlZUVQVVdhoPaKDYg7tpXeFFisfrlYglMc2kwhFbXn7+C8H
 pFC9De9UcDpyKXBEWvTQmSI/4NWgpV/I53RUT92l5DCB5JK/Z5TUKLDs2DlTKVzkbnYL
 ebZTKxLDFwPMzEKD1eFYkeLN1+ClwSNh1r1YRjy4YxbfaJJ8z6tzG6teZEWS+SivWN+b
 5Kpvg32f70x/m6wJOvyY65sLonxDkfp/dyNV4btej033Adq3bM8Sez1pYpdLd50I2LHO
 uv96eM+KSArC31cS1ea+yFnhZQ6an9j+aoqxII7C/8Fgy8B3rvecGLjkAjZCw/O/ZDlp
 rhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4zLedJ56cHLg3UjNx+PWJAW/zd4plY+Z8jU8lK1deX8=;
 b=xfChbNAabC3oelt4jW0tK0RzuNhOn+iLobIJpv9m10zeqkBxsBGNSilXrB8ahADrUC
 CnCxNCCngHR+kN5cIBqlzLaLNHqeCCajONA/GjAwZoRnILcc5ST8N/5/+ASyB+Bl/OO+
 4Dvwj4B8mnOSwS+PvFoYuxmqCj/n03gPYKmRiTsrah97zwsZ/rY8z5tOaxnSPkmzP/Pn
 5ud/Lm0VY0k2kNNJ75Lway9DPBTP/aXGlBDN3sC525BEgted7HwVFHkmXaMjWX2Nn4yB
 CWWZQVmLRRjMroTc+9NgHdR+Fpe/0Pk3n0Mz2aAzOLfTpuYyx6thS+27eMBQhuLyuqem
 E0ew==
X-Gm-Message-State: AOAM532t+ckAfie8ytNZu2Umx5gr2ZVnMqVZSP6rKFvnHazTQBUU6hBB
 Yl5iFbsKvpkhLmrfh9GYzgF+YRCoVi4MJQ==
X-Google-Smtp-Source: ABdhPJyzAaMl3QtsKR0go0O06nfnCiLReeV3R+/Q74pndddxLt32RrGVzwOcxBIHvbwisbaeneJQlw==
X-Received: by 2002:a05:600c:350e:: with SMTP id
 h14mr2736644wmq.154.1640092898701; 
 Tue, 21 Dec 2021 05:21:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id b197sm2399594wmb.24.2021.12.21.05.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 05:21:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 14:20:56 +0100
Message-Id: <20211221132056.111661-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/minissdpd: bump to version
 1.5.20211105
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update license hash (year updated)
- DESTDIR must now be used instead of PREFIX

http://miniupnp.free.fr/files/changelog.php?file=minissdpd-1.5.20211105.tar.gz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minissdpd/minissdpd.hash | 4 ++--
 package/minissdpd/minissdpd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/minissdpd/minissdpd.hash b/package/minissdpd/minissdpd.hash
index 385a5a0c2a..e14fe7ab2c 100644
--- a/package/minissdpd/minissdpd.hash
+++ b/package/minissdpd/minissdpd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  177ab1907cc0fd20c8cafd13ca8674c7ec1828aa6101da9bb066408ccada7350  minissdpd-1.5.20200928.tar.gz
-sha256  00c8368dd1574b025df65f24f61c32d1297ff9b6dc695fda964b1b1efc7a53d3  LICENSE
+sha256  a073be9c6d9194feaeccf31cd986c48afd2212426b6594e75166cedff1c461aa  minissdpd-1.5.20211105.tar.gz
+sha256  45950e1d443106906f83a4ec7b9c2e1a9d6457130737a493cff0e5b7a39da570  LICENSE
diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index 159c5855c1..2b9fac4df1 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINISSDPD_VERSION = 1.5.20200928
+MINISSDPD_VERSION = 1.5.20211105
 MINISSDPD_SITE = http://miniupnp.free.fr/files
 MINISSDPD_LICENSE = BSD-3-Clause
 MINISSDPD_LICENSE_FILES = LICENSE
@@ -20,7 +20,7 @@ endef
 
 define MINISSDPD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		PREFIX=$(TARGET_DIR) install
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 # Use dedicated init scripts for systemV and systemd instead of using
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
