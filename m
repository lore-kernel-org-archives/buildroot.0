Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3940E606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rBHYPEdm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 162F081BB2;
	Fri,  6 Nov 2026 16:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3OJ60lqPn2W; Fri,  6 Nov 2026 16:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6EA5081B83
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981399;
	b=Lxd3OP/ttcsXx+j/uFCVLioc0syS29zVROKlDms69Lz67+Oc0YMhmUdhbJD3syrCJ2QL
	 vDh59pBtr9dQkeG0Jbg6Er3eqthlReMUFjJFRER4jmJxzKAOU6SqDCfsnjOlHmXYu5JDI
	 FAygcnn7xWC2fAdOIR5SvG7aEZ4g28H17rnkDe2lFWUSwucMg3+n8w5/GYLQSs5Pu8t5M
	 DfGOEP92/xK2l7QKXblMvWG/s9+VS27JIdHUm3IesOLeNndfZ1Q1w6qwqmyYy9hw7oDOl
	 87eRxjo+6EQl9IKOUglp1UU7HtOwtuAh/fOCyFvhARYfR/ttmwIzywgN5boERfzyjdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981399;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=w3wCWFfRnDjpbbr1omjn9/CA/4e3PrD1Wh4p5RozH2Y=;
	b=SJv6FA/c5l5eUylJRW1Bs7Oo45ng0FXRfz5X1hw/50dCAGsgyIN0tnw5Fg6BL6kBDxTR
	 4naRMoMTdqGymYTtsFtFnZrp1Y+NEu5nLR9/EHEzBoojNyVhwZATuv567DFJBb8wA1XRB
	 afGfovfsu5d6h+1LbDLjQdh+6KpWsqBjD4/pJJzK9E9/Yiy4brKmDa0450f58BabOvx+X
	 7/haXFJediUr9q9rZDJEnF/ZqE05iVMw4oM31Xl1quitCtTwYiJXBzUVIwlMtQwFke/aE
	 hdXKnvF0R9EnReBlhyZwrnD0ZIdmCH7kED5+GHzTFm0nrut4t0alh/NIWv5HOG8mKkQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981399;
	bh=w3wCWFfRnDjpbbr1omjn9/CA/4e3PrD1Wh4p5RozH2Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rBHYPEdm0qodp5qYfMYgxHKzNtR99IuREuOwb29KIMWhwEKpCyZRh/U41lVxMaM5Y
	 ogJr3OFmRqBgExYfjnpon3rHOfCdBupWzYqzaIaDKdtPo+EoOvWYMzwr+6JJZGNWf3
	 KzpmG0B9ydOCU16kR/jJPSObxnzBTZb6eFcMRGNdD120xani3KNMP0sRpXeqhxpI1X
	 qExdXg+oSjrtgIzZ3sagG+ybudQx/DJ1OnCDE6w/owdO8Zv/EOCbgY0xT0g03Fp0ks
	 EtfXYUU3AdAEtrkqdijMVb1ZfslNFm7A6OE7YUJfQLjU5LSL6Nl4fyOjkOvAyx9IBq
	 PBZYt0HLh20Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA5081B83;
	Fri,  6 Nov 2026 16:09:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7977C4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FCC660A81
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stGdQH5bZidn for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D50F608F2
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D50F608F2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48e47347279so496290f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981379; x=1794586179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=N3yaQgmMRV4m1gIB5o7Rx89zy58lhe3EbcMLTjUKLMc=;
 b=G2ew6QwvuKmEFOwjQ8uevNuYEnAkXp0LjV/qeBttcJzjdAh+Fap5MAg9wNuElC1VWQ
 u5h5UX3DbonKmYyQoVsTsGsTpsG0FrAiwl/l8HueYmt9wBZXzPkvAln3HpqVsX8qx0d+
 oooi4UmBIZejjCob9+NpK/d2IkpmSYZTP63J8lUV0JgHRGC55q9w3WzHitvLDOMfwBxg
 hFPuJ+nw0WrcpxXjFvLngoUcBIUVNOuGpE3+ftUxZMagQ5l26beJuT3VAmksszmEH2/T
 qQ4m0pF7yUlFbTXLe8qJgpo8RWLVcabe60xH54umfoWQU1CzGYgGFb0W+RkJAPTsR5Pt
 F62w==
