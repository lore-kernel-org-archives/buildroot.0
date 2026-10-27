Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63951606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 05:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DIglRFkn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=RelzYT97
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 421D680C0C;
	Tue, 27 Oct 2026 05:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suRG6RV_SOkP; Tue, 27 Oct 2026 05:41:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5FA4380BE8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793079668;
	b=Ql0WwbFOnvK+TO0eKTUeMnHZesPS8C12nwBFddBmic2PXjRa3UghzjFdEJrCRKG55brp
	 OVPpNvEWRXSurvcyZY3uG7znB1Wju/gsujDDXEvy8LkEYyak15fNFLvHOOhr2g18zFyBb
	 IOE3QqdvpfLJ93BGnS1BIXLgyuaZCWuhIJqzAiScu28xig8wlln9o80Z9E/YEs6UCmL4j
	 h2DXIXL3apwg5/ixMH8LqSR/hqPGlqPBITqnEgN1cuoSP3n2gfqZXEeYPrNR1pNEQbIGy
	 WtxMKGBH7uQxG19QO9DUj9KyciqC9ky7TY3pJYz9s6OzwUN/jC3DG4nq984PD2dryqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793079668;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HFjkgndo0X3oaivErNBHucmSpafOlwZCvXxUs5BpNeE=;
	b=FJSYVOkKdYyb5mVNeRvUeb8BSlLV3ngrQDOrT8Qmf0172OyqyLjMePjTpaB/CBNL1+R7
	 I6QHlCsp69MeOIJSyFLisVnKmnsZhkOG6QQp67foX2LI90H9pKR+Agnwl/yUhDzwzCZT2
	 qwuyhunKE7M2tfILjdIHOPEQhw+ZsvPF80fdwQ7goI6EiFEywEldqtT+RmMbKo12n//8V
	 605KkorHRh05cT4V/rUPVc9XHR3+V9cSCva/0Awy1zcb95jnQUbNSNoLRy/XMCq0jL1uZ
	 MzFA9qEkmrkqguuHVUqhe4jNdYcAbxbghmjbw2a3Eb+l/0QNmKwdGM7zHdRv3g/rb5Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793079668;
	bh=HFjkgndo0X3oaivErNBHucmSpafOlwZCvXxUs5BpNeE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DIglRFknQe9I8s42ohPpcQRxxZvZvRCTBRoxhw/9NQN3y5S5SPyH08FA8X0d4KHt1
	 PtYn/w//wsrvya3NnIglGfGk0Pe+CHT/ZKZ9p7PttTbO8fBJHDywBiEAfSHbbWUSFI
	 qVmpSh+r9hdv2Ee8bQUZT3emYvPcCRsvzgG00chvxi7uUFPA3OUuNubaEPbz08w7Vf
	 1Q6FBAdK23/e2rPlJ4+S/pLz9TDm4NN9ZS8e68zwLohusk+D+IHc72bMIPmC/MQAkU
	 ozWvXJxutN7eVT2DvWUw8gDrcKeuYDK2sSc2lJp3LA2e3Yuzzc/08wJ8owZMTnk5k5
	 iXJ1LUZwKwa+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA4380BE8;
	Tue, 27 Oct 2026 05:41:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9634D2AC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8817F606A0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSdWs4jsm2DG for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 05:41:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A856B60687
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793079666;
 b=pgNEq1xKVan5Y6F2VhTW0dQ71JS0m3RMUcKqvN1OpDYbkmMioXLR82/b++YeZYXcZUYV
 wyusfGeFCl8fqfz1YXr4mlcC5CD8zCSCvQLjpDA1UDNYk9mWltLTgKPb6wqUNpyocglKK
 4UgH3OHeG7/VwACHnDKNJKjDvWlObQQXmcW7jDb14Z9EbkAGACgovd+eMJIjQJOFFQUq2
 DvKVtZbZeYaxtXqW+YDRKV+mjelvQqcJ0JW/ZzQRXB8vvvOCwRS6ae5X5RbolK4f2eows
 M1bW6FDWwCZTvQ00YLyek6Z6H/blEQfkjQSvgj1ZUseY206KaoRtfGpycRxd3K9mMug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793079666;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=WpaifFLKW2Uy3EPtO6WO+oMnWxsme/DQmZkAt3Z8GpI=;
 b=XJmKjdTPfAyEAENFHKlUR6GMuM3E9OO1wDW77iodShBVS3hUnAuhRo2em6LsZoUTLgN8
 ZY/vyE3Rx4CmjwnuTVNoQNzNJzp7qMtWg6dYmYOj+Wi3M9OiC+GttGtuzhTxxWDOOQ4zh
 IgvHtIx8z2BLhSGaO6Lp86CeJvAFgUvQA2krfQL9uowuIQ9ARqUEgiN/ndDIWK9caZRzE
 KZwpWGaMqYUS4dO4JPSsrGXkVyvcwwO28Agt271rhLqfSfssJME5BA5HgbSs6zHCYJljI
 oLz/v7kdASp2pysDbOUAg/FLNzTu2t704r0VbxIQWv9rtCcMHVvI70d8RFKRv7LjQ9g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RelzYT97; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RelzYT97
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A856B60687
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793079636;
 bh=WpaifFLKW2Uy3EPtO6WO+oMnWxsme/DQmZkAt3Z8GpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RelzYT97zNwNoq1VkTALHIO5FrI6NK38vskyPzwG2WAPDMzi0NpgOrMCQz36zOKom
 d9uJmEjIHUDzOuL/z/8pKGrQ9aN+UgEdgFXyG2KrjxZlN1JssrYP3mO20rkIwtCiNL
 TDWYFHQCgN9R92wq++keJyf/oTg7BNZtUSSBuJRwdSMfnzD9XOZvWD0nUvxEw31co9
 UojczrBMi1pOiNmIZr8FaV4RenyyNTFVk1Q8SRpG56EugB3NnMAbojVjqaDhwDARrP
 SfAncZn6+sh7tMeeL7TnISjQlsLAXTEltSlgXVTuw19UDnryPCcM48sryHk0gGkZ1g
 Ur1UMbBayyf4A==
