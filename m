Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5011DEFCE4B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7CA3811DB;
	Wed,  4 Mar 2026 21:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKFKQCPGdtss; Wed,  4 Mar 2026 21:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B511B811AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772660926;
	bh=8mkPgswpyK6t73Gwhpv1cdR1SJv96K1PBcpZoSxA7Z4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ibzRTMrjXjT3xb8EeqP1VvXPSwnUlXNhL7PDN9p89+3AercOI5FnXa81kr/Oop2Qx
	 7csTLkixxWqObyOubrglbbwHyrCHA2g4/Zm8ujpQhs1I+esuTTvoSIEin9xwYRteys
	 6Q3uPFOoPqDgDHhclAh1ZLMCFRM44psfXErLvHw70KrFT1a5hbStYWv5YiiInlhVBn
	 NyrpRto3Y5NqbuhUFNPMRnbT9Rt7ju38nOdlwWNQEERwQibORSaj8TDjeQwgH8QuZA
	 JajKS8MbkhvVYPvVK364tN2l4tTdFaoOaPOKkvkANmOl1ZTTN2sml3apEwvN+jWoNC
	 sKsHmzEBDhfDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B511B811AF;
	Wed,  4 Mar 2026 21:48:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF2781EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5156608D9
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vRdGRRq3U7V for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE7B6608B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE7B6608B2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE7B6608B2
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:48:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8A7A52003ED;
 Wed,  4 Mar 2026 22:48:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 04 Mar 2026 22:48:38 +0100
MIME-Version: 1.0
Date: Wed, 04 Mar 2026 22:48:38 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org, Grzegorz
 Blach <grzegorz@blach.pl>
In-Reply-To: <912ab5b35885b989eeb0623fe4de1f1c@free.fr>
References: <20260303081323.53405-1-thomas.perale@mind.be>
 <20260303081323.53405-4-thomas.perale@mind.be>
 <912ab5b35885b989eeb0623fe4de1f1c@free.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <d8e4093b92ad5e082b8472c5ea1f34b4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772660921;
 bh=9UMW4Qzlc4uJ1fQmiwyhvKJBQBW4N1yc9D1bxekjxGE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UjDjngZSi5tU7VRu0/akEtte3tG725gZv8XW+hi7TKJqcrGmfodm9bOZOye3lNHk5
 2It+pfV60LU38a1HNXbgEMyTxZxClNmdsRW/77N4QunW+DrHqtgdMSDpe9KAbNlN/r
 RzQYqJIzC1/YyI0DZxa9crPXqxeXzHFHPO57ELScx6LF3UQz02oLrHVCrqJgv6DmLO
 AKFm4OCVbCYeousKEjwx9GMdW73Z70wDTdnrIqEDCbzV9u9w8irWXKCdj0Xey5C5o5
 mNHa9ydXERZdf2lzNqHyv2ocykt/7c9S0tBwNAKz7wioZQoIMvM+B0TBvE7BRaTRuP
 55MxysVj1f37g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UjDjngZS
Subject: Re: [Buildroot] [PATCH 4/4] package/graphicsmagick: bump to v1.3.46
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

Hi,

On 03/03/2026 18:38, Julien Olivain via buildroot wrote:
> On 03/03/2026 09:13, Thomas Perale via buildroot wrote:
>> For more information, see the release note:
>> 
>> - http://www.graphicsmagick.org/NEWS.html#october-29-2025
>> - 
>> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/compare/GraphicsMagick-1_3_45...GraphicsMagick-1_3_46
>> 
>> This release include now upstream fixes for CVE-2025-27795,
>> CVE-2025-32460, CVE-2025-27796.
>> 
>> Copyright year updated in [1].
>> 
>> [1] 
>> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/13454c83b42327a29796b2bf418e4f90f5fc9292
>> 
>> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> 
> Since we are already in the 2026.02-rc3 release cycle, I would prefer 
> to apply
> this patch a bit later, after 2026.02 is release (hopefully, very 
> soon).

Now 2026.02 was released, I applied this patch on master, thanks.

> Best regards,
> 
> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
