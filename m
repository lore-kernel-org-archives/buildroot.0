Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D12CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D5616060D;
	Sat,  3 Oct 2026 17:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WdN7UU2Nqrx; Sat,  3 Oct 2026 17:22:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D1CF06064C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791048167;
	b=ElG2ZcxwxnqhUYNl/uEY17RmLBEf01sb48PiiotfI0srIXDzj57fUDdgKiLltaBpmoYt
	 lym8Rkty04g+ogezHWXU9dBev+uifixUY+t7Yk+xQc4rBbK05tdfIq2g/JaIVktvq8LeH
	 47mb3yKADm+K6m4F2HOZrkBJ9gBDH6tiMH7krZuBjcveYbtCESg9s6p+CiypxHLOIv6ov
	 JCWpp4zjOrHUIxfe6CMhPseQnf3wVqDz1tiI0IZUcDz+HQIi3Y7QYZn/lXK5nOpqOi1B4
	 c9oTEtz7y7TkSe1TdFiHuCdoXUD1qnj8VoDkR31j9O6f45choNSluXRxshemYxUycHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791048167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=R5FWmvRmHwhA8DW91PoD4leAPFxDDukGL2Ak2wJNQ+E=;
	b=TsSZE/00xuIQp3KQXy7QpzD2UdYHm8mN4w6ZkBFEbKDaAngnpagaz2yKnUJr7JVSvWkg
	 GssHoY3oZYdXOPwK/ja78UeQZo6nu1WnIu17dkmV2X7yUWBNmY99wv20Bvx8NV8OObyY4
	 1LnSXg7QxOymPhd1U8lM2lLjbG2uh4fVEBN5fTnHOahcKH/vTdXifdFZaZhN59JWiG+Oh
	 aJ+kpyaAqY+Zgk9QB0e3ofznx83Y+skZnl4hRwcLJf6aiMWSoAzHtXE5A0V/hy6/IfQks
	 PXJDM3jKCkF8oGbtuq1NsDnAFIuaGFX7HPblmrK5jDsGXwKJ8LOKTUd9UBeWw2ZVKFg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791048167;
	bh=R5FWmvRmHwhA8DW91PoD4leAPFxDDukGL2Ak2wJNQ+E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kp7c7v3q52atoQpy9htrCehwRbl1fvylndzBcCGfsKtY3aEtYOoCDLl5N1odADTwe
	 L/tor6biTYqOrBJesMqY9jpVccEOYEdti0pjY41VMoOyG65PklqJHec4E2/J+NB7b2
	 wiBGMHB8dXLbip5QGFpKNOJLFeHvDzigfFlf9s334+8AiPxe4IzXZjmnvmtvxxnhmD
	 g4EjiFqw11pl6Nb0nEug6e+UwKFAtQuR2nxeO3MGybAI+3vWFfeC7Ekkj0XKfBxZOt
	 Bv23DOKH1a2RoFXA/wrHsi7HYvKStDEfzX9BeuGAFriN7wdFdcAN8Koq6lppGqr1wG
	 Uupz2b9X1O0xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1CF06064C;
	Sat,  3 Oct 2026 17:22:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A95A1435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A2D96067F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mS-OMgfmZv8u for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:22:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E991E6064C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791048166;
 b=W/+uQdvYU4+5f9xg3iA2jHSVKbEZHoXA7Mw9cwtLuG9imH88bE8UmlVJcoxC2A17e/Q/
 aao7puzTyBnWRPu/KPcY6x1udYk6j/nG6ka3gXmetW82M+7gIaTpIfxuo6V2GOWVdJ6Ld
 tW5zK98WxHUdDQUmD66KttgPK8MZ7HHsnIjE3xhMLuEm7jOGC2HDRirrvjdn2LSkA8Eiu
 j/qieLdb8LZHADlV7cboGqga8uW8LnyuBspOOkbol0ANSVIEh69brHamGS++d6y65fbby
 jn+Em8aZmVFKJXNzbDESj3oOJV7WRr8rlW0H+GyStQcYBHaWItGPxcMOe5mmM+xazBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791048166;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=pZyE8A41/K+ekJqA07L/C+tC0UtINS58+7uP9//qLQA=;
 b=M0vOJqNCCAfFvKS0aRBkNkgaOkvaAK1Bhu4AqB9p2YreMDkjdsaNl9Lexa91p7VW46Yp
 LR7Lk1833zIVuq5HWmo4VU/cd1hCerYACuTg3IPFHceH/ItphdhPVMFkl/IBO1XkhEAy+
 mM5Jr6eeLVkcxpSdt4koW33PE+9SmjDCXpAF8tr2E87JQTgUUfSiOcXFGVbGF9icalTtI
 4c+CFa+7Geo5G6hOjt4Tehj+ApdMwxhYwLb+g5UXp1fHNX91hM/MPhftknsD9sSKtkzNd
 OA1LpbJswaGaXwzkYLhHleDCu/LLyENNdmJs5kxRFyGHxb/6/u01E4cRu2yPHBY6l8g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AgpToues; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E991E6064C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:22:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CDD6713F880;
 Sat,  3 Oct 2026 19:22:41 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:47092])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Oct 2026 19:22:41 +0200
MIME-Version: 1.0
Date: Sat, 03 Oct 2026 19:22:41 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003164534.2876999-1-bernd@kuhls.net>
References: <20261003164534.2876999-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <992bcf62295587cf6e6bc6dbd543a0cb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump  7.2.x,
 6.18.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/10/2026 18:45, Bernd Kuhls wrote:
> Update the latest kernel releases to:
>  - 7.2.8 -> 7.2.9
>  - 6.18.54 -> 6.18.55
>  - 6.12.111 -> 6.12.112
>  - 6.6.157 -> 6.6.158
>  - 6.1.188 -> 6.1.189
>  - 5.15.221 -> 5.15.222
>  - 5.10.270 -> 5.10.271
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
