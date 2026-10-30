Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC9F606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hNtqwWlt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWlYx4ak
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 179A660AAA;
	Fri, 30 Oct 2026 15:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4U0v8rvfZWdp; Fri, 30 Oct 2026 15:24:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C020360AB4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373896;
	b=VNExUgFiVUKu/c3KehNUuUPiFocaoseLykgIbSAHR/HDWctwkzur5ok6l4SVy9ashZGS
	 +Xavb0j45jTs7K0NeOMIyJKoiTHwN8XZCBe08FJNtBoWYX9NOK02AI91sCTTa8DHJPOEb
	 a6CA6qDeAArVsKzt+/g92GbHkrHcHMgCPWPQXYh/bzSEF219PcTJ9T5twOMBFIwdM4j64
	 DrT322wSHNX4X9Cl2YqA+tTtez0oySVEgmLojeU6Sq5P2TGWe/xz2o+J3j2Wby/zJHoN8
	 jt2qzzxRwEotcM0xn34klglSuCQuK0HLQLogmb8f6TbJCfDsIfbuUQ3XCiv31V2sdEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373896;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=jKJOQb18X25Jz3OqXOAgA/vgSOcLujLAh1vmRQGs9xY=;
	b=LyIdOLkJWSq1V4yZ/upOKg2wy0Ujlx6qrgUd8CAlbKMv+8xEDYI5PrIpAnpjJ4osBDm0
	 FwWbbw+TtZ4ABPrq2BjlZ8OCVKIJblHq7t9g83yUFHZmJBYS57omH9FBa+8akuekdMfJs
	 NqNde9voDB4my7fD0vWP0k3fRiopsnfaJFMTq4q79SbMQH/v0SBPiapgZRZS1+ZyH7Imk
	 Hg197kfSmo3w69y2n8miIlQiwqsWz8HL4NXfiaRpI+k1jRsSN7aOgCD8rDmUViqV5nhk9
	 xUwKxdWlcCLzjD1VYpjlSf0cUivTbi/H9pgglkNow8XV/fXkiK0L8DFQlZN/M6h44zw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373896;
	bh=jKJOQb18X25Jz3OqXOAgA/vgSOcLujLAh1vmRQGs9xY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hNtqwWltigGIOaGlqR5JHNa7F6p2X1IU4Ir+uRFzgeM6E0ndJKB+0vLLPnIEDOqMf
	 3NXh8q3wFOEB8ZPNKn58yrrhKnpE7w533/vd+H1H3UojK3Bb1Bbje2u3zKUHKwvucR
	 nmDf2pz1vyddEAPsClp3ycKaenq6y4wwIeRa2Jg+naC5PAzvb2dX0QOUsYokPBhkDT
	 JQ0TydrthEiBHnTRfHEUAkmCQqDMCuGTrGTgMI4DlEv0pG3Rw8Ylo4DMCxn6HRXvrK
	 VQoHwAn4kRMKZhCQOmV6AgQNGwIimJABsGdHBzUOapjMGMpzh35pGkAV/sc6YebeCJ
	 w72PtP0BS1rtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C020360AB4;
	Fri, 30 Oct 2026 15:24:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D77EE362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCE4D40B3A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09zCkvMIB6cM for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:24:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0705140B34
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373889;
 b=YuBcCRwJbPEKUDrAZYKVFvWJh9FTNC4ua9NRIrw8RfOAnjqShXVjE1N1Uk84nHv45/Ge
 sOzdIWEs2b88+3cGxXZ5edEIKi/rTu7DmksHFs7vsz4H368vHIoa00ptTNuUPpx0f+yH8
 qCEDkGY4H7F3hl/zLTSKrvKi3gU/Ib0nvhUI4yrKslgh7SGqMDEcIK0sKEZjRrKf2o1A6
 enUo05hzYYq+e2F8Qe4rzYtzCPp5yF3x6v5Ya4LytxZ+jP0DRtnaaLAAFNOVn96ADFkty
 i/w2v1BlHVlPgRsJShAnY+LOOtPihAeKG/ENqU4uWylqZFbnB/erbd+uJklLIoAyIaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373889;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3ffIfWT40g/d4zbr4gmubF/do8sjmwFeAM+M5jT8rCk=;
 b=GnCmeIPCA0Ope/+hX7XVI0wZ9zi7Z+l46ByGMeMb3RPDNSckD3YnRcgh4WpxmoIV/8X4
 gGUnk+87knxa0jk20iei+X4tzXZ3AxARbaie8trpLwALe8WC/kTBY2COxn/E4WgDiZ7cJ
 O5vxmXTZQk6jd4Np/aVGRsY0P/tN/KKkLQEtXmGuhOqMVapD9jn/pjMkAAP/9SOsEv6qW
 1sJwoKSG24gcXhXbtshhXgTkY7prXPLx73JApkQXGftkJ7f+7N8TJYirIIv8TqMHv9z5+
 7oGPsgSuR5UNNuc4EQ1J1R0Gy4HYZsJnRRKeXIr8qX2EXNLdxxxCRg2lXnNxKFwnqFQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=aWlYx4ak; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=aWlYx4ak
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0705140B34
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so8366395e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373885; x=1793978685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3ffIfWT40g/d4zbr4gmubF/do8sjmwFeAM+M5jT8rCk=;
 b=aWlYx4akDQCf/FnqDA2Tw4L0kCrcfmdBmkw4JdSQtl29YAGYbdHPzNmIfh231RN1qv
 upD1kwhEshwhZOTSlwFwQP+hmqTt71DzdVsXzF1o32X0SV0IEPb0UVj2n3MijWozDOpV
 Eo9CBQhHfG4BASkDC6H0dBz+aL7ZsbM0oXyLUPeX8NuzcHZUPKRUBTgsWRRckfm8nR6W
 63aFKaHdpHpvxssCd0LMXb9c5a3mD2R/VX5jyD3d7FFwMaJisP+cYIsfsbWlJdd1Rowu
 T2lge0UJoVd64N+MofmrsCoXI76Fu4wNCpaBRuZfc0L+D7PB3BnyUuvcdjW+mxfjs/rk
 Sn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373885; x=1793978685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3ffIfWT40g/d4zbr4gmubF/do8sjmwFeAM+M5jT8rCk=;
 b=FQMqqdsZ05HGA9fLxV7wleV45T3OlWqgHJ2Tyr3k62rDoEIrhnjWBCFv78d/7McNiy
 oUig3mbsEL/dZMtjE2XWnSOfne38o645Ff5ELqGVAheQn4M4n/jKFcAQMN7uoBqFIrmG
 lF/D/7j+CAmtrSlh2MXLXI3/zBCKyWA1SecdX0gvzYDzjlxWyexBys8c87PRV0mvYPxQ
 2hDUNzCGWwIeNbIpf6fLFP41p615tVo6br7fgAget2x2YEgWCFzg6A4We795QJSFEyoB
 n9I2Qk2C3Ag/L0M5AEOn5QxiPLt5do8/xMOS9uj8Sd58YfChT50GsGtFOPbYqRUs4JgY
 oSgA==
