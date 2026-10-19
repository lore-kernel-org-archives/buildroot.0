Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06735CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 09:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE1A8605EC;
	Mon, 19 Oct 2026 09:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rzq1fnvMIjWX; Mon, 19 Oct 2026 09:54:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DA2AE60603
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792403686;
	b=UxzlZay33GU4Mpara8+xy5prS7HKxK0orSH/GBTIpmRrkbvw7ozDX3ANOkPoEibI7xlY
	 Uz82BdFMbxSZ49f5ZqlDxnR5Z1GUHSC4hq9+sBnJPfn6F+TN354NTWgeDw39uSTvwgzkY
	 ANHXpjwMlMnBMy2rExYNn2rSo4pXj5BzENf+ZHvCXGTK/+lcSjxbnrg2jAcW9+YbsC4Ev
	 Fm0IIXtwpCiNiSSMF9sCluMcp4bU6J2qRyGOOVhzooROwe7/kLfwicjEeOFS3+BkMmeWt
	 nJSbEKEJYh46DToeSTBd0tyVQeTKc5FUlCR+hAT0xkGqnKiX9cvN4Dx1ZKUbB/+wyag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792403686;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=4yyyyPWTa3roX/3jKN6kG0rTbqTVJQ4dwtlMbDRSQao=;
	b=plDVEg5C5n1GW73dqY5UCFU+pKpHpex4Ea/7EGyZKF5Dt/k+zX89ZNBic+yp4dHKnTpr
	 QW6On5OmdPSxYmpxq5lYxegiN54yqdMBHE24KBWC96jy70apNBa2g44ZapxDWTaLtacAo
	 abR3NzAIJdhN/wAPNYQ3OjenCKbz7hT2IjC4Exbpe1x3jOKrEbWdWzp67YLi+0ui1fYLJ
	 xAFagRYYslz50FMwHZCZaHXDCcQdAH1Q6yTtV9mK4lNN1I9swcWK9e+SNvXr1U+01cEmk
	 kegH7x0HbatnbcUjDHsLGl3PTnk9rpQTGpwU2sq2tIwMeGybIzyR9r74W47FA38yFKg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792403685;
	bh=4yyyyPWTa3roX/3jKN6kG0rTbqTVJQ4dwtlMbDRSQao=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fWPp+mVeHM7uwMSiaR/9ONO2l6VgXI2kPCiVfgl8n0TnljnOx3lJ/6aWU+TGOS0qf
	 7LrpZO3p/WUOWak1DeO2WXQTj73jroEUoVQ/NHGYM1x+Y07k6q5KNcrWDONa7wSGNC
	 WYghgwgcay9oBRITT2GwVQx3YNCkYiOmAR0Hdw5tFDapbmQSrn6onbT0l3olMNePje
	 5DhkEBJ9MVQ+1ipV6luOdKkS8b6VDv4Tg7p7ha2wfho6D6OrjVwnYVEonSWzS6hpG3
	 VMZyjhLLLavXfkBmeZsnvQ3//q0gqyL/Es7pljlsyI0HjL/LpuucE0sQwW3AwRDY6M
	 OGSPYlGG0bFYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA2AE60603;
	Mon, 19 Oct 2026 09:54:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9418D2A8
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85FFC605FD
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDxQYEPm9aGI for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 09:54:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6F13D605EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792403683;
 b=VYwi8t6RHkA7DtNKu6uAIeqE7MktdSBPK1xGPP9OP0DjH0TUtQgZXoCaTSb0CJoK0F/b
 nqvlu+a0Qdf9wWoKlH58rVDnJVUqK7c9xBKFcswAaKe+b2INgp2vztkWDbNJ1hWe9tsxr
 dAERxLsecZ9toTQ3kBHo7cXHoi8Xzh8nt1+O1SkYarqySfYtnAXv4y1PEUNWjgGiuOWEQ
 rBPK8nQx2e8sSyapPFSddTGzil75pWDWDzqmHdNxgwmXQmCAZ7nprsoRzTUWi99DsGlAu
 pmLadAyCckNO/mNP1QHbDPtcV8jkqEctmNK/TJhFAbId3VbICbU00vE6A7lZtHBXf3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792403683;
 h=Received-SPF:Received:DKIM-Signature:Received:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=RRtX6Lf/svc8U/NRPnqxQurMRVFzpjNv3gr+5lq4Jvc=;
 b=r9S55AbSc833a+mcWbwPUIaVpYzhq2saX+2M4aB/VoNkHrSIyxplrjvGQdy1qVZMgaaV
 3nT9s/BRLT2cMibJE6sQJFphc7PjIoj+QEuW9TrYW6s00ahM7t85w0BWxkgOsTxiqI1Nu
 uVYEEuDAipAyCW0dinaSMwIt1NIBDXYBJICoWsy4b0LmymdTzu/CYnP6P1YUPmyqDyp5n
 kcwtZiBcCTqORKgkfpcibgXJE8ZMPW0C7WfxmJ+XOgMKROJWcYhMEDNaaCgT5UqRc4da8
 CG7HOl3pdCvk+2WfDM8PmGMPQ1cByFbVN/KPQLbEgs4uFofQyqnO/bUZDf7++pQEgSQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZCK1jlh+; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F13D605EC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:54:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c1b2:c247:1f34:4379])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1217D60141;
 Mon, 19 Oct 2026 11:54:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Oct 2026 11:54:07 +0200
