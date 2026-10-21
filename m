Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD491606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 22:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N7cZz0AN;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim header.b=cfGogI92
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 806334098D;
	Wed, 21 Oct 2026 22:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cu7woITqWbDD; Wed, 21 Oct 2026 22:34:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7D89D4055D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792622082;
	b=ftOTnLAbzor+S4VKqgxuoBF7UFS1P7/VBt2L9npaW2JFXgF2tzkbawQ0jiM8AJ1zXoQG
	 tj1n33d6d6oBsanOSOWBFhP4AcaTNzlrrdbSYpxLXHRzoUzB/5ApdMtePnaIlL1iWaDIc
	 HahscvTGKZ9B3lzWlA+BjHnHXo2LS6Gd/jPheAC43W4ryzvnbtlpNZGOQu608CwRw8Flb
	 wovl633pmpVLmhKWcYfnL2liuk9w4GnUF0p0ymBWR597KLm2+RK0MCZbxergyaU0nomQG
	 sKLel77ouIBkVKFxDETGmbGVYeHoj6d99RshZGxcPKePU4AyVVvs6b9bscepfUIpLyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792622082;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5Quoek4MtsBo7t3z8SOhdkFp913Nh2t45vU41NHYGg4=;
	b=PN6wG6gqGvG1EbYcR1AtqIxqt8mFTofUlSTjMEt8VFTQibaa8vYVKIijM0xBtbVTYOJg
	 osL0854a8SH0VWKS7n+dMtVuDkWM7Q2+rhQPTHVDpMqbvOVDJAuvsFr6EBZT750sh/RAm
	 +EL6U4SmdG/VQazw0E/Iy+C4N+IClTzj2MNfNj/oZL7RK/UpRdJDJd7SOOVdNM00lWODC
	 Kqdr3nLQ2Skf5EF9GOJY3Ksxgv6jzrI4nOhKYWHkGIUo46jYOFiyngk8GCyCVbbOycqJE
	 OjYj7kY4Y4eB4ioFVPP+30cbf5diX+HUosXC+wBA4R8Y1Q02JmkUMuMzo4u2vl8fxkg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792622082;
	bh=5Quoek4MtsBo7t3z8SOhdkFp913Nh2t45vU41NHYGg4=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N7cZz0ANj3UT6Qhb6jBfhw4H9ktijikfvJ7oEpwUOfuGtOovmQACaFEcfXtgkcYcV
	 eOeQ+Iewlno8NTg0jk/MTHkj4KDZo2EwXeB0mdcbkwmZUHl90AGs8IujGk04bxclyw
	 7+lUwvaeneFbIZFbRkcspo5UQp2yQJpbQsQsV5mR7bsDolJRXAzVBb0zjggRXuTwDV
	 suvpZ+ZtPYQBQxBa+rHqPSP/t8Ogp0QKdSQANWHQVci6+zOM43MrzZyVu+mbg8vkGP
	 dRxKrZMwPSTnXa0Rr7W6xU+UDNwWYauBACfrc8zfHdNTbN6wmiVqNqCzOZu+mEfLVq
	 iX2oxc6aDTdxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D89D4055D;
	Wed, 21 Oct 2026 22:34:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53F573C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 22:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39AED6119A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 22:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NW14Fa97BEc for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 22:34:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E7E7F61189
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792622080;
 b=hc6+vcsii8WN1BNYZdmyLNgDmQZkn62nC6Js4ePEiMOdpc+iYEPudlOVlIqmX+fTLwlA
 JZOV8O5Q8fuYHNpbsQyklGxbGOOoA0vifmB4HvsVDVLm8pKflbp6X7LBVoRwdZfObmapx
 Ea0MMvWdqKFL2kDBPzlXH9lSsWfyMtcd0qxfkmV3vsgLhO3cEEQlu9RsMQKl4k4BJO2cq
 vIJ6nw5A2KjMrOu/EGx/2KS0FDwCYd0sYDYrbvGGqAYM5/c7yydU6EGRLiUf9Ika7fOOF
 RCb7yk3MhciCkiagLxu6X/lxLZkI+Xsq0tmUC296ix2o/T4ZYEHfyZIO+KyZZ09t/bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792622080;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=lUOG7ZoWnimsWxHWA7rG/oTwL9Rim3CZshgoonOyL2o=;
 b=BCvNGbX/7xetWhP5XWDP9YuG149ejXJ9ZcjE3iJgWoUVeDJmhwemb2nBTMWXiyXGTp28
 QUfo0ARh1z/HOdYR14FMFJiQ/kfK9LoinSRnQ5iAZQp1Qfm2U9YjJHpbdEHn5vBESKxgO
 Gvdz1R9+PIagnlT4SpL5DOJZP/tXClrZY0x2GgRB1VwKu0awI+2OuBtf4tCDoorl8Pb8D
 Guj9YvcTq0KDH3+/gZOwx1ad56O3CTPJnvgHkzc5V6D6Gwm9Cti6tvf4j3ltZumlOvmvB
 W0Pq9Xmeb6kSjcAqXOZmJPoFMuyRnoNPc41Gv6G7hJKauPuaS8V4DaPXorVBq2G0v1A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=n621.de;
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b=cfGogI92; 
 arc=none smtp.remote-ip=136.243.2.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=cfGogI92
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7E7F61189
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 22:34:39 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id E9067E009D6; Thu, 22 Oct 2026 00:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1792622076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lUOG7ZoWnimsWxHWA7rG/oTwL9Rim3CZshgoonOyL2o=;
 b=cfGogI92Qdq4LbIe8ZCxGAZ7nSt0SoJIMTuF9Qyo1BHpsNCvq+oT9xckk76XO/aS6zk36u
 ZS0PiTzDgZpMJdn7ebUaQ64GVFen77TgdPXd1+RlVYGObQbrhEORh9/Mi78HtMdB8oqX86
 y0BEA3ZNUbiEDE1MExnOyyKXvmLHiV4=
Date: Thu, 22 Oct 2026 00:34:36 +0200
From: Florian Larysch <fl@n621.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>
Message-ID: <20261021223436.zi7gtk4mzgllxccu@n621.de>
References: <20261020144902.10111-2-fl@n621.de>
 <atkQd0313OH1-ox0@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atkQd0313OH1-ox0@windsurf>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,

I've sent a v2 as requested (in 20261021223139.26912-1-fl@n621.de) and
also an alternative patch (in 20261021223000.26513-1-fl@n621.de) that
just bumps to the nmu version that Yann mentioned. Feel free to pick
either.

Or if there's still something wrong with my patches, just feel free to
redo them yourself if you want to get this out quickly.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
