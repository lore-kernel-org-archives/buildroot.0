Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC469606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RAdXpKhd
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A49B94055D;
	Tue, 27 Oct 2026 16:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TF9gPs4SRW_v; Tue, 27 Oct 2026 16:09:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B55C640567
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117349;
	b=Hkr88BRwatp/LkKKwWbVgMHXPvHforJkI+GNoiv5G1pOUl2DhnAnGYREc8ddaRUH4UYy
	 JnrEFLv01raKmJLdpFM4BriGD+ueRmPF1zH8895coefdzOhStqp4x47YOXoXZHjSeUEw7
	 nqgFFywtzdAO5H5QWHZClP0vIqZJB1sG3V6mpIGEloA1tpNDQlKtzGFpWNDw+71PRDuCb
	 +z0zc7xR/YQKbluwm3TpbXKgoNiYsMDIhiewzA8bl8PljygM4UHl+fjWQFihnT3kxvrez
	 bL4A1HobI9aA/3hKiJ3LqDjdeDKKOQYIS8memsS5jo4Pc9NXqdVzEqwXt4V8GuJfU/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117349;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4FqhIocx9zB5ZQj5/KbQ3TULtqR5l9Jt84bkcDQ4zOw=;
	b=MGb31qXMIBM4rJLXD3IrmShagTb3QkSOugvZXyMEwZLd8SB0fb4kA2cNPrMrLt0xLjBf
	 qoEd6KVdItUJDou/OWaSd4G379iwDR09oFGq8gGm2fT/bu+9BlWYVFH8wOYZnTJgRsCWf
	 TlGfnP2RByYS+skJSAWL4zj2gQIEJGQ7rZLgZNyzdB1ghqgFHQpfFzgQaMBMksI3xjzmO
	 3epxUxocfLcLIda0Fgv6Ezl4EMOFzGdbXEd97hq+iMAirKH4K4/eL4zWNqb9hdm1d/aoh
	 M2C0pQz9N3h1IIucF1AzhXeL7qzpjb1/nKsCZ+gdnzfbTNb8zmAHpVJDnwYK4f2RU6A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117349;
	bh=4FqhIocx9zB5ZQj5/KbQ3TULtqR5l9Jt84bkcDQ4zOw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RAdXpKhdzMg2Re6FRzQpqru3EjZdkFosScXxSDfL68Xwu+w+Iz7zmzz4B9667JAzc
	 8S6qDuXzKAOiGulV5ZQhGztKs7tNfgUg5wIrz/yiKM73XbNjFgGBs3GO4dwBbOevp1
	 T3jYzfNFePQMwUugArKxmuDmSO2sGwCBGbxKKsCrrEhszekVMKZEm+Upnxb7iOzCgY
	 YXYhed4l3jQwDt+bM4Qtg05lKtdkQfWKmOuXyMmppDc9ryo36X80XrUJFQ7gcP42Wv
	 u0LNv/zpDd353YuT1dcKyRRgSF987s/7bY0dvug0Pj3TArFSqOEvSfyY1YpTZi1Iwp
	 HYwtzWpbIHnQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B55C640567;
	Tue, 27 Oct 2026 16:09:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56CE72F5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5453740567
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7ehLx9fBlSE for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:09:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7561A4055D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117347;
 b=At27r5n/wOJacIRjd7u+OfXR46D5UAepRhrSqY1YFlKAN/UvAgcxUvihrPUaVhx2L3uA
 0Lvh1s8hLDVKmH5Oz8wEE5lL47hzd4DhOXBvWvd6SCaiipB90p1+PWzLLms0N4P+XuQ49
 IiiUJ0lqGqx4PC7IJ35sHzJ//MF2doGGKp2Q3pcV1XIWPdopeAQe1AT8vKjh1Yh+lb1g3
 A4Si7Ae+rQrv/rEjPeRb4M9v89QHryzyhnPFiC5J6fNjfhrBrorwADyk2ctXd4ARQx+xJ
 V5pgU5wnBvlFEGb5okN0G8yQz5gBM868fFgMp7oEhVxsMv4SZOIn/IxIF12w9XzYZ9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117347;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=aO/346AIaFbNOC3T9FNL9HgVo08/J6Ah91ZxZxOvoTs=;
 b=kPUMeGKuI3G01gt6UPbMclsOwgMF62f2trNpNDm9RSoByx74WHesK//lXKzbKMGWg8LV
 /DQ6eSKs94ky5FbmBYBMyiwHCIwio8z6bf73y4/mphiB6JFvsAI+dXBIZCHICQSGv3QJT
 W6okyd1II+7XjlzPc/QP+7M1y8SN1uJE1Yq7hN1yDXPeiMYQ0/gROKHQUqvRxHMzoMkau
 D69uPDFCSe1Bcn+uGW6imEP+CjFtsyMea2v5EQVc/azY2w63kmzifLMsfZRU6nZ62S/Jv
 qKSOScvjngq+aJ+5KJPhqAdwOLy00wjUS9VTzxBnszrgIdB1JauKEHuWfK03AIXZ+PQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=d3W+P76f; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7561A4055D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:09:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B33FE1A1350;
 Tue, 27 Oct 2026 16:09:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6C209603BD;
 Tue, 27 Oct 2026 16:09:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08D1C10328A20; Tue, 27 Oct 2026 17:09:03 +0100 (CET)
Date: Tue, 27 Oct 2026 17:09:03 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Danomi Manchego <danomimanchego123@gmail.com>
Message-ID: <auDMmNNMbgZTC16s@windsurf>
References: <20261027081659.3905442-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027081659.3905442-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libwebsockets: fix OpenSSL
 detection without libatomic
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 09:16:59AM +0100, Yegor Yefremov wrote:
> Since version 4.5.3, libwebsockets adds -latomic to the libraries used
> by its OpenSSL API probes whenever 64-bit atomics don't work out of the
> box, without checking that libatomic is available. Buildroot toolchains
> without thread support don't provide libatomic, so on a CPU without
> native 64-bit atomics (e.g. ARMv5) all probes fail to link:
> 
>   ld: cannot find -latomic: No such file or directory
> 
> libwebsockets then assumes a pre-1.1 OpenSSL and fails to build:
> 
> -- Performing Test HAVE_WORKING_ATOMIC_64 - Failed
> [...]
> -- Looking for HMAC_CTX_new - not found
> [...]
> include/libwebsockets/lws-genhash.h:93:18: error: field 'ctx' has incomplete type
>    93 |         HMAC_CTX ctx;
>       |                  ^~~
> 
> Add a patch, sent upstream, to only use libatomic if linking against it
> makes the 64-bit atomics test pass.
> 
> This issue has been present since commit 20c3eb6eb684
> ("package/libwebsockets: bump version to 4.5.7"), which bumped
> libwebsockets from 4.4.1 to 4.5.7, the atomic check having been added
> in 4.5.3. It therefore affects 2026.05 and later.
> 
> Fixes:
> https://autobuild.buildroot.org/results/863c30265623973e15a25c2d38c0e1631a39b7e8
> 
> Fixes: 20c3eb6eb68432c37d5db69963be266b7f2d23f7 ("package/libwebsockets: bump version to 4.5.7")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

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
