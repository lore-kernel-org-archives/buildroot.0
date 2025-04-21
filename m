Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365D7C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 14:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA8C040659;
	Mon, 21 Apr 2025 14:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAinHWwdU51q; Mon, 21 Apr 2025 14:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BBE44058F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BBE44058F;
	Mon, 21 Apr 2025 14:00:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B6871C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 14:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1226A40573
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 14:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjLDgwFDL_t6 for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 14:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 708AE4048F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 708AE4048F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 708AE4048F
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 14:00:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 01900B00573;
 Mon, 21 Apr 2025 16:00:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 16:00:15 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 16:00:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: Joseph Zikusooka <josephzik@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <CAPWx8vtcjfVZJLydqyUAJ_8WbOHkrfJm2DG-qS5TO+msfa4uBQ@mail.gmail.com>
References: <CAPWx8vsoJUt8YMJG1aUqFRK1=yizNbgjVjGL1Q1+9ygjJGnZLA@mail.gmail.com>
 <dfe20dbb0429ce970599a992005b9ffa@free.fr>
 <CAPWx8vtcjfVZJLydqyUAJ_8WbOHkrfJm2DG-qS5TO+msfa4uBQ@mail.gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e07d34b22ea6c85e2d50249f1b06ccd9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745244017;
 bh=5OIeph9btSQQoBegjw46xMxuMUIZOIfgwMG/MGtymvQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ijhr0XildtAh/vnMPt021GAHo197FAQsRs2QCVmfNnbDWI2EkQBswo/XeDMQ7qdsO
 SrrH+2CSnXjMhxanyc+yUcSHUqtBftkWHHgZxOvtAsRtR1zNzI0Q/Fu6cOTai6fVh8
 dFlTjHLXYj3ZJbXEJkKKGhBlqxh47WZrMc3QE+66Gae2Brii3nuuec7vnG1gnxAmJm
 k6pLu+BKQq8cbwnCRWK5TgRf1rcY9eB3Bqbrq74JAUJQgE9hdA34UabfwmOrevLBOT
 ktwsqer2kgGdpghUtIdweC7xmxLU2jyAQkN5CeBw1fW1dzgJmP6lYLRoU8kwF/4DL0
 XqGCJtv7cBlfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ijhr0Xil
Subject: Re: [Buildroot] host-m4 build on Fedora 42 fails
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Joseph,

On 19/04/2025 18:56, Joseph Zikusooka wrote:
> Hi Julien,
> 
> Thanks for the info and the workaround tip!
> 
> I updated my patch to use CFLAGS="$(HOST_CFLAGS) -std=gnu17" like you
> suggested, but the build still fails with GCC 15 and m4 1.4.19 - same
> errors as before. Strangely, if I build m4 outside the buildroot
> environment with those flags, it works fine.
> 
> Any idea what else could be causing the workaround to fail in
> buildroot? Are there other flags or tweaks I could try in m4.mk [1]
> until the new m4 release is out?

I just tried adding the line I suggested in package/m4/m4.mk:
HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"

On a Fedora 42 host system (updated as of now), it solves the
host-m4 build issue. You need to restart from a clean build,
though.

I tested with the commands:

     make qemu_aarch64_virt_defconfig
     make clean
     make

Could you check on your side, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
