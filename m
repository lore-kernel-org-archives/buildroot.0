Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860BBC88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 17:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BCC480C98;
	Sun, 13 Sep 2026 17:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjmDMi1q5eUk; Sun, 13 Sep 2026 17:36:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3494F80D2B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789320997;
	b=SSPap1+w8uuemIvLDKq4Ll4ZYRcV+mE1GiayDZTheC1948gqQJKrL6VPIamVZQh7GbOP
	 IlbpbR0/hP76EXTPPPtHtOPZtgmzx2TBFAykysiWW86Nm7Hk5rFG1N8eoSYXuey2h7iSb
	 G8n/OzgCnyRnHF4gWcEAIahE52GAG+d6AGzr5MTGpdXySJ7vzr9fn/kwF4XewGoghkvpI
	 coexwfDpRtT2NYr3H16g3MWNzd2tr2DzNcq9tqfDTmZZ8KTkP25q2EZ2r8X1+Dexog4hm
	 PW9eTSr5L5JskiD6xlHcHNcoU9RAKWNHPQeYjY60xeF87KXL9SuvOYdXXOL+qkyRZdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789320997;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=jVzIZnqe1U5jRKAiniSnBaMLttr45XKo87vrh1Xqhkc=;
	b=mixj+ucwrwC5ODzhn8m6LMyqnSZd4WIiNTy8TeciCSbBOlVVbR5PAWnu9thfA3DGPbnw
	 RuzfcOaPrB2MQbwYar4p8zsjdrxw0ic0nuM3c6w6Mu4XiYq0Wa76iXk5AtDQOUI8NrNSs
	 fJl63QGChqLs9EdSPjiMQpHvbLppZSOHdB2AgNfUHEMQDUW8QId5z2U+7ChJmz3RCyKHP
	 0rm1IKhe19CEd9fF/sSNWIdwhR96Y+XQIKafb5b2zkshJu+f9mlxPiLIHg1aQk+l1q+A6
	 jDH0p57n69Q0PmTgGnPDwin2A7xCM3uUtzbCft/bD+nqdF71c/FVNbfjIKe/rkG9JiA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789320997;
	bh=jVzIZnqe1U5jRKAiniSnBaMLttr45XKo87vrh1Xqhkc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XJ208PZIy7GI78TTNotALJW1X6IN9uT1KmtJL+zaibuHkJUMtf2npzPcVOGvK7afY
	 XYUEQUSHmENouNtr8HNUGJ57SSqYP0fklahJwZ74+wpFNt/Zgo7zIMZ9rKG0miaMSP
	 60uTFNkPz65mHmZxX0vePkR5U+bI4SIMolsjN4SU3pEtmX7Juj0J7AJCbmX4K2DTCt
	 LKdKu2ztFvPNN7Y3/vG5tBddU8sZOdlKiomplj+eAdVHvTDLc0DjwZMWoBtGktUNDm
	 KQWvxsnaNman35a04xVqaey5oW6LZIN2Fls3VjuOH8M1S0jW0SqzRlRHoVUGJEMmEo
	 5AX0RcVSE4Qjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3494F80D2B;
	Sun, 13 Sep 2026 17:36:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0D2F29B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A653D4055E
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rt0ofu7rKqlG for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 17:36:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6417740540
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789320994;
 b=is2p1TdYFUZLLfGedi3g/RlYNbxkS0Ao4yMdhwugd9vKugCPVIguF06rGS00j992JH0b
 d7vuDn1c6AlVTrkXZPJTAgB3fyYKgz2yyKVPjDYvz0wlKoMTOlJECftjmoQr3bsCJckya
 E+RImPVGwLi5qyvk0/1inmxfrIUtN5TNqHv4ATrf06jH4ANrsQtFxs5VS+5S92rk2bRU9
 3HY/WKjh0G8NaX6Cnu1xvkjhhgSblsHXY1RD1KXU7mkjAL24a+QVVruDqZ+EYKhwQ70ZH
 0TzsO+MDWUkGT6MHTdi7BfEGGYP5F4zU6YlK5J2wIVOq/UWfXxApZBrKm4ZG3ac6zqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789320994;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=AadhBrxLnmYJkeXRO5rwiH4TGaKvc4udKfsmtcFBV0E=;
 b=Av4DA0XWPxJPs3IIhOL5P9PCZ9HUnjf2Ba046J4FdQOfj0OTplEJzcStHH3/KvId1KEF
 Ml4kDnlCSwdTzYyqze4ZMI4V/RP8EZX+qMzCcNT2DmCF3+gRcII120uEKlt/NDgOiMADF
 nHVHfk4f9M7pr3VJx30ZtO+MlYsPChL9WvSmAh0hUXEIDHqZAsuWv6yxUGMgLbG/euV2B
 xPaZc1fr5/p2v1h3NNg2Qbpxq7RjGCVHkYrILu/geX6JsqLGC4mGoRjxng6y3SCrS3LFY
 Hi8fdrtg2OFk/lLeKB0Lio/tHLTprwR3Qnq3f/YbQUKseW0neIB1mogjkS7p6QLYstQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RQzfu33Y; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6417740540
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:36:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 76FB678034D;
 Sun, 13 Sep 2026 19:36:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 19:36:28 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 19:36:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?C=C3=A9dric_Ch=C3=A9pied?=
 <cedric.chepied@gmail.com>
In-Reply-To: <20260913162753.2099563-1-bernd@kuhls.net>
References: <20260913162753.2099563-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <be5d3f4711e8a0c97e33be636262a1cb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/znc: security bump version to
 1.10.3
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

On 13/09/2026 18:27, Bernd Kuhls wrote:
> https://github.com/znc/znc/blob/znc-1.10.3/ChangeLog.md
> https://wiki.znc.in/ChangeLog/1.10.3
> 
> Fixes CVE-2020-11022, CVE-2020-11023, CVE-2026-82373 & CVE-2026-82374.
> 
> Updated _SITE according to
> https://wiki.znc.in/index.php?title=ZNC&diff=3493&oldid=3460
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
