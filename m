Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CCC606D80D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dQNZcqn3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8380F81AEA;
	Fri,  6 Nov 2026 16:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvlT4-pME2K5; Fri,  6 Nov 2026 16:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B95C981A6A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981392;
	b=BCAP+WXD/JVffB5EIG3m2IknE9stIBEe7yI8v7a/0W8JFg5sfwB4mllEDemodpL/PCg1
	 qlm8d64K9E8un5qFcVkis64bJ+D0rwdTqLg67iDvipEZn3gpM9NAO2c3yPgIOhh08BTSO
	 cmsu/NKlybWhS8hz7n55cR8hIrLssPA5sgsDQwhzZmo1yBGH7wcprc9O+U3Ahy/GajWKb
	 pPsj2SrfDPPERotgYEIVY+mHobZvywcJcrZykdsT5Maq+RLsd33P2YLf19tmF3HibEdzy
	 ysvCkw5dPCbSSAOaNDJ7LaYGNv9aqTT+qDjzeI/P6f5QILCZFagoWJgQOCJg4cXoBvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981392;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cXQAV0F2JAjxipsjic+QX70cJdItShncjBlFshuSoFw=;
	b=d8dmHn476Vmx1Lfu/X8C2tOacpGSNdPTsr5HWnc5L5ImI8LOddQG7fXJ0yaO0TGBwWM1
	 zFsgGnUcqVEW+xT0swdKEh4nz6AzXT64jjHoAXO10jpRFVc0RbfraoTFJBTWfmvrXOjS7
	 6dcqPkjHxoe/imyCwnYWFBGC4LEttpNmwZq5eWzTichf19D42oQh7q14dSQpXgg1KBatI
	 ZH5OadMKf3xx2d5mBwsxZq8Nuy3j+S/exhdwPJGR7tu5LVnvxji2VDF4oqCSeFyVMmwiY
	 Ez47XvDCuWZsSMrzlEPYMIyQX+plRZdxVd762jCM+/GY87c0V4a8g8YCrLAGfWtYJig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981392;
	bh=cXQAV0F2JAjxipsjic+QX70cJdItShncjBlFshuSoFw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dQNZcqn3ke5827IYrN8kVWH9KDyssQlohn9ecv9y0+jDOVqcWDlbOavgXEzrKndnM
	 6GrkDGKRha9KWZ6uGtxiHpmusdgWF03fuDxLa10PRxI2zUKa4nNFXep65gj0T5DdrO
	 /mulzIeizZVyRQ31Mh7eUylqNCXcXC7nkEhX+MgwCIPfYumBwBKTPgeWHKxET+vaMv
	 sGuYnU3bINKM9eyp5IzOpVlL0o3iJXITsomc8lq3hCIevAp0ux51teN0mLSSjM/Bp4
	 aHe2dLOypc0/F/my5IeYUo9yj/H3VEBimlT86JeEj/ESD3i34D8N5Ck/RgNwvxwE1D
	 X1SKYmkGqoYDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B95C981A6A;
	Fri,  6 Nov 2026 16:09:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1448E4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0602B608F2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6alx76SulQzq for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CE93E60A69
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE93E60A69
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so7954255e9.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981368; x=1794586168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c7grQANpV4NnFjxTi4OTkTi8Ci/1Vfk/iDyrhskbL78=;
 b=rRmIpHbYR2a/UmPcIr6FAW7yKzF3KAO0fa/Km63Vc01+gtta06kaEjfXvpIgaYKePz
 7ZYynIonZxkGBc1+fXbK6OYqcV9E2LL6h9+IY0/mqGl9eg2OdVIM/ngZ/p9i3kd9tDvc
 6mMcYAacYkClrL5e7wxiG8QeaUot0Nf2KlUsTwLnTHcxodqHEKUgaAKKIbliB+VvNmEO
 VxB6dPwwnGWcKl5S/Sz6AhajVp/PI9KekwaveBdXgA4CtV3wL3cwQqYv9V1CEwm0GYpi
 RbyFB9/JUxorMoQGyZzCaq7rDOg7JqvvrDyCL5YUyMNXub3US8vag1ByqOGeBw8UjZnJ
 Pflw==
