Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC665606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tr+v2trR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D16811E6;
	Thu, 22 Oct 2026 18:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUiXbPxLYGyW; Thu, 22 Oct 2026 18:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 92772811D4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792693095;
	b=hm7S2ru7hkUGg6b1kRoiDwUs+9CIrIjIPdpBMVgU4vUynWjmHjwQQUESZy4NGIXGoK/v
	 tcrJN4y/6KQotX+H3cJ+mp3XTng79PYghH97bfcXjkB7y88N+43mVkXIjmKkbqzTjnhpf
	 4x0KtLA5KFxGPPr0X8/lIW5BZlKtTCK6oj/UO3NI2poSlMD2QzbvkHc36Wfmc9yqainVs
	 /ar4Or0dwjVf4SBBkjGdOY0DPfGj0FxH8xkfvgCgsdy5gbcssIDJp1lqeHdN2A1mkMN5O
	 ySJEp9wbXgMZ3aRA3SW2FFp4i9P9n9oHsEtRpoDabXU4v7ZPoK1rXTapQlPRr2BfmzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792693095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-DetectorID-Processed:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N/lSxKNY4UO5vBhKxzPmOf0HgRDZ4Kv+0neqYH3ngJk=;
	b=Xis7SJrTo0cvU2cLpJHS5uOqaSAzgbAGK1ix8ThpYNJwOUlQFQkw7BPqyfJy/aaia+3y
	 2HVSNy+FbecqlVzcGpWe5VoNWgt+Jtr1rEWbnETIPn7ANbg+Wa5Bx00MlUn4GL9varkox
	 19JS0TDlrpmIqUfNyUKVkKQGBGj6nqS/4HmlkTR6x/yAX4ziisbfz8DB8hoLKHd+3wOzf
	 NOnwT1raeQ48PM1YTryrhmqIdWz6VN6r722tDmBdd6fxBkP5JneyhJwMtJ/oC8fXoOt82
	 F2ATZAValamjqrIMPWiVpHAMYIR7YvtFdq9CMGHTtTTlC8hp5Vf9V/0yws/0Ro2vHvw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792693095;
	bh=N/lSxKNY4UO5vBhKxzPmOf0HgRDZ4Kv+0neqYH3ngJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Tr+v2trRVmUmVRnthVazJW4/RERdhbjtu7RoDvwrwJmU4b4vH6EBJ+9PwvBVQA4fw
	 vo2BgFKGytoyk9JoYLwM2VhUuSc8EMD3IU5sZkmEnOkLirXCCQYrQlLKSuE+v4VoZS
	 lL1ih0N9QOaFPRezXIRSxF2/cO2n+lOZKMpV2yYfPZ4IKKFIFK8VR2xSHJyYk9j60d
	 QEqy3Z/MResJ8oouLkTgFAI+NGtN9e4j1jofSkx3vVXiEsV2VQH6Ux+SNkrcAwenBo
	 UltVpF08XlLv7m2BQBatY2uyp9494nZ6sMMOon1ldy5/P10VcF7Ljue+x11jPS+9OQ
	 9GAMqDimN664Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92772811D4;
	Thu, 22 Oct 2026 18:18:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 232D7499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 148176070C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ieLoD8_NfUJW for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 18:18:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF9466066C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792693093;
 b=nNIu7eu+jm0XlDxyvoseePejYFFI7TctMshHqGgXKdcjQ2p7T9A7+PG89+fPPI6fsK22
 D1mw7GL1Vwk/ZYQ+JOK153XROCB7lm4vlRv6Mf3O0TTQS+GuSqjggY80x4V9D0KbuCw+1
 QkQjJSZZ8pdIQK/s2Z4ci0o0jaNjLkdraWrsfdnd5cLR9Eo8vX4wAnjHeLlf0z0ox76Oj
 1Kqln5bNKZoAnpKqkdJ3DLsBczUGI3dFAlLwQ79oulCY7HP7WMDq3Tnth9RkQqvkfssZD
 TkoO8vbpVl9D3tpzSLLhB6LTx43behq6fcKjmP995XMEN1fJiQkl55tEqHy+Dayz6uA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792693093;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=s8cN2HNdduBMzaNuFmROlYpRay5qsvm5qvRGh/oZ0KA=;
 b=KMtBzgzTWOETuXuuRM1M8rL9oT9fA3r/sodC/qC6ebl8unFBew4s3PnHajyBeZuCkwpx
 VFKm2vkVcTeTyNt3UbbwwJg6CdgwVSMxcuDI6Nn3MrlmcjMQf5IG0eZaD8ebEjXc6Af6s
 fHZwhOmXtyWbLMdZWsRZVhn57knRUxO1OL+Pxc+JbKrdt8sYWVVs4T8/0wYSF+SvHER3Q
 cGWfPlfvhkQFSbKnsPvYJuXzTszp5kXuylcYca1mTn4VrFH2SHGNfrLd1skI/J37KMsOO
 aiQehuEOX8HaPr8Mm1Yl0ivu0oxHkZPGl6C5PnaOZcGz8n9Qupbz8Df3Z4zy/7tgUCQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=TNZzSqU5; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::862"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::862; helo=mail-qt1-x862.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-qt1-x862.google.com (mail-qt1-x862.google.com
 [IPv6:2607:f8b0:4864:20::862])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF9466066C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:18:12 +0000 (UTC)
