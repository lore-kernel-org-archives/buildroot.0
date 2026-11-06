Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C2E606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I59bQKyA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A146B818C4;
	Fri,  6 Nov 2026 16:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQMrX4H_IdkM; Fri,  6 Nov 2026 16:11:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C208681E54
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981465;
	b=YaUTRKvazZMzp0oUXSBI3c+3/KEVMMZpzcdtBLpgSzq/Yosbxj8b2s3t1RURz8Ca4V13
	 IxTUJAIAC6IPjsLjVOcyJ6xQPknD1tPeMtmGlLXs+wETx1rg8WACdIe0gHpXMAybkv8aQ
	 Ws2MIxb8lmbxAAMQ1khBNWom6eingsPZ+Zs2qFW48OzWvSoFkI7HjeDXmA2wXGs0q4qE8
	 kz4ffCSzQ4BBhcxGzmjqVbvLAiIjD2ZCbgdo5zAtRWzd6KVEIxdAn/Ndwn3o0TV0lcwlw
	 l5GLz0BPJT07LO25vPegL7OkoYdeCreSBQujJbZd1CIHZo6eh1zxj0DlX3XUq+aLSBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981465;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=stDeGhlCwx/MhVDHzgDIi/rEziyq87FU2ByOxgN6pkI=;
	b=R9gKKjCwFjGndAxv922jHU0WIzl58CjXXVVW8qZ79xST2vhbqllITfV+s+aTVVTcukLd
	 ubh6gtHp2HsuY1Bl7GWpO6we55RRWMr9W2qvbzOhJRftidCrZX+75y1XEfuLW5dZcB/hf
	 bwW7sX6hm0Y/a42aVYSQi/wOKX1kIw5/edimDhiFbzNEDAoD3KXCyCSYHSy6YRUXLG0un
	 1c6uHNhsTxrPtLsNKAaK8eVLmwjHUuC/1ovQ0qaou7a7NAtxLbTowZ/e4aBn/i/oTE0wg
	 +A+rEdm02ihClhXHMsMcgalP71FJ9RZASGvl96yF0PvVmQJmJUgWbU/dPmHlRL7Jw+Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981465;
	bh=stDeGhlCwx/MhVDHzgDIi/rEziyq87FU2ByOxgN6pkI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I59bQKyAufCQwu4UwZy1edT0+cgXOyshdjdtmkIs3RMj6yClQ41MdEDrevtBDuu/v
	 Q+22GvPC7LkbMPYDUFT4Xi4YXJQ37NaujmNtnu2CGtY+HeaBGrhg/EBLCN47xnet20
	 riQghgQeSJ8oK5MA+kk4CgS718CRG0Pcw6VnXI/tg63texOkT+RPUcJuhNsoSRYzfS
	 GC8/cxcHpAGs+ma21IW/Ktl9j09IsMqMcty5aGD7GM0+o6iI6FUGQnkgEi7MUwYOcR
	 OCf/JxbutCQb2El51dp4JlrD3XA/5qpkzwFY2EwVb1bJtpc880liqk2hS0iV6iTtzg
	 bThI8PQg9KLCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C208681E54;
	Fri,  6 Nov 2026 16:11:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C53922E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6EDE81E58
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJkxWUM4tCEn for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AA7A381854
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA7A381854
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so4514895e9.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981460; x=1794586260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lC37bW0J9ffGDj9psDtQMIroHl1K4rQckw7XvLQOt/M=;
 b=leedgIW91032iC9TAgYpXe0FbI8QJ1gK6jm5pxfvAuGtRcHNHKTeEKhmAUgDVp6Vke
 uILpEeRiA+XGBy6EXkppd11Qv5lzEy3J/3zHj2Wy219/kHCaFX54MZo0o+7JOH9P8CnK
 +lBjpi26BlnqZr/ak3O8bG+2k51QNrfKq3L5HcMua6kp53BXtLeEiGBwnK42ysbAoOuP
 07II/MzvaaA9iWvsD9WUuEyj6EvSx2f7SbhDCpWqhY1qaF4iuE5Sup2P3vxMJNyRBfDN
 V6PYVHWCKt+Udbf6n7j6UG+idWsG5nLG+NJSjh5mJhJR0N9x+Fjo+u4sOyjK5ON94rQc
 t+fw==
