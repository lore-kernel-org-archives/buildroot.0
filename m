Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605EAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 20:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F290881A33;
	Mon, 28 Mar 2022 20:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70Epb7Fg6zLu; Mon, 28 Mar 2022 20:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA2B781846;
	Mon, 28 Mar 2022 20:18:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 028851BF28D
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 20:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B5FC4006F
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 20:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cTM_UmDT2Oy for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 20:17:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FE6840993
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 20:17:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i4so3129302wrb.5
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FB7NcCUwGYmOUT/4UcL074Pqnsi9R/YFzYKXHku7Go0=;
 b=hbeE9XlAHm52VXyH/tGJvv96/kgd1240kpDGLmTQcan2lmBolQO7/oNTGSFFzwkvi1
 31tAfENFsoibc4xwoO8Wpqq5DClsbBMwsun5YePeJpLlqUM88ydcRGBAYMq4kuBrt9ty
 ggl5/3P6Yjn6o2irw6Ne/TQHqIqvmjVUke10M9EJuvwcFrVRce7I2mWVmdnE1/FgWGyu
 IuZqbH8uWWHxswDCo9Yam1OjpXkJtqC2Sl/c19CtSIkOUb/rH3iSGO4oYArcpdTtL1bb
 vQIWsPdNVRPu6i749mmrmpke9k+d+PALgyzUeJijYmcukDy/Z3q0huosL4bmur/5j0I6
 nklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FB7NcCUwGYmOUT/4UcL074Pqnsi9R/YFzYKXHku7Go0=;
 b=jJxD/Mb55w+uaw/qlNgSGl8qvILtonG7clBbay58CL9OyRXWh/i6qCa4G3DQMasNjl
 lBoT2D5rYKqC4CYSoZLs4GNiVTYPn+DU1kdemZaOXhaa15+3V3bo2wcx2qXr91EdM4gu
 C+RTNYiCOxqMqhX29zg/oyPElqsHfWupUEWItMZX+hQTb6MvRI7E8nfbQp9yE9n2wugG
 hGv8NfFbfGvQdu8qv86+crYQpXBqGXmzECKoz+8FxnNcp+4WMbLHej0vMGeC0WXgyRdx
 DcsZ1y/uzunwyFD1cWhwwMi59VdFiRiGLmQ1xFHOibgkCp3Ani0H11luyDFr026N8Lq2
 iOfg==
X-Gm-Message-State: AOAM5325tHorU7dgNxp3IpVJWzsHe2EQpXkbVknOt+j7ACdi810iWl9F
 Mdkx+S+c+AIzVVZeNman/Qe9kxkUOKY=
X-Google-Smtp-Source: ABdhPJzNn3jE6CyZPIkSVXHOgi8qfPZZSrebhZ66ehiazDtQyKxo9eU9mOSlRFSArJdKiguKzT7aSg==
X-Received: by 2002:adf:e4c1:0:b0:205:8b74:8dee with SMTP id
 v1-20020adfe4c1000000b002058b748deemr26562415wrm.225.1648498677063; 
 Mon, 28 Mar 2022 13:17:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a1c7402000000b0038159076d30sm408052wmc.22.2022.03.28.13.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 13:17:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 22:15:21 +0200
Message-Id: <20220328201521.4084-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Revert "package/tpm2-tss: bump version to
 3.2.0"
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

This reverts commit ed13a65a08cfe315aed9344abc609f5f2b92c782 as it
has the following non trivial issues:
 - pkgconfig files have no version number if we run autoreconf
   (https://github.com/tpm2-software/tpm2-tss/issues/2329) resulting in
   the following build failures with tpm2-{abrmd,pkcs11} or libsecret:

   configure: error: Package requirements (tss2-esys >= 2.0) were not met:

   Package dependency requirement 'tss2-esys >= 2.0' could not be satisfied.
   Package 'tss2-esys' has version '', required version is '>= 2.0'

 - addgroup/groupadd and adduser/useradd are mandatory since
   https://github.com/tpm2-software/tpm2-tss/commit/7fde604383c62fc764a1e060dff48fc06f79860b:

    configure: error: addgroup or groupadd are needed.

It seems better to find an upstreamable solution to both issues before
bumping.

Fixes:
 - http://autobuild.buildroot.org/results/d4d6807af3493deb47951c6f11f427040e5c5e11
 - http://autobuild.buildroot.org/results/a304e45bacb8cd7e7ea9bc49e4a8ec9359ca0a3a
 - http://autobuild.buildroot.org/results/be0befa81e955ac8cf16f9d20723f9b9b174e012
 - http://autobuild.buildroot.org/results/d4ebee400423f6df51613193c86db3c58c94ff88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-tss/tpm2-tss.hash | 2 +-
 package/tpm2-tss/tpm2-tss.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index db6b3b7ad0..b6eb3c1f97 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  48305e4144dcf6d10f3b25b7bccf0189fd2d1186feafd8cd68c6b17ecf0d7912  tpm2-tss-3.2.0.tar.gz
+sha256  8900a6603f74310b749b65f23c3461cde6e2a23a5f61058b21004c25f9cf19e8  tpm2-tss-3.1.0.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 2bb1235177..f475697e40 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 3.2.0
+TPM2_TSS_VERSION = 3.1.0
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
