Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A13606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VgvXYCee
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3AD680AEA;
	Mon, 26 Oct 2026 21:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haAkBWDnlSGf; Mon, 26 Oct 2026 21:16:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B455880CB9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793049383;
	b=djIxBfSwjN2lyTTecJJk4KiKXNsin4oQpdV6ToMBPqXZZr5lAzfuC2dQRYqZ4IR0Auk9
	 bTLpcvx4nOJfLZzv6qcTCgh1xnYsAUEJXDH31fbLdm3yM3y13nLvDEuzKsc+s7cM5qIJ9
	 DgYrcU91knAY5abAHx9NRXJEI81vpNUadoKT1CKmoO7SQpuS8TM192aptWf813Dbsj+43
	 vEdTvlHxXcsn155nlauGmxwsOpdZ7ogiUNZSRrD6k30mscGj0Jf2zKwGUQI3Q1/UpOW0L
	 YqUMNFRsb0xnnYxDqg1ZJI/4Xb4RinYMKdv8EY52/cqbEhSxsHIHZCcHS+JA4Nb3abw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793049383;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rt53BF7Y0CjPzeKr71SudDANfgQrTa8xzcNnluFBEI0=;
	b=PgHXJ+eq6fkqscosZecR56s4dYS67AGH0KmHvbWjlqWGdl9wMYE9PrFejIv69iRRJp9o
	 F0zjqDu+xMejdwrrkz0iFSLgPoKPEvMEHmwM+LMlBH+UvXL6aqiudN9usyVfh8b4X98AX
	 o7HoK7+jA28Z5FsAb4gIuqRvttQvkIf/gjY1G7oyD1ZmFyTsn19M4orEJnncW+gwK0ijg
	 6MGcgNqLZeUwnOWF/8DGiZn20CZvjwFIUduFIsYRMIpfCRXxgdpIdCy+dyRcO2ke6wh3m
	 77XcYc9NE7Si/PGmFs/oXyts9yfdya92lLKoNvPipvzmD/jXXbAuAqNUbPSd9McSpqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793049383;
	bh=rt53BF7Y0CjPzeKr71SudDANfgQrTa8xzcNnluFBEI0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VgvXYCeeNGRUu64Hf6cuFBCRIVmkw3XOucxBBmq85MfC1ZF8L07O9t74225uKaALi
	 5KSLse5ExYvM5Z7+yPKpfLOPY8NkRrBSJC4qnWWg2rLl6wekNDDTTJXanUsBe4FpQE
	 L5scCw1KTVa74+wcVU9dGyRc80wAgC9IQ/HYGAEn9CU9QZesQJBa7wuDz0Af9suAhu
	 /LsXqMpZ1w4Iczllg2nGsLy8O8lh9OX4QlO/UonvcvxYMf08JAofetyXwmgEx9iIWg
	 G8dR00ree/Otb9C5niMdq8gIyxx6A6OSES1gOk+z5NSfwaWGNDk8ApzbBJ0c7RCz9y
	 H4uqXt9JLQiqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B455880CB9;
	Mon, 26 Oct 2026 21:16:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A73784BC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4EF040075
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tESJSAWvOYtb for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:16:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4911340062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793049381;
 b=MbDzk31rnXHGvfXeFR67SOYXwXQIrn3UQ2H9a9obNTUUr55wzV6wnRkEfnXHkfbJXneX
 4/8bPnt5gpKpc3aLwJPNDX0LvM8lTqI67weV+rHIluLA3nw6tkQ1VPPOST9Kbt0CVebSZ
 aDEz8Zu4vUSOJuYpuGzTDVCH9rdGM79fCbozMMcf/MLQK47NS6uCNXb4J5itA65p36Yq2
 vmfFYfOBUhY4RS0EkopElPMs9qHI7nT7voZNt9MUf5OqCkF29o5dWRwokmfIIL4ya7yLq
 BjULYZwXP/4ehgchvvt1OFb6BeQFiBiC6XcXq7ngcWLSsAmgp7usLnsWGT6FojhVHLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793049381;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rR9DRl0VPIjsJHRM1mLYwOvvGC1gdnAIYCGFmP1yXyY=;
 b=ZEgchVJv04ez1+usLhAg+6ZYd5MU1NSWCgZ6HFa6zZBIHGSKoifkSZNczfmhtNf+Crer
 XYqRzKqzfs/tBj7hdDLSp7UElAFJA96UKvwqfGgWLDW+G1XbCxxAsz+ch5/UpKci5EB2g
 jLb+Hr//JM5cFOV8fn5VFbItC6OtwFUCjk4OXAx4zaVs2V6aqp8wQPK2dBDEzh5vRCsJV
 ioF1v21m8yUuEqPJDNkvp+sQamisBT6eS1IWQJe5xRWJiLTe9b2CloeqQPUz4JC880oHO
 A3knbSqhR/LK63Wk3zAiH5gm+V+ArjcQSzQNmPkZbz4YP+wzOD8QcWjNNdYVSx8hGnQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LCMJuH4S; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4911340062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:16:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9C673C79AA7
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:17:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 40EDA60740;
 Mon, 26 Oct 2026 21:16:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 30A5510329044; Mon, 26 Oct 2026 22:16:12 +0100 (CET)
Date: Mon, 26 Oct 2026 22:16:12 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <at_C_0FxgMSAQzDs@windsurf>
References: <20261026111813.2325455-1-titouan.christophe@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026111813.2325455-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/mender-update-modules: fix LICENSE
 hash
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 12:18:13PM +0100, Titouan Christophe via buildroot wrote:
> The SHA256 sum of the LICENSE file was incorrect, leading to a failure
> when running `make mender-update-modules-legal-info`

Which Buildroot commit broke this?

We have LTS maintainers who need to know whether this will require a
backport to a LTS branch you know :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
