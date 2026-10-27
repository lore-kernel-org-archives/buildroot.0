Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE935606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 05:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OmiRWgt6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=aXN3RoZi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7867480BD4;
	Tue, 27 Oct 2026 05:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXBL48FkP9PM; Tue, 27 Oct 2026 05:40:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F26BA80BDD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793079657;
	b=X/WzZFhRo5ytcNodGzAgoR1lGqofo0MWJXomw3/FM+ZVCxZNodeKBha6ihap/JJEUduL
	 KPUM450YVVsKgdmT212wgNX032mpJdGI0pvabfbumXKHFGGhkTEAt7Fhg+1lruPVdU5oJ
	 fyHyPm3d9z56qJ6whwPBLoETutEpmcMrOinGF0O2r+LnnPBcKjy3zE2hrd8fYwsrhQQkm
	 yyQfNxFdmTXvfbPjrxlvz14ZOp4nfPCVjjbow/PbkTDj+wPMu0ael0jbOwQHfWrlkU404
	 IX1WaeDnsuVxRmln2mUkzP71b/FQkUjAsUDjhZurraCB6vkE5DopqX3wCVBYrKAoWCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793079657;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hmKB1YkCR4HsCEf4cibwQ5bkisTs+cr+jh/U5+aGLHs=;
	b=on/MSt5kZBGxr4odZJV7YhKF6kSqJKAOrsIsa618IWy87QIhd2cXEm/fjpBDx3Mb0lwG
	 t6HOrZUI/uvt7r+i/6J7bgWJQmluBpbC10s+krs29zJnsVV0VkmlKxg3P+yeu6fY2M0hz
	 VvoHWdRwWtFCguM533i0+gexyQiO0VJzRuN39cLz1bO5cELmLtffgHoF/IkryE53tr7M5
	 4I3w0FGFE3bAqWiU0tiPWzcLVr8e1ixslA4on6NBZB4P9zE1A2uppq4fszt7D+a23BBJF
	 jHQckeWcCrf+mof4XHadRbJJb83WrVeLGg+FJAzE3xDGVtzy2DJaMpxxoNe4zBSELjA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793079657;
	bh=hmKB1YkCR4HsCEf4cibwQ5bkisTs+cr+jh/U5+aGLHs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OmiRWgt6ZJjWd+5kxoF4Q5pKAJ3W56Fp8s9xZyPAk6V1ampuw3UYvu+4OKVWAdTa/
	 YPmHg1QJkTVtCsEiNNK1pCBFAZz937s6lhdHJ+OUpb7J4nc3a0QQnYJWWobOKop5P/
	 AG5Y0FtMImyTKD/6/JPPZB0woI2lFNXDHDWdShpOidayFYpmNQVcdgS9ltrwx3MjQ7
	 W3t0HFDyBx0ee/l/A6L1jsRefU84NLvnzetiXJ8mKu4tjrzNU6VOw4i7jHl6LOutZ6
	 tpBGd7nYfBXR3WwKsLbIvyObTSzgOiTMdSr9lg+caJEfa3r9aynYJdWlh7fo6txjYL
	 CwNSwc9+C93Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F26BA80BDD;
	Tue, 27 Oct 2026 05:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64B34279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56847606A6
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y33wzMK2xqf7 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 05:40:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3296260687
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793079654;
 b=E86l3y1X0ieAaWKov97o18ER2BOLNwJKCBQkrQ7xPMBGGJjftQr3bwck+3iv6rcIpvT7
 Hnfo5MhzHJv61h/C9oCpohVQpawHmFJQ/EGFLq3v+FuT2WilsnNVdVJ9WDGEVGuUdm/GL
 Sig7zFzrn3D/o0LY75SE76hWQRYE0IbsWYpL0D+BLm2Am3M48qifIOyaW/ZD8QXs+ccSy
 IpLdZdZYc2NxzgvOfXwqEFLZJ/ESBffuprscQMByOzys7+LgkHLZ4rqOoicv/nLJtWPqd
 CXApV0INo8Q+0ri2v/+vq8YBj/Cw5kk1yaVvlRMzb4XJ87LKEaxBM/DjwJycp5Qyfyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793079654;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=VhpD68jd8xvxoWwjCkJVRMVSWXEIQy1adIC4zrLFhEI=;
 b=lWz8OTm68KlniPMeRQP9cE/Mgv1rTz1V5SZw91yZ1E8kECG73mRx/o7nyDYw/7u6hPR9
 WZcnODNeibHIDwo/VMQo7bqMXUCwMLKlSLMTTShDYGC/J/CDkYfPoLWHP7VkRSsHbRJ7i
 XSfGVGlg0uToAlKohOfOruvPvwcEZxORD5olhUDJx2JstNNjUQ1I2NKmnbJdYJyyQKa46
 qJqDANE37GCq0gg+/nKFLCStKvfxiExxi4+AXTegPvog2DKgk7m1SxBiagKPeWv2K5Ufg
 Ui7N50z7STptD2QZwbygIjzI0eXbwbkc4S0d/zImgi4Np5+qkytYPQz4FxVuqYDAbEQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aXN3RoZi; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aXN3RoZi
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3296260687
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793079636;
 bh=VhpD68jd8xvxoWwjCkJVRMVSWXEIQy1adIC4zrLFhEI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aXN3RoZiFZtHjll2KgH3oGJ3EELzbOiwRGrUgYChNlgFSLltPmvHXhlQsxsbR5ROQ
 +CNjYuiI59nhVNWlf/WwjQEkE2tHmJHUsDgqAT4/7v8/Vd1hCiGL45MrYN5/ktrKGF
 KYbdqY9nW3MoIXYJF3is97cISNCM99zu1UDvLyJlIQqUTZuFNBCxeqbtFLq4vX2m8P
 pC23erTBiefaSJCVEuLk/VPJrCH9JLRpfD9lZAmhb5fMocUGEzpnbnaTZqtpSgND5U
 hjedqpNqCZt4VdEfgMemdpjS/IQOXN31seYCCqrIOMAnTiex1qf/sGzBYM4d+tBLuP
 QOnnXTFLYm4AQ==
