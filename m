Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A879DC79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 21:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 748A6607F8;
	Wed,  9 Sep 2026 21:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYcWcjis3qeQ; Wed,  9 Sep 2026 21:16:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8587F60802
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788988616;
	b=F5tmn/74I7Jg21DNKToSNCjF/RpbcdOtxojYyYOWPE24GbPEhrXuoZokvux6yf0lETKl
	 psLcaKAyzOYLBQdKv0w4ecpaXGsFyT0gIAN8aPe46ozRz5e4yKHr0IjrZSWs0GhVhTEND
	 Lu9GXLc+DC4TQSb8NxNm/CcJ0yPNe6qTWIOrFp1cmzd9FF3Bdkxvdm7iH6LPoPIXrbKzB
	 AVVZ4AN49W9xmBp+rWI54Y1gZ4fm3nmrVSuvZ3LnpA3aHuqjLzRX4Qq5CjslbADzlVyWy
	 /5BwjeI1jGnL6YOzksHEfkkinMcLQf6Hd69ZU64m/lA6ZwxlhFM0kvc55RBMkicKqAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788988616;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=WOJ7BaW4r44+HAetsEhrQ7rRSxpTIDKq6Nor3rxFaIM=;
	b=P9A8IEOydNsZltfc1i0EpDCat/Rb6OqRAwPeekOWzzQD1Tv52FwK9WhXhYwsvs55OaA4
	 aGxwdzZpIb2TsnA3vMmtiLUwS3orqFme7SCqv7Hs0xPt0WsOTpsKOmIOPL19R3N8igDl6
	 i6v/HGVk8y5MjG8WihIj2IO8B7MBWn5GxVsz/sOwQBFlTAmuBhBa5EOcjF3hUCsHkGyp1
	 D7tB6NQznGrSrgEmdh98q9ycMvURaCXItNQLzFZkaosyTv+ACfulL1Jv+t0opcZY9/Eyp
	 z1z3K8asrAb038FZItYjxyHK3ASUM3wi9A7S+3Es3uoMwYZXbmm/EL+MNHmO0/x2FkA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788988616;
	bh=WOJ7BaW4r44+HAetsEhrQ7rRSxpTIDKq6Nor3rxFaIM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ESHsTSv/JjQIj7tmgXnrs2rc6Iic50WYyKhjo9P0N0IaRu8O/WeOZ3Eot9FVU5d4C
	 9yN334t55dAzv6bY08P3tHIlNwmo+gJle01vk5O6Kqp8bqRXRYEy+4381hTFhtlFo8
	 ijIS9R5dLuIVbYz9hyX1cwqN5v4Gy6RHKXJ2DBbV65WQUt3FCWsTNL1xyWtiLLPnuR
	 emuSB+WytapUboA8pQCATWzs+MKw+ltU2OjSEnUX1CA0VLvkKaWG7LEi3ZUxKswe7J
	 /TEwdwPyDCb72o75ofxsZIy/arll1S3mq/RVAfMoQbOBOV+6s7snSUWPjTzEWfojFY
	 FLt9pv1JLnD9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8587F60802;
	Wed,  9 Sep 2026 21:16:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81E12724
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67F4E4026D
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gf_6b384Z29Y for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 21:16:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0EBCA4026C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788988614;
 b=GE8EmoV7dI1UlkKS2D/kQizmahLWFiY8jwuV/Hu1s1l1F3X4uzF8V0T1RUQQNcOM3sXP
 Q0KB8f8g14A8fDjyFZN/tv2j95CWr4/nE1Y+VFB2I7vU7D2GAZ58M1ExQZx64s6Re1ka0
 QYoy9VeCSWRc4njSRWbk+tDqwzhrvT99Eh5V4ubFqMxsCj+2PGDDmureYyTM7ED+b7nN/
 0U46T+DSr+8z4iSD9IARY2Gg/+Tv7RcEICXCiKxudkGNhOeJra3C5mI3Rj3WnOckX9ASB
 x2szpWnuXB5mwfuVYTqqghnabQEL8HiNOk05AvVa70q2CaNUG2ydIKswSTym5NGLHJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788988614;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=iNqxCU/YPYy1croaDZYcKcuHhN3WPUxMJSN3bIH8i3c=;
 b=KQamjj7+oagC+/qpOwkTUeBhYtqb3itmHDeH0zav8YqZ3GN1XzvPy+xNYKBePpDEK9Xs
 e2n2P0321Le50bEe3VY3z2VqGL8Bxhyqjr9c+OUBAXmrTQh0L/xzn0FlvkJUDslG34Dva
 CkTdqbjt4Mi/4kiXu1rtwS/ySjsR7de4h55Wel29wpW71vZINtmmGcppgZuPWD7TT+Sup
 tjDoIIN8WVBWNkp7qjca7j0z4SyG2F9AXuJwqGY6L7JLN0tv0aavlpFNTlHuKMcgypU78
 9VZPaT+19MfVl0RWN7PBnHl/yi3MWBe9EgEFP61SS0bc+/0AtUIjl6Jzs1cemabGD/A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HtwdgFyB; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EBCA4026C
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:16:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5FD42B0054E;
 Wed,  9 Sep 2026 23:16:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Sep 2026 23:16:50 +0200
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 23:16:50 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260909123451.1995875-1-romain.naour@smile.fr>
References: <20260909123451.1995875-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.19
Message-ID: <26417b5524bad1525f5f0541c9f08bf7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] docs/website/sponsors.html: announce Smile
 as sponsor for the February 2026 Buildroot meeting
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

On 09/09/2026 14:34, Romain Naour via buildroot wrote:
> Thank Smile for sponsoring the Buildroot Developers Meeting of
> February 2026 by providing the meeting room.
> 
> https://elinux.org/Buildroot:DeveloperDaysFOSDEM2026
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