X-Gm-Message-State: AFq9FYIfvyom1E56PdLfghe2ch5Uk9gqeN894OyMiwS58DFcl6e3HTIr
 VcnQ3yZKpIIisJU4U2E77eaqbloPYrQWmienPtjxlMJUU6d1mtrvTrb4AodrVQ==
X-Gm-Gg: AYBFou10DSfAdYrVGpsDw8OxBUcrd8dMehX0v8Qms0caZSoHF3WqcouwwzAbO6H3hce
 Dczr5MMTW5qXctVzdko30TGX+o1JA10bZ6OobWwfTpx4NwZSFVumI0XZaqsPLmWSHM4+FfDTl0E
 CsyjRu8LPuU8y0bUmIhrw1qbwnc/A0131v4lGe8t/dLakdvHSv3fwlfFpABx52EpCpmUTc9yX50
 EPsEBNnbdJMWASStPKgRjIBbxeHIedzzKECkFkGMgtFcrGpyYsOV0NvCW65mTUjPCd9b+3M8Zwg
 GBgm17Gdy3Ow54ZxKjlu11AjcUj/LHiTVpFN5c2qSwZwywhwpLLuxW9aGDrD8GmhhBPLPyZoHZn
 PYyHbK8dArcbkz3C00vA240wcgNg0LYlpAR4nAnrm6CE0m0Bi7meakDO7as2l+kjs4lAdmD9cKr
 8FNIv/KdgEej0k8wfOZMbh1bLYGmTGKo6qyf1T7ebLZkPvHkAL+Rsk6fR5SxzGWD7j2FHZnnNey
 o59qBmiaakRqzI90C+hPHDxGX5LaRuddirZSeOYDB461ME+0qo0Lj4GZIz01CRGjpmO9b6xXMUH
 Nti2X79CuNeY7m+qW+tfJltJoLVBHQgcti3J9isPV91VqalnxueZ87c9CqFlPvz2EIwJYKj7F+w
 =
