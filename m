Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10BA606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=htfRdstK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lZMLYaCz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3B654086C;
	Wed, 25 Nov 2026 16:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N11jex5BoF8A; Wed, 25 Nov 2026 16:41:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7F8634081A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795624908;
	b=Og1XNjfvwryfXqoYkJkXBHJA0l9nVvM/BlPirsleEqxqsAr3k/gmFsHJMpPPaOzijuCb
	 QdZwfmKGNnVInovwwr1aX/SmaStuIsRP0EI5BKpj/a8yqj0AeNM4o7TI/rjdJnlx/Z6/y
	 iM0yEdBnlm4s2q8Qs2azzMa3k2ee/aG4BMC7rLZP5ml18RqQZG44TmbE1oZNIAGBPFJLh
	 u+IpiEFnIOwlMtiyTqQMiKpVfUSM44RUkgcg3mmmH+uGA+yFCcNBrzLJxDs28YpyKB7pM
	 MK5mCLn2AWnva6YUadPQFq0zEeGJlHNnNWADjz/T0QJjia62gT+0s4tIAZ17zgQ8V7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795624908;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=l20LD9n7ACEtcCwLDv8v7y5R3W3kDon5qNYrBOEqDU8=;
	b=biKXAfhq1gMu/dzSoD6eswAO3uI7bIdVX3Pv7hxM0T4GK3eQfBDCUSZdFrTQoTW+2fsd
	 MKNva5XnqEtfsxCB/Lh+xKhx/pL6XLOOeGBuWbkJcA1FD+NMCP1LpsNnVgqu+MYUpA3Q3
	 4Jg1eo48qpM2s73j8GWhA3hMbztW83LZYHY2PxsIuvrTHmx2pwKlOtqg6eEX9UkjZxdnY
	 q4KHGWdI4GqprhUQ/depGCSolVfOATAwkDDozUTyV70r+Qx0SUsAHKJWHXCjsVNpn2QCl
	 vsSgswXKCETb3B6Fe2hkl+wBpq37t7XQNQ7+D6dPtYM57VMS1o8mW2DWNmspZBG0JyA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795624908;
	bh=l20LD9n7ACEtcCwLDv8v7y5R3W3kDon5qNYrBOEqDU8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=htfRdstKG7i5nvQOiOuOhZ1gHSK9Qyyfm2QdvbAqMztB3QHin/ohZQyeoSCwp8VYi
	 /y7GNmsd+HylWz+4/1vvdKY0jw41FYuSX5FJYnO2XmNQf5pPF/T918yiH3xFpfDNwO
	 oiXtNVzJu/Sq676HzGiXbTs0ds85fUoFd0NuPZVL5UgFXLNyUpliWP/AmPjHt/2s5V
	 ek06UAGXG+/Sze9AM0GgEerYpyAOergpdBGP8f32PmEi3NY/zqOlLsi+1eTKqBQwgS
	 LssfWzGef4+z6YFRkrt9Vtjfxl6OAxoh0+XXV1c9pMtyrtXMlOIKhFezoeudschEHL
	 P0rVVg9Q7CkQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F8634081A;
	Wed, 25 Nov 2026 16:41:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 324BF43
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24B6A80E0A
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-tqA7hONf5I for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:41:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CE9A880CB8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lZMLYaCz
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE9A880CB8
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso44275895e9.2
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795624903; x=1796229703;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/jDz0SoQ0rygAjvQ7tHPBK3jhjBdEJQm9xtKXDU19Yg=;
 b=lZMLYaCzvpimfyvLSh46NTXfSIG4e+4WIT0OIuQpmmBmwyrGJegOB9khSI3fWth/No
 HU0F3+UYkCALRW2mKYNsxhk+0gim0rmauhxu9/2ge24oZht+JnTRlTniUsj+zLiFq9oW
 hZyappN7X0d85H4gtBk/vYPCqkMxCaaWsqWJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795624903; x=1796229703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/jDz0SoQ0rygAjvQ7tHPBK3jhjBdEJQm9xtKXDU19Yg=;
 b=fyDq/3EsznQ/0FsNQ3uFR7kQbaS+j4pffp6O4K7uDA3DhflWJL3SRy+5SwZ84/vn29
 AX51N6BQ72GGH3WWIvxhySgH85BoIw6mJjZMfmZ+TBCG8CsvMblxZMoKI9hDxdM6iNo6
 04d5cuIVFpMWu4/H8n7ZVsGnjB5N0VscN75kf+bkfPrzScotPicuE84OLRrz1KzA73YU
 +M4MGxYHAtzNcd4i7nyhmbw+HNXUPjS/1RX2jyvKIwjrXRfK1+kMf37aIHP0rUusbqwD
 cy0wuFT/Mc7iS7A9ZpsaVBS2YdH8dvuuipkqy7kxfy88JNVojhKHoD2A6+qHj9697zWx
 rFBw==
X-Gm-Message-State: APuU4Z91mqIh95RmzDQzyJ7FRAanvwxQc8ezsuf6WP8TjpSQQgYvhwsY
 ZMEtUvRo85KG3Uflc7JoItXs2o9eHNJv2grbMTFIE1Ucn06WxoSyi2sz/epCqsE/uVnYtL19I5J
 cGGGt
