Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4A7606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ncR7588I
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3014C40FFB;
	Wed, 21 Oct 2026 19:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvGtEuls_DhZ; Wed, 21 Oct 2026 19:21:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CAE1040FFF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610490;
	b=HiZj1//x/00KAJWzPYmKFh7l9ajQgBzP53DhmXn7CcYfw55H1UeBE4hWnY/kmFz1MuxK
	 /dhj0ZQIeJ57IjRJf8xk4MzcrAi+w5/0wR353MiKNQBwweriA4sXDIk6vC33FSdtu7peh
	 Gc+MAlBBikv/aMeN86ROmdzMkjjaugCHcAdu10WkbjWBEEMtST/khbWo2Z60TGqzN2Kov
	 OPUJvXl/U8lMWUcCehZ++QE+TdPMtQkgI1kseH//kGUjauaAws7bhgl9/0nmcT0KRmlFP
	 imaajjVipt6CxrvSKE7KqT7qsVTuC71zezstS7uSTJBFJpV1826WME6PnKmk/fksmZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610490;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5EWjvON4CfCeip/Md44CvyBKP/ODxOjVjVtiXhQsl4Y=;
	b=dNWe7bDfNog1gWTxhwoLKBG1NcY4KhDlrm2Z/qb8y9s/3xr+U0ls3hvdMI1PsfjlhoB1
	 8cJp7BSP/Iw40GVS63gU+H/pHZs3SJ31vnBMqLPQdf2ff2biYxEDTYdfCanHsN05dzlRn
	 nxeKdw2YLXgljlI86UbXHqBcVYLcfb+YGzL5iT1s3i5JIgl9fQCOCYAYb1X2AcDeH6bWW
	 9FqxrYe8lwkt8ouw4qdPuekSVnuRM5oKCkXq4fx/NIWgMNHds0yrz1DLnjLNi7xkQPMda
	 dLl+IJwf7KJeTtOdPUdfbOr4wNfQAATf4NXZEUw8WkNW+zF6SOox1JUgPYGlYSWIi5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610490;
	bh=5EWjvON4CfCeip/Md44CvyBKP/ODxOjVjVtiXhQsl4Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ncR7588Io7WHTcuw1tFC8k775nMnZ8P2edxHrJB513yf7N1qDmBj339aTkeApvZCu
	 9G2wbNY2YQr9vJXdR3kYSdbt8ciswxD+LrrHNLm2NNckROoEE2fitOzXXxplOSaSQy
	 7/pE4XefLcYpll7sbPKZZ8tijmG7SbTcycYGwsm/pD4Sldv4XN2dn0JSWAhk2oW1YE
	 tDDThLIayaTqybkb8U0Phe0B71phRs4RWEE1SvwW4NMA8ywXH/8gQdiPE/7HWCf9+U
	 XfZxUvmnh6OvqOe4pqdAJJ+rCxR0F0W8dZJTjWLYVHWuYvGOw6xsoqy9mQGjL+c6gY
	 fsT45njLGXjVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAE1040FFF;
	Wed, 21 Oct 2026 19:21:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96B0F3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C73D40087
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kan113UQUkoQ for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D1EA740409
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610488;
 b=AQiUIw8xbsMDBJorMhnvjNaT7gpwb3vTqtUSrAEmxHv+Gvj/XM24KYspsk1pM/BWcAAS
 8iOp6wKNqRGEyDz8Xcj+K9EKmzfDgdL1rdhL2WiuUPq8GYdG2aFnoDJ8VI+B4wsTox1Qh
 lU6MRuxYCY36Zzck+3eaqRHxam+GM+gQV2zLMhurBGW7BboFLtkMMWfYm6tZRHRzHlzKn
 QyS72CYShgcoovttRXSMhqoSeoYm7lUmg4bIs/qaqDSsd2JsaJIXa4bOopPZrN8YsQN/3
 SNFsKvfPAE5g37aLMjmXF/ocGNyBKdKR3aiX4IMalwzbHpnA924h04TA5ut4DyyaKJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610488;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=KJ8JORtKtahYNSpnVAZxZD567mdgJb/6d6Cws8MwsAw=;
 b=NK5zmVsGMFgBn3mLo7/zmgptRrADbIxdrpS695PfYMEMrL05EBQjCCiVkNUxlHYqm6eZ
 /6KBHvn9yKolFFS3u28WqJb3Xf8qaC2IQGZ7R5ypzZis/QOH4n1h8n8rUpuRSPRMhOSTf
 LlXYTO3SEUZdj23zb/nWOxewoafWVNUfmhrGaqOXbGhc6BjpiGy0arjc60K/FLlFRIyfb
 deUy8k405lqeZfnPl21BJOPIeLxzu/PS5l30Xwqn6nmzUmoKKQYubpgacx2Vhc+JDe+TM
 U054ObgqxW4cg57tNE3JOjGTvR+X0fe1TDS1URTROoEPZrOAq8nTo6BixggVgANglRg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UapcjHsS; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1EA740409
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:21:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 63367C5CD6A;
 Wed, 21 Oct 2026 19:22:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2CA74606E3;
 Wed, 21 Oct 2026 19:21:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20587103289F5; 
 Wed, 21 Oct 2026 21:21:18 +0200 (CEST)
Date: Wed, 21 Oct 2026 21:21:18 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>
Message-ID: <atkQd0313OH1-ox0@windsurf>
References: <20261020144902.10111-2-fl@n621.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020144902.10111-2-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] ca-certificates: remove roots chaining
 to eMudhra intermediates
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Florian,

On Tue, Oct 20, 2026 at 04:46:55PM +0200, Florian Larysch wrote:

> diff --git a/package/ca-certificates/0002-remove-eMudhra-parents.patch b/package/ca-certificates/0002-remove-eMudhra-parents.patch
> new file mode 100644
> index 0000000000..46ff520f56
> --- /dev/null
> +++ b/package/ca-certificates/0002-remove-eMudhra-parents.patch
> @@ -0,0 +1,11 @@
> +diff -Nru ca-certificates/mozilla/blacklist.txt patched/mozilla/blacklist.txt
> +--- ca-certificates/mozilla/blacklist.txt	2026-02-23 16:32:21.000000000 +0100
> ++++ patched/mozilla/blacklist.txt	2026-10-20 16:21:52.412423854 +0200
> +@@ -2,5 +2,7 @@
> + 
> + # Blacklist explicitly distrusted certificates to explicitly ignore them and prevent build errors
> + "Explicitly Distrust DigiNotar Root CA"
> ++"emSign ECC Root CA - G3"
> ++"Comodo AAA Services root"

As Fiona suggested, could you send a v2 with a properly formatted
patch? This means:

- Git-formatted preferably
- Commit title
- Commit log
- Upstream: tag
- Your Signed-off-by

Could you get back to us with such an updated patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
