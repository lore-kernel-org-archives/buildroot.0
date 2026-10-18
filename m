Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D340BCCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 10:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74E8B60623;
	Sun, 18 Oct 2026 10:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWjKSrKb-3dz; Sun, 18 Oct 2026 10:37:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2F4936061A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792319864;
	b=FyS2btuQhV4Rf65FtxobxdG6PJNYEpFZAHYvXsiJl24l++u/QsEftbpfEfxsuJo4kF3H
	 Y/Uhi6drtHf/3VJXuzlJkgkluCPIvyoRdRv8waOFTPGnlTVQIALBYmGL6MYimVTPulASq
	 rA2b6BDCaaecploVK1a6V3c7XWB38CFehlmjdD/w/DUz3pXSJ4kEdy31YseU5uYmeopN0
	 Hl8lLqXsjt2RSI8xB/szjocL52n9bJ9xG9/mD0pwSDglmRdhGk7LBp4n1R8CSJDHXGful
	 nGu7Lw5aD8W8a5cSEOfiRv6989vdoqGxLZB0AXaPutm+48meRZtQEQjT2FkOjQXcOyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792319864;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=2hvbZwVJ67WavHTL0Hg/tD3uKolUIz+pFxVaTnTuLZ4=;
	b=VRRBesRZTcl6sOYDWx46ZwMTb12CxmVVRshXo1f2bBsR0ixERP+FMnWBdadEg07HiZfv
	 x0Bh2eEjMmggTaQJqw5Q+/zlvqtKIWFG1Vm59OJfhQfmco/C+BfLd1wUA5n445djKxHRu
	 vmmZr7UDB1+HWyC9yL81JWZBQyD4ZWD0C38LuVkyrHpGlGJ7T4e0qRJOIuQ04xNABbyQG
	 bOPif1pgjrntMlP3LoUdH/MPiYyBK5SfhfCm4PpbsqdO4lx96b6ge16PrZnIAdYQ6ulNQ
	 CEHyzVvl4J7yLD2BfM2v4XyZmNnriPZsH5xhfFBi10MW2GFfgWYYG8BMehB+NF87fWQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792319864;
	bh=2hvbZwVJ67WavHTL0Hg/tD3uKolUIz+pFxVaTnTuLZ4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r+dzRYojCUh6jJWEsWWyXTK3PLua36LVZw6t1zSvYylS++/PHoQ5pbtR9W21eb1vk
	 aaXzkDIIPNOc2wdQKWIsPZQ8ACeh9R/VSk2y96owBqJ+lGs0MnyW7dI7e0TK/9ouo3
	 LzCiiNojvWNu6eZlSJpp8EnOcuTI/nUzTrvMsHezQ+m+HAelWN20yVpeaf4hB660zr
	 fy5IZdamSvoZstHrCaZnvNIjOg0Oh7lNbgxlf1DBbR8jddwfMqNCLv40IPEtB/qRV+
	 Ds4Hu773R/+2ZAd7lAzK90Ys8MTqaJ75QAj7LknRJCz0MmiIbkdpbIbVwCmY9L4Lh9
	 YfQ0/y6PMJ8GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F4936061A;
	Sun, 18 Oct 2026 10:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 346EB2A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 260F3811D1
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imE2t4ZZmUpD for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 10:37:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EBB7A80CDE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792319862;
 b=CO/eNxf3C9vhc28CZd3fTuV/FCSluPd/DA1lE5Tk5gXPN8DMH+BxqRqaRr69/YWmMFfD
 kvdsm/CjOgKDrf8jEfP6laFMTulK8PrgxG4ryTEWT62LGICOVF966EdUQkYtgfD1GL6K8
 BMbqaOtqaaxlujPEsK32IyX+R2B7H+T7IUtmDjCWSp60EYDIgN+M8c0BG2dLgdoQTCs78
 Ry/A749ClYUsZokBfZhX8yWOeWYEuZJ7MXS0lEGsTyQlHGNaUS9vC7KyXUsRBgsiEqYWL
 WnEHcwuAEx3muH58B4vOZ8SZRCpWDucaJjPY2K484NFr9p3yyXLBjpPTkAali+Qdo+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792319862;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=V3R/HtwV7+nDNPQ7eqLNrQr7FZG7YkUG4dXXkLLI0d0=;
 b=OBQA7oOvOSbYeHzrfVK1N6oFJKxB5e4ryMpKdzTR84kN5BMB1VIPUW41nVNuJnGezLvD
 g4MRcLZUdC+YFl0Lf43Y7f8cuVUEyOHh90cl8q9XMXSYfp3QLFE4f/4SBsmnenACg1rk1
 j2yJKgfeu8Qvin3FsDdD4/yai7Tr+hToErD+0/JFJEcdSZh5Z2tllGIWjG1WqSrd2OF7Y
 277HrGeesewwJCgNKAF0h/H9axAGvre8s+aQswIAfRHkUBZxCWdahkXd6VsJ4LrnpXTB3
 EV82cKsxwStSbpTPF9o43OyC4As6UTKVGP700cRWB2AeUIx+RbwxJlJT0ReP2Bm5oOw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ui2dvhVc; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBB7A80CDE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:37:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 026DFB00548;
 Sun, 18 Oct 2026 12:37:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 12:37:37 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 12:37:37 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261016090747.4170285-1-troglobit@gmail.com>
References: <20261016090747.4170285-1-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <d853bed6fab81354662ff432f2a89a4f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/mg: bump to v4.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/10/2026 11:07, Joachim Wiberg wrote:
> Release notes at:
> 
> - https://github.com/troglobit/mg/releases/tag/v4.2
> - https://github.com/troglobit/mg/releases/tag/v4.3
> - https://github.com/troglobit/mg/releases/tag/v4.4
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
