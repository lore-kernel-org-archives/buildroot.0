Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C123606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 17:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=haKLWsgk
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E527981175;
	Thu, 22 Oct 2026 17:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKtrIJnBbSTT; Thu, 22 Oct 2026 17:28:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D984D8119B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792690084;
	b=oUWeXJvCsu3J7OGD0Enecp15Pvb/vtqG7Dqi4HxXsDi3q4EhnGLu/Ad+dnV+doJXIMEG
	 vfOxZAsmF9411F/0iuezPaPVTRdtPSg1HT4ANLg3qpGFRrZC87D/FJ+kfa9FhPtUxJWBi
	 IrNBTXXseIlFGS3evqskmtEe/V0feFovWpkUfOHTYNpMzxuI5wfOl3HCYCaZsYXAUJ12t
	 JT5DABUJaMJfoZ/nGTk17tpkkt56+Su0xM9j2eiQU+/5w+MRl2KdGZ6tqvPwagqao0Jn/
	 6CmxsYd0pm+8ZKSgrv/i2D/LCC9JLnfweSS45fJGBsdChtjowlnJOtDwgBQXdz+zlUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792690084;
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
	bh=fpdvjI1HERY9EwsyZX2s058AgLnkHbzuk5RAxpVdRPI=;
	b=BMTX6M4oiUbP67yXIJRz3LZ7K8X/ryhFbtN8luFJBjnJnG9NerPKnVo8VtR8C5v7FIV0
	 LgVLnLa1qWCKE0tgLudSprLg1ehQJOPku/FT3wxtBS0rsGzLB7+P4t3dCHCVMj41i4sFU
	 9/WdOzmUYm1Jx+2oOmIXEPsZ1vZjHIi7LgDRO3zkBpPGgrpU7gntGD0MA23UQhvNE8vWh
	 RZwzw2692ImCJt3CUKwGgxPhBoFcXyYk9kwTnBZMaEEYdHLMSsDfQS4Nq7eCTp9Trl0Im
	 uA/ywclWjaeGrI4uN6or8dvB+Q6h9EvZ2VT4LPQinB6perHH5MPyQQM96aE/33PMKmA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792690083;
	bh=fpdvjI1HERY9EwsyZX2s058AgLnkHbzuk5RAxpVdRPI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=haKLWsgkUABvcDb/PdGeViZ0BtJR2JKhzeGfW76dM12HE02uQDryeXrt0a0fJZ2Ig
	 sBJgANX6ac7zZaL++TSV2dFHcv8CggoYMC+xcvxVjKLf3kYFx0XQ+b8gORpNCbVVll
	 kh/n0ftDl6LjYGVdDx8Y46RCjPgKX10UWE6sJCqexlaMz09T98LozQ2hnh/3uWIKBV
	 uoEvxDb+HGic5cSGPZ4GL/6iIfWEM6bjWxI17mtDYjAbsBEzcxw0I/OQCW2jkevlMA
	 8fedrR1vKYi3WGJ5oo8s3qMNPvKTxs8mSc/xdLMG96XJzskgXYWj3W0+s0s7xS5Mlo
	 AhBLLa9J+oAGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D984D8119B;
	Thu, 22 Oct 2026 17:28:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F01A32EE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D61478119B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qaXFcH3ZLMC7 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 17:28:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5B0A081175
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792690081;
 b=SZtK0542q4dmY2K7+903GoxX5BOSZiy7zZ/brbxuiDNscESEC0qcwfmN8VRMliPw5ceq
 +fDV3crkYnbabFK3dUVRQu+JtfeawkeEG6o/+a6LsCWEzoDnPtLnTMX+VmjPJIPwDAOAf
 nn9aMjXjf4iw1LLqNzom1b+i39rW2V8OPmjSkEWmJWunAw5SpBN7rp8Vay+aAbbrDH3zA
 C2dsWPrZNiNBPgAgTNMuGENHOrku96Qc2QLi8KB7HrJ6d5p/Srx6jIMl4aYPO1FtosLY7
 O+3BDsTzVJTd7eVWD4I9M39khTcxBTk+DmXEA4NNVoovG3mfFjWYZTIiLJMzKvjxHlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792690081;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=lidK5jjg+TtREcnRWW6juC1bCPSoEfHrlQtEfzVj1do=;
 b=RvfcIYWvJxKv+Z3FMMJ4l+N3Tv7QGc9D8tr6sAboW92AKsPyatV8tVu7MvBxE1mnTqp/
 BzY/996gmGw9/bjzWOuRJu6rhSRPBBImQJzXvjo2Ks+ryw2PvVmHLy7F9b6BLzAhvs+vC
 N9tSHX975E6b1jjAAJikd6fP30IwGktiPWYr5JoYgegNpa/HeM8NGKXkMCOWozwJNwsSv
 c4MxJp3xEBzs5uABtkDasc+5NaL2mLRsD5TSprw4CMZFzmXih+CmnJ+6FrXdg7w04hu6+
 YJuPkgrBlk003+DA250ymMMtnV1os6CxJoe4YOBi/78qq2LbaRHE8U6l/d1EOYyYTMg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=UvpXhXUP; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::f63"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f63; helo=mail-qv1-xf63.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-qv1-xf63.google.com (mail-qv1-xf63.google.com
 [IPv6:2607:f8b0:4864:20::f63])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B0A081175
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:27:59 +0000 (UTC)
Received: by mail-qv1-xf63.google.com with SMTP id
 6a1803df08f44-917997ab0d9so1266756d6.3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 10:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792690078; x=1793294878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=lidK5jjg+TtREcnRWW6juC1bCPSoEfHrlQtEfzVj1do=;
 b=bK8TsINfkcQ4Bd2uJIZLXIJFvkreawqu/E35uSYYa/+s6ZgsxYKt4sFzccMq9VDJxH
 BKHBHZ60pgJaJNFQcwsZnB36kG7eq+twMbp7+E63cwGlzdJCRxi1hGFlqOJSjvYbzOt+
 2H1TZhDmUENoUX7xh27miRhCLsOcVIAp9q7ngVVHoXoJWDjGGWLWSj1Kke4XjpG7nCgw
 ykSlb+zaYNClVtF0JUIdQdFzTXbOu8ulaj/hcLmlxVMBUALT/ZWNRwi54uzE2d+Xr5H3
 k14xVO6SEk3+Gxv4+I2hYGZc1EG0IYYlVKHYn+r6rZ9nkr3e9yV2MvbRC2auxcIalyvw
 5s3w==
