Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF70DC52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 18:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 915CF40361;
	Thu, 15 Aug 2024 18:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEmU7daAvn-i; Thu, 15 Aug 2024 18:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406B740392
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 406B740392;
	Thu, 15 Aug 2024 18:14:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8671BF573
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 18:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59E6140392
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 18:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OY3KIMJUKeUS for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 18:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2839540361
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2839540361
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2839540361
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 18:14:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D48C013F81D;
 Thu, 15 Aug 2024 20:14:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 15 Aug 2024 20:14:35 +0200
Date: Thu, 15 Aug 2024 20:14:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Darren Wang <wangdong115@foxmail.com>
Message-ID: <Zr5Fi_I8nruBULmi@landeda>
References: <tencent_C2D6061483906AA710B3001B277F4EE62606@qq.com>
 <Zr4_46ILTkziZpJU@landeda>
 <tencent_E7A8DE0B1508E4721AE5786DE26C9030BC0A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_E7A8DE0B1508E4721AE5786DE26C9030BC0A@qq.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723745680;
 bh=Llnhc5bjSP5vhRY6jT7XZshNYrUEjnaIQxhGi0sOVmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iFW9pc5nGij2UpGx6n/9UcZXL8gZCZVYkyAXd0P37dHGJjOylgxY479su0HBvRHgk
 FJElDrIgLRWqqp3n7UDtm6ItVwWJeHRqcM+9oMv0eyAEMKSVy6227h+/BeK6Wy9YrZ
 z7r0+uECVA/lzjtZnOkTSVaRljjaj+vM25gHNwUFnKNPNpfkjYfLCPmaRLqY3N+Ua3
 BnF8ZMDSY7R5UaTJ1mrTHf8j4jwrO0ErorsXDA9JQ11KnWwzPX9jKw8nlOdp3NgfCL
 W9YVOOGqR6hrD9zAdL++t9c1L4QjCgh01ItlryoX9Uz6+CkWNWa/9RpV8Z7AgrQyZX
 DiGSkmdk8dphw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iFW9pc5n
Subject: Re: [Buildroot] [PATCH next] board/friendlyarm/nanopi-neo: fix
 uboot partition size
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Darren, All,

On 2024-08-16 01:58 +0800, Darren Wang spake thusly:
> On 2024/8/16 01:50, Yann E. MORIN wrote:
[--SNIP--]
> > If you are still using nanopi_neo and have access to that board, then
> > you are welcome to submit it again, of course!
> I already did! See https://git.buildroot.net/buildroot/commit/?id=4265790541e925708364e1e86038bd2884eec3a5

Damned, I missed that it was so recent, and forgot to look it up on the
next branch. Sorry for the confusion. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
