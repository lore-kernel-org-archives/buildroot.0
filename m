Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45C606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jXy4jEF6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 468F480CD3;
	Mon, 26 Oct 2026 21:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xq5gIQej3xPP; Mon, 26 Oct 2026 21:15:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E455880CCA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793049339;
	b=gkrJbq3VWGfkdhax+mBVNMKXLASwZUdQnJf0pl/oEXUIFNtV/5YAfqzxdhzt72DaH3FO
	 D3WYkj/m1/c83Iwjrc7fR2BMVACESf54SDLYkfGbrPqP13TACANc67H4dY3AkgnPD3+hL
	 p4U6trB1Xfb4a/tt91mDEvJSOWMvN1x5hCH92ktqOXvRVFQMXIpiDo2FQBJlV3Bk3W7Pd
	 6+AdicyJYFnpkq6RUZie7VJ6VuxF6DKX7PZEviOHI4gQ4Sic6NGc9HN/1IJ0IyGLnMrXE
	 09edJlhAW6a5s/20J8vbmpuRYWke30/kiROtdLPHKBHmN5unin+/3TJA9vfCIkenGhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793049339;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/3YmyRi3zhrpCvzTz4o7UpOrPiy/LfGu2c3x/tEzqvA=;
	b=rXskJArkr+LW4hvEGcKU99Lq/FtvQDpFXzgAsZalXpztmz4wqnlNE/NN2+2+XPzzeANi
	 9Ev9r/aFFdcR66zL7n+C268ImTvVOaGQKg9VWk/i3WjrnAS22qIEZyd9zI4xtdfrVTIZR
	 cNyY9vekMEJOcgzmRj8MzBkjTEyldAWI2YHRIHXh35elE417grI5l/ZCSdgCF5BbRnBMV
	 ulLIP6Vq95mQ+bv8RcDFHp20dKC3s8hkYEEC521beUbosXMRg2U32yLGOAA2DmaCj2Ao9
	 4gv6BdYcmRJ/R7WDgDTyVIhcMutMoihMXzMAZFHCPVLi99E1zVANQaF9ehtXZA08GvQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793049339;
	bh=/3YmyRi3zhrpCvzTz4o7UpOrPiy/LfGu2c3x/tEzqvA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jXy4jEF6+ABnzPkGLd+/idBq6+1LRVEytm/qVTmYUtHp8JI/J90ZXSnhN4Q8/p2BV
	 F24UNdW6SrcO4P49Z47WdkTKBY85gU41uRiq0NbmH9jOwnwPEWCmqpO2rHCwZkdL59
	 /cGYX2Br/wvJBABawo/K9yrbvO7dQvOCTDzKRinS4ltaSurW+RiTTW9xGOrnrH2ZpT
	 4fmSxfbuX5QUmmR6ZGj+Qe7g8qrfbOTYn4x3NQjBQWBUGojSmkNmlmvWMwW0vx/PMK
	 lmHatIpX1rfjNj4ifcX/zfYmd7E7dn01RLRW6VAtrm6o8f9CnQR7rvIyyovdKai2oV
	 3eeUAqWSPOzMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E455880CCA;
	Mon, 26 Oct 2026 21:15:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E74D5235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8DBF60603
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrFe2IcLCBsr for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:15:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 63F5C605EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793049335;
 b=dfIc7Z785oWcdXVK3K05eBs1QKPCRc2a3u6UOYvT13jxtWYitIOqHULNyZ8AB3rm4LJO
 Bcdtzo6F4VY4CQ53jyO1m9F4EEhaoHTJ0iMfO/mJBgECnbAdrylXiI4ryRNWqIiSby2ec
 gM9Ukq1mQD0u2HSgpUoICcpaRNwHa35Dbt8iDTgB0KdTCBjbvlxeoDjVbObciGRAm82G7
 7kN2TZpCulAoblQQnS/Ot+7K1ci2A4emjMmKnftyULGVB7M+d0dx5/zMQRjVP+ve2BT35
 rw9BKBvjB9cdlqa2DRVx3amfXzgEbHOt2uURSZo1vlGwulXOIW2heqqaIlhAZt7klbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793049335;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=UNPwC32nvI+5oAJ4OxqwYkVIzJNK2Ob4kFGwQpTrKvs=;
 b=MLuPyk6VjqTCTVyqOamqWGinfXC1VqlHcXfgKCZhCT24oZ5dI3fv7ULMQbUZ7ufP6W8O
 JGAz8DfGasnXa42SjsIPgvE9lEPezApGtSOiJQvxjR3n4t+NDy7M/lr6ZPA4Wkei5XzvM
 Nn8SZZgLwAuz6Yhw9yaY4XMLyQgcD+eOkTCdRo09Z4PTzV4g/PttMlEQEusrHjT5UgOQs
 cYvq0LONP80tgPdspK8ePFUxYMIpI2md0jZURAActWRGijSFExifnot7JBQhCKf/cqlfm
 BluR0QODBYl8ZEo70UzYsb+1xDKaAbcw2wQ2DLSY6UEh0yHGinb+pI9eo03Ci6FZpog==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=p0Vg5t5J; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63F5C605EF
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:15:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 693021A135A
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:15:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 358FD60740;
 Mon, 26 Oct 2026 21:15:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EAEC210329044; Mon, 26 Oct 2026 22:15:24 +0100 (CET)
Date: Mon, 26 Oct 2026 22:15:23 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, jorik.devreese@barco.com
Message-ID: <at_CzZZSJr82P3pb@windsurf>
References: <20260827102406.3088679-1-thomas.devoogdt@barco.com>
 <20260918225315.4008488-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918225315.4008488-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8] package/sema-linux: add new unified
 adlink sema drivers package
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Sep 19, 2026 at 12:53:15AM +0200, Thomas Devoogdt wrote:
> From: Devreese Jorik <jorik.devreese@barco.com>
> 
> Add the unified sema-linux package, which replaces the archived
> sema-linux-ec repository from Adlink. This unified upstream repository
> provides support for both BMC (Board Management Controller) and EC
> (Embedded Controller) devices.
> 
> Signed-off-by: Devreese Jorik <jorik.devreese@barco.com>
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

An entry in the DEVELOPERS file was missing, so I've added two: one
for Jorik, one for you, so that both of you will receive the e-mail
notifications about sema-linux. Other than that: patch applied,
thanks!

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