X-Gm-Gg: AZFdTZeu9SJeEIqkIEHOBc5knjightt263+h7FeAPAhyt/hXSfqsoUGkukgEalwIELM
 RazB3/qdZrU11BAUmtijcAT+534AhYTZEmw/nBaL2GFdLjFHjLvDN4GRgC9oAgCdvmT6RyhCeuD
 wHF7nYBBT2Qur8Timh1diZdHM0ioW9/fvppNZRwa+aPBttKa0Y0zSOyCS9ek96BzECoCKk60eDe
 JX0kh6ejPhEscmmzLxseQX8sa+J1CLUYJ+D2b9omHdlPyX8vjamijgREFDteIhIcUCs/1fKVA+W
 JsBB3TD1aYRLUwiEMpqqFop95rKchZITqqGkhx688PamUhPJ3ULEvrhoU/BWsJs5i4yFNDLbri5
 V0SAi3y7LFIp7gja7IfPmPthtifXcd8DF7M6rsKRrRr967kcX0o+SrpzZkdW5ZqQJXWbW2ZDpI6
 tSOlFtCUf5+BHQ+SPgIuBQIfGGddE2kVumCiKoPZVUHRmDMFKxyZw0IqZ2C7IkXQ3/CDRR6bkz7
 xzDEGrBOBHlPnwqHKySlYEeHO7RmHEYbQJPkK8AFpMnv7HbIGAQraKdJV+zn4p6WVI7LGx298v/
 eUMx1uciDZlipBt4MkFs2IUCfGvKO2hiB4Ji5IVDnOuwx2rfQcawrYJbGp4ZEhxFESShz5NpmFy
 QNAJG1hfluLgSxzakPS65EHhr3HwihDkE3eali5SsJLsa3klkMu+U9L1WY7tcAAOJwmZ3e5Fk/o
 QPXAcJb90mqD+UVYEplnRg
X-Received: by 2002:a05:600c:6749:b0:4bb:71c1:3ca6 with SMTP id
 5b1f17b1804b1-4bb88819d15mr358116565e9.21.1795624902889; 
 Wed, 25 Nov 2026 08:41:42 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067a0e6sm247988765e9.4.2026.11.25.08.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:41:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:41:25 +0100
Message-ID: <20261125164127.863713-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125164127.863713-1-dario.binacchi@amarulasolutions.com>
References: <20261125164127.863713-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/5] boot/stm32-ddr-phy-binary: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DDR PHY firmware binaries of the STMicroelectronics STM32MP2 SoCs
are not part of the upstream TF-A sources: they must be retrieved from
a separate repository and are packed in the FIP by TF-A.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 DEVELOPERS                                          |  1 +
 boot/Config.in                                      |  1 +
 boot/stm32-ddr-phy-binary/Config.in                 |  9 +++++++++
 boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash |  3 +++
 boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 boot/stm32-ddr-phy-binary/Config.in
 create mode 100644 boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash
 create mode 100644 boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59fad7f26bbf..5e7312bda7af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -816,6 +816,7 @@ F:	board/bsh/
 F:	board/stmicroelectronics/stm32f746-disco/
 F:	board/stmicroelectronics/stm32f769-disco/
 F:	board/stmicroelectronics/stm32h747-disco/
+F:	boot/stm32-ddr-phy-binary/
 F:	boot/ti-k3-boot-firmware/
 F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index d73d221431f9..95af63ab9af1 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -22,6 +22,7 @@ source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
 source "boot/palo/Config.in"
 source "boot/shim/Config.in"
+source "boot/stm32-ddr-phy-binary/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
diff --git a/boot/stm32-ddr-phy-binary/Config.in b/boot/stm32-ddr-phy-binary/Config.in
new file mode 100644
index 000000000000..1a8def0d22ff
--- /dev/null
+++ b/boot/stm32-ddr-phy-binary/Config.in
@@ -0,0 +1,9 @@
+config BR2_TARGET_STM32_DDR_PHY_BINARY
+	bool "stm32-ddr-phy-binary"
+	depends on BR2_aarch64
+	help
+	  DDR PHY firmware binaries for the STMicroelectronics STM32MP2
+	  SoCs. They are not built, they are needed as a dependency to
+	  build the TF-A firmware for these SoCs.
+
+	  https://github.com/STMicroelectronics/stm32-ddr-phy-binary
diff --git a/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash b/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash
new file mode 100644
index 000000000000..5826a483cbc9
--- /dev/null
+++ b/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  519595ae24b44d70b0c0ac1e776bf1b871da00b615b9bffa83573e45b806eedc  stm32-ddr-phy-binary-1.0-stm32mp.tar.gz
+sha256  6b6a3968253466c776a660e916c67c7207c42fcd5bf02895e50215f923dae29d  LICENSE.md
diff --git a/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk b/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk
new file mode 100644
index 000000000000..d90980544a8c
--- /dev/null
+++ b/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# stm32-ddr-phy-binary
+#
+################################################################################
+
+STM32_DDR_PHY_BINARY_VERSION = 1.0-stm32mp
+STM32_DDR_PHY_BINARY_SITE = $(call github,STMicroelectronics,stm32-ddr-phy-binary,v$(STM32_DDR_PHY_BINARY_VERSION))
+STM32_DDR_PHY_BINARY_LICENSE = SLA0044
+STM32_DDR_PHY_BINARY_LICENSE_FILES = LICENSE.md
+STM32_DDR_PHY_BINARY_INSTALL_TARGET = NO
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
