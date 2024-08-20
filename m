Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFB2C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 19:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C84840B37;
	Tue, 20 Aug 2024 19:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktcoVLLYmtDk; Tue, 20 Aug 2024 19:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E4B640B24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E4B640B24;
	Tue, 20 Aug 2024 19:19:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73C281BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6148540B09
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jr6nYiu1faDQ for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 19:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C6BF4061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C6BF4061F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C6BF4061F
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 19:19:44 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-428e0d18666so46740595e9.3
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 12:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724181583; x=1724786383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hWJ2yzBQ1HM6DN1pW5rQCtthNQIlbhCOpX59WSC86iI=;
 b=MtH7q3puWMTOoiGYudDDaeYYNiqEk6DKN1cVLx7qaYjzxIe27aWqsJ8Z2Nu3R77jze
 KHN4bjM+yr22I0J4AooWaOusXIvfUnjtwOGSj5smh508zj7vvxxS9IYgE96sJ+RTGEh/
 gUH/tcQt6KRwXjmtAnHOcgaXFkivH5kc1KnJ7qSW89zsOqgJ61ncCXQ+DapGTxYLAR3Z
 sSi9iBRnL/hv+qaPGDUxAdPDiaaikdxgSFfQ1qNSLG5G/wztxAVgdta+2/wYfx3j0IOI
 Nf+9XoYa8DuWr4Hzoh8G+ZIgelR64fs2ESdaQrjfa5+Iq4zvM2Dw/XUnT4qxKC1vQaQI
 HRMg==
X-Gm-Message-State: AOJu0YwSoetdyxoRrfzovr0s5fO5NbjZvZhQR9gV4PLSeEluOKtL2rXr
 /9SXEl2BMwYmZltZy2pF8n0fYIKgJuQ0QtTp0gCUGiKGZlkbre2ftXafJUNKSg+TgmW1CjHKM3w
 n3zM=
X-Google-Smtp-Source: AGHT+IHHKEKeweYyiF6LPPQe6XNCr6xYV60dG9ofWwIcsJeT1jX+CpzSOe0vHNWE7zTjiXs+S941Bw==
X-Received: by 2002:a5d:6402:0:b0:371:7e19:b9de with SMTP id
 ffacd0b85a97d-372fd6f1536mr14074f8f.32.1724181582740; 
 Tue, 20 Aug 2024 12:19:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.87])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718983a184sm13763209f8f.14.2024.08.20.12.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 12:19:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 21:19:25 +0200
Message-ID: <20240820191927.2126281-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820191927.2126281-1-dario.binacchi@amarulasolutions.com>
References: <20240820191927.2126281-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724181583; x=1724786383;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hWJ2yzBQ1HM6DN1pW5rQCtthNQIlbhCOpX59WSC86iI=;
 b=NTKdtE7PXc8V3eh9sEg/DAKD7Ou4MuxV+b16hhWI+iYYwG2l/OVyHUNhxjkbRjpTNc
 BNFZ9R371Ej5S7PglYbwtWsscDKg9WqaBVMdiFNrKgmtvALuHItrdz1+Z1/c/2/fMUOK
 FoCuZfMa+ySn/aHmZewklPp0PNGgz+VGfKTIg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=NTKdtE7P
Subject: [Buildroot] [PATCH v2 1/3] package/tinyinit: new package
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package contains a Linux init script suitable for resource-limited
systems which can be used as an alternative to the one provided by
Busybox.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Rename tinit to tinyinit.
 - Put the script inside the tinyinit package without the need to use
   a github repo.
 - Update the commit message.

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/tinyinit/Config.in   |  7 +++++++
 package/tinyinit/tinyinit.mk | 12 ++++++++++++
 system/Config.in             |  5 +++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/tinyinit/Config.in
 create mode 100644 package/tinyinit/tinyinit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af35431b..45cc1cc48996 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -791,6 +791,7 @@ F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
 F:	package/sscep/
+F:	package/tinyinit/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6ec6..435134fd38c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2870,6 +2870,7 @@ menu "System tools"
 	source "package/tar/Config.in"
 	source "package/tealdeer/Config.in"
 	source "package/thermald/Config.in"
+	source "package/tinyinit/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
 	source "package/tpm2-tools/Config.in"
diff --git a/package/tinyinit/Config.in b/package/tinyinit/Config.in
new file mode 100644
index 000000000000..c780ed3cac3a
--- /dev/null
+++ b/package/tinyinit/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_TINYINIT
+	bool "tinyinit"
+	depends on BR2_INIT_TINYINIT
+	help
+	  A Linux tiny initialization script suitable for resource
+	  limited systems, which can be used as an alternative to the
+	  one provided by Busybox.
diff --git a/package/tinyinit/tinyinit.mk b/package/tinyinit/tinyinit.mk
new file mode 100644
index 000000000000..c7bb144dee68
--- /dev/null
+++ b/package/tinyinit/tinyinit.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# tinyinit
+#
+################################################################################
+
+define TINYINIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(TINYINIT_PKGDIR)/init $(TARGET_DIR)/sbin/init
+	(cd $(TARGET_DIR); ln -sf /sbin/init init)
+endef
+
+$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 318c538ef1d0..9e15a785f3f0 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -145,6 +145,11 @@ comment "systemd highly recommends Linux >= 4.15"
 	depends on BR2_INIT_SYSTEMD
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
+config BR2_INIT_TINYINIT
+	bool "tiny init"
+	select BR2_PACKAGE_TINYINIT
+	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
+
 config BR2_INIT_NONE
 	bool "None"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
