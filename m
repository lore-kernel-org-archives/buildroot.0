Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543CDCD37B5
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B75B180AD0;
	Tue,  3 Sep 2024 22:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUSz_UpAn4GY; Tue,  3 Sep 2024 22:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C4B80A6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C4B80A6A;
	Tue,  3 Sep 2024 22:47:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 182E21BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5DB180A6A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7AfVvOLf_Vm for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:47:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0AC680874
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0AC680874
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0AC680874
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:47:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2F0FC13F846;
 Wed,  4 Sep 2024 00:47:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 04 Sep 2024 00:47:38 +0200
Date: Wed, 4 Sep 2024 00:47:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <ZteSCtu5F6IeO89H@landeda>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
 <20240829144940.209964-2-johan.oudinet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829144940.209964-2-johan.oudinet@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725403661;
 bh=sBUF849RLq0WjIlL1CGA7GQKkJuo3oXRFzTYoQHzYL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ARHUEWDx6d1cwxKEGwMzzAplKqW5/dUGyXv6pFicOe+OhheRaTBQxxzMID/ovGglB
 ur1kszC1rGEiAurvB1x94GdwWOnF2gialCL8jfbN4gxA8NFkdclr1XH/LvO+8anY4c
 sL/8hyiAXSD0yTq5J7B0JAo9Az/ggQYCeWeRsx5kkARja0WJ408SeshRkR7k+vBpvz
 KXb/jmh7waopddzynFmdOhTSup3RB6RYwnf97QyqwpjmJhfPyPmp+eZ6xsLeP0PJHJ
 1cmy2YsPGKbkt54xvcLMX+IKY5geBMk61vzxv+6Q0j2Hkgapel3jyG8P0pBK+hiWaX
 OvuoAHHqRPR+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ARHUEWDx
Subject: Re: [Buildroot] [PATCH v2 01/23] package/erlang-stun: renamed from
 erlang-p1-stun
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-08-29 16:49 +0200, Johan Oudinet spake thusly:
> This package is renamed to avoid fixing other packages that expect to
> find its content inside a stun/ directory instead of p1_stun/. Thus,
> remove the corresponding patch from the erlang-p1-sip package.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  Config.in.legacy                              |  7 +++++
>  DEVELOPERS                                    |  2 +-
>  package/Config.in                             |  2 +-
>  package/ejabberd/Config.in                    |  2 +-
>  package/ejabberd/ejabberd.mk                  |  2 +-
>  .../erlang-p1-sip/0001-correct-include.patch  | 31 -------------------

Since the file is removed, .checkpakcageignore must be updated at the
same time.

I've fixed that when applying.

I've done the same for the other similar renames in the folllowing
patches.

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
