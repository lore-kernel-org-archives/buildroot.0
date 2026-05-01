Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD045FF8864
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 07:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6618C42150;
	Fri,  1 May 2026 07:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suXUkP8jRgac; Fri,  1 May 2026 07:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62B0341C0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777620575;
	bh=5omEA1dE9wmAg4vQx/xKv8XEXKgnUmpKHKAhuP7cyp8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m8DLHcT4H/9+kPtUu2PE3tr03KIfdqCwkgYNPTYzncsvcVYfeOsoc6X3hPfF33fEq
	 9GgY39K6lBni0WuCXvVMwrgZHpaKGEI3w2osCQMaG6l3GrEG78/X3DwBSxcqTQaonS
	 xrwZLoN8sCvrLRPGdPdO5YxuU4XF2uhFKvVTKTOtmge4AZDyyTRMwvwB4xIdUtLRwk
	 nUIBcQpyUK+7+HF4oPwnoLbcBpqEFtt63YGDox4v5pQD3XQA/65NFjWSydDy2B3E2P
	 H2zseKgbXxo2Q9ZMoL97GvIfmZvV6Z6U25OwGhAqHw5e0H7jnAZwbgCLamXx63fRep
	 26znlA9z6fJEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B0341C0D;
	Fri,  1 May 2026 07:29:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69A87293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 07:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6434885485
 for <buildroot@buildroot.org>; Fri,  1 May 2026 07:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bfL9-vvJfoT for <buildroot@buildroot.org>;
 Fri,  1 May 2026 07:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2E0785471
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2E0785471
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2E0785471
 for <buildroot@buildroot.org>; Fri,  1 May 2026 07:29:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1DA1F6013B;
 Fri,  1 May 2026 09:29:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 01 May 2026 09:29:23 +0200
Date: Fri, 1 May 2026 09:29:23 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>
Message-ID: <afRWU1jyiPy6AMtO@landeda>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
 <20260425085657.474422-5-fiona.klute@gmx.de>
 <f17073a5-410e-467a-8b29-befc23b3dc0e@bubu1.eu>
 <cab73423-6879-4382-8d7c-64d8db5940f6@gmx.de>
 <aa4a5ba1-eb8c-46e1-8aba-572b1cf23835@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa4a5ba1-eb8c-46e1-8aba-572b1cf23835@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777620569;
 bh=FbN8BSQcqBLiZilL5PpYzigX9aT0ES6KJWvEu8zINvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s0DPEnjax71g1yEB8xRCrtNboqFJYV9e9DYQbHm5JUJHq7b66HlG1aTxY9OSzNrxu
 Bn8ZnVeA6Yle7hHCPZPi6ypldKheSOUyy3G0UjGYKpWDEI/uPUq9z9GFqaCzEQUawy
 9mBv0avjNwIRNwBJgkPK+SnYbTSfaLtAjZxG0+GNmeQZo4OHQNle1OhEVa+GpwXR3f
 udyPRNXujpCu45NQv4+lrYOXulDMpkONStPO/o4Lj3fFCBqX/3acFA1SYq95xw8CP9
 QJZ48xcgi81BPtuTjR56w/u/YlWxGWuZab/JsoDBZRLsOdynj6PUWaFz5PtqcMciPc
 CW5YpBdhY/OGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=s0DPEnja
Subject: Re: [Buildroot] [PATCH 4/5] package/kmod: switch to Meson build
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, Fiona, All,

On 2026-05-01 00:22 +0200, Marcus Hoffmann spake thusly:
[--SNIP--]
> > > Is the bindir/sbindir logic still required actually?
[--SNIP--]
> Yann, maybe you have some input here?
[--SNIP--]
> In general, this is a bit hard to grasp from just reviewing the .mk file
> without building different variations of this, so uhm, what symlnks are we
> trying to create from where to where and why?

The reason why we care about all this mess, is that busybox does
install its tools (lsmod, insmod et al.) if they do not already exist
(the 'install-noclobber' install rule in busybox), so we have to have
those exist in the place busybox would otherwise install its owns.

Otherwise, we'd end up with, e.g.:

    /bin/busybox
    /usr/bin/kmod       <- the real stuff
    /usr/bin/lsmod      <- symlink to busybox
    /usr/sbin/lsmod     <- symlink to kmod

And then, depending on PATH, one may not get the lsmod one expects.
Hence all this dance with the symlinks...

Tis was introduced in 78f5ac2908b3 (kmod: add option to install module
utilities), at a time when individual packages would depend on busybox
to ensure they would "win over busybox", but the comment about the above
was removed in 273f23a45252 (package/busybox: invert dependency with
kmod) when we switched the dependency over, to avoid having packages
replace files from a previously package (in the hope to have a clean
PPD build).

I agree that the handlng is not optimal, but mostly we're comment
explaining the reason for this dance is missing.

> > Whether that makes sense with the kmod binary in /usr/bin is a different
> > question: If /usr is on a separate partition (the ancient reason for the
> > split), the symlinks will be broken until that is mounted. I simply kept
> > the same behavior as before. If placing the symlinks in /usr/sbin in
> > builds with BR2_ROOTFS_MERGED_USR=n is fine, we can remove this whole
> > mess of conditionals. :-)

Check where busybox installs its own symlinks/hardlinks/scripts before
you drop the symlink dance.

As for /usr on a separate partition, I think this is completely ruled
out for the merged-usr case anyway. With unmerged-usr, I am not sure
Buildroot ever officially supported this anyway: as you point out, the
kmod binary is in usr, so usr-on-a-separate-partition-with-kmod never
worked since at least 2012, when 78f5ac2908b3 was introduced...

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
