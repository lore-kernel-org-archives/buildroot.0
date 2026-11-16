Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FFA606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r05OQQrc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n40szM2F
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A74108108E;
	Mon, 16 Nov 2026 21:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAyOYNTh98_a; Mon, 16 Nov 2026 21:29:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3577580E98
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864571;
	b=Yj1jJ7TdQT2WLDI4M6P3qb5t74B/GQeI+Vfj/oHpHlU8+jJtZagpBEjx/s+OqecV585G
	 m2CFR1TOwEfluljRhI7dOJM1+EbvlA/VzqAFphhQzLDdcn44KRpT1kdq1A5QBz845/s9R
	 vPkkYgSVPaDZyQsNMRULKwNgFwmnSicKU2F54LTGiIo9lDrZOKoPvaONjEwfgW0yrApDe
	 xLdhxbNADk6IO4HwNT8BHaH8xVhmlRF4O5JvKiw3nHTYnlM3EXfAAs7cLLsjp/LTWO/ak
	 C+zzsPLrnz0XM2AVEFswfNE1YMDI32lS8RqAtaFK3W3ltBTsflCGODh9CBluw/zAcTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864571;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=rdTLedV53J1vSCXwnwiec2oQlkNjzRM1yANw2TdaykI=;
	b=F8Q29qAD+yOFXimRsrmhaDVIbctXy7hDWZtoNZiQr4vtJElV9NlfDn/fiJCc2BYaYzZP
	 f4JqazHnZEb/ziYRds0AZ0+0Jfx1swMcLn7xc71R8Ajohy9CVjv/0Dugd1yBmMq01Z6al
	 c0A7TOVA3/OI/Ivbao0QmK56/mjTar4VlLdTWpGlInVUXki6cbvH36FFWprOgiNKOO6yO
	 3xt/MO1U932oL+K0mYQRkGQyMVEgBTkpv5ppuT3v/jDl4Oz11yPIkjAKafRu990OBDGVS
	 VKN2A41HctSyzc4prOpjzzAtOGGsxowoaARepWM1xRPIyqUJG/asyJMqqakqvT1N95g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864571;
	bh=rdTLedV53J1vSCXwnwiec2oQlkNjzRM1yANw2TdaykI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r05OQQrczuoT7SXX4XgB3JtJFgNETK2HWQNUx/EiN5mFrCM42Dt/cw7GdlJhLqoY1
	 GiYUI84cFz4U1CE3rdF1x4fFBmMdTMzTLm81owAIoocSr+akJn5iPghkX9j35Y9Udh
	 VeQDhAFy8GFJKOwc3aD7kcQKGEc9Bjjy6iW8zSvqzhPXjEfAH0WwDz4VLWtSpUTHSs
	 HhYJmFytLXprqIViWHNjaqlyWxGrXHmIUQr8Kbro5fwvD0k2mPssKSMDcVLVPWGdfG
	 cOXXJ+t1qT02zAo2CjF7No+LZFKzF9fn8KAPZHdiA3YvO0go02DfE33Xfu93lqFjon
	 cDLuylOmXLnig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3577580E98;
	Mon, 16 Nov 2026 21:29:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0BD6109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9593E60811
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYNpga6q7CbD for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:29:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 93CAA606A2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=n40szM2F
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93CAA606A2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:25 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4919a880834so2034654f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864563; x=1795469363; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QBfiEqkwlC70DjrxNSSUauSzYv3/iUcKg38fjSLka40=;
 b=n40szM2FOjSZXUkWt3dPRJpTB9Vh/KLddmQyC9Eb6rjTv+rs4TSBZBj+Xs+0tk4veW
 555k4XMieaEEFZHx3ez1i5H8ufPCVFNKDu7xBzW10vdzs/MiIFYXTKFmnuYP3fzqnhym
 FLuLb/mx7oJYDDzx5UFyRqZR7fQtIvhpYuJrCPIpq9x7CeZticMeeOuoYTuPCt3iB+Fs
 TDzpb6kJ+MMsDRfQOxgJXpEY3vMnfkmOK3DaUjefPBQcvCI5/LDgcL9kg5m4d3jPn7bL
 82CMy6KZf91pH4IcZ7Pdx3aQkcWsKaxz7RjwPmpmLaTtLrB4fvvWpTRtr7Rv8hDygSuk
 TygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864563; x=1795469363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QBfiEqkwlC70DjrxNSSUauSzYv3/iUcKg38fjSLka40=;
 b=Md2TP+5trLGR8MmiG9JWStghsZ3xTk05RdmMwbUVUOahXmA8tuOuqs8MI7oy2/xNH8
 bi1ow78aD08tyBkLxxrtVEwFI1DqDQGeI2b2HPvAcE0HY4mxtIUf/OLRmWY6CgZT3d5r
 cVD/98xy/uMGnpSIG/acPy8IwUlcLAL2KRIDPW0lqRIfKC4tPmb4cR54K32pY7Mo8yAU
 9PewZ5sUcpuFOmu147hLTw1i2lEGaaAOFfz4rsb4awCSFydKzfsBnDiBt3UVTMXRmWgn
 aDoW/y3brZd8jF83UnbB2+Dz76ddL7rDmRAUmNEJs+RJSNRXPqK2KYpmYPCp7Bryrwq7
 hxrQ==
