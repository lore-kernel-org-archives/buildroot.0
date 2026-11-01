Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9B606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aFFy9Wry
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18047405F1;
	Sun,  1 Nov 2026 16:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpyBzfbmCf8s; Sun,  1 Nov 2026 16:26:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4F55E405AA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793550360;
	b=NnyatNEWJkAVfxmvv7ZiKI343DsGWi9qxkcAFjCkBRL2+hMnghoMYcfijBoh7RlgST0X
	 Yfj+M8+tb3l8IKvV6Ww/ykX15zixwGlyCy9b85jS0l0Dn9eqv4gOcg8OwZDJiXYpqDt2x
	 gl3+J9ACj0g7m7YLV3RZVGqFAvcpQCHqQ4KDB3J8l7i3hX3eM8AsK5PRvZ/OQYH0Qug0v
	 r0l6FAGGmdIKAQrrxphHjSev3ezKvD70GKC8HUdpDkaavJqWYuF4u3bf3eExAG8L8tRIk
	 WxHhZkwle9g7k+/aM8H/sBoFN05P4sGs0crVtV0h/X8EkXDHyL8KUTWj7z6eHVniC2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793550360;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=66gEy8p2Ag+5DEhbMqQy/++lGf2x87T/ZljXSHNY1Vk=;
	b=eTvd7xGY9OuMzbL6dnnaVEcdvFnUHe5w9HmLilbUUf1qJkALQzaEDczDY5WvaAl6f61F
	 4ugHdm0OAr+TmgLYbCYhaDVGaxTnf5zM+DdzJp08iQB0C+fDQ3JCcJNDEtmizwVSBgH4t
	 hBf3/Lcex0bIC3rT7FNzPiWY2QBurerfytzSmtgDjbw4ss0qE5HLqmVYUgxO82KouUWpm
	 A7hrouKpqfH+ofNH74U0yccJvfh+AnTFm8zlEGe2g4kXN/pBtNuVg9y//cnAc484ReMBS
	 ih+HN8pxJoXvi6JrB/B17q9nwDs2BvsI6zel4CjMZKtvhT8jc1mA9K9k/4RwN7UNd+A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793550360;
	bh=66gEy8p2Ag+5DEhbMqQy/++lGf2x87T/ZljXSHNY1Vk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aFFy9Wry3BXY3SljHT226kiO5XabY3nKkFwMlSS1PH7IbBgpC/9TByYupagY077qN
	 WLES40GoeV1y+pBzv+sslqOAPgiyciqmu4bEqNXkH+xV/+q3eu24fjWw8C2EAnAhNi
	 RkSpG255TVYxj/477EX0bWw1qX2hqXoiBQ6fyFuhx9Bs1I1IHz7i+U2UPsJc1YzzYn
	 IP4fpNhOoQ4yyOa+Z+Au546cvJ+xPytAQT2PO56Sg7q9Dx81rsfmI+tEKN0u7uLov9
	 Qdtd4sICxwLBTt6m59tkguDlcXQn6mLCaX0gPhDzKq+xqmRvJ9njlyltt9QMK/Zg4d
	 visqfEdUbXb8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F55E405AA;
	Sun,  1 Nov 2026 16:26:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60FC3323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4654D80E00
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVOAFzta7_6s for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:25:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 45D9E80DEB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793550357;
 b=f4FkLPbL9h4Jb/d+upZGVGJ7A801+LOPNO08gfe+fDi96zju9WsoSw0nzB4/pddXc1Bu
 LtzTsH5SjKyBL5a0HIeTnJFkcapZxEFi/1rXLeo+uSlO2yumtGWmADpPuBf/CtNZRQmcc
 ZoireiqYAc40OkRE63GPs9Zz7JXyV9A3Srmy29Fx4eORGRAkx5xbSknIGd9iw4vyiZrYp
 5ubgIr4n/eRz438i85R9jRwV42n/6dnI05Q1aVK2GzNh1K3NhEwDf88jMPbdCTeIarKOf
 oQ81eJXylVth+nvIf6gv1Hagh4vkS9xmAxm5HQd/b129lX8XR5lBgmYL/eYyBdKKZfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793550357;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=g6satmOSGy7LwpEHZmoHNm0dxVfLQsL5A9sk7L/CWxI=;
 b=Kx0fxtUGaIWAmbmH9/9bo661Qp03yweSi1oVJ/emJN1Doezl2Y4sXS06pcvESk/qBmo0
 u+BVzLPJ7AzSzHZ5OJ8oS14OgIVbFFR7RjbZYSXlNgBbnJyjrgelm/wTS03Re7RILk3K+
 DQCmHgtcBJc6uYQm/yqwJKt0O5GvEFFITJOqSBLMLchY2Eql4AGq9kvnpUaCDa6+c115u
 qR0ba9uG7vO9Aqrh/AMJLM7ywspeyBAeSJt7XdKjcOldT3/2sjnqy3wO3Tfl+SQD+5JDw
 pwlP8VuPJOJM3wit+C0QtAH+eBPTM8s+ve+Zq3MttXeQGjqDSJYxtwppTv7ACSC1VDA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EW1HOCw+; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45D9E80DEB
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:25:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A59F91A13F7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:25:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AEF160750;
 Sun,  1 Nov 2026 16:25:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 24B9E1032912A; Sun,  1 Nov 2026 17:25:51 +0100 (CET)
Date: Sun, 1 Nov 2026 17:25:51 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <audoC0J47va8hNBf@windsurf>
References: <20261101094100.1906969-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101094100.1906969-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-autobahn: drop stale C++
 dependency of compress option
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

On Sun, Nov 01, 2026 at 10:41:00AM +0100, Yegor Yefremov via buildroot wrote:
> BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS depends on BR2_INSTALL_LIBSTDCPP
> because python-snappy used to select snappy, a C++ library. Since
> commit a8c315b62c0c ("package/python-snappy: bump version to 0.7.2"),
> python-snappy uses python-cramjam instead and no longer needs C++, so
> drop this dependency.
> 
> python-autobahn itself still needs C++ for python-ujson and Rust for
> python-cryptography, which also covers the Rust dependency of
> python-snappy -> python-cramjam.
> 
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
