Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96150606A32C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rSSlzDPc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLDbJx5O
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 713B781108;
	Fri, 30 Oct 2026 09:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPFj392VXzIh; Fri, 30 Oct 2026 09:15:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 66B0B810F4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793351759;
	b=C6msmdQANFlhVPPsZYs6JOllryH+/DuDtlvmASMWN53Qm4u7KXLvcfOXn2OPnNaUlPK1
	 TiX38YEimBUbRTAWH1iE6QRcV61izIG+WTpVuF3e/7GrHzRjOUwGe/GMeO53WUg8p7HbE
	 HjrF9fOPs/ocYd8fv1+T7EXJ6eVmWgrv/gJ0iCF4KsxYQ+bO3VtEwi1npWWlYo2c7kTgx
	 mc5r2llqtiwJP/W3OOfZRlNAH4Mo52e0y9h7xJTsq4KW8GgonMdyfU6Sssf3RMLjvhq4Y
	 E56mtX7wjEOXxKk1U1oJxzhtKZ+KoMGRHS1LSxqxa2A/G/jMM61oB9vK808AB9o3pRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793351759;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=aClOUSEUG3FqIGYhlbbiQDh0zPuxSS/3lpwroVGoTJc=;
	b=daJnlqhH7iye28LzHMahrgP9/96nadp4sGBId1ctgHAjXUBSOqvRDB0ttU6Gj8DP+rFr
	 YGNVVKXhHZmsuvUCXewnHO+PA5w6FId2zueQQ87f9y0xTFsbnKCLluMfHQU4ZaWzG147s
	 tM0VU7wYDmMIXUVJcDlCHt/qCvsqBYSGnv6IlelmPNuZAG/cri2BI7ylDxaY+0171HdAS
	 ELdalplQPmIUSSQHiQg574Ilk0075YndgHB1li4JsNujVFPu8V/4ScSOjdpUmcUilHYJQ
	 fa0SFBYaeJ1sI+DBhVG1nHbhjtfGbgoE9M+/oNwFmgjLMnRgYdBgDpf/hSjIw2QYJMg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793351759;
	bh=aClOUSEUG3FqIGYhlbbiQDh0zPuxSS/3lpwroVGoTJc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSSlzDPczKra5/szc8Co2gAsOHcwoJBJR2MXEb2C/3uIyOMiZIAWM+84cZRf5vRLG
	 iScX1a9Ku4EseK+z0B3aULowHubL5ExKgdwcP3uYD/rSWUtJa/8N3Chy3gCw8ZwgG/
	 mpWWYP2VgisFndxhRt3AyHgh31p/YRvrNFQkZHxxmoeSByHlB+z4IGrTmbarRXY5Vf
	 l+bUMKjsocuVJW0HMpIzHxl9OJU7b6PnDdrlHkcH4zvQHMvT3L9Oe8X7yhLSbRNbtP
	 dDr2qAknt4N1mAf7/tOt/gGqMUBn2kRczNAIQNh728xg6ZPILmjpsXBKttj7nYrmFZ
	 V+gvZ8+IuCRqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66B0B810F4;
	Fri, 30 Oct 2026 09:15:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49335529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AE074008B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Rv-9rI6EKbs for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 09:15:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 01CD140063
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793351751;
 b=JhmFqAX3JBhah2QcE4YdqN/ubPJNgmCjPqhtVaE/ANyhhFiRoCcvME0r1Fi/0pasIU4m
 YXMvrdgatBkKS3v9yYb2Dba/FD3kwxK/Krt7FOYELc/WN9Tx8RvOCH1aH9hzijzuzpnFm
 zUpP61/6xA3ifHmSAmv1tv6+cWB8QxCt94xUc1GzzKFl4m98gmT0pPQC7IVK/hujePYaJ
 kipViPBKsW0MtRlTv5SeJuak7OmO9JVPtgp7SELGmMhghEkJ1HVTn1WSix+IZZFBJR/DJ
 IdRKp8q5+Dp10cR00pTWtDoUuyS8667bbga+0KURXn/T61KL2UXCsiJNvPbRM8QKkIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793351751;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=xq7OJ25a6TXfaA1joycu4gi3M29T+gtmBdecG+69xNI=;
 b=TnHhxKFJxWU94Fex794HfDaL/E4rizWcxyTKklmUXYrKuQm8llvm3QuTFQkFMpa/oXmf
 WNgPFpj2OGx1aaFHm48VQXgcBdsl8XK0GGP1qX8jy0CQgAaFaFMY7bKqbGhL0CykeChPS
 LL4713F3OPNJxFb+G67CEGf8kTYwQVgx9F4QAfblriefty+0tAdWs0NLtezr78XVASGpK
 Zx4lu83y5jZ4o2HJNqkSYem6DQSyLeB9FCjlCdWEaW2+lCB7df9hQgdwqgFcYZs1L13aS
 OAy6+I/df63zx8Lcn9566vAyJG88kzN0YipCgj8XMhXlQKewqlR7qsz/WujNwQqQeAQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=lLDbJx5O; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=lLDbJx5O
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01CD140063
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48df8fe8513so421078f8f.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793351749; x=1793956549; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xq7OJ25a6TXfaA1joycu4gi3M29T+gtmBdecG+69xNI=;
 b=lLDbJx5O70B5yNrLloAV0ji3L0Fhlzz/KNSezWYIAIuJqooTqN9CKe0Ze8NDXTxsim
 uTzqnPgoBtaYgpKUVBfPTydruYPIKq0c7JkRokfx2Lim8mLI10OYpVMTUH+domaG9vRb
 /O+cXK/kd5AUz22xg7/MzLnSs30/HkKL9ysaAFu352XsvUEZwA/lDYxFsXYErGM5+njg
 8XQ7W0QDrC+FPnzNV42oSa2RFK4PcknvW2D9n1kHTJvz8/LNp83qaAqhJWc6ldqasJrB
 1dmXCsHTJLSydGkW97ovrElO0NVsPkoMYkXVg+Nrqq71RtMcQ3NtbZ3tzhRcFubB5V/j
 9LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793351749; x=1793956549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xq7OJ25a6TXfaA1joycu4gi3M29T+gtmBdecG+69xNI=;
 b=ss0gmhNss/okfbqy9Jf1xznmRYwwQyitJNuKqorwsZTE0hIdeMPdUBbaaDJ9dy4JFE
 0i3hjwRa5+58MqvB45JSdb8PDu4KrtqfzDJqD0K/RMavEIQPagGJwdOte7lzUPxTe3nG
 fM2kgD4l1opjj5Elfob0fScZe2LEIvw839JmbTsuvs4PqzJmqSdVJwneQeHXJ+eJR/i4
 JHySsBSbMlVruzPb+6VpA1cq69QLduMt87XkNp7eXwq8IOTpxZqPNN1hkUw9fIDUjuVA
 VlJ9QYHiIW6Xq3fDCFACyX+Z4IZMitehSQza7awrtVjcX/tCzZHtaEqLnponIJ3I6I4g
 I2Ig==