X-Gm-Message-State: APuU4Z9niUlFpyE9sRJYJmfpJ05nNVhhptnL5YY1gFe9ZLzv4TwtXcfj
 +31l2TvDkhLUNhb9A3KmwL2cbKSy8MmvQoCezXzCaTAeAKpV4OzTnnP40xFQywxS
X-Gm-Gg: AZFdTZdpBeswjWxjGjtTlfUQknBEJHyslLp9IFTba0LbVH+qVtQZscY5GcS8BFz5wV/
 9OBPNyBfCYdAai6NunVK/DRh6J4ss2HHbuhu2jmtXtg9uxujcoSicYzOujuahcFYK1WEimqXMjt
 BglaXtasjSG1c/WqlsGmcykedjAg7zD9cgRKmV3/EPKzmTcITnS/2AUKyy6AQ0z3gMy0o6FHN5u
 scDAzA4ODKXsabSYwHyo752GgBByJ4YN6FjTmhJrKtthRkoZfPmIAJkeTa6sR540hF/AYQXC0/n
 kAmu70TUSmXPC5TRYTmyUXBD0MwG6qe2hLeHCTeT+hoKSyUzzr9GZMIF18cth+64Nwg3sfPpQHM
 TcFwcDWTz/DSFMn6b2ycoRxEVvUA/J3KFSIj+CBMLHUYq3VBB9UqufwAyv1UJ/Q3IUcursnFzIs
 NbLOvoTBrQjhVkAbucCtm3Kzxs1VzIE7wmgIEAJkS0c4bNeY97BQNtIomJ4MoDuHcrnuw4z8nKg
 ti5ftfIG5CVMKXygs0DiJgUjQwkfShviffcVM4USPyM3v20vv2AhxpZjhLF19YpcjQBGySSbhHN
 vHcQRvVEqk+rZ4XFR3cIuRuafZM/iX2JmDS6W1wcTkxQDgXCUdju
X-Received: by 2002:a05:6000:987:b0:48e:b1a:fa6 with SMTP id
 ffacd0b85a97d-4a200654ceamr6008315f8f.40.1794864563183; 
 Mon, 16 Nov 2026 13:29:23 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d223a29sm24918708f8f.8.2026.11.16.13.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:29:22 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:29:12 +0100
Message-ID: <20261116212913.863975-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
 <20261116212913.863975-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 4/5] package/python-matplotlib: add Qt6
 support to the Qt display
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Dylan Bespalko <dylan.bespalko@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The "qt display" option of matplotlib needs the Python bindings of Qt.
Until now, it only worked with Qt5 and python-pyqt5.

With Qt6, use python-pyside6. The Qt backend of matplotlib finds the
bindings at run time, and it supports both PyQt5 and PySide6.

Qt5 and Qt6 cannot be enabled together, so the option selects the
bindings that match the Qt version of the configuration.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - New patch: the Qt display of matplotlib works with Qt6 too, with
    python-pyside6. With Qt5 it still uses python-pyqt5

 package/python-matplotlib/Config.in            | 15 +++++++++++----
 package/python-matplotlib/python-matplotlib.mk |  6 ++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 13894004aa..8cd931ffb0 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -35,10 +35,17 @@ if BR2_PACKAGE_PYTHON_MATPLOTLIB
 
 config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
 	bool "qt display"
-	depends on BR2_PACKAGE_QT5 # python-pyqt5
-	select BR2_PACKAGE_PYTHON_PYQT5
-	select BR2_PACKAGE_QT5BASE_FONTCONFIG
-	select BR2_PACKAGE_QT5BASE_WIDGETS
+	depends on BR2_PACKAGE_QT5 || \
+		(BR2_PACKAGE_QT6 && \
+		BR2_PACKAGE_QT6_GL_SUPPORTS && \
+		BR2_PACKAGE_LLVM_ARCH_SUPPORTS) # python-pyside6
+	# Qt5
+	select BR2_PACKAGE_PYTHON_PYQT5 if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
+	# Qt6
+	select BR2_PACKAGE_PYTHON_PYSIDE6 if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_FONTCONFIG if BR2_PACKAGE_QT6
 
 endif
 
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 067bd68685..244663f719 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -27,8 +27,14 @@ PYTHON_MATPLOTLIB_CONF_ENV += \
 	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
 	PYTHONPATH=$(PYTHON3_PATH)
 
+# The Qt backend of matplotlib finds the Python bindings of Qt at run
+# time: PyQt5 with Qt5, PySide6 with Qt6.
 ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
+ifeq ($(BR2_PACKAGE_QT5),y)
 PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
+else
+PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyside6
+endif
 endif
 
 $(eval $(meson-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
