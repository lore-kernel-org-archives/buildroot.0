Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B6606A31D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eyZLxCcw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1595D80D9E;
	Wed, 21 Oct 2026 20:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbC9aZJiiBRc; Wed, 21 Oct 2026 20:05:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4EC4080BEA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613154;
	b=TVa1l4pWA0VM76yQ9q9CELMVvngQp1ye3VsSp9xGXgyPZ1R9DByPrne4ukozyjKAn5CH
	 QSNe9j2+yYW32zP6r2iZ0hDR5zUCGqMTbQq1ox8HUF7gi7I21imCKaYzDLrmJiRdjZmh7
	 +JdMpmBZAzeZDrV2FidOo92dmHET4bZMJhfYzl+rcGOtCZMm1cVkK2w59OdJ6TpLBbMj1
	 85IQi7wv0Npp7P8F93+pMWteH2IsYxHEUN4Y89JPvLvqBpUKBl0Ayw6F65RYxDPXSoT4h
	 erghJtMOH3wvlkZHw/Z/gLFr9o1yxH3tK424cs8jsGPbXdPy6teLzb9SQwKYZRmEoag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=C+utAD01G9kk0F0iD/wPcv36YJh1ydxSTEK9DeLhyws=;
	b=ne6wRYc6rBWN1VztQ7pM94BxHzXUagiCoQzls8NspEZGK83xNJ9gdZBoVedUaVKyiIF3
	 1y2vBG6Zgy/fqoKr2zp633DU5P7dUr15HxpkqOtA9/mLG53Z6xh8CkZERihVUC+8y38eK
	 VcgU8J8CZjEeQm4Ao53ILdvSWAcdAMBn8L/jdKrAP3h4Eio3jEf/OFG1UpPYNJ4anaab5
	 44hqOl9OsT3QFY0V4uJkTFBmPJDUohPBbyhJlWAqUwj8fid+/l1+m+XECFfgDAOchHIGM
	 DvkWbkiL5py4ZzJJzhB8Mw73MTbFdmvPT4SaZJe30GNAQIYvrGJ9w5JwQoyBypYgSLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613154;
	bh=C+utAD01G9kk0F0iD/wPcv36YJh1ydxSTEK9DeLhyws=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eyZLxCcwjq5TwfA5Qgr+PRYig6TbyZxwbKsddgRR8QMfMqCf/cWgdNjNY4NW3Ok/m
	 HqlsG5y1GMfc6z7ERm4x0bZY/kVVOuJRmTbAN61vSAyqKAjC514EWC/4R1J2PbDWk8
	 CNk22kzMSOq//Uqtdewk+KzP7frI0pAnTZXQKRPmPd6gThJzfr96UV16FzRdSSwLJA
	 0qdFw3XSSQ615PEe0HU366TW1vgxbCmScj0UmKJLuSvbxxZNt6SV+9FH/HB3qZzToH
	 Nr9fLNV/RVf97DELS3lINSSPqVQ2cul1ze5IkDgYGRXoUv+bSIOBjvqGPfFI7Bbb4N
	 Gn7KmpOYIEJ5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC4080BEA;
	Wed, 21 Oct 2026 20:05:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9B32356
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB1AA40E42
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abzgc8xiYoSg for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:05:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5710D40E4C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613151;
 b=qn1K8c+LXqljykezUDkiQ+imdjxrOws3VVbfTYrsT2usxRfS35tY10llmlfIQ1nPjM3g
 fHEZStE8b/PosPTj3pkrYY1Iah60KKS0Xlmxbk4iEm1ZrBCxbRZYScLhugPjqJzkCJjMM
 BR5OvkGQY8y1OHS9Ym9nP963Fz7Uk4oL7U8zQ5vFZB7SPPAtNS9fhVG1FFPAJKKfaCXAT
 OlAtKxIWJ7GTRir68UdnHWyQOcwnQVa+QsAkwuFAVFh7h8TfRRbLfB6MWfEkWOI/fPUZz
 clC3alpMQMxE8E8BG31M2fzQuLwSdvsP5+D5iYeu2+qWzoVBS+R5Js6nBg0G+24M1tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613151;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=BHLJWn/uKd5Ghro0iogwjt3lKb6slEBS25lZzdSpD4Y=;
 b=EvDZoYr9Z+WfbLLK0Sb6SK9zqqqt7mTVW8Rdgp+0cw5aCguSXqVK8zSH9+GAlHjfKTX6
 6URfRtY/l4sjrE0cGWfCTiUnFoQC8gGa06OdIeayA7TF8Cxv+tOqkmFBk0+dTkd0DzJ5q
 c2rPuD8s6SsPS3bfp4ddTRSAKeORia9Zsr11lEYSBJiUmZdGKNneQIpkAZuPBzX34MEi3
 kiKEjEsIvNNwQyOduiW/TIAdwg9nGUKMFi+zdqFc4CZRxZOiiSD/rQ79B4fbCGtGq5d4I
 UTEWsAecd1uVzHMtEsynvFLhqn4FyMx4c84f2cv4esiBNyU/hUi97QnofzwJfATrdiQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1f67ZYx+; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5710D40E4C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:05:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1F97B4E41296;
 Wed, 21 Oct 2026 20:05:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C2A46606E3;
 Wed, 21 Oct 2026 20:05:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7432D10328D6E; 
 Wed, 21 Oct 2026 22:05:42 +0200 (CEST)
Date: Wed, 21 Oct 2026 22:05:41 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Gary Bisson <bisson.gary@gmail.com>, 
 Refik Tuzakli <tuzakli.refik@gmail.com>
Message-ID: <atka_8cyM1h3QCdF@windsurf>
References: <20261020102906.1918308-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020102906.1918308-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/7] package/freescale-ele-imx: install with
 original filename
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

On Tue, Oct 20, 2026 at 12:28:55PM +0200, Peter Korsgaard wrote:
> U-Boot expects the original filename (E.G. mx93a1-ahab-container.img rather
> than ahab-container.img), so install into BINARIES_DIR with the original
> filename and add a ahab-container.img symlink similar to how it is done in
> firmware-imx.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Patches 1, 2, 3, 5, 6, 7 from this series applied. I haven't applied
patch 4 yet, I'll reply to it separately.

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