X-Gm-Message-State: AFq9FYK3eH7N4Ev7BJrAPg4drMlIaa2vrr6Ebpl6OM9hZNOzA+urRl9M
 we+w+aLsIAXB4QqVQj/z+2VT2vKkC9fjOto81scL9EY1+YOI4AkkiBOM3TgfdQ==
X-Gm-Gg: AYBFou3hCBtv+cXyI0PIsSHotP6MF711lRUj+0Pd4XK15X65EZdAnA2Vub/GnLrlj33
 0fy7ri/wk0QLne/8l2jxMcR/keXi1AstlquJIEAxYL4fmw13BrsUBsONzIDg0z0kSEWju8QNFLp
 5of/AK3l6pWq/OVjbopIUxv4NhE+zgSwns8fh7XX6QMj7pqlXPDp2bR0Z789RW6Yzz8YxZkbakf
 PvmD+N0BFFe0WmdQnX2wsLPK6iwm61gIrfnNvXlV5CUOOpllikcqSyOYiSGY2Q+ybMJIL9q8oLC
 ghlt+sEVjnR5K0iAOAvT1OSiXc0MUiTnSYQDKpoDJyApfx6vGEkE/SCsPd/Ul0xfZl9daqrBofw
 BPmn55B9Rsu/MMeQSzF1jYQ72PCyBm9tUMKd9sJ8TYiQ8STWGkgfdX6SHztkU1TJpHUJJ2iFXP1
 kqjMZ27wGPGCnfsSGinXqeqK0ehB4nDQ1OBXXRJ+7w2Ixi7ok9bm0nBpBV2sS7QuI6tVkIjhqs5
 mnwyDd66R72zhUHSLG1HyINAf6nZp+HMkVmsZmd5dkblTC8CQg7fNGzQ8Vw6ev4DtMsYE8KOk02
 Wsy/DwFIYm7I3X3NUQhrEmFMTXi5/uWUI7YxXytCsN9uKlhM2Cwycg==
X-Received: by 2002:a5d:5e90:0:b0:48e:d88:55e2 with SMTP id
 ffacd0b85a97d-48e6e518c08mr3863179f8f.42.1793351748659; 
 Fri, 30 Oct 2026 02:15:48 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b7815fsm2106312f8f.22.2026.10.30.02.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 02:15:48 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 10:15:36 +0100
Message-Id: <20261030091538.1773417-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030091538.1773417-1-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
 <20261030091538.1773417-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/5] package/libppd: new package
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 2.0, cups-filters has been split into several projects.
libppd contains the legacy PPD file support of CUPS and cups-filters,
needed by the classic CUPS printer drivers.

The required dependencies are cups, libcupsfilters and zlib (used by
the rastertops filter function). libppd is partly written in C++ and
built with -std=c++17, hence the gcc >= 7 dependency.

libppd needs at least one PDF to PostScript renderer to build.
Renderers are only called at runtime, through their executables, so
Poppler's pdftops is always enabled as the default one, as the former
cups-filters package did, and Ghostscript, mutool and pdftocairo are
enabled when the corresponding packages are selected.

