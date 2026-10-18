Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEAACCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE0860702;
	Sun, 18 Oct 2026 14:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D64lLK1LuyZa; Sun, 18 Oct 2026 14:30:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7C9976062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333847;
	b=FyNVnh/fvk1ea8LnaJz5Rymrm+InPdIoS4f1FoaD/z68xdFOCwV8xO5QPYZ2uQPiCu/R
	 gS1rudYqKw5TkfoNV7HwOd5KK2N5iizhGqFQMxo4zojpu3vLHvZF5vx2v/GWzmdN52g89
	 vmbBurqLUugZbBhvbfvvICvXDK12kQKUrSF3rf2WWksYyF/sIOMG0ogbMPvf9lS2IqFzC
	 vuJgLBihEYTEHy7XKG2lnxsYH5J8/oHRNVaRxtysCYuAQNxT5oXE9B7iLLQ2bdopcpb8W
	 gTqeovbaTy5nmJR/iOoiiTUsKXmmgveVpWtA2mEy8jOhlx6b+pk3188umC5yRBFLI1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333847;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=TELExwhyvqqYz3L0idZB6YBZFgdhzFS5B9wlTI1pKY4eJ2lcKXYIt871I6Pf9aV4ZmWp
	 hTUnNvPAbk8HKt5X5LLKcLHCnuQeFtGIVU4fmZ1kvOuvR83tiZGt5h3JskotoM+wq/YIw
	 FPneUjbrJfHuYP93akF14Ru36c2mL6qV/Y9bQtqzP+uzTk0aIlZpVlKUEAmbMZakmZywC
	 5Kk64L5PRIBmx8PKuaYTURjcyAVd8OJmWVWAhNnrCSHh9wdB4ISU2EKmzMQYsuXth6QM4
	 /b2aP8oKdvBmJ7c+dCIK31j24uIcl4fQZj4LXL3TJhsIK8ahWwsjWHJjuogfGGJvSiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333847;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SWRnH6riR/uhGSTdQh2svvD5MW27h1oJOthrojyDTmWCtvidfddtic04UGduU9yfj
	 ji2zWBzSPgzOUcurBHW7mqvRxuwAiy7bzsnkjKDnbzuZBksd0gV9HRliWuJwBTwJjp
	 c6vuYmbNIyLIbDqgF7ijf4DWGZdbP0ByJrkXpgOidL62k+INyjwjI3lNmRTtkCr+4c
	 /7P24n+y5VEz4YZ2t10FOdklMLrGWK9G6jl9u/Bp2q51LH9n1QpcS8lY6B+eiBB/uL
	 qg2h5y4AQrsKP+/d70bTDnSaar7dzenrneyREWTM/s+wWh9w22PrsyoIRYPIVdGu24
	 hQzW5swQjXNUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9976062C;
	Sun, 18 Oct 2026 14:30:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0361861
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 011CA810EE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pjv7aX1kqeZy for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:30:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F23380E2A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333846;
 b=ZXANfr3/IJNShKu5OwWEEcNkwi1eDkLL9Jze/fzEFKzbpBykIGCvAZnJYuClhGYx4Ux4
 LM/M4QE0wIn8KEKVUUHXhyD3mkF9tDgPP5xCkvwJGfVv+b9wQ0aDcFtKbIriT19oQGn66
 khTp94/L11FA7iaZLGL202bSuA0OTlRRsO9p0TceRCF0BU2Z72UsGk22u31ueii2ofWrH
 ZINsGOsb4eBlZz6xWRehc6+dkHQ5SzGbFcyfpLsAPyeDkR5KP5CxuhLhmYqWluODfz/Dk
 p1ewMjprTe+6z5HpJbVFNJTbYkTHDf089j/IcRSUmwdBvK+isR9usmQeEmt/ql8GMPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333846;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=GXxJEMU1h+YPWS0nJ/kkBkDYrKuN58Xad7L87qdOuh8uVmxALj5Hcup1nsmsoiZBBFR+
 A/yyRcUCZx+/PonrgIW5hyvT0vdg9WG4ETLaJ5hiWe3VtcYQUaok+2iKJcmUx6T00sfag
 xGM7KQAkuq2Ikf6rn5Nyham9eos0I4KPphe8SAPgiGnSqykqZuKxVW4W6mhy4E0HaIqPy
 6CDCUEI490/8QXDV4XNl8VuYtnwsNzY77JzoULi/gYUDc/F5rDiM5D0t3mMto+6kI30Dt
 cR1eqKGbVWVBheACiaIt7wHOhkDLp3r6WE20BhsMgRYzkSlz8q1SqpLaHDQ13aUm1vA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Z5l94Zsc; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F23380E2A
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5D6452003B4;
 Sun, 18 Oct 2026 16:30:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:30:40 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:30:40 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thijs Vermeir <thijsvermeir@gmail.com>
In-Reply-To: <20261015215210.3426895-17-james.hilliard1@gmail.com>
References: <20261015215210.3426895-17-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <deeb5adaec2e3b28edb30ca5f60cbd8d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/ranger: bump to version 1.9.4
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
