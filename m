Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A896C43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 09:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B629A40A06;
	Thu,  2 Jun 2022 09:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Lg9VjG9LF61; Thu,  2 Jun 2022 09:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D93C8405BA;
	Thu,  2 Jun 2022 09:00:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 493A51BF9D1
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 09:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3579C40A06
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 09:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxwgwJLLTAwE for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 09:00:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FF754026F
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 09:00:18 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 86E8440018;
 Thu,  2 Jun 2022 09:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654160416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSFqox69im0mqNySx3US/nVV71Cafc+jKekyI8g1PI4=;
 b=nfM4oYZyGINqm8jW/VQ3pzTxa1CKaMwHLqSyNQiOpC+VKZy6vanwVMufRgoTZ+W1/aA3jv
 VQyc6VLWMytXqkhDYL1gR6YRQzO33rgLvHHnemhyxO1ZwihIpoGbNpVl9DkpiHMcTv5bfL
 SLF1ICPVIKdENNGvj1fR4gVhTmEY97psKLPBrP1c/1hz+gJOp9A0NU6y9/jErJb0xzQBLc
 FNJpLA9Ej35cvas7j6nufSd0WYUICJGoAaY16NhncKIaiAH+vQlmmFitdO1ptXK8kiHXHo
 fYMnbYryTRcJcuFxe13906UBcpzPfhi2ssNVvcxwFv9JCXwnWnv911rpzeWg3g==
To: buildroot@buildroot.org
Date: Thu,  2 Jun 2022 11:00:12 +0200
Message-Id: <20220602090012.2008381-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220602090012.2008381-1-kory.maincent@bootlin.com>
References: <20220602090012.2008381-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] boot/optee-os: add support to build with
 python-pillow
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: kory.maincent@bootlin.com
Cc: Kory Maincent <kory.maincent@bootlin.com>, etienne.carriere@linaro.org,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

SOC constructor version of optee-os may uses python-pillow to build the
Trusted User Interface feature.
Add support to build these specific versions by adding a new
BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW option which will
select host-python-pillow dependency.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/optee-os/Config.in   | 7 +++++++
 boot/optee-os/optee-os.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index fb8a189a75..b459393191 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -72,6 +72,13 @@ config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	  python-cryptography. Select this option if optee-os needs
 	  python-cryptography to be built.
 
+config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW
+	bool "OP-TEE OS needs host-python-pillow"
+	help
+	  OP-TEE OS version from SOC manufacturer may use python-pillow
+	  to build the Trusted User Interface feature.
+	  Select this option if optee-os need python-pillow to be built.
+
 config BR2_TARGET_OPTEE_OS_CORE
 	bool "Build core"
 	default y
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 5313a1badc..88f14b48e4 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -29,6 +29,10 @@ else
 OPTEE_OS_DEPENDENCIES += host-python-pycryptodomex
 endif
 
+ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW),y)
+OPTEE_OS_DEPENDENCIES += host-python-pillow
+endif
+
 ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_DTC),y)
 OPTEE_OS_DEPENDENCIES += host-dtc
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