The CPE vendor is openprinting, as shown by CVE-2024-47175.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - use the tar.xz archive, which contains the configure script, and
    drop AUTORECONF
  - select cups, libcupsfilters and zlib instead of depending on them,
    inherit the cups and libcupsfilters dependencies, add the gcc >= 7
    dependency for C++17 and a Config.in comment [Thomas]
  - add the missing host-pkgconf and zlib dependencies: zlib is
    mandatory, as it is used by the rastertops filter function [Thomas]
  - explicitly handle the PDF renderers: always enable pdftops, disable
    acroread and enable ghostscript, mutool and pdftocairo depending on
    the configuration [Thomas]
  - drop LIBPPD_SELINUX_MODULES [Thomas]
  - the openprinting CPE vendor is used in CVE-2024-47175 [Thomas]
  - rewrite the help text, add the URL

Changes v1 -> v2:
  - fix incorrect order of patches [Baruch]
  - add a note about autoreconf [Baruch]
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libppd/Config.in   | 19 +++++++++++++++++
 package/libppd/libppd.hash |  4 ++++
 package/libppd/libppd.mk   | 42 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 67 insertions(+)
 create mode 100644 package/libppd/Config.in
 create mode 100644 package/libppd/libppd.hash
 create mode 100644 package/libppd/libppd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ee74a3768b..e133d0dbaf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -240,6 +240,7 @@ F:	package/libapparmor/
 F:	package/libb64/
 F:	package/libcupsfilters/
 F:	package/libdill/
+F:	package/libppd/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
diff --git a/package/Config.in b/package/Config.in
index fee866748c..f7e2f8517e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -349,6 +349,7 @@ comment "Graphic libraries"
 	source "package/imagemagick/Config.in"
 	source "package/libcupsfilters/Config.in"
 	source "package/libglvnd/Config.in"
+	source "package/libppd/Config.in"
 	source "package/mesa3d/Config.in"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
diff --git a/package/libppd/Config.in b/package/libppd/Config.in
new file mode 100644
index 0000000000..048dc5616a
--- /dev/null
+++ b/package/libppd/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBPPD
+	bool "libppd"
+	depends on BR2_USE_MMU # cups, libcupsfilters
+	depends on BR2_INSTALL_LIBSTDCPP # cups, libcupsfilters
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cups, libcupsfilters
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	select BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_LIBCUPSFILTERS
+	select BR2_PACKAGE_ZLIB
+	help
+	  libppd contains the legacy PPD file support of CUPS and
+	  cups-filters, needed by the classic CUPS printer drivers.
+
+	  https://github.com/OpenPrinting/libppd
+
+comment "libppd needs a toolchain w/ C++, threads, gcc >= 7"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libppd/libppd.hash b/package/libppd/libppd.hash
new file mode 100644
index 0000000000..8f124710a5
--- /dev/null
+++ b/package/libppd/libppd.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  3fa341cc03964046d2bf6b161d80c1b4b2e20609f38d860bcaa11cb70c1285e4  libppd-2.1.1.tar.xz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  55e4def1908892891dca2901cab74ef8142999fc3384ad17364b95893fe0c8f4  NOTICE
diff --git a/package/libppd/libppd.mk b/package/libppd/libppd.mk
new file mode 100644
index 0000000000..72c7e58116
--- /dev/null
+++ b/package/libppd/libppd.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# libppd
+#
+################################################################################
+
+LIBPPD_VERSION = 2.1.1
+LIBPPD_SOURCE = libppd-$(LIBPPD_VERSION).tar.xz
+LIBPPD_SITE = https://github.com/OpenPrinting/libppd/releases/download/$(LIBPPD_VERSION)
+LIBPPD_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
+LIBPPD_LICENSE_FILES = LICENSE NOTICE
+LIBPPD_CPE_ID_VENDOR = openprinting
+LIBPPD_INSTALL_STAGING = YES
+LIBPPD_DEPENDENCIES = host-pkgconf cups libcupsfilters zlib
+
+# libppd needs at least one PDF to PostScript renderer to build. They
+# are only used at runtime, through their executables: like the former
+# cups-filters package, always use Poppler's pdftops by default.
+LIBPPD_CONF_OPTS = \
+	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
+	--enable-pdftops \
+	--disable-acroread
+
+ifeq ($(BR2_PACKAGE_GHOSTSCRIPT),y)
+LIBPPD_CONF_OPTS += --enable-ghostscript
+else
+LIBPPD_CONF_OPTS += --disable-ghostscript
+endif
+
+ifeq ($(BR2_PACKAGE_MUPDF),y)
+LIBPPD_CONF_OPTS += --enable-mutool
+else
+LIBPPD_CONF_OPTS += --disable-mutool
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER_UTILS)$(BR2_PACKAGE_CAIRO),yy)
+LIBPPD_CONF_OPTS += --enable-pdftocairo
+else
+LIBPPD_CONF_OPTS += --disable-pdftocairo
+endif
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