X-Gm-Message-State: AFq9FYJ4ZcHMseWhVIg5zao6nt+3egyHsqhp2ngR8B5B13GNRkSPkv2z
 cs386RbwEXbyfcTE+cobZRloZEIENI+Be/hPylhNC4aoc+MHuOC8MkMsT76Gfj9WUObdsgOxr3m
 gxvoK/XKyyM12CTg2ceOCjQSyEkrbyAadu6x9VKHaEHOuGMb80YfLe1MsCmsOjeD/bpYC1hgJpe
 w4gpQKp0Eicu58HIrGChzdL7wdgYRt7l+dxBQUvXaDF+e1W+RV+tdONb+mxA3mEnCBMee3xRqvI
 qLqtyW2mR23xb0N8Q==
X-Gm-Gg: AYBFou3Fi3o5vdYt76HIZXeCKmAINGTxg/1mVmwV6sZ5pi30yHNjw6Ma36Pxn/XBfT4
 HmDFyPvJgVrOSDqbFAp8U6aIWp80IyXLLSVyccVEwZ6WNapBWOLm4NX3xaVLEvs038ZLlEfa9Z0
 sG7TH01Iihcs+KMojFmokt/3cdR51f2h9JkqUL0QQcadXj3r+w3PH0R1hWcrlFL5eHTkwgOEco4
 EJpePYxfN+QEJhkd4fL+JSovPdXR+M+DzK1YXKhg2ldA1S3bWjejaYhxbEOkjbZMoz6XTP1txp7
 bQ4OHA5uVtYtSzyth1KEHJjDmLW4i8rChES2Bee5QhDUuRs71d1DU/LM83tQY6MBkzxxV0A0gYp
 3BIqpOkIPgJrLiBOtXMkJ+dYc5Jb5r7PGNY8/TA18n7UapWKBoqXoB+vclSBpaBxM7e3EJzTs3s
 Ba5nY8MM441+hK4AFt5e35KawoBmfknPt67VVO+LEAYRo=
