Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48757606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XfoXdvo0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2598C811F9;
	Thu, 26 Nov 2026 22:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pl8hRnehLgEH; Thu, 26 Nov 2026 22:11:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 48DCA811CA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795731082;
	b=AesKFgkNOdqwe9QhZrWocjSJtff1oonwgPtx+ZCIbFrJ+d/9zj+a0uLb8xw1/BnFxN8v
	 ffzwtv6DJ8+6FyB3SlI2JPcfUF63tHqUokGeWzsVq1Q5wOGjr255eqJkJukoXuJ7GY9eC
	 MrzRT97IzMoAIBSYUyBTh/R1HUssQ/dV1HLMEAyO7k5//KwGSMNab0C47cz7fgVcTMERJ
	 J0Q7mpoDJNFyWMH7IAFaNdxn/A94uoab1t1lduzBwOOrId+D+ioY1JP+LANj1VGqmGsVp
	 el4bIWVtA1v9XhW7gVS1uAevxc9HVdn1cwb6c11iCBjd8NMJjcJKkplQVNUwa+Oxy9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795731082;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=97eUHLL4hVRBgtN9C9j87+iZPSjlVHLH4kZjZcQk+4A=;
	b=P1tdy7Bv2lJ9TU3hHL1JzLYGdd4zB3ffb6mHMRsnmk0ptUmJvesv7QJBpLOQC3EvPmOL
	 gJ6cfbGxvEcCQpNXBA7Bp8EHjtbQS2FdIdbJ84vLKJR2w22MpTr0rvhJyeVoPhqYP+akv
	 yn2jDRMh5xYU/HMwzJR5nBuYpfAC59qqrMSG937ZQLcA+Ta0ijpl7ofJ2vXSe7O6I2Kuq
	 tVBp9SUo5KFeArcN1+eCLNmn1rXNPiztZ3DxLaOzRIq5UCEgvlOg3bDq2uobp8gPSIvKo
	 LM+gJJnl2CzmBFiow9ZbWqZ/pQDDFhME4vU1YrVKkCz518TwFL39e9vNM3NQxjDhKxw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795731082;
	bh=97eUHLL4hVRBgtN9C9j87+iZPSjlVHLH4kZjZcQk+4A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XfoXdvo0lAi97C8UPKaCu07459V8e3Yvnj0tzaZae9MbJihXkYi82othQ2MAG8aGw
	 /ukY3/9hIP+j0yhcii8Iph4ugQRMMauFqvzXZaAXFC/nQRysxwzkPa6QQq0osuPTR2
	 agF9NGl00UAYHRod2xkjPiq5zufQGs+d3bdFjSH0fkl9qyyYI7fXFy2IrCCC/Uf9V2
	 dkNJBtz7jn2lwoKA691TR5cgQKRVSlP3vNm4q9EFxBn2T8sj7lubP4a9d/zBe/l6rc
	 gTF7hOd/i0S4a1jKhIrSL+s/G9ViNgxTPi0v/kcZUWfyjjz/7YIZ/UfRFzADiKgMi7
	 nQ8fjmOk0lVIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48DCA811CA;
	Thu, 26 Nov 2026 22:11:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBB56260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1D3C400CB
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuUiD6wtcmfQ for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:11:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 66414400A0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66414400A0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:11:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 85AF11A1810
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:11:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5455F60558;
 Thu, 26 Nov 2026 22:11:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9773211E691D1; Thu, 26 Nov 2026 23:11:12 +0100 (CET)
Date: Thu, 26 Nov 2026 23:11:12 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <awiueaSidgFNuYGp@windsurf>
References: <20261126114110.667721-1-chakrabortyshubham66@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261126114110.667721-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/bash-completion: bump to version
 2.18.0
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

On Thu, Nov 26, 2026 at 05:11:09PM +0530, Shubham Chakraborty wrote:
> Release notes:
> https://github.com/scop/bash-completion/blob/2.18.0/CHANGELOG.md
> 
> Tested using:
>  utils/test-pkg -c /tmp/bash-completion.config -p bash-completion
>  (Result: 6 builds, 1 skipped, 0 build failed)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to next, thanks!

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
