Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B88606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1138380F8B;
	Tue, 27 Oct 2026 16:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbUsQ0OTNpkx; Tue, 27 Oct 2026 16:03:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F03580F6E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117014;
	b=F1Mywq5zgKG1J2RGMVRcbjeRaPrg5lc6m+HDZg2CQ8BkIpbNuDw+hj87KbqrSLbwrH11
	 x5+0C5dzhMOsR9FQI/soMKx/SZRsHqXg8ne2iLn+fM4CCig6JmTe6eaxe99FMFQh5stLN
	 AT1KTcfsIWRxW76bgcr3UOS+gFUoXqRuY/sD2EhvpMq4whtiwanR5V/uOEA47Ys8txkIx
	 qFcjy7PxdhN3BSDgzqHrp3HCBCc9SnEGSZ4KdvFaNKqle8jDQEBkVOiQ45FuejwaCL61/
	 H+MU6HmfQHuxII1y8gbD0xmV5SpHFcOt6MSnJzfkQFmcRfemdIEYFWgpaF/zxjISO5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117014;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RhYGnRGCCgxe19JrIb0y53VGV5w5/E8hGMKsOe0kGgM=;
	b=aEoLDrEfTTfTv+QMx69kANRKKs6LHfJLgfG3kTzgyEces1ZHAcLrJA2S1Ph7+ZsxTlJI
	 LRyNFFFghS8dI8+tyRiIB4vbkxYpR6QMU1ckOTB6RNhhKh6gQEy+Vg6Fa6wZ7x/VATG4R
	 nRlUGcvYiMa0p6z5vk9PhH7txUv/PMHPI6fnDUDgZ2s/sLGcjD0HX3KSbbprZuMXjqF5r
	 tF/Rq2OoI7SCDFx2lv8i52L66YoDFcRfvd+EcIqNqauBaHmDVJzqZRZoYphNQJfrYvdRf
	 Lh8OxaASKp2H33OH35qwsfHBdqwuUxL/xekPSk7/RMyF6c9kDCrOWCNzOMGQd89llQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117014;
	bh=RhYGnRGCCgxe19JrIb0y53VGV5w5/E8hGMKsOe0kGgM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NnUkIC8W8NthLJi3h7dVUBbyJ6KriTWpXwJbsY2/PWMcl8EvAtErMz3qW2ge8D75f
	 Uu/MgCdzJW8e2CusZQgv/kyikjA7gmoV4xKUQZZ7tYjX/JuYWHxJNl+Xim5ceOeEZd
	 lV8KeCuNPn7sqE1gppOHdYtAOS70gP1eSfWsgZB7bmE5E0rVXQo0ikDAM74lwJ+lLT
	 UlAG6NLkUOKfFaz+wFu3/63vpn11istCd19+s6JiuOtbuEz/fuIasRQzzFbTKJWAZy
	 /S0/sEhzFLFunnw9WXxZeRiO4rVMlhzG3aakzQ5wrz9WVEc3RbnyLKy/Lttqso88yp
	 DKaaJr1ziYetQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F03580F6E;
	Tue, 27 Oct 2026 16:03:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C922279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E16B60794
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9fW9NTGRIwL for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:03:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3E32460768
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117012;
 b=RjA7Wm/oofA3A/RBVdxxHlcs0nxjSlYu4r2KveqX2IZZbL8IMPP89xTJ9ixf0v7iKLj9
 m5NrNr8+Nuq76lhKtDQVzrEwyt86gGwhViMf7ZNjbHkaoLoOyl2ujE74he05mgsA2/VSj
 8lD3TVBMwxqqNImtaBXDMiPibvUVhYkU+tcs8LbURY5f4r2BYQE0mq8PiSqYekFcD0mXo
 iIoW7CPkgOcp5EtkpedbXLLWXmwn0HsZ2XS27JvrVpoOXADUbUVL9//ojJvBUHXJpbgOw
 92TQ1JlT3ahyHb1iXpybrtv+aLzwkbs7vkJmCukhOOy2o+gJT2rcKMomTFB55nrM2Tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117012;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=oArpRR5PaqH77tLP5vPL0w7ThGDSWmUJ74Xeco4kgOU=;
 b=cpSSgvzxRPHj27NCL98oJ1dabzz1dPWRiUx77n855R+QgtDKVFcRDQz0DxoG0Qkc1Cc3
 Hyl57XiG/RME6AuhDotD6QWIBKnaNOidPECliaNsluohI6NcGUEtlCuJRY+c6+5UcKZ3q
 SO3kqoryYoqqXz41AKoSD7VbphmPrDV5t13qe3GWf9El9QOesyOHWRILuLnbX2llrVBIi
 sXIsa/8HBpfs64mPtyikVWfZuAH4Rcsqch3djRR29dMwND0lvdkicHj84cyQUgkfktUSx
 UlujXKjZ8ZE3WsdDMpU7dwz/GltyIkJ/FCkWPHoacU+R6kghk82Zth81LmqZB+WblOg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EaMaXMBr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EaMaXMBr
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E32460768
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:03:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so5033f8f.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793117010; x=1793721810;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oArpRR5PaqH77tLP5vPL0w7ThGDSWmUJ74Xeco4kgOU=;
 b=EaMaXMBrQy/SouvKau+dRVmCCwe4/CKsEeNHbjJwDG61LFHACuVDxd6OjRe8GU7mvf
 3qYM39JheLycaS4/WPlYE2Pq4TIMdxGJOuIuZ/TFlzFN8GYCbyQSSEpxF6PcwhnpsuLd
 4FgEzCuxOEp8gcpm4d3Bcnjeb5nQKLhXPEN7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793117010; x=1793721810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oArpRR5PaqH77tLP5vPL0w7ThGDSWmUJ74Xeco4kgOU=;
 b=YKZ+DGz2vbY128PnBxvm26FkFMgU9z1VzNXKb32U7j3WcPdq6qUmi+S9ZdT1gfKgSB
 tCEbC1tSxE5rA54XbSUMoQqRfdaYzHlktvdKSFOADSr4b/hEWJoQcRi2yVvA0jf/pGhj
 0nwyyxi4z5c/DclklEDqJlVx06PBn+dUV3BoU5deKSqWYV6AiuqtYPKld0c42v6ZO5Rv
 m2Te3213OScZt0rLGGqwh8+O0HD2z0QOUCvUt08PG0N9ygw2J9uAahCbWvn07aoh0lPE
 tlxp5PrWybM5eh25blXIcYyv6CqxqeJXDjpeAQ03bAMPyG6RbxQfRsrLEkW/5+VQxsNI
 K6Aw==
