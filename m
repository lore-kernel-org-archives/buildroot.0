Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0499606A31B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cfDXY67u
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9E580A58;
	Mon, 26 Oct 2026 20:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPT8_dIJs6it; Mon, 26 Oct 2026 20:35:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BBFE880AEA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793046915;
	b=HkRC02406IRfSq7v/jEeBDMVGeUYk4zQVTHgT5mj9/5mPA6AgmVVin9FiKo8Sjf4FSHZ
	 NYQucWKY54TZM3mGwwpVITkO4+84BvrmXVXdnDhxyf1HJJmohXgLqa3Vr5jA/klmRQYEe
	 ELiBkNaV2wocQOasL6FbLsnkp5H3gUKgczVxfg3mXby14Bpd6U1jYBbrbuP3CFb4pIHf6
	 z4cIn6Dqy1Ivj1AkDU11EeUDSVGLERq4FBcx8TAQ5VOm/1ralpcssMhtNqVxCFdXbmVVt
	 AyBxW9rkHPYFSQpXTl8SPTJZA1YLxrkTFJ+9l07qauUOFn3s4BXIVjHja5Pcu3CB89g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=KQ6ED300MJOWaiqL4H5+/919EBSJgRx7stHhTScL+E4=;
	b=nsazOeNC6oRkCHWOn/szr0/CZp2XrcpY+LqcZ1ZXX3fa6oY9smu1kO8F+twcalHMTz41
	 zogC134O7gXwUN+n2n5vc59/4x5m8mzUWpyp8fMuhTKz0Ocruf5AGo50jmCBBsGq2ndXh
	 PGr2wYCy6WmyIolsSCW3Tr87ZIlRbS0OCpteRU4uSUt7jF1zZlLl7++7XqBy5QLjG2V0T
	 aL29gqLczCclZdtXUjgYPUZkXnlm3ENIFbtFuxiL3Ui1sHuQHE361nWuiEzRXlLHNeD1E
	 D6VGqJdCAWO497tOEjG9cNwzA8ntKnzPgXrZByCa41D6tcQSCQiNgw28+FVVRipLpjA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793046915;
	bh=KQ6ED300MJOWaiqL4H5+/919EBSJgRx7stHhTScL+E4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cfDXY67ueC9jJVwLezWgh4Y1SKoqg2NFnB2bIppdqoZUKR6igHDicm6pIpdVL83iD
	 1Q7Z7L2acRKoFQgGSLdELyos+hNlQ+rdv3TiDcY6qPhI/n48vThi/bUGqpq4E3eA97
	 S5EwConoK3+QpAEW0xAZI4/ZDWxI+XcUY82MJzF6u+xjhCdA08D1mwaTo17gCnQxGS
	 OQEXhkeX284muEQoky3d2eB/VI4fhlvlpfs6mDw8BOZ3WHh1PQojdXlZRzlC0FervN
	 fSpPaiC7hcqSideg7LHX/XaiV43D+OZvlnyqTNMH3CVvHC11x6xjfXIEjo6O6V+/Bz
	 fJr6V6TrSTnbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBFE880AEA;
	Mon, 26 Oct 2026 20:35:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC1FE235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD9CC40520
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLoFwBdZSwKh for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:35:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C32A34051C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793046914;
 b=YiTHuAaH1S8BSTvjR7PwBFKVXd+BFkUHSuIkrGQb5V+OUEDGvoLa2DbeX6l0SEXRUMZ0
 RKrDHOopXb/EfO/w6s4sOECDeHlwgsF1vQYm/+eMtFd1KlH0iUToLn+f3oqN7Vl7uHJ8r
 uDfCv0uHgg1I5LA2sl79z7w6B5TAiN6w0BmPX4MssJTYccC/tIY72xsZjmdG7HvLHRVJL
 yP3KMkcxnVENLuv++Tb+uPZPbme3HhZLDsinmvGF5KBrorund8Ixnlmh+Hjx1E/0qurE1
 5fJoNAyX93ZCkV8sVPpqE6lqgPoAzVcN7zFbcg6KtpuwcF10xyLGP4W2DPhDbPc4nIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793046914;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=p0Oi17DW1Naxx1+d8AQMmm1Lpq9nqugWVzvvaivcsSE=;
 b=muqjY+hkRCkaVCrhgC1LsQ6120XuflKnCKm1WzIDbEv+0Xp0pdzbs2PJ40EO73f2epJu
 5V0zcAhhf2iYe201zH6xQ++fNYHqVJxa21Fwlya/MrhnUy0ry4O7KxTo2TrBr5wpAFfcg
 C44jfPdWjZqrkb76C5TaAI4TBd46VtJWy5df0bFmz32mrXyQRxxPMn0pFiWvJcSYoEplY
 16w6x2VzOImPxDaPoU/zCvo1HOsNgTa2BNkfDBjLYYwrAPlmq4ealJjzsP95auyq4+evi
 1hjIJdyhDpBWDb0tNiz7eDa6NUyELAx8YviAmyEvJHnz/0b2zs44gxDHCElRnfOZ2RQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YTYP6vr5; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C32A34051C
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:35:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A31442003C1;
 Mon, 26 Oct 2026 21:35:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 26 Oct 2026 21:35:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 21:35:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>
In-Reply-To: <20261025220723.1332924-4-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
 <20261025220723.1332924-4-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <a4c64f302c4f6d16b94159d3fc524679@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 03/34] package/containerd: bump version to
 v2.1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bernd,

Thanks for this series.

On 25/10/2026 23:06, Bernd Kuhls wrote:
> From: Stefan Agner <stefan@agner.ch>
> 
> Latest minor release.
> 
> https://github.com/containerd/containerd/releases/tag/v2.1.3
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> [Bernd: rebased]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash 
> b/package/containerd/containerd.hash
> index 97d2691c5a..1c3a39d99a 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>  # Computed locally
> -sha256  
> a07e4bc9959ffdc409d2df22bd199be93fcb7a88f77b3c3dd1c07c199c01b42b  
> containerd-2.0.14-go2.tar.gz
> +sha256  
> f5fd43b9eefd71ddef100e7070016f9e40a1d689251bc885a2d2a87750da26b5  
> containerd-2.1.3-go2.tar.gz
>  sha256  
> 4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  
> LICENSE
> diff --git a/package/containerd/containerd.mk 
> b/package/containerd/containerd.mk
> index 753011e125..379f9c4059 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -CONTAINERD_VERSION = 2.0.14
> +CONTAINERD_VERSION = 2.1.3

Keeping all those intermediate bump commits will increase the
maintenance work.

Could you squash all bumps of each package altogether, please?

>  CONTAINERD_SITE = $(call 
> github,containerd,containerd,v$(CONTAINERD_VERSION))
>  CONTAINERD_LICENSE = Apache-2.0
>  CONTAINERD_LICENSE_FILES = LICENSE
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
