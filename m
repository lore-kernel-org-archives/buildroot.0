Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095DAC88E45
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 07:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2B7F80ED4;
	Sat, 12 Sep 2026 07:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vGnGWmg1ZtR; Sat, 12 Sep 2026 07:40:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E3A8C80ECE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789198804;
	b=M1JrmWO4YxI/39+4z40aQH1jpqv98GQ4VnQFORPWKuJeuO/kWAI7HN4fAFNLcXBS+rv4
	 S32w2uZdDLyu2b/s3aOj+apCh2lsPYceG0sJ490bLd6CF/L6n1oeSRinjaOHaEdKlV025
	 KKbqQDaVeDZzQKNbkbT6W5lm3SHyvaIyHt//AI5uqFvyuqoo6ekb4E7kHaiqfoX/ojW5O
	 SbfBGGPudvjo2SHtLfWAgcRreT8KVkkNkoZBptIR9mMstDE61ENK792HxbGYnJy15/J8m
	 2BGAaRfyjPSwXUULAoYUSZAszTeKrSDd8ZT7NpIx1W76rBkqDXzGg8lAfpeYPlogW0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789198804;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xZzSu1LEin8CLwXqrdCnJalO1KSfiAVKxbhll3Vdg3g=;
	b=ZOZ6x6/wn9ecFCvxwYWzDd0kou6HHfUYFdiK2zkBC0Wzo5AHQfNv30exidFX9LAF8tMr
	 5YlAaM9teBseqJDPZJjwn3bbjGjznGzBI/NR/mQ0PFYxoDPiGp4DSnhwnaXSCJ2E6B2Ab
	 uoKjYzkqxIOyOVRWZghNiaLtHoKo5PCAcvL1NGIkmoVvpsMh0qPtuKvJXm5qB09Sznyzb
	 Vx0UJEtgCJTmrN+uPIzxznAlUQ83xzcHM3AhnEYDSrKHGE0ruq0avyArww1PphcH2Qb2e
	 n4ew7UdHh7JekBWalms5ovvew42jd6r5CWFXZ3SHXzx/d73u9+zDi7y2ubCp5XOt/0A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789198804;
	bh=xZzSu1LEin8CLwXqrdCnJalO1KSfiAVKxbhll3Vdg3g=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JINu8Om/qdPJJ0sp0mhGs8Ecr0MWnWoP+dNlIAzp0t4kqgJURbGRLm1Zz+D+hJlxg
	 ysdzcJhA62BetX6fkRZCwSMmZJgWSlqfky2BQtE4Y8DbDFozGCW30XS38doxC8ghOl
	 4m1qLLGs1gHbGENT+q+8gQm+V+pfAG/TrSzB9MEoWgra7zwGQnKg/ed8mINUh9sfrP
	 +QY9YTFHMyA6nhiRRuls4950NeqKPOUkRETY7pikeUkCZyJmsvYUwlJ0e7dqZnpF4A
	 gWnjiajhzJHark4ghW4dNPInq7Om9/Fmp9MiYrtOJWynH3s46B5EgsVCDsLK3rx2nT
	 9JUlkLwQVejTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3A8C80ECE;
	Sat, 12 Sep 2026 07:40:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE3AEB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E69B560601
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gURfn7_nbKwM for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 07:40:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 38E2D60614
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789198802;
 b=qBMMi17CyXuKoQ8SzG49QinjDnrO5Qee5VHhMusb7UzZwuRKgw9puFfGw0DpOF8G3AmD
 PMCOaVrremN069m/MqRlS7Ikt+7DMNO9y2+KSXXQQvLBsxw0aFo8IVKpyftMNDWwAGPIs
 /Fvbos0gYgHLiDd4Wo7GK4q1ymiW9mm10ToZ721eiH8ZqdfNXhi6h8nv76zN0Ki3MmXJu
 s/kMav9pHqlMpTwnjdnkhP6c6EbE7FtyOiLj+hTPvCi8FZBEZ7DtUZ82Y1g7M2iPDJfrk
 d+13aEvK6+7HcKcBpTyGR/fXWOBljLc9ftR3uNucMkbYIq2emoTWQazFZXtyKTL5cYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789198802;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=SkMfvJwnsLWj4JdF4WZz6mJ3cQjc0jA4ohvzlv8CBDI=;
 b=s9PFVxIh+uEllYiHwTlLTqSCiG1UD54jnvB8YnAzESZyliEySQMpfqqgcG8MifJ4HXLJ
 hj8DkTXWN9C1evPkFqcu53Y23b6aibIgip1tThXiyxhS2g0GpzIS1dTpC/gSFDHJ/6bk8
 Xj08ZbO6dvoE3AXW7TpWY62P4mkb0i9UGfsLWzSUJPrZ/NMF22NhjTAGdNRbl2iD0BcFq
 O+m5s4U6Zw/sumdSlp55+pbYj4SXF+227y8Q/j5VKRhiNbZa2B3Vwfmq1+VXE6c0GzYFW
 9vEe1X77l5G5kqp+O+rKs1sqnuODqdR7mZlvuWsjf7/laq2jHwBvkfVcEqPr1tuM6VA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b="n/3BQbKw"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=n/3BQbKw
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38E2D60614
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=n/3BQbKwgi9ZYJS8FqDK5mDwWBV4h5Ml/cWAm4eyVaUsm8nbpmfM6zPn2DNB13i4aCgTBoG2rNsWiTLvVCSx7eKFD4FiSkPuP9DHSpueXZvQ4OMwyy177of6LIMK/Za6kAmJg41P89ffQ0NdSmajLmTMqVj045PYWa0LoLZYmVgty0mzxbuPrHJXpgjtQymwyGJru8gwBzidqSKbO4G9WMW2sQzj5+DtcmDNg0i6abM5j7yHYWe1PHTETmjEChuW20J8zHzzXAFE4lag/GuCQfZRSpi+6in2VORS5lelcEpDZzxal9Ch2Y/m7UmTmwcKTyQlrcDuK6NuUOwbcYBu2Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=at75uoAiPxyJXozkdP9XcdfQi0br7IP9SGqNvoqmKoU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 128802181; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 12 Sep 2026 07:39:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x5IL7-0000000FCku-3Sna;
 Sat, 12 Sep 2026 09:39:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260911205732.773058-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 11 Sep 2026 22:57:31 +0200")
References: <20260911205732.773058-1-bernd@kuhls.net>
Date: Sat, 12 Sep 2026 09:39:57 +0200
Message-ID: <87eceydik2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Update the latest kernel releases to:
 >  - 7.2.4 -> 7.2.5
 >  - 6.18.50 -> 6.18.51

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
