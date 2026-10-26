Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07216606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 10:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E9fB8LHV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE13E4063A;
	Mon, 26 Oct 2026 10:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwXxICfpZGKF; Mon, 26 Oct 2026 10:35:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D53E24062F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793010911;
	b=RGh+kJexsKLM/BAOjWHSg6UM33Xmm184cS5hWLjqNvrSzvuHG6YeVSGLedNBtb/yYI2K
	 KEqZyY2Va6msYRQ7I2cCW6F4cnkKp7w9pvZUzFWHUWEH98TbIbMje6R0NH9HEQa1ZJ9Sm
	 gqcLF/HRL3HoE9UZLKj26vnF8RtX/A7fLyXtKPjJeOz+HkkT7Ej6mQJ7dSP/CZNCWcRyZ
	 dER9aeQrB5KNRUiHDmEmkIjnwHngRsOSRzxcrki3SRB/iww7FlIjhJPpGCeN+DdbY5lQ9
	 apjDT8bDInWitYyhXcoPYe+ggzBL7BHoDH1wGVzmOPn0Nvu0+MQzsUS7Rx3soZMZPhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793010911;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=JeQOpE/IIjMi+kRXZLKUr6ZlvALOc+6TBkE20hcObOM=;
	b=VRcVdUI1Kk5sVmcRtRkopNnwDiUooW6abF61k0tYGk4efKl2oEOrT8wa2GlDf0/KJr1G
	 jZSnaXvBfkMtR2iwLydd7AAv+JacqD6mcsIl+g6QM3INXDKZzPNcsNJ7rUpfSf7i1h6ef
	 BnuFE6cBc+losU3zw8NTY3f5EQMoY1V754c8nh9k9uxFBl2vvzXcajbHMllWD93quUbAC
	 Ot59ZzTB2sw/pY+Q8ocZDtb1M4x2+ucouWinx4F2TszaixTQbxsFKqfdi4IQnp5teGGL0
	 HM1b0zkHQVagB/xGU8yLCFQCdaGUlGkOmP4VDn5Thg2lEt1HFk4jqjomGFDAZX9VtMA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793010910;
	bh=JeQOpE/IIjMi+kRXZLKUr6ZlvALOc+6TBkE20hcObOM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E9fB8LHVJdM+yE77emj6HlhSvsoksCEdZPBqu32QrIBADVUplnMJNWOJe5EQ1MVGf
	 EhaYZnpkP3VkiUBaGifDc1bmT2A7gcLz44rjVQUIe7fmJzsHQgauWe5IYGr3pevx6j
	 j/lmxWLeXGl0NmRwTFU3kI4xJEhNg/FP/vK8RM9Px57HHFJ4SfEGLN0xSej2cx+PZi
	 N0pDhEAeK7Chu+hIFgkefyylFdfjdl1+mjub9t/5TUu56JW2IRMGCuHGQammo1bdzF
	 2m9zjIbsp2m+T3mDfmzhrMukMIAG/uOf4x0fpiQRGHyVt/p+wG8WW8a0NRYgwu/2Km
	 O4R3Wo7AHXJEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D53E24062F;
	Mon, 26 Oct 2026 10:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46243356
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43EC740139
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhWe6yzc4Kwv for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 10:35:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 68F47400F8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793010908;
 b=Gbc8MGz6UaV0dmrhRFNIYOJe3s7IwcJXEaEBGxpFDwXkSTDI0JGhJYIu8xcIbvKVqm8Y
 NDGTQY/Oty6Ze4t4D34robf5h62OnGy+xMEAg5keoMEqFjYKlODR1jK0+bL+auNewEy/+
 ZK37b8/RWVrBOefXsDZOyqFsEMF2Jkm43oSVO2n+9lxm2HYFDwZE/dcR3ekJUCIZIB1jY
 QYjZ7V5bgQZrFyATyKvugreWEA9A68C916966Icdompx3exJMtIC6NvkmQ5GL5kp67GRd
 MDv+JFDi+2Jkl6/l/Rqhy+StF1cBVTU2uqwSn4dv+/Ol0JGNm1nOBvSpTTLkotFOTXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793010908;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=95Y12booppHcZXS9VxGVga5oaV4Q3vEc4eWdyq0IQSA=;
 b=qLwGIa8KITpOuyJhA4yIDTOxY0z+Kt0U9rVrGOOCsQsc12r1eTBEhj0UO7hPaxZw37CY
 LBhbsDFpa/66SwvUV3lFPvCnmEPX3BKznqT5yEQ1lFIS0ZYX27Ys8pt2DS+519/Gq3hAO
 Uay/g0BK7+HjA4W25R45TGNRGO8xGHNillYvF7tjWeWXf+MMKw62ZnZH9U+TSIXYgWfHE
 nm5KlCMOUVMmEjTgieqSWks9FvhMeKpV56WuRkhMdVS8oHrQbg39k2Gev78VgNU0myB8A
 KoT7f3iq+ED0AHlMWhf5cI4xMFHITW3w3aQSeP+9fQPICrb1+ZdGprqU0Iimqshhykg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68F47400F8
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:35:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79F699CF7E; Mon, 26 Oct 2026 10:33:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 11:18:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a8b2d699f4194eab06b1e26f67b4c94a39423f5
X-Git-Newrev: 5e7918d01b022fbe47c369643dedbf703f2f30ee
X-Patchwork-Hint: ignore
Message-Id: <20261026103342.79F699CF7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luv: bump to version 1.53.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e7918d01b022fbe47c369643dedbf703f2f30ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 779046e651..ce4bcd325d 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e6eb820a3aee034f85f9cce9bd77b5d42f34d128a1ccec877adf28c913577c7  luv-1.52.1-0.tar.gz
+sha256  fccabc7bb37fcc3b84ab258a19a862c55f67abc2059af0a744a1ae64119dfc6c  luv-1.53.0-0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 3d79bab163..2b742d44e8 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.52.1-0
+LUV_VERSION = 1.53.0-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
