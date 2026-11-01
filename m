Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0A606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RrC4+wtE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 258F260684;
	Sun,  1 Nov 2026 16:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zmW238shI35; Sun,  1 Nov 2026 16:04:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B70A60602
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793549065;
	b=Nvg8/xTKmq7WSuW9Yt7XC87jyw16NBnDysQIlWu/TjifCbwaJBOZR4xNy0JiavUeO6Nf
	 orPTleunk1zV4Ibuq9J1wB1mCTEcPdIZJECQAEIzEkqGaz6rFtLY2NBnRczE48g1K6/sK
	 +JGAd0tr5Kw0vfbK+iJ151OhJClJ32nZulNWN0O8IcqIOBBsna286Nl5o1vPl2IGAzWV0
	 wZtPWt1UEBu2eI6fk19Gqe63ZotgXb+t2Q2cJ+wceZ7TPTQdNoPFZS5g2nRrQmJ+BdAhU
	 TwYSzQrFE4jtCbNBb6cpU+I/pX7Rb9vOqAuwLRV7zuj63+2lUJgzI/W9E6aLFLcl1Hw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793549065;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=7u/uC50uyxZA3rQZI1OEmt1DmaGdtM+CdsYk+8uqE+U=;
	b=TEhIjLpqQla5WNZTRmHYe5nmQN7pIeWAumSknSFCJPKG/+2dJ9UPHQkAi0/VbHfeeUoJ
	 KuQfUGHL7cqZjcvEVm3v5ZHuUUQr5TJVBQjZJNhzTXPmIq3QplomyUqILtB+0sFMmW1DN
	 r5PGiz0cB0zWhIU8yisxHGn8avPak4hwHBxKYk1N79R6f12ZQNCHNrKiRQJfJEDogLlEx
	 o6/699dgdkyvgIhlpWfkHtLxFxEAU1ttkBq+K+ec6EVW4VBnlEJPpzX2euuMDghYXYf7R
	 NG8Xdn44wZJDv5dn/iSBLe9HBMirtVs7Jda5bpW34xCeGrZ/Xj5lJJ0+7zyVK8/Lm1A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793549065;
	bh=7u/uC50uyxZA3rQZI1OEmt1DmaGdtM+CdsYk+8uqE+U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RrC4+wtE7gBDq3xykYhvXdz1yR0eLDEHWnkfrk7injetzXPw/oFs5XU6BU0V9h9M2
	 d2EP6BMvjQnVMqCGXkF4k6gTTW83+fb5uH+TF+lz2hZbGRb4ulvWtjvbtLgH8yR+NN
	 17pEKlqFaANqZsQXYb4HZAbmmlaipFO6oxlgB3DIidLhxVJ5LpcH84OfODzkRkVmzh
	 qSh8rzs8zbFNU+1V4i+JOLoRlDe6kLt7AeHxo0qTTQUGPD/6v/9gwmp6Oz08OFUeNP
	 /I2NZemqtIWVZVIcXWEBdcu1LSER65UAhaKDVwxo0lYFCS9G4VuZhjKqNgd6m8Au2h
	 QPL1ieDSmSwkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B70A60602;
	Sun,  1 Nov 2026 16:04:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 344EA380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A222405F0
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9W7yc68paDvI for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:04:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 44AD240595
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793549063;
 b=dhywaThqsDoVoD+BBtJMDpr0GRXnUGOvS58xr6uljhdUbTBU+fHJfavH39VVxHgkcBD/
 p3iHsE0p7CeN9dQkQTM17KXWgFk02yZWIrFJbQ1hlcoxpLAz4YArisTMlcJHGH6z78cDi
 1tMKeZ++0Agsj6sHXkeYuSXXqeSm6sQgbiihpXpEnTXGmIHFv9F7Zr1LSxVU/0eAg/um/
 BlvvGsW2k321K/YODKCfQ/H/Lj48avLw1CbuhhdTrJDE3vVxEhWJhSunwpl8i3KZ1MJ0M
 mvqyE8sj1ZA/vf8T+I6EHxXsxt6pZE/78V90z+qARe+0OA1FruGZO8t664JDhat0d0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793549063;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=biWq3oLa7L52vpxV/V01AOq5qBNb0SlaTASJVRHKE2s=;
 b=qYedqVFC0+iK7GKkzYC0iVB/SmcSkjt8074iyOsYOemwM6Y1uWgLN8S7d0W1ItV+klJy
 0pmDpDilQtlam18E97/H6yM9iwsLz7CfCrEoCve1JB6TQPCulVOjBAMWwUm5A8NR2IoWj
 veVr1C6J4m2Qhshkl73drPsA3c8PZy8v7uSO7ZnNWm8zhczj5Ijo9Jm2OyNf3DnNYgDev
 et8lKO/sIoeV0lu+/t+ZxVS9+fMh7gG1t6Jla3vq2khrJzqv9Ym70CC+Ne/bp/xHw7fTu
 9LXWOrNfsXSuk9E8AVBspslqfcW0kh6nWdUnvXNAZyn5RMjB+KQ5IC41DI/JN47jFKQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QbTCeDl1; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44AD240595
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:04:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E3BEEB00571;
 Sun,  1 Nov 2026 17:04:16 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 17:04:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 17:04:16 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20261031180625.2738332-1-james.hilliard1@gmail.com>
References: <20261031180625.2738332-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <8051bb94d3949f7d0d945b395d821fea@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-botocore: bump to
 version 1.43.123
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 19:06, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