X-Gm-Message-State: APuU4Z+XGupIftBXDfUs1NtIvABiV9P+kcn5ylul5HVMxdwdctTM7n1B
 Z7CsHtrhwReOS/Rwudip9DzAW+K7shhotnoqYc7dr1jEycInPdQzUOpsNbZ18yG4VSiX/GZetYY
 xfZQAgA4=
X-Gm-Gg: AYBFou3O/1O9wf88MuZwcSWanP0ylRMC6nbBX7T1Y5gXDk91psKCkNNljg0WvFYraYr
 o3PQfKQ3fXE0fnskpgh3pDeEflN+4EwGDkCPCk7HS9TbRHz6in71xsO/ux4JCcDpZnnuKWg5S76
 hD1CDH520XKhkjAXi8ee/4Ta7pwT/SfCcb6wfegiasMC+imFzdg5W8oYNHB2x7J/kgaCyNGucow
 c6UDuHriE4PKYtIU+CVlHIb9/xK07YpfHs77R601Rw6EHsQicFlpzUWN2bFU9VgcTzBaNSQparM
 A6PM8Uy78RQlClVD6iTw8ArCHi9kokmrQe9nFzUHf96I4khCHw7fRTP+V5h6BAPUT6hEBwC80Vt
 LY+qTihUhMOnt4tfKZHOsLHWi6TPgQdqOcquIJYczwwm4L+2HzjRga8/a7G3+le+fnPdwrtl4QU
 Du7kxYv3Qj9dRipn53X1OGJvuU7BcoF/YA6894CiL2G6I+aJa5nreEgA4+TBtFSQf3qN+ueHpqj
 lf2THVXyB5R9ZikOn72VI4+4aYIp10EZAhuy92TLsi93FyKTduxNs8jiQf8sIZ1f564P/LzKu5K
 e2uGeGzPqUhPMHiz26Oiry/xyTq4c+5d1i1tu1fXP3XzxV8w7knn
X-Received: by 2002:a05:600c:4e0e:b0:4a2:1364:252b with SMTP id
 5b1f17b1804b1-4b6e054920fmr52199135e9.35.1793981368427; 
 Fri, 06 Nov 2026 08:09:28 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b76cb772e1sm10080875e9.0.2026.11.06.08.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:27 -0800 (PST)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:25 +0100
Message-ID: <20261106160926.607165-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026190956.376568-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/swtpm: security bump version to
 0.10.2
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
> CVE-2026-75900: Fix length check in SWTPM_NVRAM_CheckHeader()
> https://github.com/advisories/GHSA-gqrg-h59c-j4wj
> 
> Upstream changelog:
> https://github.com/stefanberger/swtpm/releases/tag/v0.10.2
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Applied to 2026.08.x. Thanks

> ---
>  package/swtpm/swtpm.hash | 3 ++-
>  package/swtpm/swtpm.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
> index ebad1ef4bf..4f6cbfd61d 100644
> --- a/package/swtpm/swtpm.hash
> +++ b/package/swtpm/swtpm.hash
> @@ -1,2 +1,3 @@
> -sha256  f8da11cadfed27e26d26c5f58a7b8f2d14d684e691927348906b5891f525c684  swtpm-0.10.1.tar.gz
> +# locally calculated
> +sha256  f61cf6f1e9bbcb4cefb30b70cafaf1c4df54c6961e65cfa63830e8ad0e220134  swtpm-0.10.2.tar.gz
>  sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> index de7f2fa05e..d6559c22d6 100644
> --- a/package/swtpm/swtpm.mk
> +++ b/package/swtpm/swtpm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SWTPM_VERSION = 0.10.1
> +SWTPM_VERSION = 0.10.2
>  SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
>  SWTPM_LICENSE = BSD-4-Clause
>  SWTPM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