X-Received: by 2002:a05:600c:818e:b0:49f:fd40:80fa with SMTP id
 5b1f17b1804b1-4ac1932aa2amr60310375e9.34.1793373884620; 
 Fri, 30 Oct 2026 08:24:44 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8c0b6sm3540180f8f.41.2026.10.30.08.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:24:43 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 16:24:31 +0100
Message-Id: <20261030152434.3738285-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/9] package/falcosecurity-libs: convert to a
 virtual package
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 0.11.0, the falcosecurity-libs userspace libraries only
support 64-bit architectures, as they get the system call numbers from
tables which only exist for them.

In order to provide a different version for 32-bit architectures,
convert falcosecurity-libs into a virtual package. For now, it is only
provided by falcosecurity-libs-latest, which is the former
falcosecurity-libs package, unchanged.

The license, the driver name, the kernel module make options and the
Linux kernel configuration fixups, which will be shared by the
providers, stay in the virtual package.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/falcosecurity-libs/Config.in          | 16 +++--
 ...-pass-ARCH-and-CROSS_COMPILE-to-the-.patch |  0
 ...ver-replace-removed-task_euid-helper.patch |  0
 .../falcosecurity-libs-latest/Config.in       |  9 +++
 .../falcosecurity-libs-latest.hash}           |  0
 .../falcosecurity-libs-latest.mk              | 67 +++++++++++++++++++
 .../falcosecurity-libs/falcosecurity-libs.mk  | 59 ++--------------
 7 files changed, 91 insertions(+), 60 deletions(-)
 rename package/falcosecurity-libs/{ => falcosecurity-libs-latest}/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch (100%)
 rename package/falcosecurity-libs/{ => falcosecurity-libs-latest}/0002-fix-driver-replace-removed-task_euid-helper.patch (100%)
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs-latest/Config.in
 rename package/falcosecurity-libs/{falcosecurity-libs.hash => falcosecurity-libs-latest/falcosecurity-libs-latest.hash} (100%)
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.mk

diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index c73b92d78f..495dd2b8ca 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -19,14 +19,18 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
 	depends on !BR2_STATIC_LIBS # re2, tbb
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # tbb
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # tbb
-	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_RE2
-	select BR2_PACKAGE_TBB
-	select BR2_PACKAGE_UTHASH
-	select BR2_PACKAGE_VALIJSON
-	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_FALCOSECURITY_LIBS_LATEST
 	help
 	  falcosecurity/libs provides libsinsp, libscap, the kernel
 	  module driver and the eBPF driver sources.
 
 	  https://github.com/falcosecurity/libs