X-Gm-Message-State: APuU4Z+y9rmXiHXniPOiomWDtsGADOdrUeeJ6zpVai2uEbLYa5KJLu/T
 4gneB7q6f3RYM0UbytnouKZt2UQvUHJjxKvgEtDmLYqHauZbAAzBf5nVZmR6+So+onREl8MGzux
 pWuKzL/k=
X-Gm-Gg: AYBFou35nPPdV94gdeDX7vTB5ilVW0dvMHfVntxfx7HlYSGlgcViuPedn92V4aDK1eP
 kZhpswsLpSfaMI5c27RBvJky0fW+ZvIh5IEtstQoZ5viGpfC+5z5t2xPcs09gjBjTr8F1a/cfXD
 U+sWydT3m/WqdirR2lndv1w+mEW1yyu8Wg3v6pz1oqERDlcq1SHrz7wF1k4i5fF6nJVY7gFG0vX
 uFpXy81abzzC0LpzgGgikBeHr/XkqAQAWh7xq3junHQXamnVcGLjCQ8Y32luw96G5nfpSvm8QNK
 Wi3LJv1Ux1kz0XnNQeaPw8TzH9IV+cQq+Rc//nTDkQ7lcU/eGEE40rw2IJoOy9bHIKLDePnB1c4
 796cEoSzWPOY+lJgzI2TbehiqpR6Nm06UYT/45X5Gv+8dL6x8ev30HjRwUm8vA5sAP7BhMJtdCZ
 LacMwGY0XOzUY8mkmBKTTwrWdHNbhRPTsP/wSsS9G4Q38X4esfr86+lpvIsVY6WHB1C/vBKqCoH
 oYOOAVMddaqVIi5wc/xS8uPvFBlT+pCEv1/793QdTFa7ktXqVusZ+2+IlztKA+7uqB12JJH80sw
 hUnDTAUAIglLnT9+YHbdcccvHodYn832skRa4pEQOJ4vJr5JzLEuKg==
X-Received: by 2002:a05:600c:1910:b0:4a1:7e76:d02f with SMTP id
 5b1f17b1804b1-4b6de4a6b88mr51242185e9.14.1793981378690; 
 Fri, 06 Nov 2026 08:09:38 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e168f35bsm72477555e9.4.2026.11.06.08.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:38 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:35 +0100
Message-ID: <20261106160937.607250-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027054034.4556-2-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/6] package/docker-engine: Fix go module
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> When using Docker engine built by Buildroot, the BuildKit version
> information appears as "v0.0.0+unknown" instead of the actual version
> (e.g., "v0.22.0").
> 
> This occurs because Buildroot's build process doesn't preserve Go module
> version information that Docker reads at runtime via debug.ReadBuildInfo()
> (see builder/builder-next/worker/worker.go).
> 
> Docker's own build system (hack/make/.binary) uses "-mod=vendor
> -modfile=vendor.mod" flags, which are crucial for preserving module
> dependency information. Adding these flags makes the previous vendoring
> workaround obsolete for modern Docker versions.
> 
> Note: Use "docker buildx ls" to verify the BuildKit version. This requires
> a Docker client with the buildx plugin installed.
> 
> Patch downloaded from
> https://github.com/home-assistant/buildroot/commit/eb49dd0b3e7cbf00ec3849349251b9798a7d7f43
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> [Bernd: rebased]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/docker-engine/docker-engine.mk | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index bf2dc588fb..5502284dc3 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -25,6 +25,7 @@ DOCKER_ENGINE_LDFLAGS = \
>  
>  DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs
>  DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
> +DOCKER_ENGINE_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
>  
>  ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
>  DOCKER_ENGINE_DEPENDENCIES += libapparmor
> @@ -61,15 +62,6 @@ else
>  DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
>  endif
>  
> -# create the go.mod file with language version go1.19
> -# remove the conflicting vendor/modules.txt
> -# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> -define DOCKER_ENGINE_FIX_VENDORING
> -	printf "module $(DOCKER_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
> -	rm -f $(@D)/vendor/modules.txt
> -endef
> -DOCKER_ENGINE_POST_EXTRACT_HOOKS += DOCKER_ENGINE_FIX_VENDORING
> -
>  define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
