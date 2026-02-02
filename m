Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0227E7315C
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 12:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3EA4810F6;
	Mon,  2 Feb 2026 12:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQZeEWCNYPwN; Mon,  2 Feb 2026 12:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A8181102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770034823;
	bh=s6Y+wa9IGUip5OH0e0z3hQpm8/eSFt1KmvmG+nYdQsY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ers+v44dl4XTtjPEEfCWSO56h0zlSGyVEG2c3Al0eKLzdT2MrLvwsp1yn3/lVN+BC
	 7TzAZ1LIGq4w0wFLlJY+hRWWNPAgDUyQfMNITfgvQuweL7J0Lk6bVgGXCLF5vYwYpf
	 QrBKIbFhmQE0ajmzv062gzRbl14I9GCeI4l1c/VS3EBYCoJLJ0tPEddV2w1Ttn7wh8
	 eYinjwJygv1TNfYsvo2LsIuZVVwwKCfKNyEMUIWHKglzYG1m3csOqGqMd9LW/kTZI1
	 Zd51NzMLsO9JWjCLkmymgzl6Cf10/0Wfq54DkD8T3zLCTBw96v1jl6v4aFIKxNxQEB
	 o6CFFTCk5UR7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5A8181102;
	Mon,  2 Feb 2026 12:20:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 879791E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 12:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AA6B40885
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 12:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzTIvR4521LV for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 12:20:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92C294086A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92C294086A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92C294086A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 12:20:21 +0000 (UTC)
Received: from [172.16.2.205] (host-109-89-232-55.dynamic.voo.be
 [109.89.232.55])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CD0B32C829CF;
 Mon, 02 Feb 2026 13:20:18 +0100 (CET)
Message-ID: <dbd8a355-b7e3-4fca-9b5b-97df4f151763@bubu1.eu>
Date: Mon, 2 Feb 2026 13:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
References: <20240916133057.1358143-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20240916133057.1358143-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770034819; bh=q9kGi+IghGfHmTmoxLx2CL5Is6CgUHSIO6gc7/xVwjY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=omaL6bWVWD6GmA8LNpHzCkeFsY0vYdykRlYAjceSSszAj6pzLBUPVoRWLNH0gTiiq
 tPlJCXaNMzkM4D6uhdSEZqz6Wfvpz8BtqL+7qnU67m5NKpMIOfIaHSNPM7QR2iaBEe
 94RlYqeAizZW5f+jwZRlK4JbzJAZYAb0PJVC5wLN+YKTQUhhURNBIGKaNsV31cUOjW
 2t7aOqIdfu3YvgZPogS7NVNVGTcfionZ5UlY3463P8EIO+ZD/Z0msFBlCDYJHBwt9J
 Enp6Pc50PCsQbp2UaI8+hVjb+EGAXSMvfWN5SgoKyuqjLcsCfZW26yEgeJBLug/gTx
 MExe6lenS2YQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=omaL6bWV
Subject: Re: [Buildroot] [PATCH] package/python-sdbus: fix linking on aarch64
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 9/16/24 15:30, Marcus Hoffmann via buildroot wrote:
> The following config snippet fails to build on arm-aarch64. Adding -fPIC
> to LDFLAGS fixes this. This has also been discussed upstream [1]
> in the past without determining an exact reason/cause.
> 
> Error repropduction:
> 
> $ cat python-sdbus.config
> BR2_INIT_SYSTEMD=y
> BR2_PACKAGE_SYSTEMD=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON_SDBUS=y
> 
> $ ./utils/test-pkg -p python-sdbus -c python-sdbus.config
>                      bootlin-armv5-uclibc [1/6]: SKIPPED
>                       bootlin-armv7-glibc [2/6]: OK
>                     bootlin-armv7m-uclibc [3/6]: SKIPPED
>                       bootlin-x86-64-musl [4/6]: SKIPPED
>                        br-arm-full-static [5/6]: SKIPPED
>                               arm-aarch64 [6/6]: FAILED

This not longer reproduces, so I marked this patch as superseeded in 
Patchwork.

[...]

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
