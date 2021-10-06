Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E6DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E3ED61163
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E3ED61163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E845460F52;
	Wed,  6 Oct 2021 20:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7Ui31iKZk-V; Wed,  6 Oct 2021 20:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB01B60F4C;
	Wed,  6 Oct 2021 20:43:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBA131BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBFBD4069A
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izejJZm3JHJG for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:42:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D61E940689
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:42:01 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so3354828pjb.3
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/5BkMoG2MlUXFb1kuInSpZeSHE8hOKoxMIu8kqKBj4=;
 b=CIQzJNfTQnZRYlvIa2TcgJoiZvjVAyGHmdv/H/FSS1ZsCifZU95XhtNJdnt5vJgfIL
 kRO9RAw21ev7viR+L/bJdgrST/9qLN08240W18u3O3W6QFc+hD1h46q/OUm11ylbI6D0
 /oa2us0pVbMUPJCEhxhp1r3+vN3iJYZ4baMug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/5BkMoG2MlUXFb1kuInSpZeSHE8hOKoxMIu8kqKBj4=;
 b=JjqM12qreBurZ2ekBrOcoTBm8obYJjUyapaoRyJ11vB1Adgcwr1YiBwOYj2FVUtEqp
 aViNZz+lM/CqoFdUgOUP6vY/DmOxs659bbr1jW+5v/TFypy6UWrtutBnTkvW9rSNHISx
 Q6QWAnKeRJnqYzST3clpNDZ1C8zGhAB2oPOu4Pw5fuQmMlDKwqs9RtrjhkBdWTJpLBhj
 eE6+FOSNSLRlAaGEf3HbUrVE1vTAsMRJkLRz45GySJ/+6x/QNuvCpIxjs930RoBofxOF
 t0QvwDUILQU/YnceqCUUDkqLp54inHWEhAFd/YobDq+qjmDet7CfQeMPrOZuvDlscp1H
 sWCA==
X-Gm-Message-State: AOAM533TDGWb1BgUYeKEwgQ3aacwLuOdJfJws4f5xajXeGWfEaQToE10
 rdzxzMynIi1XkNDt6VK1Vton1HpQomKzmHSP
X-Google-Smtp-Source: ABdhPJxQF3jfjM4i9cC9jXnajZww9M+6yNoZTldpOlfvnYoDEMczpBAsrCB9Reg3FwwLxBYUrmXrMw==
X-Received: by 2002:a17:90a:f287:: with SMTP id
 fs7mr971369pjb.98.1633552920980; 
 Wed, 06 Oct 2021 13:42:00 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:42:00 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:30 -0700
Message-Id: <20211006204135.2813745-7-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 07/12] package/freescale-imx/isp-vvcam-module:
 add package
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Verisilicon ISP that can be found in i.MX processors such as the i.MX 8M Plus.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/Config.in               |  1 +
 .../freescale-imx/isp-vvcam-module/Config.in  |  8 ++++++
 .../isp-vvcam-module/isp-vvcam-module.hash    |  2 ++
 .../isp-vvcam-module/isp-vvcam-module.mk      | 26 +++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/freescale-imx/isp-vvcam-module/Config.in
 create mode 100644 package/freescale-imx/isp-vvcam-module/isp-vvcam-module.hash
 create mode 100644 package/freescale-imx/isp-vvcam-module/isp-vvcam-module.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 4a4237fb42..5f02d24909 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -116,6 +116,7 @@ source "package/freescale-imx/firmware-imx/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
 source "package/freescale-imx/imx-seco/Config.in"
 source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
+source "package/freescale-imx/isp-vvcam-module/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 source "package/freescale-imx/libz160/Config.in"
diff --git a/package/freescale-imx/isp-vvcam-module/Config.in b/package/freescale-imx/isp-vvcam-module/Config.in
new file mode 100644
index 0000000000..d3a96c0d02
--- /dev/null
+++ b/package/freescale-imx/isp-vvcam-module/Config.in
@@ -0,0 +1,8 @@
+comment "bdsdmac_module needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_ISP_VVCAM_MODULE
+	bool "ISP-VVCAM Kernel module"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Verisilicon ISP that can be found in i.MX processors such as the i.MX 8M Plus.
diff --git a/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.hash b/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.hash
new file mode 100644
index 0000000000..4b2fc15a81
--- /dev/null
+++ b/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e52166a29a7d58b1f7d30639b451eb8f38971903c898c24e8fcc03dbfc7a503f  isp-vvcam-module-47588cb88cc75400b5d2c35a17527e99b752d9be-br1.tar.gz
diff --git a/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.mk b/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.mk
new file mode 100644
index 0000000000..652250c65e
--- /dev/null
+++ b/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# ISP_VVCAM_MODULE
+#
+################################################################################
+
+ISP_VVCAM_MODULE_VERSION = 47588cb88cc75400b5d2c35a17527e99b752d9be
+ISP_VVCAM_MODULE_SITE = https://source.codeaurora.org/external/imx/isp-vvcam
+ISP_VVCAM_MODULE_SITE_METHOD = git
+ISP_VVCAM_MODULE_LICENSE = GPL-2.0
+ISP_VVCAM_MODULE_DEPENDENCIES = linux
+
+define ISP_VVCAM_MODULE_BUILD_CMDS
+	cd $(@D)/vvcam/v4l2; \
+	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
+		ARCH=$(KERNEL_ARCH) KERNEL_SRC=$(LINUX_DIR)
+endef
+
+define ISP_VVCAM_MODULE_INSTALL_TARGET_CMDS
+	cd $(@D)/vvcam/v4l2; \
+	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
+		ARCH=$(KERNEL_ARCH) KERNEL_SRC=$(LINUX_DIR) \
+		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
+endef
+
+$(eval $(generic-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
