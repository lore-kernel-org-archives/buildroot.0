Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94303C5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 09:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23C07606A6;
	Sat, 15 Aug 2026 09:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBOB7YRQ7hl3; Sat, 15 Aug 2026 09:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374656064F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786785161;
	bh=kxZ88zI8A+aGkoP9thhmVlVVUob1WsbakM3qiJSM9x8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XlGq/GT+bsrA01xEkRaJ77rOSaXPCVVtEmLkQdSQBf8NxC2IkZeox5gtSkgLxw40m
	 lajFApHvnbjDzazECwAK8k18EbxtiSvLvDNnG41t0Ib5L+FZfMpODO/q44B7WHsnfK
	 9SiCnl8SKcpXbBvG5oeouke5A+j9W8YzcM6d5ps9OC41V8WV3luqAyVYZaOX3xJY1M
	 oYE7YJmz1hGhLsTZFREIrDvLozd1ijiKV8nsJeFKzuMtshK7amBXqTwUlcNacHsc4F
	 OK/rpX5ciZpV/UzpDeA9yHgygtqzZhKPhn9EJww4tzQEoMc6pusOGhhXKOHfftCFpL
	 8oniA36zmTMWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 374656064F;
	Sat, 15 Aug 2026 09:12:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99B723DF
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BC376064F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmZbuhm9AaTC for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 09:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5429760640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5429760640
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5429760640
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:12:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7A7F213F880;
 Sat, 15 Aug 2026 11:12:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 11:12:34 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 11:12:34 +0200
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260814190051.2970501-2-fbstachura@gmail.com>
References: <20260814190051.2970501-2-fbstachura@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <574be64001fb9f9b38f833a41106bf43@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/memcached: security bump version to
 1.6.45
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

Hi Franciszek,

On 14/08/2026 21:00, Franciszek Stachura wrote:
> https://github.com/memcached/memcached/wiki/ReleaseNotes1644
>> Hot on the heels of the last security release is...
>> another security release
> 
> https://github.com/memcached/memcached/wiki/ReleaseNotes1645
>> So this is a lot of crash and security bugs.
> 
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Applied to master, thanks.

> ---
> I'm wondering, are packages in Buildroot master supposed to be
> bleeding-edge? The maintainer also left this in the release notes:
> 
>> If you decide to deploy this please be cautious; use a canary server
>> and let it bake, just in case.
> 
> That said, 1.6.45 was released a month ago and I don't see any critical
> bugs reported in Github issues. (there are two AI-generated reports, 
> one
> is not considered a security issue, the POC of the other does not 
> work).

I don't think there is a general rule to whether have or not packages
using bleeding-edge versions in Buildroot master branch. This depends
a bit on the upstream package itself, and it's also a up to the
Buildroot package maintainer.

The general rules I would give would be to try to keep package versions
that works in Buildroot (for all cpu architectures, gcc versions, with
dependencies too, ...), and avoid using intermediate development
version which are updated too often or too unstable.

Some packages, like Wine for example, decided to use
only stable versions:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/wine/wine.mk#L7

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
