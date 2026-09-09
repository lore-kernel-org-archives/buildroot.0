Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3CFC79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 15:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D6780E12;
	Wed,  9 Sep 2026 15:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKUQDkRO8a45; Wed,  9 Sep 2026 15:03:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6699280E0E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788966211;
	b=CcepNdM+iNahaLm/4yK738Ci4L4scPds0b/SUwYI0qC/SFbMQNp7NYFxzpbwbP0aJip/
	 zr1a0G6RQIhkKPpRXTGDezUztpe8vdJ7C4O4SGnsV9Rez48fH3uRTR5ann09hp8Duw3oF
	 2RNdIOgRRzXgzi0KvZtjFI3r6+ATTmZyPJNkYJMF2QnKqOwfyszAuSUv3Y6A34AF0+jEX
	 fTyQemP97BrftiuFjIJXblFKGPCmNO+2HChKqF/roeV2pSJkkkE0FLWPdvjARY4WmxnHs
	 s2kfR4ogtSFBcfniDYoGmr9P9+585+fsyC3CeFYCRcSjdPy6NJ+TtPvH8H/GgoqLXHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788966211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=voFWgQ7Cn1/bCsvNostYReWtZ3X7ignhj8ApLnT7L6Q=;
	b=krkJTf9Mqfq/TV9wSWV9XSq6HUsRM+PM6RUasfaI8UGxek/sJ915i3vtX6Pym+k6yApG
	 zrL6nRyk+CZ9ozmTnRX/9Ivndm9qMnSSTx2DRxqNFRb1kRC85k7+TRG4AtXNEpi1EICd6
	 k8GkpCDvDHG9KLhwo86mdIR+DVIRTh7i8URyX0KUhlExK8Yy9TzOCBz9DngjHYuItNpVN
	 42qvlepziMM4ZprUFvU0pSNqBOxRZcEH8U+LkIr5coJmV9iktjzSHR+V7A4PoneqkkTty
	 vCuOYmwqaQBgkIwi7eaq7mBb3BPLhjwOc5DNcWTb4MAYNvBPMAPDQQVXwsf/PEJ9V4g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788966211;
	bh=voFWgQ7Cn1/bCsvNostYReWtZ3X7ignhj8ApLnT7L6Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PRme80oL0Fhr6K5DisTTVSWU4IDHC357DWLPdOlXwoHXBvhtFRd9ShrnqmVjltnHy
	 GTq51o4lZxbLlVV+RrLe3qUTCBSpvl+Vy9Rqmu+EXt7f2+wZ6RBdDzHmOVuHSd2mO0
	 b8nKTxWfStxx7w3oHirIijBXRgymRTd46gbx3kzJIkOOAifdrDTWQXCoQbv2E5yAnL
	 bGL9YAu4wehKuPhlweNloi/wyG/Ej5qy+AU2gYIN/J9n96LxsSA0aEM4sgtKPm1Fc4
	 RmLF4E/iS4PiNoNg/Fa6gBPqZxZkH7hvxkeH6MUwQYzBbPXH1JPmev7rlCe8pbDgbX
	 XjIgiQbowkCdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6699280E0E;
	Wed,  9 Sep 2026 15:03:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC9F42E3
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEB4540234
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQ1c8L60_dHQ for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 15:03:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D3A5640244
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788966208;
 b=kFCOFBV/Cf9jwstrSLj1zZoKzPyGhHWznLCT3Bgi6iE+gctNYIQ9Wtr10eXyd77IpG+x
 0HS1QgtGyEDIiq2kdgFn9J6soUZAs5AV0CPtreFGWmb3KCUkya+Bhx5leZh04VLqTNnxw
 Ssf8b1iNTmchgR2juHKYsuRP/LoVb+yNjYCoOtMo+Gt/C9iWUz4Xk0DMzgPosGesoo1Ou
 +Z0bTUj8qbNwrysbapBIaXyR3Sm8zYTy6nNgvKn0r1qCOHf1wISYs5O1dLQFJWnW85AnV
 qgkBJXaXJTUWAktB2snPtlmrw/pCM7OIA5jNlVU4VygDSb20sA81DCVhYewdmBRZ/UQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788966208;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XBkWGfNcc6WVhb2W08olFkzGdU77iL192HJ3VlsYEew=;
 b=n+VwB0fF8spUCZg/tiozJ0/c+wijDwK6s7ZP30XUBp6S88FVLd060QReVsTNURpZIhRD
 PC0cfrE+ND+e1ITEzcJiC09/zqfZaPg85aRWSiovWs5RF9YlyAABzUjM9/GhnpzKXV5AY
 owfFH3iU7M6+2T2hNVTAv0NqxyFXDSNRwVlchfSYZBcONVqUtgN9nBG0OmZGGwloATyT1
 s6EU4zjN7gmWXgr/ckIVJ5OoNAnq0OavH07nqQiFDhDmDqTmHe8Bl1ZsdeKOPitm2wGAt
 1eToyWInHAZQWV9j0sTzD6xqosIzekyMo2jxi0pQGiNzYiYvgwBXvwMnWC2RKCH/YkQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3A5640244
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:03:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCDF99525F; Wed,  9 Sep 2026 15:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Sep 2026 17:01:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6084d8bb7f83f76f094e9dd3e5b208f70864951b
X-Git-Newrev: a9643c31c6a117d064bf0838ebb27e9dd089390b
X-Patchwork-Hint: ignore
Message-Id: <20260909150225.DCDF99525F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 26.3.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9643c31c6a117d064bf0838ebb27e9dd089390b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.3.3
https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.3.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 82043b23f5..bedf9f8af0 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  56f4494b5cd408ec245aee6107c3bb93565218c24fe466940d1d1a89c4045053  intel-vpl-gpu-rt-26.3.1.tar.gz
+sha256  70782df455555dfd216507d727f67fcca191959b9c911e27ae23ecc8852664ce  intel-vpl-gpu-rt-26.3.3.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 4dc062acbe..f953cd20aa 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.3.1
+INTEL_VPL_GPU_RT_VERSION = 26.3.3
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
