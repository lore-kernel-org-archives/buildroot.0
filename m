Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FC9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 19:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C3AC81383;
	Thu, 28 Apr 2022 19:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1O3Etob9GWZ; Thu, 28 Apr 2022 19:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 959ED83EBB;
	Thu, 28 Apr 2022 19:31:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDBFD1BF3AD
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 19:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC32461126
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 19:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQFrjAqnPB3E for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 19:31:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AFB960B68
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 19:31:18 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id e15so7610752iob.3
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gkas+A8goY4R/uCxpHBj+CfPuN1lL1+HtVwm27DBAVE=;
 b=LTKjlvlGvYm3wFaxNVL53FAEx2/4ypuUnE4i/Y9XXu+rQPbY4aMFWwin/E4HMiJ+sh
 I4KFWmexpKzOQ+RpD/kCVlbDUSRaBwu3aQQ2myKgdZi9XPCWOd7ZIYyhaR47B/xIlqHo
 xHirRUgutKcYtn2N//lLgMMeHjpwdPpK0BADabeAxIk3Smauva43JjpwNCjGliDyBMVi
 dbVhiq5/SF8gDVrBxmTtYbZ0sEHT8v5I+OQfgZIfVHC59E9/p+w7ecRrTOSYOb4E/mpc
 b+OZfZO128mKUJFRaQ3iE5TlUzVk+9Ljn/MqwO4PqImrf/q0RT8mh/IMkvg1GqIcJlGf
 FJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gkas+A8goY4R/uCxpHBj+CfPuN1lL1+HtVwm27DBAVE=;
 b=lD+dm9T7I8r/BPN1uxp0ktqBG2vyeKJd1O607mG4jeQ8ds2o6+7rIbVbXnlt35Jslx
 aXI4g8eseFNJj3Pg6H1oaqS4tdxNcjJC7syMiWChu53FqVwjkelDbdrD/hyf3cmlFt8J
 Nbumbi/lAtmZZ4iLuJ18iUH37ZiBaK5543RNCoF7DdVgf5+Dz4/Vw9v0U+AOKeWi5Iu3
 7w10ZNXuFJ7V+4JnyD2+eykmbUdL/WvYcJn+RlaVBPfFCF1raW0i6Q/ZrIA6ZNbwQu57
 busUnYAgrwnS4RKP9zoqQYMBiK6QO3qdmokpOf9aUMdukJXi3xjFJk2H2+I7D4qDTMiM
 ahCw==
X-Gm-Message-State: AOAM5337ScjTu4JIauDHyc54OimqCBTt9ifcH7PJoRKWQ/d4Sm2kF9lJ
 2eO0DG34BBOFVTum8hbXhgivSk2/mm8=
X-Google-Smtp-Source: ABdhPJzIrAzxPP0WF3o3PYZ3ci/c+DBXgOLobAf12gstyPmK1d/q8hV2Fj67OnFgF4iIVpOjcs0tFw==
X-Received: by 2002:a05:6638:14d1:b0:32a:a87d:6055 with SMTP id
 l17-20020a05663814d100b0032aa87d6055mr15364774jak.116.1651174277132; 
 Thu, 28 Apr 2022 12:31:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 w15-20020a056e021a6f00b002cbfa8b4b9csm422771ilv.61.2022.04.28.12.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 12:31:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 13:31:14 -0600
Message-Id: <20220428193114.759935-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 37.0.1
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
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 1219fa9b5f..0649207426 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  196bba703cebc052a19f5353614fcfa9d680471990c10305f110adcc05744eeb  cryptography-36.0.1.tar.gz
+sha256  d7718568773810e42481f51f810919f5501ad252300f4d1b36bb5127b2f6050d  cryptography-37.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 872ede9b89..7714b9ad88 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 36.0.1
+PYTHON_CRYPTOGRAPHY_VERSION = 37.0.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/f9/4b/1cf8e281f7ae4046a59e5e39dd7471d46db9f61bb564fddbff9084c4334f
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/3d/5f/addb8b91fd356792d28e59a8275fec833323cb28604fb3a497c35d7cf0a3
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
