Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46A5606A325
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 20:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W2lKZuqt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B6A80DCD;
	Mon,  9 Nov 2026 20:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuSf-SwvHSaC; Mon,  9 Nov 2026 20:51:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 633E780DD2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794257479;
	b=jk9EvQamh3fQsT2enDaTtJYfEFDDoRK8G3f2rxZBL9Xlv2TZnRaGBYBDBYx0wQWX1uWi
	 2QcqLbp8yCpL110VaU7/UGzVoU7frkOWpjC/B1n7KLKg9vwh/BZNVOPzV+EUmHFVj8v8Q
	 xWeC3u9tzAmlwCNHpRs4duHo7gHPeIjqtxlJZpu5PgPpIAX2K8xiX86H9/0kK+wig9ZD5
	 Nbz/sXMRX623zdgBzFgZQ7H5W7tDPXq9pgxzuOJIrZnxjUqKQQFqfzOkO43fuC7h+gqLm
	 88v7FwSi42nPAufPNutYnA7Chx//379idmsmc5E26tfOcvoiLS4irYp12hcNche9g2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794257479;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8ZVhSSZc2MxQViAr3YCER+DVgNRW0W3Qu+GR61cM1QI=;
	b=s4fpLZf/04FfJDIUijrkaqZtJ88FC+xnApK7honHNkTs5NbvXrtmvDwCYhWgEUNmOGPn
	 Bqn766LNq6NfDiaLBXNMdA7apOPJ/1RyElIflZETMoX74n2bZdag7mJmwcJFKaFNJO17E
	 WnmLNnjYEWlMGc04HJLMKZ8LXoaZEMDc6o+8UbVutEI1toHkx98kAL4vWDJLroPuOpJPE
	 N5D/3+W5/s9rEFjGeh8+6yhrl2sH/1zPS1dYMXzfde78NFirqk3RunKCPKtrn1IPRqSei
	 8x0eObQSWruRbTPWREyiOarX5f2z1UkP/2NEkIe9SPy+xxgbMrivEjgm+C1wU1//U5w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794257479;
	bh=8ZVhSSZc2MxQViAr3YCER+DVgNRW0W3Qu+GR61cM1QI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W2lKZuqta6lnx3miaTwCZ/iwcfVq8oZE3Tv0OVu856+2CHSSw7oyfCAqD5hjR7Yl4
	 Z9xZ9l+MR+uzLzOSrADWn64aARCqI/FRzQCLhfCKnoOrq21xD4LsKIjQcGS3r4LTPm
	 HsjFqu9JBXFvkzgNnRqkNui8k9/9ALhdGSbyKU5rMFwEhqG/qiP6hCGkZE4l/VtFYR
	 S0RCEdrgTQAB6dIqs0JOW/wNsYm8WPCB37b3R39DcN6GhGqafzuaXq+iI7zZ7COYu2
	 YH2KZxtaUvfFd4fK7JP4Frjvm3FMyQEwn0/bBd1vnOcxxcqe8OjkHa6ZT1a2WFCTda
	 Y3FwvL+H9YiTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 633E780DD2;
	Mon,  9 Nov 2026 20:51:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65A2628C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 572A86077E
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 20:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oE9mYlT74_uN for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 20:51:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7E96C6062C
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org;
 envelope-from=dinguyen@kernel.org; receiver=<UNKNOWN> 
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E96C6062C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 20:51:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AA6B8614A1;
 Mon,  9 Nov 2026 20:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E2E1F0089F;
 Mon,  9 Nov 2026 20:51:12 +0000 (UTC)
To: ju.o@free.fr
Cc: dinguyen@kernel.org, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Date: Mon,  9 Nov 2026 14:51:04 -0600
Message-ID: <20261109205104.2140273-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261109205104.2140273-1-dinguyen@kernel.org>
References: <20261109205104.2140273-1-dinguyen@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 2/2] configs/altera: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Dinh Nguyen via buildroot <buildroot@buildroot.org>
Reply-To: Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES, add custom hashes in
board/altera/agilex5/patches directory.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 board/altera/agilex5/patches/linux/linux.hash                   | 2 ++
 board/altera/agilex5/patches/uboot/uboot.hash                   | 2 ++
 configs/socfpga_agilex5_altera_defconfig                        | 2 ++
 4 files changed, 8 insertions(+)
 create mode 100644 board/altera/agilex5/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/altera/agilex5/patches/linux/linux.hash
 create mode 100644 board/altera/agilex5/patches/uboot/uboot.hash

diff --git a/board/altera/agilex5/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/altera/agilex5/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..5a935a0d16
--- /dev/null
+++ b/board/altera/agilex5/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  59bed1328131f1eb1ee10f16c94d8f0bbf5600d7573d42d0cf987b8edffe2f6a  arm-trusted-firmware-QPDS26.1.1_REL_GSRD_PR-git4.tar.gz
diff --git a/board/altera/agilex5/patches/linux/linux.hash b/board/altera/agilex5/patches/linux/linux.hash
new file mode 100644
index 0000000000..d322ac26c7
--- /dev/null
+++ b/board/altera/agilex5/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d8328683db0a6b43a96c18d7149b98a11138909ea50f2fa411339f93eb492571  linux-QPDS26.1.1_REL_GSRD_PR-git4.tar.gz
diff --git a/board/altera/agilex5/patches/uboot/uboot.hash b/board/altera/agilex5/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..51906e1d73
--- /dev/null
+++ b/board/altera/agilex5/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a78bf187fde344297bea7d986f05996dfba94ea11d2d4dc706a78bcae543e175  uboot-QPDS26.1.1_REL_GSRD_PR-git4.tar.gz
diff --git a/configs/socfpga_agilex5_altera_defconfig b/configs/socfpga_agilex5_altera_defconfig
index a0888bdd25..f989403c69 100644
--- a/configs/socfpga_agilex5_altera_defconfig
+++ b/configs/socfpga_agilex5_altera_defconfig
@@ -2,6 +2,8 @@ BR2_cortex_a55=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/altera/agilex5/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="agilex5"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
-- 
2.42.0.411.g813d9a9188

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
