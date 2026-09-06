Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB664C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E38E60627;
	Sun,  6 Sep 2026 10:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwBDAuu8xvbb; Sun,  6 Sep 2026 10:55:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8D8516061F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788692133;
	b=HvE7S2hozW2PoBB3CtXZX6SdSVuuzqP93zZwQgUPiES/Z/8UZO83EOmoxzFGWy3l2LQK
	 AJOHW2ZU4NcKbmrN9zf1e6l3PRRV/eFgrLqeu7wgYfrRr0ZaXam8ucIotiN3ohkrmlVEk
	 t6cy3Dl7lvHJndfoh2z68XvNT50fEmF3sv11CoQFHAWkIgth/omot9RcWXUIGwYrcrpI9
	 lJJU1nsBhaQdxcID0PZGtidfwaUDwpeFGd2On3IxaZnof6t+MFXVUaqZi9iZM1pI7+mQr
	 A5/cE4h1PIeMTNoeXv8hosMbeOr2SGWQp4RAAMl+nuxJkJy/y/JOTaHqrDvUmiuduZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788692133;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3wDGG1h8sRfa8PsFbnVvq/jNyJH/gh3EjoYFE7NQ+vI=;
	b=H4Y2To45rhUM/q7B5E5z7FF//HoAeGhXzMry65CId9K32cN8mt5Dsbayl7ujGUbjqggX
	 tDdX7GBfajCEUca7KlCEG2mF+g+MA5AUgF4w+HFdalNKPYqO/xpF/GnTWzZWhYdD5u4kA
	 CyP8qINmoLeMlwzZ69PTTf0Xn4kcCIeD6gy+1znDcZ2hMuOrIlWpY8Jt5fJh4RM1Fez2Y
	 9NMXBYtQDdf+hv8iKuNRHQVQVud2uYrJXJ9TjHjHQBRRm8dqyP0PlrTunMuk5T2QUDHTn
	 EYBgpDJgR6tThF/lS6EOnTvN5XTl9ZLUjDUUvh77Scw4OspGtK+ubJZjKD5Saky1nZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788692133;
	bh=3wDGG1h8sRfa8PsFbnVvq/jNyJH/gh3EjoYFE7NQ+vI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NMKTZgdYgBnnnBbDbxqMFXTgVyvLpmdgORbf1U0MamuHF2eELaNoksMB1J6BjZujX
	 RC+wiSbuEDh/n2eJbAd3CggZF8N5/8j+te45wqaZtHzCunwNQx7Jc7AZHvlWcY+0fF
	 r/CooLwe3Z/tG67hEH6sr3tRk231D6a0BTVxaxDS8N3W3D/EbkM67KyZX83bz/UAMj
	 uzdbo6aFDBKSYqWbFgoIy4nkK0CzuYo1W7f4G48gFRTKoiA3lMsAT/nP9n1zejXSvH
	 3ZkIJQ2mZL5i7jkByjtSEMQkiTv2q2EP0JExwaoApH3l0lK+mhLFsNLqGBz65miKt2
	 p8c1h/o2cthdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D8516061F;
	Sun,  6 Sep 2026 10:55:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C40783AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5CBF40636
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtrdZ6-RLBwu for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:55:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 63BB9405A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788692130;
 b=G6xn/l1GqE9DSZt9vPQLiE1hwt/uAhRhpFc7h/YeTvsYUYmgt2Q4oXkC2WM+/PiIMOpz
 UdaMFD/+z6qWpDUWO4bk7NDmmPQLPbibPv5RibdHowt4VDazLoDY8zvm/UCyn+0aW1VAY
 J/XdRpU3pgZTpai5QYifb6izffkyOlJ5c3FvWKDMVAeCLtyVa07J7rsk3mTzNsHygf/v4
 bHvaNiFPoCE/ZXrsjxjNlbuhVrcVVwhpvOrm2YWmZwtpT2fVX1sFORy8qX92y2M9V490I
 CTPHjQ4Azcpdv7hUyeSS7RrtmHr1u4FuJ+bVbJBpdCDs9+4jG+DuTKHd5cxETr/6rtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788692130;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Eo3OispcIJCb1AeH/X/nMJTF2H6VplfqqtHBqdkR8iQ=;
 b=ItMvaVh8KTSey9PqaFGEXAXf5KKdR136DmBGQ06dIoBuWS7/b2ClVKHsxz5fgUXMoPl/
 gvxmO8/2cIh2245gtvvq6Xffq+OO897oMl2PVFEY0mqFO5vOKyphiKMszpZIYVkEkVUlp
 NLGrYfact46ErMF41OIxolaWFxpHctimdha4fm9ZeT2/yOPQThdzgXo+nQZ+71rcl3B9N
 REvZ5dgZsyKFsq0JoSYSsv6sfLmmWBE7lzQYycnMZuF0f1yq8qQYzMTGMOrED1cTOFCpO
 bPYZYMt7D1jT1v8IBF5dpVCji4OI03XGxyWFLiBaf7rC4fiD529zcoXlbF0e6abbLNQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Z6UMJeKH; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63BB9405A2
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:55:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 96F8C780331;
 Sun,  6 Sep 2026 12:55:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 12:55:23 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 12:55:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260905120923.1531021-1-bernd@kuhls.net>
References: <20260905120923.1531021-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <7dacc7b0caf594b0ad5d23e9e08c4619@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-40-g30950ce64
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

On 05/09/2026 14:09, Bernd Kuhls wrote:
> Fixes CVE-2026-18374:
> https://gitlab.com/gnutools/glibc/-/commit/0b4e41fc51e6aba6216a908961b49b0622b47fa0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
