Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86095C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 306A1408C4;
	Sat, 15 Jan 2022 10:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0HwMnsocjrc; Sat, 15 Jan 2022 10:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC9D408BE;
	Sat, 15 Jan 2022 10:48:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8A551BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6AF5408BE
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZbiCFqkcYZ4F for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:48:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFFC9408BC
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:48:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so10536883wme.0
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 02:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r08qrtm7RaLIa6JCOIZj+DflNWd21hosAlH9wiYUwIk=;
 b=h4Lz/kdJlv89FmGix6ge2C9eC5kkP4EsoyPH3BTGOMtLM7LSQ99TmNzy/eim3adqU0
 05drwPc1gU2qP+qyRMil5QEHzV+T9+Z6SjltYCOY4UX0IktiwP4k2T+Lv8VPiqmUYJGZ
 pJD9NuO4V6dsST3oWja27b+nTUg+d38I2FWyjjtjQdQqpBvm7/0SNSPzn0bXr2d07wx7
 X4g6TPvpQbPwnB20s3FSU4B0QRxLRqg4qLiOsX8ESkVODcUyHYdHc8qCepgDpKUyBG/O
 DluoBRR/SVjBPayhOhlUu+log6SBUkshklGlGM2fNTsOgkqexoruE2p4JVZQoRhReFWF
 fgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r08qrtm7RaLIa6JCOIZj+DflNWd21hosAlH9wiYUwIk=;
 b=IYLfzQb+uPZDtnC7dfd0kcsF0z38Ulyq7LVsual97rFDYhqMicLaWwRodkvvG2q4IQ
 f9+p/hQGVW1NKVsHfV/vnA8q3sSbEy4vbM2hxvcCuyejplU7EBtVvBI6byRF8i8zhM3J
 uRhy0bVIYs2xo4Wlt/bBIfP06k7rimSmyqMIJJY+Lto8cegfq/Pgx3mtwf2Xm7eaGlvM
 /7agcedZHG0preFHmsUolCW0e6VsPnyQgBLWMRvSPlmLza5d3HgBYbaEVySzoth2rKWb
 uLIPZKUeTnzve0FjVJhuE6PrAy8ds1rNR3giTIpAIYxLN/yasHj0Cvxd4mhpIMxtiZxa
 9tgg==
X-Gm-Message-State: AOAM531Py0SOWzfREu5tXmWcDveXcgHGQUuFhiXVuqYdNUTw+Ia8SRPg
 dHjp3cFpUr1f4XFROMDKH/42pCvW244=
X-Google-Smtp-Source: ABdhPJwBAbv8g7Gp7tdQkl3GFxiuk/hEXq1dN+LNQFPX8BBRUBtX4UQVD+xcbV9JiZMovsS2AKFwFw==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr18934446wmh.140.1642243732537; 
 Sat, 15 Jan 2022 02:48:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id u1sm2425951wrs.97.2022.01.15.02.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 02:48:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:47:29 +0100
Message-Id: <20220115104729.1760707-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pysftp: fix dependencies
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of python-cryptography
to version 36.0.1 in commit 01764876e3d4e7ab95c8365f1c83e6c12d49757c:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
  Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n] && BR2_PACKAGE_PYTHON3 [=y]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_PYSFTP [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
  Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n] && BR2_PACKAGE_PYTHON3 [=y]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_PYSFTP [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=y]

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pysftp/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/python-pysftp/Config.in b/package/python-pysftp/Config.in
index 5d5b731f33..c65369b667 100644
--- a/package/python-pysftp/Config.in
+++ b/package/python-pysftp/Config.in
@@ -1,13 +1,9 @@
 config BR2_PACKAGE_PYTHON_PYSFTP
 	bool "python-pysftp"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-paramiko -> python-cryptography
 	depends on BR2_PACKAGE_PYTHON3 # python-paramiko -> python-bcrypt
-	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 	help
 	  A friendly face on SFTP.
 
 	  https://bitbucket.org/dundeemt/pysftp
-
-comment "python-pysftp needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
