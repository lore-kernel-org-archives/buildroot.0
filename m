Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9882C606A326
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s1/55mrF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Zpmr5oB5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6779F40871;
	Tue, 10 Nov 2026 17:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5BzXbeP6s9k; Tue, 10 Nov 2026 17:28:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 465AA40873
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794331739;
	b=WAr790d4gpTXQPBbvSr/jtfHyNf1AK8ltBji7R8MP+gG8wb5HJRxTFh0/VPFFZ2gvfrv
	 JZoGvrPjmsFVXAiEfCkXT5GVRHLTVFSkdBxu7VA6XvkvsvVIoBePTayl0WZStQCHrHfdX
	 NjJZtJRHrRmIM3u+oqqdbkDr1EWktAgRtzdNlPirOM48WaV3MZSAoumUww4No7jsbfNd1
	 ANZroK+nDqGuR3SGdAFaGXVHtGw55FJaVTWiA8cGY+GXyNJLchuShsPm/hCFy8HPdjR50
	 L0VrlBZmnc1xJAnJCRLAGjdBKeYHbeL/D5B1W5fRNIB86KhT9MbD4BaHgThz3lsEvSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794331739;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZNaMyJGu4+F5mMshDHPxMzZXqWO6hzjSNZdXWtcX+jw=;
	b=O7IX7SJp+6xnjRRE/ODXN6S1csoFEONAP1lT//jyk/jBpg6Y9nIp8lWdT7sOa6YSfSeN
	 bnN1SN1L7emt65ayXfJ90p6zCPI6ZmAhY4UVxLGxp+NO4ydb/OA0dZeTVZkOJGK/FWHqn
	 okJe4/GKUPu4HmkQj3I41swD4tQBR4GPs1us5nLl3scSBK6/t0dKxYkGTetukxz1/48Fd
	 llvhvxHa5ccR6vwkaJkC/5bc+YQPAOM/S0IQwUceMuX4FE+N3beLrPCl+AVXRfuDM+2hG
	 by9Kc9kSH56JGeo1rLqVA3NKC5+35pYM7Dp/ZkCDujvTMMMppWSTBKeCLYMhjxcx0OQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794331739;
	bh=ZNaMyJGu4+F5mMshDHPxMzZXqWO6hzjSNZdXWtcX+jw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s1/55mrFgckuEYdFL4FQdE/U5nbesPeIlLibd0fzVBMdillll8VDZWYUL2TuOzRzI
	 Nn3qsW/5XZPC56FPMtkr27CPt13H2LyT+sPJKxQtWY60hoinVpYfzIILtHVtnySf2X
	 4L629Ze2K6163nwDJu9djBPX9Q8IHeD2bGdxz0oPE1h5Flm6mjqG96Ku9IvUuMgbxJ
	 YxRVGQiI+/jjhlQrfeIDij3ozLwA8jWx/53FVMxshXu7CrRH6DmzJiVZI2ItBQfInD
	 DDmZeLzjPGXq9dIoZYXTGE0z2OiYJ+P5rinz6sDd34YLGu39h8xbQTVg7x6MI93llN
	 /PW/G7Rp1JmDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 465AA40873;
	Tue, 10 Nov 2026 17:28:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BA6E731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2181E80F82
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mi8qEvnvworC for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 17:28:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3324F80F40
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Zpmr5oB5
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3324F80F40
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=/U/o98v6jrki8QLPpOzaAu5XnZWhhq44xpkzi+OPYIM=;
 t=1794331736; x=2109691736; b=Zpmr5oB5dUWRN657WUu4Fbta+hELjPkwawTd0VnJ89Cfh0z
 GUjVKGmxWsQxuiEQwaE1KGwyDUppzoXvKQrZNAVmF++auhyWm1ObWS2tHRv1/pl9Pn/SD+3PzLJq2
 9fU6k0xs1KvBPJPgrr+O3n2mkYSz/Ix/vpVA2b0u9PRDrrPnDmIwPELjcD3ExePXm41ujJJ4XtoEP
 LOj3p67zxxWrxLVkU7pvQuVAJgrjDSzJ3Oe9Wtb07HA6Vok+WYa+49ARER/rHOKNedv7KR4YxK1Lu
 QqgtWk1/YToj1wzM1WLXOc2sMW0Qw9J+GU06TIMSH9AmvJyAoC1+AxOqGFCQNBVA==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xQp3W-008H5S-3h; Tue, 10 Nov 2026 17:50:46 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 07f51775;
 Tue, 10 Nov 2026 16:50:45 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 10 Nov 2026 17:50:44 +0100
Message-ID: <20261110165045.3679658-1-aperez@igalia.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/bubblewrap: bump to version 0.13.1
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This release fixes an issue when opening directories in the new root
when read permission is missing, and introduces support for multiple
--sync-fd command line arguments.

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.13.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index 43b22dcb5e..2a7a12ee3b 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# From https://github.com/containers/bubblewrap/releases/tag/v0.13.0
-sha256  4734237473c0e5d695e4e9034a34e43b2dbf5164655bd13fa59ae376b2b7a765  bubblewrap-0.13.0.tar.xz
+# From https://github.com/containers/bubblewrap/releases/tag/v0.13.1
+sha256  0e85c8702248b8dd64144f594147553650cdd0e4c951690345faace79c217c4d  bubblewrap-0.13.1.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index a58d7fd143..4f63b8ef90 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.13.0
+BUBBLEWRAP_VERSION = 0.13.1
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