X-Gm-Message-State: AFq9FYLDpX9GvcHgb9KzbK16oCaV1bTvzMunlBJI+XjZcVJL9/+2RkB7
 /S7TsGqb8rU11NWTwR1WQUMfzykIHMcjMTXduMUGbmELBiT14mPI/1aahN9mnJPeCHiiww6Xvgy
 h2nhw
X-Gm-Gg: AYBFou0ty7iFjLcdJcWJIszhpMSkMNJSwyJ5WhHLohxNJIw1xboJYk8rYMAs+RlXYYd
 yeOQcyJkE6rUiOJs8bmb5iEGRv47YTQ3ld+DMYRS8u+XCkbZ1Sq6YEMIJKytkRA/2aF8Zbh9Sev
 PkxbeuQpFrZztAb2J93V8yI3T83ePWEl73cT3eGBfzBMd9d5vB6bVHLEHYJP4oMRGgLTBEXNBJj
 qoW6/KqgfZAOqgXESEt76T1vuGWGk74dtfjIqWgqRF2nM/68BhAKjb/5UvvON7Z0QOUdyy1kUk0
 o/KBEHNpMIGjI3/N8mcTARM/lddS2K8H3tOLY5APJeh8iOwQG3QPjPraTLfFcRa1E36jeFbKnFe
 wBN/juU6B6md25zdmBHNIyTaX6PSo+TwtOwFrQTMswyxkXqviSGw7h8PXrc+2wo9gd3aby6kfhb
 PzAp8IYLMEKATeoyhTdS1OuzcYt1/cxjCCp00A7wtNessLaP+fPCtLM0MAleSAqjIrBdJYWJb4m
 dkX78DTWfUmhAe50NcjrBUJscWpuNhPsIsLHjk6D0644Gjn2agYulTbFl0Hq+AWVk97WkhkJtVB
 Ikjup+ALC2xRMVZvc7uve7DsZcEG/4io62Bg1SlyRYQ3XBiq2Ur7A5l7X1ACxRsGbnJLSESsCHP
 RoUvZItdqE/DQi6apyiRRDxrh6dpuoSDq4LmMO1hKc307qWkTGZsF1BUb4N5CNttWCSvqyLtGVQ
 ==
X-Received: by 2002:a05:6000:2501:b0:48d:f14a:9173 with SMTP id
 ffacd0b85a97d-48e3eb247a8mr18744885f8f.8.1793117009563; 
 Tue, 27 Oct 2026 09:03:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd4ba7sm23751917f8f.33.2026.10.27.09.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:03:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Oct 2026 17:03:26 +0100
Message-ID: <20261027160326.1690238-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/drogon: needs a toolchain with
 wchar support
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The trantor library bundled in drogon uses std::codecvt_utf8<wchar_t>
to convert strings between UTF-8 and std::wstring. Toolchains without
wide character support, such as uClibc without WCHAR, have a libstdc++
that lacks it, so any executable linked against trantor fails to link,
starting with the drogon examples.

ld: ../trantor/libtrantor.so.1.5.29: undefined reference to `std::codecvt_utf8<wchar_t, 1114111ul, (std::codecvt_mode)0>::codecvt_utf8(unsigned int)'

These conversions are part of the public API of trantor and drogon, so
they cannot be disabled. Add a dependency on BR2_USE_WCHAR, together
with the matching comment.

This issue has been present since the package was added, so it also
affects the 2026.08.x branch.

Fixes:
https://autobuild.buildroot.org/results/6b893fea68e25fd928daabff5cf034de76062ac1

Fixes: d38b4915e9437c5492836914c0a0fff12b4f1031 ("package/drogon: new package")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/drogon/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/drogon/Config.in b/package/drogon/Config.in
index ce8a8313bded..c5e20c2017f6 100644
--- a/package/drogon/Config.in
+++ b/package/drogon/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DROGON
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++17/20
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # std::codecvt_utf8<wchar_t>
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -45,8 +46,8 @@ config BR2_PACKAGE_DROGON_YAML_CONFIG
 
 endif
 
-comment "drogon needs a toolchain w/ C++, threads, gcc >= 11"
+comment "drogon needs a toolchain w/ C++, threads, wchar, gcc >= 11"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
