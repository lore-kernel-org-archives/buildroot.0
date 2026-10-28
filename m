Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54AC606A324
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TJdC0tfM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gtn+Ukw7
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A99E409AC;
	Wed, 28 Oct 2026 21:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LMtRKTWdl1R; Wed, 28 Oct 2026 21:37:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6E60E409A7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223459;
	b=Y2I/zt/Amj4RwP+mXJu+SwLwDSZ4nzDWVAENjhrsW0C4+EBkEAT9DTdqUzLtOeaEpLYu
	 nKArbwbeHiIlwVi29I8pavkQId1GQa2LOwhksMXlZrlR3lmCp1ccZ0KMh1+fRtDAlxN6n
	 ofT+1hJ7tZNmjKP7KOMqYN5Imxr234QCFQPlE7jRJVPeKMHuRl1BTOJBY1F5wi+/n3pfx
	 B3u3oZPjtWvg6/k7zlJfgwf9RT59ku3vGAcPL17iVSZsbwBnwjm8oCy6Su7ppwmCfTG9K
	 DuAysvsSLn+NuAsIj+OPNe1xIM5gRWQ+uLwbhw03ZExKPVc0U5+laG2FA/JgmaFoUlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223459;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=K4Ax+jQOQxXTeuCgY+nHMdtW+TsMMdvhYSrByN/Cs+Q=;
	b=Wjy7itUOQHxgyay9QbAbkQQFm40/wE1OQpQ585Kbpr1lLEX6oRJKZiNLtbliJN23ESV+
	 0pms+KeY5T6mI5AGHKKj01KRlcAJ8vki2gWuNwmL4RpMIGRMrlfZlZZREqECWus6PSs9v
	 USth2joymU50SHEtcqzZb4EugOregd72OXng2kAIbDEkCUWFXVJfefumaHxl1cQJFzcp1
	 9eC+dbYV+8CBI3ino/BiVA5+5Vg0pq+2rJ2iqB8XubLHarBoo/t74OebM8DPxCv4Cwe6y
	 26uR6cg7riWraGM6c6B8uW8N8VGCjx8e3JqhmG8ZGNU/Hgy8unnom+bfIqAo5PE/3TQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gtn+Ukw7;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223459;
	bh=K4Ax+jQOQxXTeuCgY+nHMdtW+TsMMdvhYSrByN/Cs+Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TJdC0tfMv9MPkZF2a0XoRzhvK0PCU3XDQzFDOJ2ua50tOXm/k4cf9zrPX+iVia1em
	 38bRPCaGMLRasJqcgr4NeewVHHznln4Xp7pBGTxBtDZr0gtbOHPLVxFMQQKBpfj2WY
	 cpTYsQyd96MghYNaLVg1rWKGCT+4Ugh8acNDyjFTxkGtxgitVvU3m7iab1ffbkKVL7
	 ojYsAoozShgRfL9t76TjBQPaONhvHeVcWWUz9slBUFSkiqMEYcex5O22mDLj3RgZXS
	 paEl9IIoNx2WWFemAdVIIz0qDrKV6EH1gw7f/dU1KHpJEUp2tqWExsfX0kSxK7xL3t
	 IY3ceFBNTEfrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E60E409A7;
	Wed, 28 Oct 2026 21:37:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D0992A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EB90409A7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_y-L2sqOQ73 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:37:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C1E6409A6
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::b136"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223456;
 b=bsu46jZuVeFu0UA+X5v/T1dgkq9d/1OdHHpgYkc3TGBwPEVKXk8HiZP6oBnchvtLlx2j
 shv7yw7EHg6wb3UPsuAO+HtP1I3A3Zw4wS9V0gHyAazdqt073/G+anbaRZEbMgqCCZHZC
 Mxx5A9kib58FaYqNotM/xjYVNezkBKUj/JJl1iUQNXsZL43Ohfgolh/zfSftOIsMfYBNR
 l2F4HjJL2HbzFsltUr9VwmEpPbVZKdmDn9iHPGRfksdY0BSKk/XDbNN/I/FO5rMMrh5+W
 7faHwq2iyNtFjkNBbRl0HfrgNUhC6xuH5MDLavJjVgkIHkSv8f3goyOdxiOsZyRj9JQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223456;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=AVLWuj1VrW5vxOs6SrZYARRQqyZZI7Avk1gZt+TMdnM=;
 b=KnUkhqW8ClnuJ57PmJ+mNfFHecL7Asa3H84IbulIS/EYPwZeI+Y8XR5zPex1qPQ2YVvT
 Bjrc0NJvXbBAoRraEkLsMHVfUfO/f72MXEBMxMYYYdFBkS+r2892taVD9+pX4UYsAqXSn
 fEw4nKsqQq/+enxY0rv1mP4loS6Y02c4lIbuxKSXj0IJK50OBA994Jj2L6oOjdL5vik7g
 Undx9dNAKZ0N9NhOli9MFom3zDvtjYu/Sun7GPyDHruaUhY9y0Zqu7VzIAdMIRF+vRluB
 Ikr4Snv2lLBAWh8ZmZnURTcE7mSpT0/V9C8MZeWBKJ55xz0cZ+6z75Q4PxQKAThE6Pg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Gtn+Ukw7; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::b136"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b136; helo=mail-yx1-xb136.google.com;
 envelope-from=ckhardin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Gtn+Ukw7
