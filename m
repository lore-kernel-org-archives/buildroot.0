Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8F5606E80A
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DEOrXDuW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A172560820;
	Wed,  4 Nov 2026 22:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2U3Tmm206GR; Wed,  4 Nov 2026 22:21:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C6A6660844
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830869;
	b=VsVn4gY+elvMNWLuSXELD8YKx94tCtZwElMGgk4V5xzj+LxU0v5whkGmoACFFvK9HVXu
	 y1ZsmStoRKWT1cXZZr4irgNvR8voMsukZa41IubsHNnWHfSWC0Qy5ZQvl+b5GfvOVEsuw
	 YHEQxi9dRsJZhy10TmSBEdfT12vjmnWcYJNnMJR3XxmuOdnzNf/W6eQvkKTn+y03QJSLi
	 r+kVf8rB3zWTxjiNoNxg6l1pUszW9Nd7sQRzc7yAQ+LUO3Ld5BN4EHtU5r0bOm1HmdAsB
	 MaxcNtZDoX4FfqXm+z3Rq90TQsTmlXbo+t8kCDVztjFOgm++lOvXRHUxEf8N6KUzPAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830869;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=adR0tx/5ukI2dixgsSyxhur8cz6QGIi8kEOUkRXBls4=;
	b=HuuvriXVPHEAF13KwLGjdBKRt+d0FpZEdP3N8SOA1/Pqc+TfhwwzKdJ/kXAO0sPG+L44
	 qNaAytn7qLGf8EyqYlGr0whjTyoNZCyrvozSSiyFFNoD058gh4r5L2cJFGSOa/wrhm12w
	 Y6GDbBJ70B6ZLQfEzSHow1po3FzWF8wbzSidKZE6tca2a1BgwJ4uAsd/KLqo5Mnscf4dQ
	 cq5IcZYMkrRHNJGGWWKE7vcQ1S0IjVbHU35rVq/hkh2xbFmeAFoaQasG7z4g9NPfhrTyI
	 9MRRQ7xAUWCXH7GN/whQ+LzHCVOSCTC8ESnj3Ipe5mzfA6wZDo4GH/AXMS47cbxmoSg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830869;
	bh=adR0tx/5ukI2dixgsSyxhur8cz6QGIi8kEOUkRXBls4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DEOrXDuWQnGHMyolvF8htag+EUpB4s4lPO8PjSV9qmFbUVnVuwvfSIVevK2s+c0Cg
	 fv+97QbIcplMsaWaz+1ExGiCH3dGfQAlhMwh2KsAYP9+veijar/qMPFiFwp9CIARYf
	 Z1hEhqh2uI8pRUxpuU+tDq35HwR3ZYc6mALuHcdoph0c/Yd8C6yF+WqJKwrbsc9UZB
	 Zrep8gTZoE0lmocUdXacu9fa2xcNkZVS4kwejfb2Btd0cFnfjAY/ttPi0famhtkpML
	 Z/ydMqnDbEobj1Y66v9tgr/5AhsM5HQBEzGVyx1KegnifhJWJ3Qv1VoRwOjwKC/owh
	 0up9rwxiUALww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6A6660844;
	Wed,  4 Nov 2026 22:21:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0F2A362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95A2540211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7kywxElMRoU for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:21:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3679F4008E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3679F4008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:21:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 11F534E403FF;
 Wed,  4 Nov 2026 22:21:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DACC05FD65;
 Wed,  4 Nov 2026 22:21:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA6CF10329262; Wed,  4 Nov 2026 23:21:02 +0100 (CET)
Date: Wed, 4 Nov 2026 23:21:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <auuvyh5KMkSZ4vhx@windsurf>
References: <20261102181345.3238554-4-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102181345.3238554-4-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-pytest-asyncio: bump to
 version 1.4.1.post1
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

On Mon, Nov 02, 2026 at 11:13:35AM -0700, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
