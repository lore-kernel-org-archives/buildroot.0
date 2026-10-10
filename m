Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83A8CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 13:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E64F81127;
	Sat, 10 Oct 2026 13:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5xT1qLPwWej; Sat, 10 Oct 2026 13:51:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1264E8129D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791640313;
	b=Nhqc8D491BrqzybDhIKieREqm9H3QhagicVx03eyzM6QVtprmnO1qb0pgGAZqnLx/vU6
	 Ry0PzifhokP6gbw2ii+DYeF8l/IU4U2JCFgDSsgh4VJqBhacaCbYQWQZkXaV0dArfIANU
	 7IKq2DU9EgtrDG/t/BnjQhl3aHA49J71iSO7bWfY5+eooGRaBpxQS0infDs82jyBCOps+
	 k/9IgxR+26lcjt4UP90zkLoLsgd9KUibX+30H3O4C6d9QY+Jmnk+BE81ybnD5XfjMxD/w
	 szN+9YQonBpZufO7f0Sy9lZ2+PUwEbvoY02LXxePp4hViBW3FNnhXSGRA7G3wy1d+Fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791640313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=MONnHgDavcu7fwNkRhvNs4eGqaguaNp9KwRuPUWdHaE=;
	b=K5YcBeUJPC707iatI/bglue4Yjh0qDiXZ3O38cVdmkUfY//fiKq+RDEgwO+NgWZ1tun+
	 VLAxpBy68/BTpFdAawmtyChmbgOR3pljap5TAREro2cp491yr+UMTxOyJU7SihmphiLF/
	 LoNyYWEKmBsFyJ31DpW78jFBqgcHBYddD9iELqGT5n+kFDqQsyZlH1ZEbwRxWd8GVji3v
	 4lrWPJEXhfGIhv0WFwEIK7zIblDHKW86+PVE7HD1QUziHBdtPQFGsMJgVFlCJahhINTFB
	 Zzuy9s92pFBb7Lp9oNG+i3L+TvKuSvppP14qMPpWCQLjUDSHuWM3OfzweQJF/Nk9zRg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791640313;
	bh=MONnHgDavcu7fwNkRhvNs4eGqaguaNp9KwRuPUWdHaE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iBRWUYPeZZvwyyxntuXOSyZPojXsblfa+LIWdB92r76exagYE0665U8Hss/jWGwPW
	 MUfM8ovtNMhMjHoisGyJ8h1ctKhr6jaCb+Iy9T5XSKzoumxgLw2NK1P3w/LSqwSRQl
	 QzaKIYC0PAka8A5gsw0a+plWMHnAVyysJh3wXkXshZ1qK4pi3gZ23Aha4qHXxTwRxb
	 ffZvT1P9/oerwaJ2A4Ab0e/2Gvic2mf4bQ62swnroTOQ9ubaDnK3M6cev8ZXvYy1rE
	 PK2kKp/C6bWuxLjUySVi6qL4N/9FOx835ejz7dtDRyAN73sNsNgizkw62y4tL1Tql6
	 XYoj6uQqAj4NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1264E8129D;
	Sat, 10 Oct 2026 13:51:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F863105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 310BE60648
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crfGpoP0Mxxk for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 13:51:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 177B46064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791640311;
 b=AtPyub8qaAmNlyfWWSxOsiMEPUt79U4sdxi3bvZnsZa4DozOiYG2RHlvul1hmAd6nUvv
 k087NjbNTWBv5bGxXnFz01Kw05PmFICcg9vPlljvyGda6J9wxRAagp4EnWNCOmVe6eaQG
 gONzkYZHAFUHtgO32nFTErbZB85KHVojfl3EUr08VHLZo16AC8+HNvLpQV8nEQ/6dGpjF
 gk50JxVSHJ6DKMoR/+tVRqFERMQOELEM6BApZIo3DoNP22XKjAQHJRNtXBjw0GW4zkG1s
 6voBXvvrDkHEyX+nyAoL0J+q9owOvupFR/wiL0nQ1shpQ/YKbmACPp1RAf6/ePbnxVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791640311;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=yKJXoow8QRxPDjwvo0Ww8pU8/x9yRSMd+JGPZxovnKY=;
 b=iT19aS1yQWc90ABtBhWVYH/dtubi06BjWs5OWotBZHjDvvsB1feBRBniAZJepv00MgQY
 bN+BHaoHqZk/hwgsHABwISlD1NzeVHmImyfFW3vLqi6x0Vqw3ff3BSC3vP5djX47E19dq
 6kt5z7vTHHYPLr5ae0G5PxoscH5ruucLLpVJCEeThZ4yzRLPqpQupZO3ljjkwI8uJZwzi
 2lPPk3/kbPkOz7ZYjjpNCicDwnWgMLIYt77zBn3w362aSkctnfAhlr1ca7BngbFx2Taqa
 /3q7r7JCR5atNc6ygUBvKrp4XLEQqf8NI0hGuNZPPCULQ8Sbtt6OoAcNBTyX7VsRyZQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gyGEigHI; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 177B46064B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:51:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0C03419F5B2;
 Sat, 10 Oct 2026 15:51:46 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 15:51:46 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 15:51:46 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003142426.3532277-1-fiona.klute@gmx.de>
References: <20261003142426.3532277-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <bd38a50d008c82163c3a93750d1058b3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump version
 to 1.58.1
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

On 03/10/2026 16:24, Fiona Klute via buildroot wrote:
> Upstream changelog:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.58.1/NEWS?ref_type=tags
> 
> Changes relevant for Buildroot build:
> 
> * Support for dhclient has been removed, drop the conditional block
>   for BR2_PACKAGE_DHCP_CLIENT=y.
> 
> * NetworkManager now installs a systemd generator to manage its initrd
>   units, disable it if building without systemd or for systemd without
>   initrd support by setting the target system generator directory to
>   "no" [1]. Note that the current upstream main branch adds a build
>   option for initrd support, likely to be released with 1.60.x, which
>   should supersede removing the initrd units and disabling the
>   generator when building with systemd.
> 
> * Contrary to what the NEWS file states, the new "clat" build option
>   is enabled by default. Disable it, (optionally) enabling would
>   require libbpf and a suitable BPF compiler.
> 
> [1] 
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.58.1/meson.build?ref_type=tags#L416-417
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
