Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1B2C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 18:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 211F641835;
	Mon, 31 Jul 2023 18:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 211F641835
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hD-iy4sNat9E; Mon, 31 Jul 2023 18:51:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C44A841EEF;
	Mon, 31 Jul 2023 18:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C44A841EEF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7B21BF2B8
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C1B3845DE
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C1B3845DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aN3DE5TENsyF for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 18:50:53 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2F6081F8D
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 18:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2F6081F8D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9f57:78c5:813c:6b41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D9CD0B0053B;
 Mon, 31 Jul 2023 20:50:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Jul 2023 20:50:45 +0200
Date: Mon, 31 Jul 2023 20:50:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Maier,
 Brandon L                            Collins" <Brandon.Maier@collins.com>
Message-ID: <20230731185045.GB421096@scaer>
References: <20230728213218.3893857-1-brandon.maier@collins.com>
 <20230729153310.GA229077@scaer>
 <BN0P110MB167326D5720C0DDA05377E90EB05A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB1673CD7AFBD6CF8F5D8848D3EB05A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN0P110MB1673CD7AFBD6CF8F5D8848D3EB05A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690829449;
 bh=JqVGsyMft0N/1mOvWy64ccWWZWYHOnMzyLX7BeUmogQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=csXgbNttkKEGYK/XSwpghxKUou0LejpdDeMJeYcmz6JZxu05AS3LOKKZdED1KUaAo
 oY+JLLSOErhnW/Tp/O1BwMEufVS3/LZpmud678w2MH9oCoSwOYVJdzMla7gbB0fh7m
 U0+Of0TnOltJsJQGPDOs+J+2YRuxD7oHvoEn0mkjEPItVR7oZdOCiW0hY9ITWuYbMI
 gKEnoJ5VZFp7yprG/F0dWyJ9cOzbx5/ACNjC345XGkH9gXdik4kDb+pTwkvWY/oWrd
 7IeD6Lzw/J5oXWxfKE/uNbp8PDkWjc6kFEYZaUR6pHrl7dIoPKpV1PYdCwqfU0HQJr
 PzLt0XNu48MjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=csXgbNtt
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] utils/docker-run: fix
 support for git-worktrees
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Brandon, All,

On 2023-07-31 17:53 +0000, Maier, Brandon L                            Collins spake thusly:
> > > From: Yann E. MORIN <yann.morin.1998@free.fr>
> > > --git-common-dir was only introduced in git 2.10.0, which is most
> > > probably not available in enterprise-grade distros like RHEL (RHEL 7 is
> > > still maintained, and it is based on Fedora 19; there's only a docker
> > > image for Fedora 20, and that has git 1.9).
> > >
> > > So I've added --no-flags, that has been present since at least 1.0.0,
> > > which means that, on git versions that did not support worktrees, we'll
> > > get an empty GIT_DIR, so that's OK: it means we're in the main working
> > > copy, and thus we don't need the mount.
> > >
> > > Applied to master with those changes, thanks.
> >
> > All the changes look good to me, and verified still works on my end.
> 
> I was looking at this again, and there's a problem with one of the
> changes. If the script's working directory is not at the root of the
> repo, then the `readlink -e "$GIT_DIR"` will fail because GIT_DIR is
> relative to the root of the repo.

Ah, damned...

> My original patch had the readlink run inside the `cd $MAIN_DIR` so
> that it would resolve the absolute path correctly.

Yes, I saw that, but I forgot to carry that logic on when I added
support for older git versions that did not know about --git-common-dir

Thanks for checking this! I'll push a quick fix.

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
