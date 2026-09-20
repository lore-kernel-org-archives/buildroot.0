Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25521C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D296065E;
	Sun, 20 Sep 2026 10:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5q8X-FteN6EI; Sun, 20 Sep 2026 10:25:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 157B860639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789899908;
	b=TdwTFJH6Kcd0rulFEWlGbnELVKE/vgaft7AUDydRUjnTT5aVx3oIdL0Q/vcpth1yBvRN
	 6E+LTZYqymmI2v+/B2fOIfHMnV73zfJVwZoiM3+FOlHgvB155g3H1k9Aa5mrmobc8wVmU
	 6pDMFHIt4YvrmCyN7Dze64Lhq0wrIWIy62MtDFseFXW23z3uiEq9KjgFZ+5A+JIKoKC4k
	 epI6DLK2iwyytpuW+7SIeoemPGMsqTXrFMvWjKvp70F30d86U68TIujaqraYXCauXQSC2
	 +Bba3v4OikIwys9D9d9hQcr0DG49iPhrngyQwidqBvYtw2ePk+GmEnU6Q2T4G8v4ImQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789899908;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=uWJ1oCAi+/GV+obeBvLJTtz6zsGpA3ckpcqEF3+LjDA=;
	b=LOBB91++zmX4PvkBBdiv98Ia5KL1k+tSGShGvK2QYgd6kxzwLXmGcYz6Dxjd37MhpOzQ
	 ab0iMtLduit+rhOfOo+m5/6M5x0AUZr6pfDPJC+h+fkegmPmFdNQDbNsQ/l3UwseMMqJf
	 VcLlmLnlHXfek57fztz2GskigiAI+dtaccHJ7ayoKshrvN9uPO4mrWtajhFexhnXR6jUe
	 Oa55b7VnZm3oDOr/9CTpz9RoeDywmrcqXU2880ec+ripk6COeWZbaLMAPi09zxv3eg0Uq
	 yd5fRLEugIt+6RqbtityWkgKDiRtQD/lfqklzl4mHdjxeaUyb6kNbOq+uAgwORR7DJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789899908;
	bh=uWJ1oCAi+/GV+obeBvLJTtz6zsGpA3ckpcqEF3+LjDA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ksGj3fBcGfl6hAUU9omQ6t0MfBlIUcSZ4Yzk/NMOnxNk8qARCFu6S2VHHTRdeNP9d
	 kThl6+Tw7GwccMxFT2wqUlXg/7i7JUVDr7h+r1yKdey9Gu9gdlKTrDHlrSLXjMKUYE
	 Heqo9hc9wF9UxacCsV0LwY3iIY5t4QUe5RZNjhI4hnULxVfA/Ky701cDu2fCkjM5FR
	 dmEjcJ5Wt3PG5av2kcOmi4yt/nhskGBA6Ci/BSUX0K+5OKvzFZRbqyzDyY3EeBL8cg
	 sj3xe3le7Qstyu0AFPMKPBiHYYwX9p8ts+gHFh2SDV7gvqFuWJfhLLqXSUr7Mch1fC
	 w7RUzjd7+KXVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 157B860639;
	Sun, 20 Sep 2026 10:25:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C70A513D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C481D60639
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkeUjLbWk0r4 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:25:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7ED1060629
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789899905;
 b=VZaD0ZJfDsdlbES1TeYQGHmhLnw6IOjkogmMuyHfaQV3wkqTvFrTb9gJXrUExih2q4CV
 /bMuct1HDYoN5Yjyz9q1qR1mq9VHZUlJBiJKFRW0gfIjTYpTVUDGYULcwHG3jc7e/5zXk
 cvrCNsl3zJ10yU9gJ9FEVTktPNieK++8m9gxED1kAD2PFJT7pdLqCA5O8+idAiOh2ZPEy
 kjPrBi89iOnrgPvZRXbSJyOrJkf2ofgGcXUvG7UBXyCq+X1NQ/iBFHlY27EoZM6REm9RW
 eNDWMjCe041xI1gkwDlzQJIetoeHgSlhKry+4CiN/29cAUmy/arj/uDBybD7BXoS9pQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789899905;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=95hCPg20Td3UbbyvbsjNe6jexFGOBghy//JxZMUn+lA=;
 b=rvBTiJkJ9IWW1rToDCWRAJkwjiuB41ktCKz2EcAcG+0riFvhtxB8agPdNBvMf+4+NoxX
 7ma3gl5JyhaFcTBzNm+d4jZ/fQWSaTPggPPMWn6GdxQ6ZZ5oiP4ZM1Lg64xvLWzoFfdOT
 UTo69jEJRCGwDqapIJAQD/PXzfssT5C8KGageOL4fxSWFFm1aM7D0XAmhCOv5POKOTLPB
 4NVypXeCUtw1zViQL4sp8CsCs2J7MqUNDGhmU036xBtuC9/zhLTDP5jf+54zG+bzMs5Yk
 H2HtCWwrZKAZW2QIzSguGqDDRiZIwW2Uo1LZ0fSKXCAAEZCOZDuUfTDNkLxAiTyF9NA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ji58sWu3; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ED1060629
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:25:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1029F19F5C6;
 Sun, 20 Sep 2026 12:24:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Sep 2026 12:24:58 +0200
MIME-Version: 1.0
Date: Sun, 20 Sep 2026 12:24:58 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Bernd
 Kuhls <bernd@kuhls.net>
In-Reply-To: <20260919112445.1459730-1-ju.o@free.fr>
References: <20260919112445.1459730-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.19
Message-ID: <b1bd483c5ec848e573e3145b34c2dd21@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/bcc: bump version to 0.37.0
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

On 19/09/2026 13:24, Julien Olivain via buildroot wrote:
> Changelog:
> https://github.com/iovisor/bcc/blob/v0.37.0/debian/changelog
> 
> This commit removes the package patch which is included in this
> new version. It also adds another upstream patch to fix the build
> with the upcoming LLVM 23.
> 
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
