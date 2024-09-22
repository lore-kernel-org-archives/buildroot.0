Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6FDCF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 00:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE24A605DE;
	Sun, 22 Sep 2024 00:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElxKRV_s18ak; Sun, 22 Sep 2024 00:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D78086062D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D78086062D;
	Sun, 22 Sep 2024 00:55:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F41C1BF86D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E0436062D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHUDhy5LjbD9 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 00:55:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66CFD605DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66CFD605DE
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66CFD605DE
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:55:21 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82aab679b7bso116739639f.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726966520; x=1727571320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l8i+72SgOYWb3gGQiSOt7WGg+bcbL27Setx4jI7JztY=;
 b=LQnzIfgi+x+6dS8d9Ym79n8wDCcTUETjtsxgfpLZWx2+JA0Lywk23/kN8Hbvy6yznM
 2KN521tDLOesWW5ai6b6rMlE3aICJ2OYYgOngr4TsLeN9CQeNKjrrmdY5efXH8jZiZpW
 6dNlw+UjPViz1+On2CPVmDYryrz0t4gGWXYBmQcGvRcqzrVVrSoIz/Smq2iVA9jfnCHG
 uavMbuYZhx4MnKnQF/iXJ61O1jiluHPq9koPIT9Lk2VGWsLh9J422U6DCu1A/xJP9tmr
 G559xuKdFedCP4/vPfBSgKaY0wHvBccEy3Of/7Fd9wUJAwwuJqEOChad3XXRJc5DMasG
 8eNA==
X-Gm-Message-State: AOJu0YxZEhWHMueBVPkVkCNO4V5oEc+ersj5D7lpsr7TW/3c3Fe0Agr6
 Ui8ogc4ALEPsywKMFKjQ33lPClB+LTwS/e2pP/pSq8XdIAei+S/AAEiSpw==
X-Google-Smtp-Source: AGHT+IE3sgql1T6RCpNyOKjLJd8neNND3iPmEGmN1a1PMm3phU7SWPWNcsp8BZ8JXPKo2BcrD5m62g==
X-Received: by 2002:a92:ca47:0:b0:3a0:a385:911d with SMTP id
 e9e14a558f8ab-3a0c9b82cecmr70046975ab.0.1726966520114; 
 Sat, 21 Sep 2024 17:55:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed1907csm4335857173.85.2024.09.21.17.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 17:55:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:55:18 -0600
Message-Id: <20240922005518.731743-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726966520; x=1727571320; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l8i+72SgOYWb3gGQiSOt7WGg+bcbL27Setx4jI7JztY=;
 b=a+3uGt+NePRFAjtqde2yiiFDJJhK/Vda92H1BHcCOoUMG5XyztFBD267IcX9FhLW6x
 yfwc1ld+IDZqSTZQqoavlDSMQrP6f01+ngLKpPKuPXBMEs8WEKRPal9YoRueH0pHR6OU
 grYqrvfpAthaiJqrwwVas1PDby0m3zWIp63wRl4X1Y+LzfyBcfkiXvn14ptIOgKDgm32
 gHsw+lRM6DO21yx2URBhOowSUhVicTE70lEUiii8nUnFDmn3q8612cQAAynKWLIv31ls
 kjZPtR0URBXN7PxVg/kDrgrGtnkwAU9L52b2IFl0IL2GDcxmsv3LFIx5r8XaMDti2vUf
 FTmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a+3uGt+N
Subject: [Buildroot] [PATCH 1/1] package/python-smbprotocol: bump to version
 1.14.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-smbprotocol/python-smbprotocol.hash | 4 ++--
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index b9d5f74999..e3de9e87d3 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  ccbb42bdd58a0070f56e966d8562451b  smbprotocol-1.12.0.tar.gz
-sha256  5916a4b6c948bb70f82c246bdbfc86cf152226b71dac9f33b3d731d91e86274f  smbprotocol-1.12.0.tar.gz
+md5  ca5c38cbe82d7995ed2147021a7d2950  smbprotocol-1.14.0.tar.gz
+sha256  4918ba10a0b0b344308e7a043c1c6741bf7282c3937059a5852de702d3b684da  smbprotocol-1.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index ece0744252..fc464fcbd3 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.12.0
+PYTHON_SMBPROTOCOL_VERSION = 1.14.0
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/57/72/d95216a9fd5da1b2fa225130741f50d4949c8f76d46669d30921c06d69ff
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/41/0d/d178f651591de45607d6dfc5637e7dcd8c5190b137275303cda005d9a13a
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