Received: from mail-yx1-xb136.google.com (mail-yx1-xb136.google.com
 [IPv6:2607:f8b0:4864:20::b136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C1E6409A6
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:37:35 +0000 (UTC)
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-67990a45e02so1794977d50.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793223454; x=1793828254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AVLWuj1VrW5vxOs6SrZYARRQqyZZI7Avk1gZt+TMdnM=;
 b=Gtn+Ukw7XF3x2qywsOVhK7hSCBypV+fylxRbwLyK7JhHAEDJ2lFmLtsuSzauMqejB4
 dDlQu9kvQCITXYE/hwY1LaeV37b7NO59ZUFpaV7ihcxafMN+V9DNNLOLPQu18vVCYr3b
 EfT8MrvE9ur0gL7Kn5NwcKV/A0oIufm48q3upEo6jTWslrJ8VnoWQR5ss6fsE7AYBKdf
 evhHkjlMnEHkKWas0rccOyAZygS3eBaWabglLHedBgBZs4OEOIUHO9jcCSvidajakJ6S
 sbJ+f0bErV9GIOP5o9S9iXQEHLxuZvAyPrMkMcDSErYxh0JnQBcU8nWM53cznoLTlffi
 Mfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223454; x=1793828254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AVLWuj1VrW5vxOs6SrZYARRQqyZZI7Avk1gZt+TMdnM=;
 b=i8dAyvbd+jaR+eosiJChz6YYIWl05vV/C6UQlnxs9TFDHuwDylEGNcj2lK1cPCoTrx
 8gb5iPySX0ip2rAS0G4tX2LIw4BwehkD7grI1fSi1NmUtmdpWj5Jm6Mkbqa6WJU8Yxfw
 f206Vjd2gzbQGrfZHut1B4sDB8HXJmhTztbU8sE90/K5Tc5+Z3W16KDhDS+bfGZGAp+V
 ojr/HvCPHpWcfes2tvbpcKZGMH9T8IyjzasV3Ovgy6YSNtBnVCj02l8ABzLas7a03sIp
 cHcMqCSv+jVbkJp3NKA30nsqogzvcKAvseedNTDQ3iYLABHJZLrhjCSokh6btxYwbPh5
 Pt5Q==
X-Gm-Message-State: AFq9FYJAw/ZjS+hcoBGY3VPbjG5XVZiL0YkYNeuQXl4g34Z4pn/2Ym+T
 WrXTfBSghCpJ0cTpVfpaIR31PuK+9dvBGtVP8L1oPP+7TUZYIBmJj/tn8xLl2g==
X-Gm-Gg: AYBFou16zBim0apbX1RhcCaQKnDhdU6Qlo2hi7gxG9NPdONLgXfwqV07zgCMGDUNHp/
 QIkvzq3N6P38RpHI49whEc5DtoFhVTUQ3ViaXtFuulslojQXnmszmeb6aozCoFoMcr1IbnoibJA
 LEwozCifSa/thQV36HIqBozBhvjKdpxw/Y+PSfVoLwb0iJ2Esd/dzQ6MNRtVHqGNGsy4/2KPn9B
 HzgrrYitf1oQwcJVuj/99q/yxEm29v9vlE5kE7kjGwSR+ZqzQCnBjyZ2eG6dsq7alIpetUYpGn3
 A5Y8BpnnXZUwMLLEBrmFYNcG5xbrT6+B6aw9fk/a3KF+sVRE8D1tdsjUJnpMKSNm6b5gIWYSDkT
 02C/gHbhmaWcFxAIA7Zb7KGZCk8mCrXFusI1QARpTi9DlfjkQyb3Yx5HmGVKekxUme7WVAnVD+t
 l+151owYDtGcLxoXtGG3WjiVR895CVdPAQ+MYID3EeQ24/ESipstGpuAgRxKe7GlDHj/JpImxju
 4v+cRjpTPhdliiaN+THcPUXQby50s1l/+6BpchTtAGKMQuxRHXiACkii86rUnwDdaSFzv3KabrJ
 VvD+a31i6ZBFAXmTrzyY/ts1lOv4F7J+CXhpVwyo9V8Ru6lPCpJlKUs2dn7zt8AY5KvaXMzAQyV
 nPQGvXYwz
X-Received: by 2002:a05:690e:2391:b0:679:bec4:ad7 with SMTP id
 956f58d0204a3-67a7bd54ff8mr2257762d50.55.1793223454535; 
 Wed, 28 Oct 2026 14:37:34 -0700 (PDT)
Received: from abyss.attlocal.net ([2600:1700:65a0:14f0:352b:6d58:6839:1227])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-67a7a0c7da1sm2455021d50.12.2026.10.28.14.37.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Oct 2026 14:37:34 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Charles Hardin <ckhardin@gmail.com>
Date: Wed, 28 Oct 2026 14:37:30 -0700
Message-ID: <20261028213730.3132-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] boot/optee-os: add suppot to build with the
 ftpm application
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ftpm is part of the trusted execution environment and so add in
build steps and configuration to enable the additional image. This
following the TPM 2.0 microsoft extensions and compatibility. So,
patching this into the optee configuration since it needs the sdk
and other tools to directly build the ftpm application.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 boot/optee-os/Config.in     | 29 ++++++++++++++++++
 boot/optee-os/optee-os.hash |  2 ++
 boot/optee-os/optee-os.mk   | 59 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index af08375b9a..566b56064d 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -131,6 +131,35 @@ config BR2_TARGET_OPTEE_OS_SDK
 	  kit for building OP-TEE trusted application images. It is
 	  installed in the staging directory /lib/optee.
 
+config BR2_TARGET_OPTEE_OS_FTPM
+	bool "Build fTPM (Firmware TPM 2.0) TA"
+	select BR2_TARGET_OPTEE_OS_SDK
+	help
+	  Build the Microsoft TPM 2.0 Reference Implementation (fTPM)
+	  as an OP-TEE Trusted Application.
+
+	  UUID: bc50d971-d4c9-42c4-82cb-343fb7f37896
+
+if BR2_TARGET_OPTEE_OS_FTPM
+
+config BR2_TARGET_OPTEE_OS_FTPM_EARLY_TA
+	bool "Embed fTPM as Early TA in OP-TEE core"
+	default y
+	help
+	  Embeds the fTPM TA directly into the OP-TEE OS binary (tee.bin)
+	  as an early TA. Required for pre-userspace TPM operations such
+	  as U-Boot verified boot and Linux IMA before tee-supplicant runs.
+
+config BR2_TARGET_OPTEE_OS_FTPM_VERSION
+	string "optee_ftpm version"
+	default "4.10.0"
+
+config BR2_TARGET_OPTEE_OS_FTPM_MS_REF_VERSION
+	string "ms-tpm-20-ref commit"
+	default "98b60a44aba79b15fcce1c0d1e46cf5918400f6a"
+
+endif
+
 config BR2_TARGET_OPTEE_OS_SERVICES
 	bool "Build service TAs and libs"
 	default y
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 3db5c85cf1..7788955380 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,3 +1,5 @@
 # Locally computed
 sha256  9400e16c45bfa45f15585b2c933b86c449e7de05def0ecaaa62a4f38973a3a45  optee-os-4.9.0.tar.gz
+sha256  907fd49dc9db97fc16c8e4309e8e17109a044711d053135f21690dadaf50908c  optee_ftpm-4.10.0.tar.gz
+sha256  1c7136f2e6270b10da188163369f2ed9fae68e404c0c8169b317b5eba667287c  ms-tpm-20-ref-98b60a44aba79b15fcce1c0d1e46cf5918400f6a.tar.gz
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 38faf8bff7..ccc63f6650 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -141,15 +141,72 @@ define OPTEE_OS_INSTALL_STAGING_CMDS
 endef
 endif # BR2_TARGET_OPTEE_OS_SDK
 
+ifeq ($(BR2_TARGET_OPTEE_OS_FTPM),y)
+OPTEE_OS_FTPM_UUID = bc50d971-d4c9-42c4-82cb-343fb7f37896
+OPTEE_OS_FTPM_VERSION = $(call qstrip,$(BR2_TARGET_OPTEE_OS_FTPM_VERSION))
+OPTEE_OS_FTPM_MS_REF_VERSION = $(call qstrip,$(BR2_TARGET_OPTEE_OS_FTPM_MS_REF_VERSION))
+
+OPTEE_OS_FTPM_SITE = $(call github,OP-TEE,optee_ftpm,$(OPTEE_OS_FTPM_VERSION))
+OPTEE_OS_FTPM_SOURCE = optee_ftpm-$(OPTEE_OS_FTPM_VERSION).tar.gz
+OPTEE_OS_EXTRA_DOWNLOADS += $(OPTEE_OS_FTPM_SITE)/$(OPTEE_OS_FTPM_SOURCE)
+
+OPTEE_OS_MS_REF_SITE = $(call github,microsoft,ms-tpm-20-ref,$(OPTEE_OS_FTPM_MS_REF_VERSION))
+OPTEE_OS_MS_REF_SOURCE = ms-tpm-20-ref-$(OPTEE_OS_FTPM_MS_REF_VERSION).tar.gz
+OPTEE_OS_EXTRA_DOWNLOADS += $(OPTEE_OS_MS_REF_SITE)/$(OPTEE_OS_MS_REF_SOURCE)
+
+OPTEE_OS_FTPM_DIR = $(@D)/optee_ftpm
+OPTEE_OS_MS_REF_DIR = $(@D)/ms-tpm-20-ref
+OPTEE_OS_FTPM_OUT = $(OPTEE_OS_FTPM_DIR)/out
+
+define OPTEE_OS_EXTRACT_FTPM
+	mkdir -p $(OPTEE_OS_FTPM_DIR)
+	$(call suitable-extractor,$(OPTEE_OS_DL_DIR)/$(OPTEE_OS_FTPM_SOURCE)) $(OPTEE_OS_DL_DIR)/$(OPTEE_OS_FTPM_SOURCE) \
+	| $(TAR) --strip-components=1 -C $(OPTEE_OS_FTPM_DIR) $(TAR_OPTIONS) -
+	mkdir -p $(OPTEE_OS_MS_REF_DIR)
+	$(call suitable-extractor,$(OPTEE_OS_DL_DIR)/$(OPTEE_OS_MS_REF_SOURCE)) $(OPTEE_OS_DL_DIR)/$(OPTEE_OS_MS_REF_SOURCE) \
+	| $(TAR) --strip-components=1 -C $(OPTEE_OS_MS_REF_DIR) $(TAR_OPTIONS) -
+endef
+OPTEE_OS_POST_EXTRACT_HOOKS += OPTEE_OS_EXTRACT_FTPM
+
+OPTEE_OS_FTPM_OPTS = \
+	TA_DEV_KIT_DIR=$(@D)/$(OPTEE_OS_LOCAL_SDK) \
+	CFG_MS_TPM_20_REF=$(OPTEE_OS_MS_REF_DIR) \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	O=$(OPTEE_OS_FTPM_OUT)
+
+ifeq ($(BR2_aarch64),y)
+OPTEE_OS_FTPM_OPTS += CFG_ARM64_ta_arm64=y
+else
+OPTEE_OS_FTPM_OPTS += CFG_ARM32_ta_arm32=y
+endif
+
+ifeq ($(BR2_TARGET_OPTEE_OS_FTPM_EARLY_TA),y)
+OPTEE_OS_MAKE_OPTS += CFG_EARLY_TA=y EARLY_TA_PATHS=$(OPTEE_OS_FTPM_OUT)/$(OPTEE_OS_FTPM_UUID).stripped.elf
+endif
+
+define OPTEE_OS_BUILD_FTPM
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(OPTEE_OS_FTPM_DIR) $(OPTEE_OS_FTPM_OPTS)
+endef
+define OPTEE_OS_INSTALL_IMAGES_FTPM
+	mkdir -p $(BINARIES_DIR)/optee
+	cp -dpf $(OPTEE_OS_FTPM_OUT)/$(OPTEE_OS_FTPM_UUID).ta \
+		$(BINARIES_DIR)/optee/
+	cp -dpf $(OPTEE_OS_FTPM_OUT)/$(OPTEE_OS_FTPM_UUID).stripped.elf \
+		$(BINARIES_DIR)/optee/
+endef
+endif # BR2_TARGET_OPTEE_OS_FTPM
+
 define OPTEE_OS_BUILD_CMDS
 	$(if $(OPTEE_OS_CUSTOM_DTS_PATH),
 		cp -f $(OPTEE_OS_CUSTOM_DTS_PATH) $(@D)/core/arch/arm/dts/
 	)
-	$(OPTEE_OS_BUILD_CORE)
 	$(OPTEE_OS_BUILD_SDK)
+	$(OPTEE_OS_BUILD_FTPM)
+	$(OPTEE_OS_BUILD_CORE)
 endef
 
 define OPTEE_OS_INSTALL_IMAGES_CMDS
+	$(OPTEE_OS_INSTALL_IMAGES_FTPM)
 	$(OPTEE_OS_INSTALL_IMAGES_CORE)
 	$(OPTEE_OS_INSTALL_IMAGES_SERVICES)
 endef
-- 
2.50.1 (Apple Git-155)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
