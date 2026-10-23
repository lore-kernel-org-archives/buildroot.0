Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C4D606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LerakAvW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B2A60A52;
	Fri, 23 Oct 2026 19:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVcWyF2U7K1Q; Fri, 23 Oct 2026 19:23:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5FF4260A3D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792783381;
	b=nbzUKpJ42fsMF2bPrBNGAmpcUaSPweoGttiSL/RDuc95rhIpaStQ0KHwmxZ5AVWybre7
	 Krj7HeSElsaQw9ye01vep+X8Lyxw1z0aTDLx4YT5RaNW0VaKBQsIRXOZIUNvO5+AFPCXn
	 t88VDPvEo1Xn5znp9wtSDzxoIjtprzS5Z1fqFGwnEFhm1SzQUVJwcWIVTYe2ZNVmnhOoP
	 706iXZ7UDkffn8y+joEnm7WZRuRcO0JEWhYVKpGn7TPYcd6Z0O0uA3/z7KNRnxazSt9Ft
	 Fi6U4st9Kpn7ZPcaiTmDXwM5JWhFwQqMF02bkV6G8LihyJfBmQmOzo3btWQHV9pCpbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792783381;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TiQWqxrBVaiGvTXpcN7+vlHDCIAaC0nyK36KF5qTKi0=;
	b=m72QBVf1Hh8+pWa3gmISaRNRXXounasGIVjOhdRBXjbtW2sMU9tUyHvf/SprcBNyY/bj
	 CPue4ojoW+4vcpylXcBhWeml2H6oA7OMzmEY9wYFIW2z136DkgRYBYDWGxRZ1Mf9LYYZt
	 8er62Hh2FQeu1j4TFlBY43RJZBmE42mqxfqHwgOo9bV2vV1S6dGcz5Hy9JX2RSmZstBAB
	 tuKYafyboGMDviOH6FIwWIUl6Q7Oe1VaAp4v7iMI/vW9Rl+svZaeHmTv2vS7c2xPq5aMo
	 +P9XMN7WnPY0aFUi+5b+WTvzWglmIuxZF+e7zc5rZPiC0CyqUf0+A7f0pXWDBKocqnA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792783381;
	bh=TiQWqxrBVaiGvTXpcN7+vlHDCIAaC0nyK36KF5qTKi0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LerakAvWr1f4RnL4404ZtzlKYK2yfSCOU2BPx+ubQhnN+IpX8kzr4L/gYxhij2oUW
	 /5HWp1MmVBos6rsx1yoduzfJ5jtNpRQIgQmx5WTx4hRwV18+4I0L88cYyTWQd/DU/k
	 /iaEcADOZpZky/O0yBwcOKKM6k5f8/megCPi5cADFr3pxIJYc+2c4FSRtHQV6JtLUt
	 0pYpq3QVQSNymyqKQ73S4Ks2mVNqn3DDi34ojaiLhSe6dbBmw+CMNVu7XYPax8PvmP
	 ny0recjGaitMA50BqPM9NZGBVcDCVhoxCvh7U66Mwj7LJkdxFGIGIcyqmhwggnY7Cg
	 J3TfIgd+rN+mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FF4260A3D;
	Fri, 23 Oct 2026 19:23:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F130235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3481D40A5A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKRBXu62vm5C for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 19:22:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 578CA40A59
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792783378;
 b=cTJlHLOhKaU/AJyseqdwdBM9SMFwDLE5DkoC7fRAFFm8LCVqjY1BroFAlLTotnfNFkRd
 r1EM4RRmg9ZkBg+j5J9rESPPVOCFs7YyWtTBDvBR01zC3oKt/VHfOL2mJP7AML5AOB/QF
 p+3fMwVRifhGWA96Ch/HbcT7CnXO2J3jo0OtDvPe4/OfHkP7MEzVByN/5+VLp4UrCd49w
 lUdBA+o1fJCSj6YCgj+LtJuB1X3mVY1/32LiiZiuYQoYoU6hTX/FN3o+PCh2jECOztjRx
 /PSDTFMWZSXaFOtRFz7lWN97rPfjyrYVw2IWSdgwqlFfQbroVzZTnmHTW3etRMe9rrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792783378;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LUpK+t0Alt4VWjURsaHJ9Q3CsbBVONQLXmKp3b52+dM=;
 b=qysh/FFTMB9PcK56oVsFOkafoz0oERqJqrhv8L6uUgOpTUBd5wz6aF5SEc56c3Gob5k/
 hfHoth7NXzsACjvqB6T8mr9STtPFl4lW1Msar4ZeUmxbeWKMqCX6Z4BeQwpgS7wGuI8uu
 xAUSD7a3Sx1CaYbCbN9z+wzvBNijAl45yFZAiTgjDkXYv1FZXbmdzphI9T2WVDNenGL1x
 XntCeYXub+nJD3HP70yDUXsQX4VKnTaWCKobRSVlAxMZcy1yy8U9Nz3ShoUKc66vzbFhL
 VirL7cVMiijEPluGMtT5RXb0tmx32zet/dq9Qn/kW1KoR6IQkYcHYCxFguF8oNLw5Xg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 578CA40A59
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:22:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADA799C685; Fri, 23 Oct 2026 19:21:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 21:13:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed17a05a766f708ef69ab4b993f8ff4a686152ef
X-Git-Newrev: ce9729d7ead802f8afd487f01982e2cae5ba9121
X-Patchwork-Hint: ignore
Message-Id: <20261023192133.ADA799C685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils{,
 -headers}: bump to version 5.87
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce9729d7ead802f8afd487f01982e2cae5ba9121
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Besides bug fixes in GATT, BAP, BASS, AVRCP, PBAP and MCP, this release
adds support for libical 4.0 [1]: libical 4 no longer pulls
libicalvcal into the libical.pc link flags, so obexd needs to use
libicalvcal.pc to link.

ChangeLog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog?h=5.87

[1] https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e60d07255327db3fc4e3a28d7fcc792cd42c34d0

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
 package/bluez5_utils/bluez5_utils.hash               | 2 +-
 package/bluez5_utils/bluez5_utils.mk                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 71027b45ba..c4b230f367 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.86
+BLUEZ5_UTILS_HEADERS_VERSION = 5.87
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index fdfb7edb3a..ca00a01207 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  99f144540c6070591e4c53bcb977eb42664c62b7b36cb35a29cf72ded339621d  bluez-5.86.tar.xz
+sha256  26bdcf2cebd7310c6f598850606b037ef0c515fe6608ebc54d22c50c4c32b35f  bluez-5.87.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 38fe9a523f..0d86fd1dcd 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.86
+BLUEZ5_UTILS_VERSION = 5.87
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