+
+config BR2_PACKAGE_HAS_FALCOSECURITY_LIBS
+	bool
+
+config BR2_PACKAGE_PROVIDES_FALCOSECURITY_LIBS
+	string
+	default "falcosecurity-libs-latest"
+
+source "package/falcosecurity-libs/falcosecurity-libs-latest/Config.in"
diff --git a/package/falcosecurity-libs/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch b/package/falcosecurity-libs/falcosecurity-libs-latest/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
similarity index 100%
rename from package/falcosecurity-libs/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
rename to package/falcosecurity-libs/falcosecurity-libs-latest/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
diff --git a/package/falcosecurity-libs/0002-fix-driver-replace-removed-task_euid-helper.patch b/package/falcosecurity-libs/falcosecurity-libs-latest/0002-fix-driver-replace-removed-task_euid-helper.patch
similarity index 100%
rename from package/falcosecurity-libs/0002-fix-driver-replace-removed-task_euid-helper.patch
rename to package/falcosecurity-libs/falcosecurity-libs-latest/0002-fix-driver-replace-removed-task_euid-helper.patch
diff --git a/package/falcosecurity-libs/falcosecurity-libs-latest/Config.in b/package/falcosecurity-libs/falcosecurity-libs-latest/Config.in
new file mode 100644
index 0000000000..2115e9a928
--- /dev/null
+++ b/package/falcosecurity-libs/falcosecurity-libs-latest/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FALCOSECURITY_LIBS_LATEST
+	bool
+	select BR2_PACKAGE_HAS_FALCOSECURITY_LIBS
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_RE2
+	select BR2_PACKAGE_TBB
+	select BR2_PACKAGE_UTHASH
+	select BR2_PACKAGE_VALIJSON
+	select BR2_PACKAGE_ZLIB
diff --git a/package/falcosecurity-libs/falcosecurity-libs.hash b/package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.hash
similarity index 100%
rename from package/falcosecurity-libs/falcosecurity-libs.hash
rename to package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.hash
diff --git a/package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.mk b/package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.mk
new file mode 100644
index 0000000000..6e078e080a
--- /dev/null
+++ b/package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# falcosecurity-libs-latest
+#
+################################################################################
+
+FALCOSECURITY_LIBS_LATEST_VERSION = 0.21.0
+FALCOSECURITY_LIBS_LATEST_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_LATEST_VERSION))
+FALCOSECURITY_LIBS_LATEST_SOURCE = falcosecurity-libs-$(FALCOSECURITY_LIBS_LATEST_VERSION).tar.gz
+FALCOSECURITY_LIBS_LATEST_DL_SUBDIR = falcosecurity-libs
+FALCOSECURITY_LIBS_LATEST_LICENSE = $(FALCOSECURITY_LIBS_LICENSE)
+FALCOSECURITY_LIBS_LATEST_LICENSE_FILES = $(FALCOSECURITY_LIBS_LICENSE_FILES)
+FALCOSECURITY_LIBS_LATEST_PROVIDES = falcosecurity-libs
+FALCOSECURITY_LIBS_LATEST_INSTALL_STAGING = YES
+FALCOSECURITY_LIBS_LATEST_SUPPORTS_IN_SOURCE_BUILD = NO
+
+FALCOSECURITY_LIBS_LATEST_DEPENDENCIES = \
+	jsoncpp \
+	re2 \
+	tbb \
+	uthash \
+	valijson \
+	zlib
+
+# The version can't be computed from git, as we build from a tarball.
+FALCOSECURITY_LIBS_LATEST_CONF_OPTS = \
+	-DUSE_BUNDLED_DEPS=OFF \
+	-DFALCOSECURITY_LIBS_VERSION=$(FALCOSECURITY_LIBS_LATEST_VERSION) \
+	-DCREATE_TEST_TARGETS=OFF \
+	-DBUILD_LIBSCAP_EXAMPLES=OFF \
+	-DBUILD_LIBSINSP_EXAMPLES=OFF
+
+# Only the kernel module driver is built. To keep the build small, the
+# eBPF engine, which needs elfutils, and the gVisor engine, only
+# available on x86_64, which needs protobuf, are disabled: they can be
+# enabled in a following patch. The modern eBPF probe would also need
+# clang and bpftool to be built.
+FALCOSECURITY_LIBS_LATEST_CONF_OPTS += \
+	-DENABLE_ENGINE_BPF=OFF \
+	-DBUILD_LIBSCAP_MODERN_BPF=OFF \
+	-DBUILD_LIBSCAP_GVISOR=OFF
+
+# The driver CMakeLists.txt only prepares the kernel module sources and
+# Makefile in the driver/src build directory, which are then built with
+# the kernel-module infrastructure.
+FALCOSECURITY_LIBS_LATEST_CONF_OPTS += \
+	-DUSE_BUNDLED_DRIVER=ON \
+	-DBUILD_DRIVER=OFF \
+	-DENABLE_DKMS=OFF \
+	-DDRIVER_VERSION=$(FALCOSECURITY_LIBS_LATEST_VERSION) \
+	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME)
+
+# The pkg-config files define the prefix relative to their location and
+# contain the absolute paths of the dependencies in staging, which
+# pkg-config would all prefix with the sysroot again.
+define FALCOSECURITY_LIBS_LATEST_FIX_PKGCONFIG
+	$(SED) 's%^prefix=.*%prefix=/usr%;s%$(STAGING_DIR)%%g' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libscap.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libsinsp.pc
+endef
+FALCOSECURITY_LIBS_LATEST_POST_INSTALL_STAGING_HOOKS += FALCOSECURITY_LIBS_LATEST_FIX_PKGCONFIG
+
+FALCOSECURITY_LIBS_LATEST_MODULE_SUBDIRS = buildroot-build/driver/src
+FALCOSECURITY_LIBS_LATEST_MODULE_MAKE_OPTS = $(FALCOSECURITY_LIBS_MODULE_MAKE_OPTS)
+
+$(eval $(kernel-module))
+$(eval $(cmake-package))
diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
index 28de5c0c9d..0437648383 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.mk
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -4,62 +4,12 @@
 #
 ################################################################################
 