Date: Mon, 19 Oct 2026 11:54:07 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org,
 Adam Ford <aford173@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Message-ID: <atXov2HEcIiVzCAU@landeda>
References: <20261018160651.349981-1-j@j-ernberg.se>
 <atUtmzafWnVtVm-t@windsurf> <atWwZGNSjbN0GrwD@landeda>
 <atXItOiRRP2j79zR@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atXItOiRRP2j79zR@windsurf>
Subject: Re: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
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

Thomas, All,

On 2026-10-19 09:40 +0200, Thomas Petazzoni spake thusly:
> On Mon, Oct 19, 2026 at 07:53:40AM +0200, Yann E. MORIN wrote:
> Yes, because right now we have:
>         [GL-using package] -> libgl -> libglvnd
> And separately
>         mesa3d -> libglvnd
> which means that [GL-using package] can be built before mesa3d, except
> that libglvnd doesn't provide *all* what is needed to act as a GL
> provider, for example it doesn't provide dri.pc.
[--SNIP--]
> > I wonder if should further have this:
> >     [GL-using package] -> libgl     ->     libglvnd
> >                               \-> mesa3d -/
> I'm afraid I don't understand your diagrams :-/

* libgl depends on libglvnd
* libgl depends on all actual GL providers (like mesa3d)
* actual GL providers (like mesa3d) depend on libglvnd

The trick will be to ensure that alibgl can depend on *all* actual GL
providers. This was easy for a single provider with the current virtual
package mechanism, esp. for providers in br2-external trees, but that
won't be usable when we allow for multiple providers...

This is where the complexity might creep in...

> > ... even though the libgl -> mesa3d would be here just to ensure build
> > ordering, and there would be nothing from mesa3d that the [GL-using
> > package] would use at build time in practice. I think...
> And that's where you're not correct, and that's the whole point of
> John's patch in the first place. Check out his commit log for details.

Sorry, I don't have the thread history here; only digest-subscribed.

> > Depends if Buildroot eventually want to support boards with two GPU, one
> > integrated and one (or more) discrete. This happens.
> 
> That is understood, but libglvnd was introduced in 2020, we're in late
> 2026 and nobody has enabled any other GL provider to be
> libglvnd-capable. So it seems like this dual GPU use case is currently
> of no interest to Buildroot users?

IIRC, one of the reason to bump the nvidia-driver back at the time,
besides the bump itself, was that the newer driver was glvnd-aware.
But this has stalled.

Also, eventually, there are tricks to actually have multiple GL
providers, when one uses br2-external trees, so even if GL providers
bundled in Buildroot do not play nice with glvnd, it does not mean
out-of-tree providers can't use it...

> Essentially, I'm trying to figure out whether we should:
> (1) Fix this libglvnd issue by adding more complexity
> or
> (2) Re-simplify everything by dropping libglvnd entirely

Well, no longer my call to make anymore. I was just providing a
recollection of what I remembered from back then.

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
