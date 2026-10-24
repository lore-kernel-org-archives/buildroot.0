Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736E7606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iHN7fJ20
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A38C160641;
	Sat, 24 Oct 2026 21:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJMbAe3bFpDq; Sat, 24 Oct 2026 21:02:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7CF2F60626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875762;
	b=k5hvoFOvypJdPM9A1r2Mzvnn84vChN6Gez506B6xWZ2mrnx6qjPPJ2MbYy5haeySr1de
	 jiURhdzCTXiZCa5084dZX+FgzxgsOL00xB1D4QqCI+pahOBUrGisEto9TiNBfU1BkIAUn
	 2z4FT+8iC6TxQj1WXvT4GRfAgGDA8tx41dJqc3IfJ3vOQFfbXfaAXZzjWZ+KcPeGRSbY/
	 ZHrhwuRP0PpnfWCSJ8ktD2O/WHfRV7JmjRKYCIZW5H1Q/L3HVpY++k7QdX7V9v1NaNX+h
	 hAqPzrkP1llFwHyRnh4nAYO47f/kSlvx/Xta3k5sLe2Pb7JDwDr1nORh2VzymWN4yhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875762;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wi1jvppjigls6daEbLNf0B3jPa8aaSaOJM6W5aVvhrM=;
	b=DnKnVoi9SYAatPd6CZobAfGHGHUe88sc7+wXNw1pLFe1qV6vonOT5i22TEu2l1wxfLkd
	 go3sjjTWWwaaD2UaBrxrO5oTew+tiO/ROBaLyjGtvta76blf96kASss6zE/KSy8/mNMDU
	 qtapeufMdlNwcr0tTt3B8RdEL+Utq08vnGqPvBratc1X46yN5iGECVHJbZfzTl1TQy9kZ
	 /lIYebPbeh2ZL47yvzsKzEpg605WJJNcFNms07BXStl7bVQ9NBhH2tb6kGieqkNcmkGKd
	 mMusBY+ksp6UoKNbiipXQJvKFxvhP/bZ5WOA5/+LMXypQsUfrVfP5Gl5zPp+jkrB3bQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875762;
	bh=wi1jvppjigls6daEbLNf0B3jPa8aaSaOJM6W5aVvhrM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iHN7fJ20Jm2eIWGoJoWU1aJ9SuXjxAadWkDWuVJkbpdqhk3+l8e5gkiUly7oGNZd/
	 QozciswZHX2hmGzKWVV6UAZrkMy0HryIDO03laQyA/WgExIbrLFxM0sXif/u1VGg4P
	 A48YCxeH/LCV3tiFMAfmpcb/TmtRQB4ZRyEaqXLdrLL1SFCkNM91f5LdCgDnF5CHQ3
	 z8rBK50pfvtiOcSxwbmgwSPlK5IwR3B/pvJbvcjYxWPlJz9cx8ROVexX3JjhrPrG5d
	 7GnPV7+1deh44NEdRatPWwFcqQ8sIMGL1z1CpzD7AHjHIO2aCMkzLFt34hhEvPwT6l
	 zQjLDH9phr5dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CF2F60626;
	Sat, 24 Oct 2026 21:02:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3841D765
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19D1B60626
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQm1EEV_EqrW for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:02:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6318860624
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875758;
 b=lmTnK9rsB8gBPw2+cMbLSbjyoG1OnKY+HDWPJ2Y/Jensl7CJJJx+SbCwpubBNNG6LilT
 3zBhQ7bx1cj1jh1NEDwmJOG3E2ZKOt20n4eEJk5STrQF2Tp7IEkphWjLlVNM54eD1gQxg
 M6elcWfXZfqThY1ik621jCuv9V4ToanoJecj9wCLDT86AHW6QijRJDFcLyDdrRalJSrKn
 /yGVIxSpqRJxO1hiN8VyXQ/ruAfsPVHY0u4Y88xSwC4/zKOwfAat62JuMXdJRKLFNVBqa
 yWJ8Hz23JPCWI6yLBFJh49guV73SDMXBI1NWCXPHqGUQZxa9eduWoybcj+E+heAOBeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875758;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=afcfdnnoda2grU8tyufWuL3Q6sfcNhlbV3E+vxgnGYc=;
 b=n9YcXxIiPhIjunx4KnkfrC22F4kKOwETFvy/8hogsg6lmlcMP3v3UveqGHMjWN/B4Vg0
 er8Z/aMUfHRgpT0gzGnYXH47Yl53ODjd9x+SHxYzFkl2pHfrAgXsfs6P+pgX4AmCJ3/AY
 rufjtsv2LyXwDBfbBildFms3yCz/cNublAhcxnske7am1oIPo042On8+P3D8jUb3NBCNm
 Y/T98etrXTBHmE3CkvUAys0jUMaNxpor4eoyfCZZXxrNXg2tT+yMRKyaUUh0LtUrrevUy
 rpJq/nGUCiaBuN1a7wV2j85DNz90vG7Oj3z/Ne3QUiM9i99NF239ta1lGciSTMBPj8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6318860624
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CB309CCB6; Sat, 24 Oct 2026 21:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:58:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92812b18fddb9217b18b1d1de9349af813760240
X-Git-Newrev: 729ecacededc0e0a366d1292f1d9e5128fb58f6c
X-Patchwork-Hint: ignore
Message-Id: <20261024210113.3CB309CCB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 26.4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/729ecacededc0e0a366d1292f1d9e5128fb58f6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.4.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 50d382dca1..0d8b0760fd 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6a1c5c7b3b1666273e2fd0060da13bb6d124f7473685a74c00f19044e813b14c  intel-vpl-gpu-rt-26.4.0.tar.gz
+sha256  7550feb11581709c884cfe8e8b0968b8b387ece23388189108005aeefde09ecd  intel-vpl-gpu-rt-26.4.1.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 1268c0fc1a..0bd9fffb66 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.4.0
+INTEL_VPL_GPU_RT_VERSION = 26.4.1
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
