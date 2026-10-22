Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A1D606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 20:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oA6POkvw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70211811E7;
	Thu, 22 Oct 2026 20:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFXDEpu16Bjv; Thu, 22 Oct 2026 20:59:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7CFA181248
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792702770;
	b=CLwsHU+v1QfMEAauR+qSuOJaYBe28A/fWFrMEXKTSVQvlhArT6QSeXJaPW1jmvEY2tU2
	 xs7Mv+pIdIJBeA00LRoANWSCIRYOgDyo8xw2uptn76HXUpvNqSbJMefwuqg0sXOC7Wnas
	 MdYE1GIOLUL20OqrAdyp48pjCE2LWz2CI9ub5W06QdwlMN3j8wqhsokmz1s0J/6e25ONM
	 F7CSgzM94AvbFhM7EJTYLUFUG6eE//bYLg2c8D6TpLn6OHetOj0MFNY7FsxsSxzRSdFiI
	 bgKZY95Fap2nI4vTWxYBuIL8fLkjcmP6s//IoL2X3Uo9nl8JxVql1gQV1h/slRONd1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792702770;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RspAlPor8sLNhG3+v8tlzFbeeSZ83pA6trJjKPgsUtE=;
	b=XOhOsJg0BmRS4o1tukYTMgS9cg8YN7hLjMxPqp9CED42Gi/D/MNjE7Yvg64aSQfH5BnY
	 R9Fxov626NqzIJQslJlyeSHUDKNEu8ILb+MIbxYnqiC8YBGCf1QpF5grCYmyGfF+pzhVL
	 RPvmxGYfcjOIpdfKmHmz1n26iv5JXEUTA5XrZUR8dcFJJxSb4v/N0KTz/mXUvkDZShaRb
	 M71XFpx98eNedjJ7CbzRGp3I7CJRVoomKdusRdTmcyE9B7DXzMXod3w9P2EedakuJFQsp
	 U6ual3+xcrfFcMwln1ROCtlc6n9rG3/k4ikowBGgcwEpwdM7eTpxi0SLyaCF2EaJ6HA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792702770;
	bh=RspAlPor8sLNhG3+v8tlzFbeeSZ83pA6trJjKPgsUtE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oA6POkvwyhfjG5oJ/yxBVX28VXfEF65TZ7zHpy73dVNc2cr2YkbKDiWE0OiPdZYPP
	 fZKuArlSj3ds/1KloE9d7xIOvBNeGnDSQ631UR7DyE5kdZKrYwuShZi3KZfhHsPCgq
	 55nisCTwGtBB/rvl2pe+hPUuryCINutNQcfdnFic7S3id7xpi0a3CJN9L1eVENcLdB
	 AHgp4RA3WIKvrx/TPXstzH+vyIfN63AO1c2HmgljThu+UYD1cAEwawM84oo2iFxmt/
	 N0N8VMneP8GrnvHKOyR/W+QbbVSpVyfccM1mhWd9Vv4mWBz167iF7FVMGOraP/B83O
	 Oge4/Tl19COdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CFA181248;
	Thu, 22 Oct 2026 20:59:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 501443C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F52B4095B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIEUp-JK9C4p for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 20:59:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2ACA4409C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792702768;
 b=NH3QwvXCIqZW6SPUv5w/kam/8U7ZP0/tvjPoRZ2/Hs7sORUsKVk35xMvK4w+HZ49/Xao
 BKDX/U5E9RXMhu7HzT7EulIfyHzapUh8ASHCA9MYpJjNAbnDku5OMDHeqhE1IHWvK8yQd
 7uABBiusrmqCHNB3IsB45oXOn+IXSLY6hxO2eNtn9GdCDWV2BNGBmHY73Z/abT2z11tFo
 tavKbeN+F97CmNMVAlRM5SwDP3apKaHB5u4L8jnQlojvGROte093Ng4PJvcYJrUtCwK3y
 yUcycqa8NBQyaizQX/McFOZYVX9fqsD8GcLUJer05daLEQusB4n8wKMpq+aaPGT/VMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792702768;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Gfl46PIY4JPmrKq0+/x7yW1d6JmmFHvXGNx0HfpD9kg=;
 b=lQutu/zJv/Dyl5GW4Zd8ebs79WbsfyX1Imvqj5KZs3hduBdm7M9X+iOJWurw2xqHPoK3
 QOuPLUHI5OgBEJWPvCo8vHHGHV8as0zMClgxTozOKNIZY8+nXGyxTxzz5kXn1SaIycw8l
 Zv6PXBJaSEhR2QQCDijef72zHTKYgs7fN0zCJxgNYGwKP/Zw747QLlNK2CUdEYKmbpw+T
 vG2oTE/Glb4E/sPJsGzlgJ/cmivcIzhRBWnAhBCu8MCh+PVkSP+9d9zxSfSbILSyLHNHl
 O1VOVM/JKaRFvSwi+8trK/1dAXnoQYUUpObJ36eucjhScjbLQP7x4igvOTMAWHXFZrA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vic1lFlC; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ACA4409C8
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:59:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1F3C0C51457;
 Thu, 22 Oct 2026 21:00:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95FB460763;
 Thu, 22 Oct 2026 20:59:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34183103281B0; 
 Thu, 22 Oct 2026 22:59:18 +0200 (CEST)
Date: Thu, 22 Oct 2026 22:59:18 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>, 
 Martin Bark <martin@barkynet.com>
Message-ID: <atp5IpIVwXvaD5_E@windsurf>
References: <20261022153102.242860-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022153102.242860-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: security bump to
 v22.23.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 05:31:02PM +0200, Thomas Perale via buildroot wrote:
> This is a security release with multiple fixes, notably updated
> certificate following the eMudhra intermediate CA compromise, brotli
> remote code execution. For more information see:
> 
> - https://nodejs.org/en/blog/vulnerability/october-2026-security-releases
> 
> See the release logs:
>  - https://github.com/nodejs/node/releases/tag/v22.23.4
>  - https://github.com/nodejs/node/releases/tag/v22.23.3
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-105481: http: ensure agent data guard works without I/O
> - CVE-2026-105482: dns: validate resolve inputs for null bytes
> - CVE-2026-106069: tls: reject non-canonical IP addresses
> - CVE-2026-106073: permission: check permission model in realpathSync
> - CVE-2026-106074: crypto: reset random caches across snapshots
> - CVE-2026-111497: src: expose BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH
> - CVE-2026-111497: deps: brotli: cherry-pick 0ed4268a4401abcb44720963
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