Received: by mail-qt1-x862.google.com with SMTP id
 d75a77b69052e-53665358476so84141cf.2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792693091; x=1793297891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=s8cN2HNdduBMzaNuFmROlYpRay5qsvm5qvRGh/oZ0KA=;
 b=sUvW9vMmPJUWQ+wKK038D+6ssd6eI3FTCROnN4rf1GcH3DXiSkaf59f2i2RzH2GLwP
 PtKOYsyp/Nu89fy/7W1CJOg1OYuD7u97BjHYCIj/FPJx7ijmTyh8I4DHxeBeHSDeVmvw
 V8w6FwFlqCY6Y+t1tFqYKG1zCYkJb+t6gRSk4fjH+BjKG/XJ3xNtlrzIP0fYamvQUUHZ
 W7/9j1cB79Rs2dgAkPCf7JBOOCDstGrfS01gnVXyBKdb9a9n5bh2aQaIt1vjYm2ZQxfj
 15iCYR8sF4h9RU7+OgNz75b/1zgrI2p1MYIg149aIZqs6faLu9QBIAp9Xdx6XQFUtPp4
 Euew==
X-Gm-Message-State: AFq9FYIxhJSPAEh5yc/AEOiSeodori0Qh7bcgaW3g3Jc8MEz3mgdd7mq
 RBXu8gB2cOUfjhrLl0LLvqCFecRBaY6IjfGyxNvk98gJSDfuQ2cZ6Yf2ZexY7LyY5rODlpjAYRx
 +7rqWKdxbb5an3PQ/rlKz3w0zjGGhHBBnHra9bHlzuvzVuBDVGnih8y3L+Pq1c1uLOWs3bdQMoO
 DtJklpz7oZRad74AHL4uhK/On/FjuClTONDq/Me1VLEQO3NJw0zMXfbpui1ZzxqyiT4h8jYJ6lJ
 wwfEY4yjwpAFMJl4A==
X-Gm-Gg: AYBFou1U4GeGaB7o6TIzgX7jsIsn9WSJA+iMDZnvk0rzS7swrcpRq0/5WC25ptVEIuf
 ikBTUIzNIenEhORJC+Mkl2HOfItYfyHmdOXuMiROvEoERn0YIdO9jbuH2HyNnFPvJ7aabixo1DI
 0XudX7pM3OdNE62Mj/fHpTtEFNvcM0i4lroUvyHs3mV93ihPy+ltQI68jrJTBG03kgxfRNpTm9h
 WZsvuYFYLDvPmLgcNd37lY0v80I608GThMIypbJmwAYDKw3GY5ct2BnUmSvGHmKQ023QW2We1D/
 j/Uj898cMPYoLWz93Es+5vsf2vyu8Mw+EvwsLmY0cXxywADde3auKr39mMYzrWydbpWrXtwwE0N
 /S83kEyJdQgNuv8i7r+7qN323sOaXtClozVzqD6WyxRJJnNHHbSpaGAARrW2X81HZs6Gj31S8FR
 ouIdrMf6e0f5imPMG6MyCHAQkrURCqfvXx84e58Xp7flA=
