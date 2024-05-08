Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4F1C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 18:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A0E24073C;
	Wed,  8 May 2024 18:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHcsDxFeCEjf; Wed,  8 May 2024 18:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AEAC4075C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AEAC4075C;
	Wed,  8 May 2024 18:57:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6841BF3D0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 18:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A5CB833A7
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 18:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuwN3AO_eRAw for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 18:57:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FBB9833A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FBB9833A0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FBB9833A0
 for <buildroot@busybox.net>; Wed,  8 May 2024 18:57:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3A25513F8A9;
 Wed,  8 May 2024 20:57:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 08 May 2024 20:57:18 +0200
Date: Wed, 8 May 2024 20:57:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZjvLDd4kxr63OZGQ@landeda>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-9-ps.report@gmx.net>
 <Zjk5YgT6u3PT_rIe@landeda> <20240508170718.6e5c9cc8@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240508170718.6e5c9cc8@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715194640;
 bh=coVpXdO9m0wj9DN1r9yglYESWFnoXH1ZUFsUqvGHTZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fGlnMZJByv3MzaOf9ruOlZHSJGSPcTu8s/UyZNm+uCF51ruai9UY8ucBsuRac8OwO
 R8yaHtK/Vfbcu30lvCLlSR8n7BYrrHgK+a04h6g2CDAJCE2nCimydTC+km/cIeUUPs
 EqRAb1K1JHeO0k/u1S1/Bq1ovtvCWB1xooRhoQG9HMYlkSqOxYTKAPABRnlPuFQijK
 zN9MEG5ijKoftjxueDEb02CmqnZPzK0g70gpnU4EC5ytD+F5dtA3hgEQ/FMvavgm9o
 4eL+r7yyC6t4KpglxPsF2I+Y9MwqLLb2mMgt52tba4y4Y1bRapxkKj6+MerNn37JcV
 lvf1eiyn033xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fGlnMZJB
Subject: Re: [Buildroot] [PATCH v1 8/8] package/openssl: move
 libopenssl/libressl source statemetns outside of the choice
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-05-08 17:07 +0200, Peter Seiderer via buildroot spake thusly:
> On Mon, 6 May 2024 22:11:14 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2024-05-06 16:45 +0200, Peter Seiderer via buildroot spake thusly:
[--SNIP--]
> > > @@ -44,13 +42,14 @@ config BR2_PACKAGE_LIBRESSL
> > >  source "$(BASE_DIR)/.br2-external.in.openssl"
> > This leaves one 'source' statement in te choice, which is no longer
> > accepted, AFAIU.
> 'source' is accepted here, but not with all possible content...

Ah, it is still accepted, because you introduced a patch that reverts
the upstream change.

I think that, if we update our kconfig, we do not want to switm against
the current, and we should not try to reintroduce a feature that has
been removed, otherwise, we'll have to carry that for ever...

Instead, we should find a solution that allows us to be closer to
upstream, to ease updating in the future...

> > I think the best solution is to move the if-endif conditional block out
> > of package/libopenssl/Config.in back into package/openssl/Config.in, and
> > add a new choice entry, so that basically we end up with something lie;
[--SNIP--]
> Will test the proposed solution the next days..., alternative solution would be:
> 
>      choice
>          bool "ssl library"
> 
>      config BR2_PACKAGE_LIBOPENSSL
>          bool "openssl"
> 
>      config BR2_PACKAGE_LIBRESSL
>          bool "libressl"
> 
>      source "$(BASE_DIR)/.br2-external.in.openssl-choice"

That's still a source in a choice, and as statred above, we should not
go that route if it is no longe rsupported upstream...

>      endchoice
> 
>      source "package/libopenssl/Config.in"
>      source "package/libressl/Config.in"
>      source "$(BASE_DIR)/.br2-external.in.openssl"
> 
> Splitting the external content into two files (two lines), keeping the 'source'
> of the empty files as default (the first with the choice content, the second
> with the regarding configuration entries)...
> 
> But either way the content of '.br2-external.in.openssl' needs to be
> changed/adjusted...

Detail. We own those scripts, and ugly as they are (I wrote them, blame
me), we can extend them as needed.

Thanks for working on this! :-)

Regards,
Yann E. MORIN.

> Regards,
> Peter
> 
> 
> >
> > Basically, that would make for an uglier state, but that's the best we
> > can do given the new limitsations introduced by upstream kconfig...
> >
> > Thoughts?
> >
> > Regards,
> > Yann E. MORIN.
> >
> > >  config BR2_PACKAGE_HAS_OPENSSL
> > >  	bool
> > >
> > > --
> > > 2.44.0
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
