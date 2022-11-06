Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D331AC4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 18:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D59E40150;
	Sun,  6 Nov 2022 18:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D59E40150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRz8Fca5VI1f; Sun,  6 Nov 2022 18:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B81C54010D;
	Sun,  6 Nov 2022 18:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B81C54010D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D70471BF312
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 18:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA801404EE
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 18:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA801404EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-KIkL8x9KCD for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 18:56:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4249404ED
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4249404ED
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 18:56:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5d5:e5fb:6135:6c0c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E86FAB0057C;
 Sun,  6 Nov 2022 19:55:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Nov 2022 19:55:57 +0100
Date: Sun, 6 Nov 2022 19:55:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20221106185557.GD3918838@scaer>
References: <20221106105309.350587-1-fontaine.fabrice@gmail.com>
 <CA+h8R2pHmjLfKPN0g8rubJi6gd66E4L9y=WMeco9r9b9voRmFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2pHmjLfKPN0g8rubJi6gd66E4L9y=WMeco9r9b9voRmFg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667760961;
 bh=ldzjrr9DrEg5OutCXFBw1I0xG/0U/bAtIvRvBwwVOdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BxXLtFOo5bRX1lP0DM8lN6/n1z2NuXXtJdjIkLbxb+NrSCZq2mS+oYTBUisy99RGl
 JP3XPUrbRP3IWvNQT/KoKYvWe2hk8szQmN2p+PVdn9M12kCaGJqd1cHdWGKY/CNFpZ
 ffRgZLqAwyEfBItUq77KSpIbMbbieT1e63nOYJAKwyQHg28qCVnR49nYXXZNwyB9cd
 RhNSs6t0yogfHT86Xx8ILUu9NDCFc6QTqHhZ+hMAopOEgGQdES4w8zAftw3mY+rmaE
 90td4/UPjy80hcJyE73v0hqnaQuQ2qdkZOKCBk0P3UA6nkcP2fUOQOegSpnukzXFF9
 +XsTPl/EOYZ0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BxXLtFOo
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: fix musl and uclibc-ng
 builds
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-11-06 10:03 -0800, Christian Stewart via buildroot spake thusly:
> On Sun, Nov 6, 2022 at 2:53 AM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> > +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> > +CRUN_DEPENDENCIES += argp-standalone
> > +endif
> Lgtm!
> 
> Reviewed-by: Christian Stewart <christian@paral.in>

Thanks for the feedback, but already applied. ;-)

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
