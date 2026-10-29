Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D4A606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QE7t8ZdB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31396605EC;
	Thu, 29 Oct 2026 21:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2qAIy_llQPm; Thu, 29 Oct 2026 21:13:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B42D60A78
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793308433;
	b=nWaamLQFMJFm+ODaobl6hFDDwrEflipayMRkCWJmYfkyLXX3oC1tJ2DxVQ7C1Oox+G0q
	 bsT+URAkfoG56ZiQrZWvXrlK5xQ5DC5LRVLFmkwGqEE+mMi68rk+/IYEl8BqlhRkbhJyb
	 vuB40C2tegMsaPQFnuwbhwuKxAf3gV2ow2eQbvUDGV1kEJgfXyVlEFEoyaG2PNB/5qU/o
	 BP7xcmlzZb49qxBT7HBeby5Zib0Nbonm7L1S3SFvWJPCTwRKFe20FD6dDuSPLUx4LkP96
	 HzmRj/8YFE18DQU0wT7YjHnJh1U+wMiyPN5yjvaioKb09o6S4/+fCxlF26BGPqOs9TA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793308433;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Bj7HMm6RTBD40dkt5AKstpMM9JJgnstxIHpb7/gDdvo=;
	b=Rh1oYtloE4Yj1LeSVbxYWs80Pdx1xZTjLq6UUA6WObWOK+I3CB8jZpjtqWnZ5zNWKwGU
	 brdmLYqGMtkUmhxz6QOqpye2O45N12e+IeDA9e9Ti9+9DAfgw/+goKfmEbo+bCOVvYSQS
	 Saj8sRonVwXG7EY1JYpZAByVB94qsRP6jnZT/57pHTPwZZB/5hQ+eRQQq/xvPu4y8xVl5
	 +M/r5uesbW3WH7GB44c0CdeT0uRfO4O4qX7d9SNCodiMu/kBWgOEhWwcTf4ukaZQOyjFP
	 5kdi2WEUhz7kkVAvZADBDlDjuAbpuEJ8HCP7mDhS8JsuWs/1W2SUwg08SsfbjTfnvHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793308433;
	bh=Bj7HMm6RTBD40dkt5AKstpMM9JJgnstxIHpb7/gDdvo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=QE7t8ZdBlBi1xrbLGbW8X4ORGt1aVaXXlfqOMIYJCQP82QxAwY6oaFtgyuq1LEuum
	 ttr0r3CUTllWhzMBFll2xSqpAEamh3vyP1gcCbrsU38OOyFaxp7UvsgKZiq5MgcGTD
	 Gao7oqJmJm1xeGjQgetLL9TxHU2MzR2Ev5dG3OobHhSudPbSO5DnFrQEcZ8QO8YS9o
	 qHNki8sTPBN6qaonRUJePo+MG06HwNfmkianqaKzkTslYhhxkmLHVyDsgSCuBWMxPH
	 arvbbq99vuKEkDFXLgDNIuDE2me/Tx3GNzJCF/IR8CRTuu8LW82PjHARTFn1AW1Jev
	 aHu6HErfPSyPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B42D60A78;
	Thu, 29 Oct 2026 21:13:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65A7C1DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 574B640A6B
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XRue-90VzKn for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:13:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5869D407B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793308430;
 b=fYg7yFreUeC0pD/C4l6bOG8Js6Husp/y2/TmiQz1MwuCjXsiMEZOETXj48fFNGKtzgw4
 kKB81cvdUoUem8m8pNGxgjmkjIuC+P3CrYj4E5npX/w8CLOxcwljB7S9awfG0xxcoOw8X
 XJYSElFz3RtUL0+Lhe8rigpASbo73WzEzpgdCOlhatzRXYq4lfGvpvAL0ws9GInitqs1a
 YWY2cJOvR0slU+/vKxwSCM9EQsRAG6NGjSZgt2gduSV+U8hsVi+z9Bch1Py3KlzcYwVPy
 itRwviVnW0uhRRIk5LDqz5yGKC1GAA4SxqlTwVHn5OOkP8jclH32Tjvn1rhqav4wY9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793308430;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=X4FaWhjC59GVlrmmVIZwyvA56WWhoofYgIYfvyOqZho=;
 b=Y67U+pkeIUnKBKjEI3WeS1v3iUZxS7IMVoosCgp+p9HJwPuNd4olpr1uySrsdsjMY9th
 ko8/GfBNhPhut6f40AQ+cjpYvxzuwoifbFOuhmezf6idTSsiG1cZOw8Y0SMrLif1dm3pG
 Mem+ku3B5XE03ihdAOjMJmMliYbnbzyIJA5GHoCUQqFFf7MdkMmZyOHRN5UcwyxDAAbXv
 tKVk3Hd1zv27CbDbEIY7zutl8y3lw+jVJttdWqG+UEUoJxG0I420U8kymJoyXKneoBsX9
 dYiEsMuMZCI/wdzgv8kmeIqz2f317kZqZRgqldMv2/PPS/Iasu4Y8nBKUWjJhQsEqSQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qTrNUI5V; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5869D407B3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:13:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EA5B9C49F4A;
 Thu, 29 Oct 2026 21:14:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AC2E6076A;
 Thu, 29 Oct 2026 21:13:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EFC65103290E9; Thu, 29 Oct 2026 22:13:39 +0100 (CET)
Date: Thu, 29 Oct 2026 22:13:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <auO2ugenOrGrEKGM@windsurf>
References: <20261029204953.1447140-1-bernd@kuhls.net>
 <20261029204953.1447140-2-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029204953.1447140-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/python3: bump version to 3.15.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Thu, Oct 29, 2026 at 09:49:53PM +0100, Bernd Kuhls wrote:
> https://www.python.org/downloads/release/python-3150/
> https://www.python.org/downloads/release/python-3151/
> https://www.python.org/downloads/release/python-3152/
> 
> Rebased patches using --zero-commit option.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Are you coordinating with Vincent Fazio on this python bump? He has
been doing a lot of testing work with Python 3.15, and my
understanding things are not yet ready.

Vincent?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