-FALCOSECURITY_LIBS_VERSION = 0.21.0
-FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_VERSION))
+# falcosecurity-libs is provided by falcosecurity-libs-latest.
+
 FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
 FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
-FALCOSECURITY_LIBS_INSTALL_STAGING = YES
-FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD = NO
-
-FALCOSECURITY_LIBS_DEPENDENCIES = \
-	jsoncpp \
-	re2 \
-	tbb \
-	uthash \
-	valijson \
-	zlib
 
 FALCOSECURITY_LIBS_DRIVER_NAME = scap
-
-# The version can't be computed from git, as we build from a tarball.
-FALCOSECURITY_LIBS_CONF_OPTS = \
-	-DUSE_BUNDLED_DEPS=OFF \
-	-DFALCOSECURITY_LIBS_VERSION=$(FALCOSECURITY_LIBS_VERSION) \
-	-DCREATE_TEST_TARGETS=OFF \
-	-DBUILD_LIBSCAP_EXAMPLES=OFF \
-	-DBUILD_LIBSINSP_EXAMPLES=OFF
-
-# Only the kernel module driver is built. To keep the build small, the
-# eBPF engine, which needs elfutils, and the gVisor engine, only
-# available on x86_64, which needs protobuf, are disabled: they can be
-# enabled in a following patch. The modern eBPF probe would also need
-# clang and bpftool to be built.
-FALCOSECURITY_LIBS_CONF_OPTS += \
-	-DENABLE_ENGINE_BPF=OFF \
-	-DBUILD_LIBSCAP_MODERN_BPF=OFF \
-	-DBUILD_LIBSCAP_GVISOR=OFF
-
-# The driver CMakeLists.txt only prepares the kernel module sources and
-# Makefile in the driver/src build directory, which are then built with
-# the kernel-module infrastructure.
-FALCOSECURITY_LIBS_CONF_OPTS += \
-	-DUSE_BUNDLED_DRIVER=ON \
-	-DBUILD_DRIVER=OFF \
-	-DENABLE_DKMS=OFF \
-	-DDRIVER_VERSION=$(FALCOSECURITY_LIBS_VERSION) \
-	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME)
-
-# The pkg-config files define the prefix relative to their location and
-# contain the absolute paths of the dependencies in staging, which
-# pkg-config would all prefix with the sysroot again.
-define FALCOSECURITY_LIBS_FIX_PKGCONFIG
-	$(SED) 's%^prefix=.*%prefix=/usr%;s%$(STAGING_DIR)%%g' \
-		$(STAGING_DIR)/usr/lib/pkgconfig/libscap.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/libsinsp.pc
-endef
-FALCOSECURITY_LIBS_POST_INSTALL_STAGING_HOOKS += FALCOSECURITY_LIBS_FIX_PKGCONFIG
-
-FALCOSECURITY_LIBS_MODULE_SUBDIRS = buildroot-build/driver/src
 FALCOSECURITY_LIBS_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
 
 # falcosecurity-libs module needs these two kernel options to be set:
@@ -76,5 +26,6 @@ define FALCOSECURITY_LIBS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
 endef
 
-$(eval $(kernel-module))
-$(eval $(cmake-package))
+$(eval $(virtual-package))
+
+include $(sort $(wildcard package/falcosecurity-libs/*/*.mk))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
