Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08648C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 18:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DBBF612DC;
	Fri, 16 May 2025 18:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-0EaMCbBbhE; Fri, 16 May 2025 18:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 902B0612F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 902B0612F2;
	Fri, 16 May 2025 18:26:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F122F185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 18:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E27AB612E9
 for <buildroot@buildroot.org>; Fri, 16 May 2025 18:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INd6K2Vfqx0I for <buildroot@buildroot.org>;
 Fri, 16 May 2025 18:26:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0FED612E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0FED612E3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0FED612E3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 18:26:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9185A19F5A7;
 Fri, 16 May 2025 20:26:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 16 May 2025 20:26:20 +0200
Date: Fri, 16 May 2025 20:26:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org
Message-ID: <aCeDTLbUoczbZXLK@landeda>
References: <20250515211806.1464239-1-yann.morin.1998@free.fr>
 <cc7f2887-8508-42d3-bfb5-e76333075429@rnout.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc7f2887-8508-42d3-bfb5-e76333075429@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747419985;
 bh=v0GPw7FP63a+plSO9yc31my/cIpNwb0t8oP2D3Fzoo4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwKZ/2NYsjY+jN/aXbIY8rY9Ca+xMK8O3nTBznUyQJdGIGoEGD2qpwp8QILkd5OEW
 gJpreMEmKYoW/OH5gGNufMuu02cT5nnW5h6uVDRHQNe2BzNAAVMZVePwJkLrOSaQ7u
 h395jv7AWkCoALvWqyUaagCUXy79mGURDGPlvzo7Phz/8mT1+g8aIyaYt9Wky6dtUq
 zM1nvZTviVSjPhtbiQ7/F36pxTJsLodijuk3a0k7ngPBhvvrD5KgF+3bfyaaaBbbIp
 9jH0k881hKfVM9jYmRelR4qcWE3Af+bDc8e93B1i3Ejpe5WLpcD3K+mIaRSPBkSIn7
 ckWlfzDz/Ycnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iwKZ/2NY
Subject: Re: [Buildroot] [PATCH] Makefile: allow defconfig to be in a
 sub-directory
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

Arnout, All,

On 2025-05-16 19:46 +0200, Arnout Vandecappelle spake thusly:
> On 15/05/2025 23:18, Yann E. MORIN wrote:
> > Currently, the defconfigs must all live in the top-level configs/
[--SNIP--]
>  It is actually only about list-defconfigs, so I rephrased:

Right.

> Makefile: include defconfigs in sub-directories in list-defconfigs
> 
> Currently, list-defconfigs only lists the defconfigs that live
>  live in the top-level configs/ directory. For the in-tree defconfigs

Spurious leading space; double 'live'. But no worries, I could have been
the one doing those typoes. ;-)

Thanks! :-)

Regards,
Yann E. MORIN.

> this is indeed the case, but it is possible to manage the configs in a
> br2-external tree with sub-directories.
> 
> A few examples:
>   - for a given board, a first defconfig is the full system, and a
>     second is the rescue system;
>   - for a given board, two defconfigs implement an A/B feature set;
>   - a set of configurations targetting various famillies of systems each
>     running on different hardware, sorted per familly.
> 
> Extend list-defconfigs to look for and report defconfigs in
> sub-directories of the top-level configs/.
> 
> 
> 
>  Applied to master, thanks.
> 
>  Regards,
>  Arnout
> 
> 
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> >   Makefile | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 411e1de515..c0a41cabd5 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1218,7 +1218,7 @@ help:
> >   # $(2): br2-external name, empty for bundled
> >   define list-defconfigs
> >   	@first=true; \
> > -	for defconfig in $(1)/configs/*_defconfig; do \
> > +	for defconfig in $$(find $(1)/configs -name '*_defconfig' |sort); do \
> >   		[ -f "$${defconfig}" ] || continue; \
> >   		if $${first}; then \
> >   			if [ "$(2)" ]; then \
> > @@ -1228,7 +1228,7 @@ define list-defconfigs
> >   			fi; \
> >   			first=false; \
> >   		fi; \
> > -		defconfig="$${defconfig##*/}"; \
> > +		defconfig="$${defconfig#$(1)/configs/}"; \
> >   		printf "  %-35s - Build for %s\n" "$${defconfig}" "$${defconfig%_defconfig}"; \
> >   	done; \
> >   	$${first} || printf "\n"
> 

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
