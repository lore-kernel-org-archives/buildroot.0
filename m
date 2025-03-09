Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABB5C282D1
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 08:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AAA681400;
	Sun,  9 Mar 2025 08:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q80Lr8bzlSuu; Sun,  9 Mar 2025 08:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D0CD813CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D0CD813CE;
	Sun,  9 Mar 2025 08:30:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 980D21E3
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 923C54018D
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMKRZTJcSwyW for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 08:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3548F400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3548F400AC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3548F400AC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:30:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C8A8419F522;
 Sun,  9 Mar 2025 09:30:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Mar 2025 09:30:44 +0100
Date: Sun, 9 Mar 2025 09:30:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <Z81RtJUaUZYJFicS@landeda>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
 <549206ba-180d-4ee1-9a5b-a9d99ab2d3d1@gmail.com>
 <Z8wjZJRIUpG0iiOx@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8wjZJRIUpG0iiOx@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741509049;
 bh=ZwAa2egNg+qmkE5Fsz4IrmLTfukOTeGUTWMl0M+sf4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gE5m8OF8h/FnTabTn9OR77HFr0cHWNiVAfPxjxlNr4rxzGeUG3ZVlLDWVMPnGqae6
 7xJgzaHGJlSGbuWP2yIRCBiTUN5wSWDrqdj/Lo/Hgm/ctmcKfdPeZlACCh2kSTJKmL
 ouNZBQMAm8OV6JZS/Nvst0yc1JTIOlJwv+DwLLh1s9Kk9bprJzt4Kgrph5vPPZoYhI
 /QUM2warx036v8PcRYuF7L48FTvoNfiluMsv8wX4ffsnHjM3QcWE7lmCM4L9CcDVd/
 ijI8GXwnmxiFDH4tq+bkk9Z6f0vw+ZBZsvoblOWQUWrDch5ZuaRdflJbG6cqW2ybuV
 qq6SDqzzBiwcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gE5m8OF8
Subject: Re: [Buildroot] [PATCH 9/9 v3] package/podman: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raphael, All,

On 2025-03-08 12:00 +0100, Yann E. MORIN spake thusly:
> On 2025-03-07 14:40 +0100, Raphael Pavlidis spake thusly:
> > On 3/1/25 16:05, Yann E. MORIN wrote:
[--SNIP--]
> > > +		$(PODMAN_PKGDIR)/containers.conf \
> > > +		$(TARGET_DIR)/etc/containers/containers.conf
> > > +	$(Q)$(INSTALL) -D -m 0644 \
> > > +		$(PODMAN_PKGDIR)/policy.json \
> > > +		$(TARGET_DIR)/etc/containers/policy.json
> > > +	$(Q)$(INSTALL) -D -m 0644 \
> > > +		$(PODMAN_PKGDIR)/registries.conf \
> > > +		$(TARGET_DIR)/etc/containers/registries.conf
> > Just for curiosity, why not installing those files under
> > /usr/share/containers?
> The first such file I wrote was policy.json, and the documentation for it
> states [0]:
>     By default, the policy is read from $HOME/.config/containers/policy.json,
>     if it exists, otherwise from /etc/containers/policy.json ; [...]
> So I did not look further and put it in /etc/containers/. Then I had to
> write registries.conf (for seemless access to the docker hub), and again
> the documentation also states [1]:
>     By default, the policy is read from $HOME/.config/containers/policy.json,
>     if it exists, otherwise from /etc/containers/policy.json ; [...]

Sorry, that second excerpt should have been:

    Container engines will use the $HOME/.config/containers/registries.conf
    if it exists, otherwise they will use /etc/containers/registries.conf

> [1] https://github.com/containers/image/blob/main/docs/containers-registries.conf.5.md#description

Sorry for the confusion...

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
