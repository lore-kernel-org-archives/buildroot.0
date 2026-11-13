Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E85606A337
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BEkIaSBk
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C9C581404;
	Fri, 13 Nov 2026 14:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELxn-SO4Jpp4; Fri, 13 Nov 2026 14:54:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A1CC68128E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794581662;
	b=qQNHyx4qBcmtT6vzd5IIaX49qmO8vcm9U53307LCNKWBzD1F9l1VukCfCQsjIEiHWFlJ
	 +TM713Yv5HvBTSyh2yGzoR58kQ09zzuNAx/u8Sbn24XgV/VUHNq53PVEywVPpZUtgtYxe
	 OhqXRWdf4K7Bph81tWYtWg5OELhG9aRf40BWoa0rH6F4E1iJc1Ur3P4bRquGloJnxJsqn
	 Tjp3yGiGaCRme1rJLjDlNYLWows2k4bWaB3wlPapqAcv+f3TZ+8IDrIHJZIChpr2rvXop
	 KosHKiOyZkxjjoCbjikLDydXICUHZHatVNU2IPCwKFqzw50F2L85K1/OhvxJlYl2NRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794581662;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZdZoxzrTiN9NHSphG04oUhypSpXTBsmwB5/salNa/Wg=;
	b=fMdGtNvXFTJQfmO36wGvgH2m30WlYYgUJ+4RAjwHov8WgSz2W+C2sU7oO4C5YdeBqQfX
	 gln3aZv6DAcpF+o7Xj56k/FOTcyYT2Sx6EvS2M9F6XhTIe8r48m/LdRpLoldV4fXVADLo
	 qwj99G0AatN7ybvzAOQRL7vbFeG+r2qWx3g49PsQag4e2xWwvsjT1abnB0kcAYHX2WRwT
	 rFKyD90D6F1ZAMuFN1LSxjRfYdDDQDfSbXX5i9YGyeMfpQg+kLezIPTdN94einaKwo3Xv
	 rZmglSt6jZvR/MOAbBghxK7Kmh5haAtEdQFHhcufbaxfavBMjTTseD5ffPMUBNxMb1A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794581662;
	bh=ZdZoxzrTiN9NHSphG04oUhypSpXTBsmwB5/salNa/Wg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEkIaSBkkCYama4C5A/0EisYPtXW/yWnMMs6sR2fqln+OMlvx9mu2lhssIeNLq7hY
	 ++RNGFSNb6SUhwaL3FTvpXZDSnH5PdWZeV41e9MuRzqvyC/ilpLW1F3Jp4sqf7Qh1C
	 CfH5hPnfuC8Dbo/0T+CfwxI+0kSqJ8N0s1N20lHRa9V2azgrsHm/CWPJm2jr1zcWeL
	 0MJZ0M8lsfrqE2vrMffeaOMqmYveTN32+k4kkUXH7dJkDGq5bSnUrbBngxM0mD/mtx
	 HDtnA0Goo3jmpN/HuiUw/l3H3WxOLmJIJqlhuOER14MjAFgGzNkXhhQPxHov/x2SsH
	 8t9Ca8FlVNiDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1CC68128E;
	Fri, 13 Nov 2026 14:54:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADCF8AF8
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 941BE606A3
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nbpyz58BPkiX for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 14:54:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D39D60665
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=77.87.242.242
X-Greylist: delayed 112 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 13 Nov 2026 14:54:20 UTC
Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=77.87.242.242;
 helo=harvie.cz; envelope-from=tomas.mudrunka@gmail.com; receiver=<UNKNOWN> 
Received: from harvie.cz (harvie.cz [77.87.242.242])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D39D60665
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:20 +0000 (UTC)
Received: from anemophobia.amit.cz (unknown [193.179.247.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by harvie.cz (Postfix) with ESMTPSA id 7621D180315;
 Fri, 13 Nov 2026 15:52:27 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tomas Mudrunka <tomas.mudrunka@gmail.com>
Date: Fri, 13 Nov 2026 15:51:58 +0100
Message-ID: <20261113145201.2357363-3-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113145201.2357363-1-tomas.mudrunka@gmail.com>
References: <20260324130037.1411867-1-tomas.mudrunka@gmail.com>
 <20261113145201.2357363-1-tomas.mudrunka@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/5] package/hidapi: depend on udev instead
 of libgudev
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_SOFTFAIL,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hidapi has never used libgudev: its hidraw backend only links against
libudev (see PKG_CHECK_MODULES([libudev], ...) in configure.ac). The
libgudev dependency is a leftover from commit
e739dd5a11f5b2bd9648a45623bc174adae42b6e ("Use libgudev as regular
dependency"), done when libgudev was split out of eudev.

Depend on the udev virtual package instead, which is what actually
provides libudev, and drop the libgudev select. The BR2_USE_MMU and
BR2_USE_WCHAR dependencies are kept, but their comments are updated:
MMU is needed by the udev providers, and wchar is needed by hidapi
itself (wcsdup(), wcsncpy(), ...).

As hidapi no longer selects libgudev, packages that optionally use
libgudev no longer get it implicitly when hidapi is enabled. libmanette,
which selects hidapi, now selects libgudev itself (see previous patch).
The other packages with optional libgudev support (gst1-plugins-good,
gvfs, libqmi, modem-manager) only got it by accident when hidapi was
also enabled; configurations relying on that need to enable
BR2_PACKAGE_LIBGUDEV explicitly.

Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
---
 package/hidapi/Config.in | 5 ++---
 package/hidapi/hidapi.mk | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index fa44288917..72ae32a6d8 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -3,10 +3,9 @@ config BR2_PACKAGE_HIDAPI
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	depends on BR2_USE_MMU # libgudev
-	depends on BR2_USE_WCHAR # libgudev
+	depends on BR2_USE_MMU # udev
+	depends on BR2_USE_WCHAR # wcsdup()
 	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	# runtime UTF conversion support
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index c4daf934ee..7e202f0eb5 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -12,7 +12,7 @@ HIDAPI_AUTORECONF = YES
 HIDAPI_LICENSE = GPL-3.0 or BSD-3-Clause or HIDAPI license
 HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig.txt
 
-HIDAPI_DEPENDENCIES = libusb libgudev
+HIDAPI_DEPENDENCIES = libusb udev
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 HIDAPI_DEPENDENCIES += libiconv
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