X-KAS-Sym: v3:f51bdf72230551df:idzSaPYQcOBEH3hN4ZWiwbOHktskG+Lrl0WEmAPz82oXA
 x9P0/DSJSXHsBWmUzjiYMlh4U2urOhQ6sNljK8Gg7MUrxk8NhWOS9gYGjyTLmLTvxg2NKYUqByQ
 7dOze/4JqSp46jsj9L2tZUUSPbxlImbpe+S1mid1JN+qG66oTpCOTj1jlmVx/uGnE8oLEisteQO
 220IDjhE7LPI2/8krbJ6GWVtTSVIBXMsNW+YemgzoLXfXrDGJiuW5ibak2NOeYDxYtm86VKzdDg
 vV4lQXuTdRQvbxp9s8WBa4zvXHqyKccFXVLeX7n3rkcdm+Y0yAZCPbCts49bgEGlLRgD5MQQ==:
 +75+fH48BGS8g37FHyTSB9SzR0QcKfxM6qE0sCORNOG8pk/Z84u/PiwhJVLrk6qvJ6Z/5vK7v0F
 mu856ap5+89uEZB3IjEDzrvIeg5lHQKuGZmw4A/+c2AOe3r6oSlOz2Zaxh16Cus/1EFn0F05to1
 eoPxeUAR5pG43eeh4mB/zAH6W1ythmysYJYCJ0ouj8EQ6ao+6q4AgrZPGfrUYJ+SMiaSWSFbRCo
 1ssfDZMM9vCijAd0h4WpmCwBAgauztVVA8XiHI1y/znEzm7B+1sDr/8rZcVnms/GC2An7VGae9O
 0hcXm6RpWMMcepVQcjibTDfHbwsRu58p48Njym00VJgBDRCX5bE6VaWrVyDPmWEFIi0gscEL4gC
 0nQ0ARRgK/gXeUjp2V/1hrdFt3ukUaToOA+PpcQkO84GyZl53MSsHGJsuGcF/7qiVwCnfJ3jOOp
 6HJHMZLmKIi3eyD0kQwVcudiYTwu7MAB9JU0B/5GOn7aAclIxj6RydLlgpJAIFuhvOiuRefBKsA
 eMmpi3EPmBqRmqXXF7vYYZEiKmOPY6gJBLyCuW6CdQyiG9xVmJpwGGuLe3BKPwcwi0kmwp8gkqn
 k8lmClfxGWFgz2xM89E4Oey8tKaxT9ZCTJmRxSMOtO6i
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F3BFA4C6E04;
 Tue, 27 Oct 2026 06:40:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58314)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLZvH-0000000078y-3qeM;
 Tue, 27 Oct 2026 05:40:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>
Date: Tue, 27 Oct 2026 06:40:29 +0100
Message-ID: <20261027054034.4556-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027054034.4556-1-bernd@kuhls.net>
References: <20261027054034.4556-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 1/6] package/docker-engine: Fix go module
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

When using Docker engine built by Buildroot, the BuildKit version
information appears as "v0.0.0+unknown" instead of the actual version
(e.g., "v0.22.0").

This occurs because Buildroot's build process doesn't preserve Go module
version information that Docker reads at runtime via debug.ReadBuildInfo()
(see builder/builder-next/worker/worker.go).

Docker's own build system (hack/make/.binary) uses "-mod=vendor
-modfile=vendor.mod" flags, which are crucial for preserving module
dependency information. Adding these flags makes the previous vendoring
workaround obsolete for modern Docker versions.

Note: Use "docker buildx ls" to verify the BuildKit version. This requires
a Docker client with the buildx plugin installed.

Patch downloaded from
https://github.com/home-assistant/buildroot/commit/eb49dd0b3e7cbf00ec3849349251b9798a7d7f43

Signed-off-by: Stefan Agner <stefan@agner.ch>
[Bernd: rebased]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-engine/docker-engine.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index bf2dc588fb..5502284dc3 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -25,6 +25,7 @@ DOCKER_ENGINE_LDFLAGS = \
 
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs
 DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
+DOCKER_ENGINE_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor
@@ -61,15 +62,6 @@ else
 DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
 endif
 
-# create the go.mod file with language version go1.19
-# remove the conflicting vendor/modules.txt
-# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
-define DOCKER_ENGINE_FIX_VENDORING
-	printf "module $(DOCKER_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
-	rm -f $(@D)/vendor/modules.txt
-endef
-DOCKER_ENGINE_POST_EXTRACT_HOOKS += DOCKER_ENGINE_FIX_VENDORING
-
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
