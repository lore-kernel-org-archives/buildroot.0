Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645BBE668B5
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 14:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED66C61563;
	Sun, 24 Nov 2024 14:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_0tUfmjdrEz; Sun, 24 Nov 2024 14:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D4861565
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D4861565;
	Sun, 24 Nov 2024 14:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DBC14961
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 14:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B18A42F72
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 14:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOUm_sawjFyO for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 14:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F29D542F76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29D542F76
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F29D542F76
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 14:53:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 86D5E13F8B8;
 Sun, 24 Nov 2024 15:53:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55198])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Nov 2024 15:53:07 +0100
MIME-Version: 1.0
Date: Sun, 24 Nov 2024 15:53:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <874j3wrbta.fsf@dell.be.48ers.dk>
References: <20241123225155.3362363-1-peter@korsgaard.com>
 <3a4e6ae025bfd288bb98c7b492ec499f@free.fr> <874j3wrbta.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.9
Message-ID: <590e2a64e91171ef406a0f1f1f0fe1da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732459988;
 bh=8T+NhpxHgNYX1zu80lJq1fKpv1DgyWmjJlyvsh+bwfI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bz8qHegJVRscS2FkhYtK3IVuVV6ZGAJ369iIRIZNBjFjFbv2SfYS1DOx/JORhDmZW
 lTxd+++DuTEdcO6rSR8pla+H0Kb0RZmwsyJHO+t1y8MNuKAYtiTspFsNgsNLkTz2Z9
 uIZ7ndGEIX8EIY36Na6Nrcm+U8aqEaF1UsV7Coa8lGkQ5xmj+jpJwA4v9Zue/Jy5up
 sd9e+0HjJO1ZoRND2bBlOAjuLBHoO0c+rOiOVqEuPYUpJ0DeltKfafhNbrTBqx4m1X
 4J0bApFi3d5kmRlOH1A4WwwTQBMoVm8Gp77PkGDxrFaZ9D17vkoaaE1GuMut88Oyoi
 hi4/f07PPFPVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bz8qHegJ
Subject: Re: [Buildroot] [PATCH] package/quagga: fetch from
 sources.buildroot.net
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 24/11/2024 14:38, Peter Korsgaard wrote:
>>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:
> 
>  > Hi Peter,
>  > On 23/11/2024 23:51, Peter Korsgaard wrote:
>  >> Fixes
>  >> 
> https://autobuild.buildroot.org/results/54a/54a165827f536be47cd45c98da3937a1e94a7c65/
>  >> Upstream is no longer accessible, so use s.b.n instead.
>  >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  >> ---
>  >> package/quagga/quagga.mk | 3 ++-
>  >> 1 file changed, 2 insertions(+), 1 deletion(-)
>  >> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
>  >> index 5d8d52263a..dd921552f1 100644
>  >> --- a/package/quagga/quagga.mk
>  >> +++ b/package/quagga/quagga.mk
>  >> @@ -5,7 +5,8 @@
>  >> 
> ################################################################################
>  >> QUAGGA_VERSION = 1.2.4
>  >> -QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
>  >> +# upstream (http://download.savannah.gnu.org/releases/quagga) dead
>  >> +QUAGGA_SITE = http://sources.buildroot.net/quagga
> 
>  > Should we use https instead? The default BR2_BACKUP_SITE value
>  > is using it:
>  > 
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11-rc2/Config.in#L265
> 
> Given the download hashes it doesn't really matter. I used HTTP as that
> is what we use for the other packages and because of the server
> migration we are currently doing HTTPS is a bit tricky (buildroot.net
> DNS is at Cloudflare, buildroot.org is at Hetzner).

Thanks for the clarification. I applied to master.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
