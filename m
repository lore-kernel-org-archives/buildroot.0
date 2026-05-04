Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DC7CD3427
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 19:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0961584726;
	Mon,  4 May 2026 19:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUUvkWuEFc8b; Mon,  4 May 2026 19:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D96384721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777924770;
	bh=FmzqWuMGuV2YC8zIYP0bSvloeuc5ukXlLh1lriHDkx8=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lzm0MONTEI+GrA+1UTD8QXRspPJ2e/0OFceI9Y2HUz5r1YeIak2iLoC+e48VEpUIN
	 +5vvu1tAYFXan4tGqF2r/SNlArMIenu6pk1rwSR8//WwviY99G8uZ+ObgYkXe0tpX5
	 d5QGAJrOrvV74e6aUntjYAZe7hXaTw3YhmpjzGXcxEpDX1u06M3O7XcpffL9XRjhzI
	 FagaBPZalCiSe0QYajlTQFtYZ6+6coyXJiBBXIZBJesI+Zro/WtKaCAuhzMp2SsYmW
	 3gcXEbfG+scL0QQEcRUhb/XzTt4SqMPDKyoU27VG3fbz2StAYD1WthWjL5Hz8g7xd7
	 b4Sp2Gc+o5Vag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D96384721;
	Mon,  4 May 2026 19:59:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 16D0F2F7
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id EFC6084721
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id sKc2Qp50NUbe for <buildroot@buildroot.org>;
 Mon,  4 May 2026 19:59:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=143.55.232.47;
 helo=v547.v5f06b487.use4.send.mailgun.net;
 envelope-from=bounce+4afdde.7f991a-buildroot=buildroot.org@drhouck.me;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E87684720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E87684720
Received: from v547.v5f06b487.use4.send.mailgun.net
 (v547.v5f06b487.use4.send.mailgun.net [143.55.232.47])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 9E87684720
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:59:27 +0000 (UTC)
X-Mailgun-Sid: WyI3M2VlNiIsImJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIiwiN2Y5OTFhIl0=
Received: from [192.168.50.187] (unknown [73.82.189.57]) by
 b08d9391a2d4f0a62166159b7bfb692e7b4f6a762cf6aa185cadb201ac302c23 with SMTP id
 69f8fa9dff56f7d09a6b3846; Mon, 04 May 2026 19:59:25 GMT
X-Mailgun-Sending-Ip: 143.55.232.47
Message-ID: <cfce9730-25e5-4811-acd1-730c711a59d0@DRHouck.me>
Date: Mon, 4 May 2026 15:59:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20260503235637.637991-1-Software@DRHouck.me>
 <7fccec77-1b27-4404-85f6-910dafd17aeb@bubu1.eu>
Content-Language: en-US
From: Daniel Houck <Software@DRHouck.me>
In-Reply-To: <7fccec77-1b27-4404-85f6-910dafd17aeb@bubu1.eu>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed;
 d=drhouck.me; q=dns/txt; s=krs; t=1777924765; x=1777931965; 
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: From:
 References: To: To: Subject: Subject: MIME-Version: Date: Message-ID: Sender:
 Sender; 
 bh=8hLqh4xumS24UiDbLzkNnXqenjWclm6GA7guNPZWZ2o=;
 b=uEAVh1Iy2al5Z2dxhMRkuzfdl8PruXvywsV6Ln8iYIygwf7UhhVI3mAFz2/sRFBQzH1+uh9C9ZQsaiz/RrkGFO9lyhNPtD16c+e3JOHLiSme+dHriGL9URij1cYtxeIBYwYHdXjcXXsCn7QMCC+2zyXHGCGo2vGae1pr+FSoJg8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=DRHouck.me
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=drhouck.me header.i=@drhouck.me header.a=rsa-sha256
 header.s=krs header.b=uEAVh1Iy
Subject: Re: [Buildroot] [PATCH 1/1] package/make: fix build with musl and
 gcc-15.x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

On 5/4/26 09:17, Marcus Hoffmann wrote:
> Alpine[1] and Gentoo[2][3] have a "proper" fix for this (meaning the fix 
> the offending code instead of changing the std level.
> 
> There's also been a submission to the make mailing list[4], but without 
> any reaction and only containing two of the three fixes the other 
> patches have.
Ah, I couldn't find any prior art, thanks for the links.  I'm kind of 
surprised it's only three places, but a few days ago I was surprised 
anyone still wrote C without prototypes like that, so what do I know?

> I think this is the better solution, even though it means carrying a 
> patch until make eventually might fix this upstream.
> 
> I think we can just use the gentoo patch as-is I think? What do you think?Yeah that sounds good.  I'll do a couple tests to make sure everything 
works as expected and then send that instead.

Thanks,
Daniel

PS. This is my first time sending to a list like this that doesn't like 
HTML emails; everyone else I talk to is fine with them.  I'm 95% sure I 
set up my mail client correctly, but if not, I apologize and I'll fix it 
for next time.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
