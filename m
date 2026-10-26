Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188F7606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iTa9U80O
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECB64605EC;
	Mon, 26 Oct 2026 21:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbmAwxwZZmJ4; Mon, 26 Oct 2026 21:51:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C1B53606CF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793051497;
	b=F7AWZ7tTeI+8eAxM60UhK8O8Xq0WkFyZd7H+gjvgDzWWBNd7NYZdqXbRsF/ECup65UxV
	 lRTGFXC3Q1hgF3wjtAUnoNVSQRP6VC80lSzF+qA13VbNb1WmlTVTUWExV6eHn5hfqAqty
	 wNoMCLmgZLMRaJhVfpMyQp58eV0Nb+0pvbJXKMAc4Yyp4B6JJmUAL7MmSwC6tpKuTU0vC
	 qkJbNmIHSJVibzLJWafsu5QBVZNMOTAV+Fcg8p7u5AOqadkq221HxseZON8MT/0dcNFD0
	 pGJkiGqlS8+DWmRO/w3wPJjYMgomSjIrovmKEE3mE4hQlbHCBR3VMX4B3UHUzHPZDVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793051497;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aXwOrDNqylquIM7ZB1TzQ+LGC+84d783duLVMiu6LMc=;
	b=IL0y9P6n71VIffA7iddAWKiX9Uez8smAZ1ki8ZDzhkAwCp2OJFUzSSgt7kWXAwohfGz7
	 se28pbJ0RF/u5pCo5iRk+cXQrmmgcIvubpjca9ETMVQ3sw0hcfREB2JATyKHuN2+uoba3
	 iV6oRGqba4ctXUlODD0Y3zLUynptBLjOMqgoWhOMXMArfBJfkjY0w8WMXKHA91syRnqy8
	 sbtMSUIzAaWh1lqyo8MWWVQYVgRJgNlLHveVIDmgAj0afDve3iJLR5zD8+oiSwsd6vzdt
	 1iMHZem2tLnIMXUINgv4NDjEUstmxBflH/gscMLgMqot+8x8LxEzRDL7NHP44242yMA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793051497;
	bh=aXwOrDNqylquIM7ZB1TzQ+LGC+84d783duLVMiu6LMc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iTa9U80OefoFh+WN6D+Jk8Bntqxwr6rOOLQqHYHdN0eS9gqC7e0DMd3qDr14Zdapt
	 SC0+GJIb2OlG6UQjPYDabs5TwkcQnOwk7Qn+4xK5XsZREb2pqSbR2wrF4QNtBENaDs
	 2DQDPFoqUiJ32dEaXNhrhOZx8YRzq5maXZToH7yB6OsuV44nnwQyK/Gp7ng8Eare8B
	 0ZuYzMgUHI47mvdnuVXfkbSBubQFAaLu9qz+PNTlWk6iPG5OGLBzkfH/FRWZrbBerL
	 nFwaSS287CS3W/rLfcq+JDMsZspFcdsiuOPGHUl40NMCQvyYxhjHV/CzPnYvagU4wg
	 tyduucpORUWpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1B53606CF;
	Mon, 26 Oct 2026 21:51:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 652053421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 630E440062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFXZHQCmJ4Tc for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:51:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D3F3840075
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793051495;
 b=CXx3VR5wG+GsKMvlc2rSUZgkrzle+f9ZXm3KDLXO+6KP3IoZoL9NBgg8Bq/zkyTRDB90
 BzezTxOpwzGV8FEGdr36BlhkfvYoOcij5MED2bpgLjzAsGqM7tYz1FwE1UmczXFvNyQk7
 1o88X5nj3QJ9UcaZcbBtJ9NtQ8sYkGwm+YGtT7Tddv9CrLO3aYoiyOcz+rdM4UXHoCZnq
 dM3Q7NkLPswtax5FSvEcVQ/jdSzhEQr0yQ3YXUyrnNi75DzAkQ39HJPNUadeyrRIsZj+3
 R6UGTtYdtCFaXr+++y6UnpNypf3pW8kQWRJFMklUlQyz4xj0vO3uXM/SkgfatxaL8MA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793051495;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=EFcb7mtKL5DT4ecd+yacX/WAE1XDuecv+j1hRfB23qA=;
 b=GfN9ZSjnuYCl2E/xsk0IvvnS4FTNKPcza+AReLHl9M0CvqgTN6ATBtGpdYfZWdECjSyN
 OP+Y6AjVNXpK2jrzu6PytuCcVv8tBO2EHiwPJWncgUYzlIKovIK8qptS/2PzUTic6X5Jy
 8+rjcv/5TyBTLjCg1M9yLNy2qraa3E4JoPWBVNMrXFODoSVVm5qaAHs6kgMM0hDPwbac9
 nap9PUcS3TkX+JddE8rNC1S9/3iRSordcB+ntZVR9NBcjnxW7eCrMRMN+t9Nmn7BfPJGO
 wByOJl9jEYk3iz+8MQEQqZhlyk7brtDyA3GPSJvVIXEBwcqIjPGFDTFK0G+XY1y1DGw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Nd2s3fRe; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3F3840075
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:51:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CA5031A135A;
 Mon, 26 Oct 2026 21:51:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A069A60740;
 Mon, 26 Oct 2026 21:51:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A7B010329061; Mon, 26 Oct 2026 22:51:27 +0100 (CET)
Date: Mon, 26 Oct 2026 22:51:26 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, 
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Message-ID: <at_LVObJnzBGy5Kx@windsurf>
References: <20261026141521.1906205-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026141521.1906205-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/dante: fix build on musl
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

On Mon, Oct 26, 2026 at 03:15:21PM +0100, Yegor Yefremov via buildroot wrote:
> Since version 1.4.4, dante's sched_setaffinity configure check defines
> _GNU_SOURCE before including <sched.h>, but the actual build only uses
> -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE. On musl, cpu_set_t
> is only declared with _GNU_SOURCE, so the check succeeds,
> HAVE_SCHED_SETAFFINITY is set, and the build fails:
> 
>   ../include/sockd.h:1604:4: error: unknown type name 'cpu_set_t'
> 
> glibc declares cpu_set_t unconditionally, so it is not affected.
> 
> Add a patch that defines _GNU_SOURCE on Linux in compiler.m4, so the
> build uses the same feature set as the configure check. This also
> keeps CPU affinity support enabled on musl.
> 
> This issue has been present since commit 7d95c34d6450 ("package/dante:
> security bump version to 1.4.4"), which brought in the modified
> configure check. It therefore affects 2025.11 and later, and 2025.02.x
> since 2025.02.8.
> 
> Fixes:
> https://autobuild.buildroot.org/results/0706b54c06cea6269d584bde2abeb8ee030e476e
> 
> Fixes: 7d95c34d64505214d56e452abc1f3502323266af ("package/dante: security bump version to 1.4.4")
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