X-Received: by 2002:a05:620a:4483:b0:93f:e52:40ec with SMTP id
 af79cd13be357-93f6f8a5381mr44832585a.81.1792693090988; 
 Thu, 22 Oct 2026 11:18:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-93f6fb8b753sm2373785a.14.2026.10.22.11.18.10
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Oct 2026 11:18:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-351788121cfso350283eec.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:18:10 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c5:20b0:35d:f7f4:bc1c with SMTP id
 5a478bee46e88-3674d84d341mr8700425eec.6.1792693089573; 
 Thu, 22 Oct 2026 11:18:09 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c5:20b0:35d:f7f4:bc1c with SMTP id
 5a478bee46e88-3674d84d341mr8700378eec.6.1792693088779; 
 Thu, 22 Oct 2026 11:18:08 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-368ee692656sm10656044eec.28.2026.10.22.11.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 11:18:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 11:18:03 -0700
Message-ID: <20261022181803.1291476-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2] package/linux-tools: fix PCI endpoint tests
 build with recent kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com,
 Florian Fainelli <florian.fainelli@broadcom.com>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, fontaine.fabrice@gmail.com,
 markus.mayer@broadcom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since Linux 6.14, the PCI endpoint tests have moved from tools/pci to
tools/testing/selftests/pci_endpoint. The existing build commands still
use the old location, causing the build to fail with newer kernels.

Detect the selftests directory and fall back to tools/pci for older
kernels. Set OUTPUT and INSTALL_PATH to build and install the selftests
under /usr/lib/kselftests/pci_endpoint, and pass the required libraries
explicitly.

Update the help text to document the binary names and installation
paths. Check that the selected source directory contains a Makefile
and report the minimum supported kernel version if it is missing.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/linux-tools/Config.in            |  5 +++--
 package/linux-tools/linux-tool-pci.mk.in | 16 ++++++++++++----
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index b9adc25ad51d..1e881c3ab4f0 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -61,8 +61,9 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
 	bool "pci"
 	select BR2_PACKAGE_LINUX_TOOLS
 	help
-	  pcitest is a tool for testing capabilities related to a
-	  PCI Endpoint (only works with specific Endpoints).
+	  Build the PCI endpoint tests (only work with specific Endpoints).
+	  Kernels before 6.14 provide pcitest in /usr/bin. Newer kernels
+	  provide pci_endpoint_test in /usr/lib/kselftests/pci_endpoint.
 
 	  These tools are available only from kernel version 4.20.
 
diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
index 17246f5d7ed2..52d7639bb102 100644
--- a/package/linux-tools/linux-tool-pci.mk.in
+++ b/package/linux-tools/linux-tool-pci.mk.in
@@ -6,22 +6,30 @@
 
 LINUX_TOOLS += pci
 
-PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
+# Linux 6.14 moved the PCI endpoint tests into Kselftests.
+PCI_SRCDIR = $(strip $(if $(wildcard $(LINUX_DIR)/tools/testing/selftests/pci_endpoint/Makefile),\
+	$(LINUX_DIR)/tools/testing/selftests/pci_endpoint,$(LINUX_DIR)/tools/pci))
+
+PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
+	OUTPUT=$(PCI_SRCDIR)/ \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	LDLIBS="-lrt -lm"
 
 define PCI_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if test ! -f $(PCI_SRCDIR)/Makefile ; then \
 		echo "Your kernel version is too old and does not have install section in the pci tools." ; \
 		echo "At least kernel 4.20 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/pci \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_SRCDIR) \
 		$(PCI_MAKE_OPTS)
 endef
 
 define PCI_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/pci \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_SRCDIR) \
 		$(PCI_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
+		INSTALL_PATH=$(TARGET_DIR)/usr/lib/kselftests/pci_endpoint \
 		install
 endef
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
