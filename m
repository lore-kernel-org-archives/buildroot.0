Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D9E606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f83CCVOM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B169C81EA8;
	Fri,  6 Nov 2026 16:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3bBCqctifXD; Fri,  6 Nov 2026 16:11:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 449CD81A1C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981484;
	b=ZQQTsUAZJUcU+ya3uNgNEtfdPw5E3WHlqA2w41gNt9fTsn/RH5bs8+HnFbcwBn0dxd8j
	 9Edzr2m9LOu1izwUEB/oaQV/KwUPhq7BuV4w+Hjky6H9DQYkLkUKRonM6IHAOwiu47am6
	 osg1lUR+oQ2PevTEjwKkuebVLL0FcuAy7zCXY8GvzY0EbHGFvv0fY4I0g3VYMed3V1f6V
	 2taVZdehwONOLWcsmsI2etITGz3Ck8Oq9IL6+vUHf71m5/kweeGTzuUvQv86YWagVTPDE
	 SRbvDGogsJyCCvcz54SvI4fIdgklMAauV7stNZdTQ+Av7ypPTJ2H0L88FtaK9kFZVHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981484;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NpaxUaY8LaJ+Oj287kFuIgH7UZ+7QV2jWneIE3bcgDY=;
	b=lAfAECD+hy92cs3xZT0d0StvVrrFajNfX/7hpZXoPUqqPJ3n1L3U4KRG5Jzg6iI8K0zT
	 7YBfFiMktneKbLBZmAuwf4PVs+DTww+6SasciqA+cGfpGms3c8AlMDURDwk18Hisawk7M
	 s4fej0Vn7nTRXAsxPjgtGSLfqhbZSRbXD1B/CGZBQVsQ52T5FAwG0xV+VUzERYM3V3XTN
	 0mDkfagOsUBNGFy6RbWCfJZvvALobQ3tpzmG1uGe+w3zQE/fJV+YkOXFWEzjKbt1shjUj
	 DYKLyRB8kYdxYptLqA52Ouy6CwJrWfuMM1E0CVv72aAFgh1u5JAZJ5mSQ5owH45HGvg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981484;
	bh=NpaxUaY8LaJ+Oj287kFuIgH7UZ+7QV2jWneIE3bcgDY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f83CCVOMNC/v1TCFcRId2CizDRG/phHN7mPCtlK+s0S5rnLXDYD/p+M12TixyY6mk
	 BbAE6JeSS1UMX/W/l1a7TVFm4ca1mLsF64Od5LCobkv1qfBKpRGTPjI9uqCHoEwE8O
	 6La2q5A5TeIhTO3IxetuMlAt4eXihPvqY4mr+N7BbKjMdi16tMp86mWBmZWM2F2WdZ
	 husYkNJrqy5K5P+9EqxpQ8/ARHKLwe7VjRf46B+AMRCI6rzP+T9Ewtn5KXhGpg024/
	 N2L1uPWB1W3vQD1mSgMkitZDmeitu7e3n83DTOVW1l/lK6TKCJ2W377JGD4PN2WdD6
	 SRMRL8t0GdTWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 449CD81A1C;
	Fri,  6 Nov 2026 16:11:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65DC64B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49D7881EA0
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSLEQyRDrP4S for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BD806819C8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD806819C8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso8154405e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981478; x=1794586278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g986bbYnQL7TBHIP3ujub2OurWTJEjU08yXRNnYiwCM=;
 b=2awMM8+3Xj8o1HHGRhPj1QdtePjgfild19moSfbujHI7ZXeDQN2XkzFvy5evqa2qm0
 mT+NaQl1AB1RMKfmjVJDy5LnD001DQK6kXrPhHtqfc5jZ4KOYjD5B58/DgI5H+TLOsf6
 NpwgIPWngO7+yI0wk/jFB6BpdOLiv73r5VDAoOIg3+o2tdvZwJKxINY+ijnwuQfc/yqP
 dRNJFZcgEGidhCjb8HUxucvCJRTkyV04ZbLCeFHp2gVPtGVaauMPCPc83KreZ9sMZk0Z
 Q6JQ7h9Drsm23fNb+CaEBuoaensQvdmB3gNiUj7FwtxvhW9TVPMgSotzGlf8j0ufN0gd
 vEPw==
X-Gm-Message-State: APuU4Z9/BOUOAKyINXSln045DUTS7tCGVKlESxenK1NK1LZNXxRvEaxj
 nnZ3OpEUJ3hXimgLydFLtl6yl7a8jZIR5hx0JqvEHRtZI31d5jNgOXODDBlMw/ALC26rP8dYPQ6
 kUnScsP0=
X-Gm-Gg: AYBFou2kfZgJxvEJwd7UoTM0Ll/u581eb448hnaGol2NL08CI9nmxgRi1LadZtUwZVN
 jGmFqMjKoZKfKLTKgYK8QlCsXqJUxtg54+R0VBQ9pay5QNeTcWyBHCW4h1jGmNEwMiVYpCyELeB
 t/NXjGCkint5S8j6zbcXH+lLqZPx3xZGWxmfa9Rp4aVvh76gYQyE2LS35Hfgyl8qB9g7nXIGyiZ
 LelQ9oQmoxWmovVNAfJNjOMsOhfnwks3ixRXNXb3ufp9NFN24p6yUB7yRULDDWo8mz13lOv9NDX
 wm77bIb+0kzCOj9TZaJnPfs5782jMyRPrHO/bqRuaEGeYFaP51sOHNdpQldVIJSRB41x2+0zNV7
 tcuRK6+PG3+T3EKRLVypPZxg0C1WK5m69Ae4tpeTD51yiXsFXBU7YVvkGOfrVWEtVpcgz4NcPn8
 oi8WTcF3e8mW5oLYCr3dw3bCQfQIySpEdTnhra254V+1UK1OpKqMFkwJ6yMRFflT7LR0niInADF
 zrDffVlyUuwfhwJziX59hjn/MB14Hl0zWSSgBNHtnplunVwNKrsFXCTExMIYHWGW/8Of2Mmm8is
 y2AF60KYe5XYBVh/I39D/04eenUY8H8=
X-Received: by 2002:a05:600c:530f:b0:4a2:133:45e1 with SMTP id
 5b1f17b1804b1-4b6dfbabcf9mr49112645e9.24.1793981478357; 
 Fri, 06 Nov 2026 08:11:18 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d3d60e78sm4404894f8f.1.2026.11.06.08.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:17 -0800 (PST)
To: buildroot@buildroot.org,
	"Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:14 +0100
Message-ID: <20261106161116.608026-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031210314.3994785-1-yann.morin.1998@free.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix dependency for i915
 comment
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Commit 52ae9f49b215 (package/mesa3d: i915 Gallium driver needs llvm)
> forgot to add the architecture part of the dependencies from the i915
> symbol when it added a comment when LLVM support was not enabled.
> 
> Fixes: 52ae9f49b215
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Cc: Joseph Kogut <joseph.kogut@gmail.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Julien Olivain <ju.o@free.fr>

Applied to 2026.08.x. Thanks

> ---
>  package/mesa3d/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index a62956bff3..a1a5db232d 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -155,6 +155,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
>  	  Support for i915-based Intel GPUs.
>  
>  comment "i915 driver needs llvm"
> +	depends on BR2_i386 || BR2_x86_64
>  	depends on !BR2_PACKAGE_MESA3D_LLVM
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