X-KAS-Sym: v3:f51bdf72230551df:idzSaPYQcOBEH3hN4ZWiwbOHktskG+Lrl0WEmAPz82oXA
 x9P0/DSJSXHsBWmUzjiYMlh4U2urOhQ6sNljK8Gg7MUrxk8NhWOS9gYGjyTLmLTvxg2NKYUqByQ
 7dOze/4JqSp46jsj9L2tZUUSPbxlImbpe+S1mid1JN+qG66oTpCOTj1jlmVx/uGnE8oLEisteQO
 220IDjhE7LPI2/8krbJ6GWVtTSVIBXMsNW+YemgzoLXfXrDGJiuW5ibak2NOeYDxYtm86VKzdDg
 vV4lQXuTdRQvbxp9s8WBa4zvXHqyKccFXVLeX7n3rkcdm+Y0yAZCPbCts49bgEGlLRgD5MQQ==:
 nIMIiKIvM1JM9mDl80gVEiitVhY7zo/O2wQxnhwfSy3SyyTnCVmJL1dceuSHSF0Y8HqMsDMiZEo
 grgxv+SEggjvo/8+4rB6wz0HMny3LLUgveXFWS/Un96Hsd+Vl84m+agptZUcYk8O2/vrfo83SQo
 0k6AG9IXq53uJab+us8c4kT4uy0osst3m0iahHZ21SGMrXrNtUvIIi1V8iDODS5IW3ApoGF2Bak
 J1rL8KJclsTmMssVwcHNqhpHTTiraZbktiD+N9lscX+JopDhzKECXbS8bJ5ly0Khf5hB5pl9wIe
 rmQZCe+3eNonH4BLeZ2a5kJhV0MydbG6Ll1ki4DZuLz1WkQ2u+PkOSgTfvbBicoZ/GCyDjqSSRt
 238X8hxIkKwBJDi3zYpHZdE27XZYqioU5BnwcWyoDinm7xV+q4RIRWWptIhqEZNbYkZq6Eil1bS
 x5mdiguD5H/PihWSlDROvoHW9Zp5pM7iicmba/0bHq9/Th3ZT002V/ujBmuaRJsIArayrhZbg9B
 mRF4MYs1sw/8p8OVmjCjDi4zPsmJzQs6oR9/2/tQf9W9NbS9DqOSzOvTVaxgTFSrOLii1K9Kc8q
 Mv4z2gJef5eTBDg/xNGPWcue8t7fnDphzz2sPhuRzEML
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22D54A4C6E07;
 Tue, 27 Oct 2026 06:40:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58314)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLZvI-0000000078y-00eD;
 Tue, 27 Oct 2026 05:40:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>
Date: Tue, 27 Oct 2026 06:40:30 +0100
Message-ID: <20261027054034.4556-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027054034.4556-1-bernd@kuhls.net>
References: <20261027054034.4556-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 2/6] package/docker-cli: Fix go module
 version information
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

From: Stefan Agner <stefan@agner.ch>

Apply the same change from docker-engine to the docker-cli.

Docker's own build system (hack/make/.binary) uses "-mod=vendor
-modfile=vendor.mod" flags, which are crucial for preserving module
dependency information. Adding these flags makes the previous vendoring
workaround obsolete for modern Docker versions.

Patch downloaded from
https://github.com/home-assistant/buildroot/commit/dba1173fb4cfb39624621f328fd2811f50a34513

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-cli/docker-cli.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 8ca74af7d0..216cf70b95 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -17,6 +17,7 @@ DOCKER_CLI_CPE_ID_PRODUCT = docker
 
 DOCKER_CLI_TAGS = autogen
 DOCKER_CLI_BUILD_TARGETS = cmd/docker
+DOCKER_CLI_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 DOCKER_CLI_GOMOD = github.com/docker/cli
 
 DOCKER_CLI_LDFLAGS = \
@@ -29,13 +30,4 @@ DOCKER_CLI_TAGS += osusergo netgo
 DOCKER_CLI_GO_ENV = CGO_ENABLED=no
 endif
 
-# create the go.mod file with language version go1.19
-# remove the conflicting vendor/modules.txt
-# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
-define DOCKER_CLI_FIX_VENDORING
-	printf "module $(DOCKER_CLI_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
-	rm -f $(@D)/vendor/modules.txt
-endef
-DOCKER_CLI_POST_EXTRACT_HOOKS += DOCKER_CLI_FIX_VENDORING
-
 $(eval $(golang-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
