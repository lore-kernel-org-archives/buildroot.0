Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8674EC5AC67
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 22:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52CD640904;
	Thu,  6 Aug 2026 22:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INKcVs-7tIFR; Thu,  6 Aug 2026 22:04:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7533E408D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786053897;
	bh=x3iPEJcswimpCLTg61Oxg9qk4Av23nhPWUYp9rmH9uk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=fgF0srmsbI3IMLVOxB9GL6jS8cfGJOHnrpMOtQUwhzpJeSnr/UpaLwH/w1LtOy/hS
	 GbWuMtg8tnuHq4hfIxi2P51IwgjiJNjkeJOkTSlBB0s0VY3zd3/juoB6Ic4Sz0g9i0
	 tnc4rpuZ87peshuF9nHObG9oCOD+Zeg7JlH7fU+hzCoC0MolKVvIw87TTYIEiD8Dcy
	 S1GpeJK/JhrPYlf+/efO26eUF/l8UTvZu8k2KXWAKv8JejgGD4I7g3al5u2qIqNHvk
	 1U8rgc2jAA6PoaAd8VW/RgxMYw78MgXKGYX4qeyuvpQoTmUIPNj/xTkMq9rgBhVXxX
	 AUDFywz5RcPmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7533E408D3;
	Thu,  6 Aug 2026 22:04:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B79332B6
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9CF34024A
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqrQn2fqzxyc for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 22:04:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3777340118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3777340118
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3777340118
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:04:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma20q-1wMJkn0LwK-00LLOA; Fri, 07
 Aug 2026 00:04:53 +0200
Message-ID: <cb0d7cc3-77c2-45d9-9ee2-623534af27e7@gmx.de>
Date: Fri, 7 Aug 2026 00:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260806170329.1976989-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260806170329.1976989-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:fDB0rlXOYMBmFb2g16wBBeekvLiATPTLP4M91f8ujVkP7E79x5M
 f8ks4X23g2sFfj/iO3hgLhiDYfkbxvCJe5OKYyrXU5q0NUX0M6WewJiSuHUrKH304tAoTx8
 9GF7bIBjKzbaePOXsvg+XvCLuVSDqiLlSgk6V0uLQXyM2ay/0keEQjo9IAsJZElDNqHTvX6
 oyqy+E7YjchIxzBO6JnDQ==
UI-OutboundReport: notjunk:1;M01:P0:Eay17PwOA8k=;SntrmR9KU2e0LvA8xU6RhsTrNGw
 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
 ukT2CurIQ4qpG/IK3+0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786053893; x=1786658693; i=fiona.klute@gmx.de;
 bh=Um89cusy9xmelg17X5iG8j84nGb8Nyh3C8WjLgPVThY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=iQWrhd/b45hPmom0tZS6ol82ZkXhNr7+4kW7r0Hk17Ey1eu6HrktqVBa2dXV+o4k
 RSWEL/7aX9sZjAm5XDBDpmRznfBl0XNwsGdD5dv73WvUGid6/YgVcatctmmI2p/Xt
 sTWXXbc/bHM1hk66oMQL7sTEawF0ViN/4n93q+um62O1m6588KgvHGX6f2j3kbkWa
 FwoTIzilFlV3Yl8/I2Vk1hNyUjidx6rPmG460Cc7FFQCAJqlBz/dRNGO6Agjlk7ZO
 DzBe9F32krhmwZSXexB7bJv9TizyPS4i/rB5RYZwqCA0PP2rTVyYXivWdKxROrhpc
 UZ5nwQnhJEV+d0v0RQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=iQWrhd/b
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: security bump version
 to 2.7.6
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 06.08.26 um 19:03 schrieb Bernd Kuhls:
> https://github.com/OpenVPN/openvpn/blob/v2.7.6/Changes.rst
> 
> Fixes CVE-2026-63649 & CVE-2026-63650.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/72c62773e9f00aebff316312fcf47a7b4082d769
> 
>   package/openvpn/openvpn.hash | 2 +-
>   package/openvpn/openvpn.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index 651f430534..3822b8c5e9 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking signature
> -sha256  c6864b3c7d4e059c7d6ce22d1b5fa646c8b379a06af872eeb9792b6083a44ac4  openvpn-2.7.5.tar.gz
> +sha256  10e24a9385f23cc38cc5cf448f3ca0769f939bc4cbecc4f4647d7e006e52db74  openvpn-2.7.6.tar.gz
>   sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index d5fd308e63..e543610563 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENVPN_VERSION = 2.7.5
> +OPENVPN_VERSION = 2.7.6
>   OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
>   OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
>   OPENVPN_LICENSE = GPL-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
