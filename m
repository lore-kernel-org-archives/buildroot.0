Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEE4E6529D
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB1560BD8;
	Sun,  1 Feb 2026 20:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzS1jMl6BB5I; Sun,  1 Feb 2026 20:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FD5E606C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978401;
	bh=OgGrcKpkohoXfh1JS5VYQiR76D0WSvaO0d3SLCg8/rc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rzlr2DCiv6BBtdOJzXosaSDN5h0C+sJJBcDdRFUK+pPf3+PL1m10OuwQgAZdsEbuL
	 6GuOn2yVt7oDuHHMv1v6h2cf23GPTuGW96OH0rmWE4nOp5yvkHfyL5t0jUK2trdP4h
	 Z8Sls3pRlPhd6q81fXKevx3zYk0gM7VJI01H+ElOljubhrQ8d9bsnXKEh94adpndnM
	 faZgQ5hiWdGIG7KGnA8N3zQA67Aa3f3op05RxuYN/SIuTLbxMPMdr+mYqgFYKnhrk2
	 /PK/dBbfH31rn7VyWcuNhu7kQKs4GN3waWOSkxYGziXXfRFFP4O4gzdsBirajXhTgG
	 uTrswdbCt2ywg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD5E606C1;
	Sun,  1 Feb 2026 20:40:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D0D1E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E3A0606C1
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rc7__RbXm7IX for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C268E60688
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C268E60688
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C268E60688
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:39:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1720887724; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:39:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmeES-00000005kDd-2VYs;
 Sun, 01 Feb 2026 21:39:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260201184038.3445579-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 1 Feb 2026 19:40:37 +0100")
References: <20260201184038.3445579-1-bernd@kuhls.net>
Date: Sun, 01 Feb 2026 21:39:44 +0100
Message-ID: <875x8g9p0v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=o+9Wsd2SOTqtlOy/dpVuB3ZakFH0X+1iSSNKLcNPvegcZjldfOiLB1byAuuF2TbkQsd4XxLmZORGrvDYvwDd9JqPJzYSqYBMQbTsbvg5GJwPcFgeIUqv8Gtn1Nqmh753YgWp8sYw8NeC/hP2xU1pAb9RwrbKawJdv5OheZYUMyE+Qehi43dNOLmUebIZlIoUGApQzIz+HU0Gx+G/AJ7HPz4R89WzovfoF7MgNOviI4kTsS9lhoBg4vMlAzNb8E+bMT7OyYRtxDE8jTIeLNkRCyKFcz4DOv/z+NLWSFJIf4hE1HSDm7L22IwlZhJdg554TruEAMeyXFqUSbuyFJhuAw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=aUw/hFUcMtbPqfk1i3rjwyn+F++4L9UwnjAmnl9JUiI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=o+9Wsd2S
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.1.1
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

 > https://github.com/intel/media-driver/releases/tag/intel-media-26.1.1
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
