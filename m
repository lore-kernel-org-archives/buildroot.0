Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367D606A332
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TA1s5E04
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B615B81403;
	Thu, 19 Nov 2026 16:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdRW5L4vKqxG; Thu, 19 Nov 2026 16:30:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F172481420
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795105838;
	b=Vuw/PBDl7dvsiQGMQM0tjlRPp+C4j63Q5KRXAXg0oZQFqKY6e9FRtpY2A9J1EmlEgkqx
	 rcb49xsxL/B+o8S+dPMLO1KCIdhzRGbUqXdYaCLMdQeu9tUIw46CwywAagTop0B3FOYKr
	 bMKzi/5+LLIqzFLrnZD8E/LntKns/mfx5vnADG+2F10qywL9xjDMnNbtLgQgTfVWNFraL
	 xkA1Nl5/ZWcAJqyrsmrDVHolc52cpSC8r0F0kwO0xVBTDazAXX7nzyxHf/ZEB7Gc1dc4p
	 wZeQ3k4xlPe37RUkX5/keB5vUyH0Jh8zlpoDO96W4VjQWjtYcflHi6p5MLMdEeo819Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795105838;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kr+VuQD8/9ErzhhXjjDLTJi6d05EDXJvdR8WlsntuxU=;
	b=hUa7RjyhhoRnkj6EretcFbImPl9LQIJ7DTg0q16RrCD+pLLtwIBgYi3iNLhd+ODsRnsd
	 LuRJrn8EKaxgYhSw6EUuHF2lUtiSVG6twthT2a+V8Cp67F42uqIjqVQ4BqGKEYvCaOGC5
	 yVPE8MltpTXH5CNTtw9T0wa/Jv+DddjFLYeqIZiNJt6BARNhZBv9DDVCdFblBI7dkBmrs
	 0+poLIHlFzOa1lVgpIEO7okivH/PvKn/aeO51K2LuN1VI0KmLMJnESDcRsMm2ranP/yKR
	 MMM9rurSFgW2jscOOn1GAcqIrr4NyGp73xGS13hUK/EBkrmzCcg0XFVBml7Nw5eL8Rw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795105838;
	bh=kr+VuQD8/9ErzhhXjjDLTJi6d05EDXJvdR8WlsntuxU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TA1s5E0490pgx3FQsL1S3zT3PM+Apmx7m5tJ2adEPkwnwblva1BmhY0XC8dREGFND
	 TtHYoU5wd+CvYrMP7UEBr0i4u+F3FO6y9oMCWJWv3xvqszpnXty647BZCBJzWvt0Sm
	 v1emFx4VFmCkQRLzGx96oUlW+aKMS9DYlLjZBUcRW5Vp2O4EZvDO84n4T2KcJcJTTJ
	 AqedHrRXvu5a+nNLaB8wgxEWb/W/UWe1JHeiLMKxlEKhixv/3A0uDcdW7hQZVrW8yW
	 DePYG3rIoQ/bQl7EZxJydhVUDofMBysC7cXhWJAE4pWqZAJeBXIKXIt7a4zvpVIbp4
	 bQWLw5rdlsYzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F172481420;
	Thu, 19 Nov 2026 16:30:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A34C1C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 16:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C9984079D
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 16:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcxhV9SOQdtf for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 16:30:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 580FF40600
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 580FF40600
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 16:30:34 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CBDB22C81EDB;
 Thu, 19 Nov 2026 17:30:32 +0100 (CET)
Message-ID: <87397a57-e8c3-4e94-82ab-7e3d9ec6b989@bubu1.eu>
Date: Thu, 19 Nov 2026 17:30:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
References: <20261104210728.3839438-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20261104210728.3839438-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-next: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	TVD_SPACE_RATIO,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 22:07, Bernd Kuhls wrote:
> The package is incompatible with the upcoming bump of python3 to 3.15
> and it is unmaintained upstream:
> https://gitlab.com/buildroot.org/buildroot/-/work_items/193#note_4029177660
> https://github.com/altdesktop/python-dbus-next/issues/168
> https://github.com/alebastr/sway-systemd/issues/36
> 
> Gitlab pipeline failed:
> https://gitlab.com/bkuhls/buildroot/-/commits/39c8bb9cb08820626e367a21fb146efa6c6b1750
> 
> ImportError: cannot import name 'no_type_check_decorator' from 'typing'
>   (/usr/lib/python3.15/typing.pyc)
> 
> We select python-dbus-fast as replacement.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
Applied to next, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
