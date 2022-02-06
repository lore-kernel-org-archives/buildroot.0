Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F5DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40AC960D6E;
	Sun,  6 Feb 2022 14:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzmnCEx5CKFL; Sun,  6 Feb 2022 14:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D23460B89;
	Sun,  6 Feb 2022 14:37:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACE581BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AAD560B89
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZiGZCSpceDW for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:37:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A707560B75
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:37:45 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k1so3952499wrd.8
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X/mzWNbU36E95IRt9D8fAccd3oFOGwW1htGO2TiXO2Y=;
 b=GDWbbZp/9IUohBPJtHFE33Iw/oEzN6ZTJKcVTErVrXXPdOu0yaRjOqy1Q4OgMvhFz8
 ppsqP1WXY089peYlLkQc6A3f4vc86HtKx71tp+EUfpAFv9Enn7vd5MRRoXCUBiCtr2XH
 6pAXZDj+sUk1+bntrgerndKXr/Skorkhkyxhe+P9kvtaoRLf84rSh3fwmDAwjn14nnFV
 vZqDyu3o+Xno6iX6Pi6DzsLV3Q0Ybl29KXtTqLdC7oP8GiAzk4r1oeOtcgIqz9RcwLGv
 CuQYX8rKOZ+FwVPKlPQDo3CYqIV3XW/a12jOMTxqWK3jC4iQNngzbSUqLg35+kpap31u
 BfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X/mzWNbU36E95IRt9D8fAccd3oFOGwW1htGO2TiXO2Y=;
 b=nbeHKbt+O7z81qngNm4i0VaFGnMzv/AYe/btBJ1yBRDNzbir9+kLa25IVCVNCdkE/3
 2jzEduo2iqm6l3yBVPWA46uIl0MIDvtVQBbZxoA+vRN3jVoBTYyDPB3ee5ktyb5nV8Y5
 VA5Olm+VDCK4l1fp+LSTZ9weMFKtHzbW2/rhIp2GArwS/eINDMBwyuFglWEqY/7CkkGa
 fihQLTA9CfFgoErWUE5A3jNBBbIwueS9In9jpGW9z9I2I47YFIsqrHPClxrBwirVbTTq
 9LRgd2Ug6tLFwMraTbaXNxUUiTI+yTjRsdM22YUXYs+++SeR7TVeVUqZI5D6SlfYcMmS
 tfRA==
X-Gm-Message-State: AOAM533aNDNstHehwG+wADV5d/engRLC/RDYGzLc885JVj9FJW5oboP3
 gBmeKQz7xaeT7Lgqp3UuAy1I1ufERAQ=
X-Google-Smtp-Source: ABdhPJyAIZ5B290dvkpJa2DFipX4ukH0ox34lPa1DG/cRBFxPdZA6VALqdZe7IgYOBsRDXFUJsgIOQ==
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr6533390wry.306.1644158263745; 
 Sun, 06 Feb 2022 06:37:43 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id u19sm6443656wmm.39.2022.02.06.06.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 06:37:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:35:35 +0100
Message-Id: <20220206143535.1754289-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-tinyrpc: bump to version
 1.1.4
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

https://github.com/mbr/tinyrpc/compare/1.1.1...1.1.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-tinyrpc/python-tinyrpc.hash | 4 ++--
 package/python-tinyrpc/python-tinyrpc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tinyrpc/python-tinyrpc.hash b/package/python-tinyrpc/python-tinyrpc.hash
index c5bdad567e..d4bd348e61 100644
--- a/package/python-tinyrpc/python-tinyrpc.hash
+++ b/package/python-tinyrpc/python-tinyrpc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinyrpc/json
-md5  34d7b41ab48297b6b8fbf937e3d43a57  tinyrpc-1.1.1.tar.gz
-sha256  9e68d7b9688dac8deaa342a2507d04f0b2ece64a9d19382aa2ee13d692e87d7f  tinyrpc-1.1.1.tar.gz
+md5  cc7e62891eee806dfbbafb6e3875825e  tinyrpc-1.1.4.tar.gz
+sha256  c99f412e5d9849c2deb468ea37fee2faf12fbc95bdd3616ae5c276ea195ed6bd  tinyrpc-1.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  587f1ea174824613f4a7e0d7fb95fda000a7f58ca17df12416e014c9ee82e619  LICENSE
diff --git a/package/python-tinyrpc/python-tinyrpc.mk b/package/python-tinyrpc/python-tinyrpc.mk
index f3f7dcc52b..e976778fa2 100644
--- a/package/python-tinyrpc/python-tinyrpc.mk
+++ b/package/python-tinyrpc/python-tinyrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYRPC_VERSION = 1.1.1
+PYTHON_TINYRPC_VERSION = 1.1.4
 PYTHON_TINYRPC_SOURCE = tinyrpc-$(PYTHON_TINYRPC_VERSION).tar.gz
-PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/6a/63/0851365686da1ca9ab03d63b035eccf87a1d85b743ce07d079462350da33
+PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/d2/86/2741f0c74cc339416c9803b6393eaf230254ecf36ffd839614799e15a202
 PYTHON_TINYRPC_SETUP_TYPE = setuptools
 PYTHON_TINYRPC_LICENSE = MIT
 PYTHON_TINYRPC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
