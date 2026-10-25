Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D262606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PbbNZfhJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B31260F13;
	Sun, 25 Oct 2026 11:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPKz-5xX1mRu; Sun, 25 Oct 2026 11:57:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D5EF160ED8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929464;
	b=J7tNs8rF4RnkCh0Iif8L0fkH776dMGHUTadnPVHEmJcIJbKx7xaXxVdN3Y3QZrOH8ScU
	 gYxuECYayDXAp6aJ3saisVuUdJE1yNcSLu9wEmARqLSGzMbVYTJSuvpaicHIeC2e1+rgy
	 ubO7gxZGIealNPLm3px4UYKJ9i4OOYljU+Ue7cRlAgOGROvhq+JGtachexBa/hpPM/8Rh
	 DGheAFQ2Osa4+XMpALploehEHs0BqUkp44zaEqq8SWmqaKk/8+07ahn1FfIOMFU9f5lHb
	 HTJyV5Mu4DQwynZA3gDS8Usj52LnR9OV4br6WEGH9LorRW5VPe2a2ocFlbPIbecNnjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929464;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=qFgKgv8B+MnqjBb+YQF6nhvEJsYLv7r0bLsoZwb/Q/E=;
	b=sqT2+xUjFU9A1oFIqO6yM2fm/HWJb9EPrrubfZweky3p+H+S/ptpfwdCVynxi7Kixcdv
	 QdB1EBwKbHEwL5Sg1wcCEXQhENrnXIfR+gE0LJxZNhO55GPx641q0ruOR1+EZelQv8hIr
	 9x6hFoqpQM4ONTaX20SSB7jMkoAp/addphhM9Gy5joO6PMIUUghiNdG4PJRseoVFS3QNy
	 hvZGkQ+5016SsUl1kZmY9QF8V0LP1iOq2cGVOIfCgij307B/aM1iVqwEE85b9TiKOhQnY
	 K0k+LhNfNlueZtY8uOaQWcdrWSWnu/BJ+2zxYVmcX2VI1XIPyAwlUYKTAnoIbx0LYYg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929463;
	bh=qFgKgv8B+MnqjBb+YQF6nhvEJsYLv7r0bLsoZwb/Q/E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PbbNZfhJwdVU1hmr8Hx4On2dEpj+0q5+mxK9FIlYfeNDG8Yz+Jm6fmBo2HYDoFiAg
	 aNSOe5jOxxYFtFlQxZyss/x2P958Paw4E3h4svHTA8IzshfQAY7+dT1QIORqSV109C
	 dBgOvpaFhNW3RkIdQSNSmZb+qbRTmcExAzEtGFht0+BZ9+kn775JOVAcKg96NyVapr
	 awvfpuhj6nx92LuAAK0sQt9qIUIT6TZAqg6mS5bYtY7eEmlCO2S5M7Co6vZG1QbtKM
	 EnKHMBDzxtp8vrrejOhJc7ZfLGpeVwIw/3QRJ8lkpIpfBq37SLedrJHeN7RiDwO2u2
	 738oPAxDqIHag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5EF160ED8;
	Sun, 25 Oct 2026 11:57:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0ED743
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2B378169B
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAi66a8I5mcG for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:57:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C543C8168A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929461;
 b=hisONNo+7fVyxrKpXG9AePx4GZWypnKwBG/KEtDy/GeRji77WlVM/NW+zfCsDG1L2QHt
 HsASrCUBrRDeGUFI/HAvpO9oO+yG45Cp+4+zKoPocq+xwKyN0VwhrJiBsb7NPvuNn0Qex
 Kc9PfQ9lymo2epenNqWPxyIQsSr99/0k04XRjsm/4HLaoA7rwE9An6HPTqjDQA8Eg3UTl
 f2dD8kkMLIhdIZtKKb28QNQTPrgjtfEZ59k9sXb/qe+6IA8amMhciMGmjXelp14r9TMny
 DaD4b1aghdFerB/XPab8eqEh0X+GX/dGBW+K9MLqY7OQ6JNZKc1q9R9VB7de/+OUu3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929461;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Ip4nF57H5O+YQqnICWD+xGLvJK+59KG7RBKzTZpPiuc=;
 b=Tek3u5K6Xz1wljfuugQZfbMGOzyX0mrsdpxqWEqT7iVeX1esJxXpPinjxHLLEv0mB4pM
 MHQafGLHfR6ADg1x80pd3Vnn7aMnykaeUI6ZSHybVRWUbllxgDKTPf/HMS6mtppheAZbq
 vKPhMBOZnYQbIt+9lHXT0LqlMGmbs7CPi0keldYrXQHbpwMPNVNLfvwA7P3pSSZI+8Zjr
 5ipgoFrbeH5CfAhmL0w2JgDrTCnSHMZX2AQ/hoSvm8ZrQAwc7ErynBONVbNLZIFBc4QaQ
 oWv1ZWgP62NmIThqcH6B+4wCmoWxFmKQr6Wzmrumphau/zYgkZYYXtOrUY6teKFJDmg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ssBG93kx; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C543C8168A
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8AA63B0056A;
 Sun, 25 Oct 2026 12:57:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 12:57:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 12:57:37 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261024182913.1957467-3-james.hilliard1@gmail.com>
References: <20261024182913.1957467-3-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <1678cf819b4adfc1028bb0750378c5f0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-inflect: bump to version
 7.6.0
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/10/2026 20:28, James Hilliard wrote:
> Add the coherent.licensed build dependency and the jaraco.functools
> runtime dependency.
> 
> Update the license hash: upstream replaced its checked-in license with
> an SPDX identifier [1] and generates the MIT license text with
> coherent.licensed [2].
> 
> [1] 
> https://github.com/jaraco/inflect/commit/8eb81cec315179539a0d9edfea634e1cae726e68
> [2] 
> https://github.com/jaraco/inflect/commit/4b10e63076aa60d774e16ab96c8ab816748c93ef
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