X-Gm-Message-State: APuU4Z+k+tRujxkKm4AnF6zUzAFXT98Cr1Dg85rm7GVhmIMOecuSoAWQ
 zIRuTiXEl2piJ7uAwC18p4DcPHikMD5JrSVNPmFLz1ICjMe7umSwhWrbrE1EkeJV1/YLUN3ROqF
 5b5I5Gto=
X-Gm-Gg: AYBFou0aOs+wlEQspNWXdaQMZgnuxHZDbdQKEteRyf+xqOCqhV+5SbvaH61/UBLgP3E
 dapMDK8N3ZMW5N9/DeYlsg7vW8HWg2b5DWfiPIR2xOYmE5FIIkpyKGU+xD6myiJvlBGWhx1SfpH
 acjSRiuYG6bOYRHc2fTgqILYNignvzTuFIeVcdIUDvtdUBmB7yQ5bAGX1Ao39oigrV0+YjPmxfU
 RxaZpaCqKXWFK3PuZ/FMxMBT1Qz784NkIgHs2mvT243f1HWwRmraGypibFWaRByfOWes85R9JbP
 Mr+8zmKfHKYb1KS81b9q85RS9nOnt1GrqpLJLhIOF//TSmN+u9kOhchtg7zb5Oa24XqZBAlepF8
 lLHNSyquLgOdwGZQVv4VbnA3bHU3qQ9z3LLvvp90IvUiKbX/HmChndrC5weohlXWcTM6UoqX1BD
 3Tw0+LKdJJHUfUKDrudWi9dp3r9EozE4TozmAd4SVi3LuOVGXcQ5cotiEh72RB6+DG3RfrENgnv
 PG2seA3OpuA617XWvwViVOAiWnelcfvAm1ICcvHcYAbxR/w8TCzXkoEs9qKDHfc7Pu8TEa1pIeX
 hl2dxh95CMQhvC6aUNxK43oZYFuus5Y=
X-Received: by 2002:a05:600c:3e0e:b0:4b0:9803:dc8a with SMTP id
 5b1f17b1804b1-4b6df7d4a32mr52456615e9.26.1793981459851; 
 Fri, 06 Nov 2026 08:10:59 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e24012c3sm63923095e9.13.2026.11.06.08.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:58 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:56 +0100
Message-ID: <20261106161057.607879-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031134509.1584908-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cpuinfo: don't support ARMv4
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Building the package cpuinfo with an ARMv4 architecture would result in
> the following error message:
> 
> ```
> /home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: CMakeFiles/cpuinfo.dir/src/init.c.o: in function `cpuinfo_initialize':
> init.c:(.text+0x28): undefined reference to `cpuinfo_arm_linux_init'
> /home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: libcpuinfo.so: hidden symbol `cpuinfo_arm_linux_init' isn't defined
> /home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: final link failed: bad value
> ```
> 
> This can be reproduced with the following defconfig:
> 
> ```
> BR2_arm=y
> BR2_fa526=y
> BR2_PACKAGE_CPUINFO=y
> ```
> 
> As stated in the README of the upstream project [1] only ARMv5 and later
> CPU are supported. This commit then exclude ARMv4 from the supported
> architecture.
> 
> [1] https://github.com/pytorch/cpuinfo/blob/main/README.md#supported-environments
> 
> Fixes: ea1cc1af55 package/cpuinfo: new package
> Fixes: https://autobuild.buildroot.org/results/f14/f14e4afacaa61021463c457def1cad3c81d35f29
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/cpuinfo/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
> index 64477c2bd7..4aecf2e060 100644
> --- a/package/cpuinfo/Config.in
> +++ b/package/cpuinfo/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_aarch64
> -	default y if BR2_arm
> +	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
>  	default y if BR2_i386
>  	default y if BR2_x86_64
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