X-Received: by 2002:a05:620a:4490:b0:93e:746e:235c with SMTP id
 af79cd13be357-93f6f91c421mr23093085a.15.1792690078053; 
 Thu, 22 Oct 2026 10:27:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-93f6fb8b753sm459885a.14.2026.10.22.10.27.57
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Oct 2026 10:27:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2d02df2bf09so12665ad.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 10:27:57 -0700 (PDT)
X-Received: by 2002:a17:902:f603:b0:2e8:e17d:c8b8 with SMTP id
 d9443c01a7336-2ea7c340721mr873775ad.63.1792690076510; 
 Thu, 22 Oct 2026 10:27:56 -0700 (PDT)
X-Received: by 2002:a17:902:f603:b0:2e8:e17d:c8b8 with SMTP id
 d9443c01a7336-2ea7c340721mr873545ad.63.1792690075914; 
 Thu, 22 Oct 2026 10:27:55 -0700 (PDT)
Received: from fainelli-desktop ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ea7b3d15ffsm1274905ad.56.2026.10.22.10.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 10:27:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 10:27:52 -0700
Message-ID: <20261022172753.1256542-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH] package/linux-tools: fix PCI endpoint tests
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since Linux 6.14, the PCI endpoint tests have moved from tools/pci to
tools/testing/selftests/pci_endpoint. The existing build commands still
use the old location, causing the build to fail with newer kernels.

Detect the selftests directory and fall back to tools/pci for older
kernels. Set OUTPUT and INSTALL_PATH to build and install the selftests
under /usr/lib/kselftests/pci_endpoint, and pass the required libraries
explicitly.

Add a threads dependency and update the help text to document the
binary names and installation paths. Keep the minimum kernel version
check for the legacy tools and report missing sources explicitly.

Fixes: 63e457639abb ("package/linux-tools: add support for pcitest tool")
---
 package/linux-tools/Config.in            |  9 +++++++--
 package/linux-tools/linux-tool-pci.mk.in | 22 ++++++++++++++++++----
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index b9adc25ad51d..19d54cbbe707 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -59,13 +59,18 @@ config BR2_PACKAGE_LINUX_TOOLS_MM
 
 config BR2_PACKAGE_LINUX_TOOLS_PCI
 	bool "pci"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LINUX_TOOLS
 	help
-	  pcitest is a tool for testing capabilities related to a
-	  PCI Endpoint (only works with specific Endpoints).
+	  Build the PCI endpoint tests (only work with specific Endpoints).
+	  Kernels before 6.14 provide pcitest in /usr/bin. Newer kernels
+	  provide pci_endpoint_test in /usr/lib/kselftests/pci_endpoint.
 
 	  These tools are available only from kernel version 4.20.
 
+comment "pci needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 comment "perf needs a toolchain w/ dynamic library, threads"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
index 17246f5d7ed2..f9acf8f041d8 100644
--- a/package/linux-tools/linux-tool-pci.mk.in
+++ b/package/linux-tools/linux-tool-pci.mk.in
@@ -6,22 +6,36 @@
 
 LINUX_TOOLS += pci
 
-PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
+# Linux 6.14 moved the PCI endpoint tests into Kselftests.
+PCI_SRCDIR = $(strip $(if $(wildcard $(LINUX_DIR)/tools/testing/selftests/pci_endpoint/Makefile),\
+	$(LINUX_DIR)/tools/testing/selftests/pci_endpoint,$(LINUX_DIR)/tools/pci))
+
+PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
+	OUTPUT=$(PCI_SRCDIR)/ \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	LDLIBS="-lrt -lpthread -lm"
 
 define PCI_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if test ! -f $(PCI_SRCDIR)/Makefile ; then \
+		echo "Your kernel sources do not contain the PCI endpoint tests." ; \
+		echo "Expected tools/pci or tools/testing/selftests/pci_endpoint." ; \
+		exit 1 ; \
+	fi
+	$(Q)if test "$(PCI_SRCDIR)" = "$(LINUX_DIR)/tools/pci" && \
+		! grep install $(PCI_SRCDIR)/Makefile >/dev/null 2>&1 ; then \
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
