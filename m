Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926BBCA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C29580A90;
	Sat,  3 Oct 2026 12:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duxhefGgIXwG; Sat,  3 Oct 2026 12:37:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 74F2F809CA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791031035;
	b=IvRZw1qysx/qg3/uQAyaFKUFtppP731xknCq6EStQNNM2Sk+RgsymNtfiY/WVqbkpmNS
	 gheAmjBz8i+ciKmYsxNOWS+7gOTA/EbNHgQr69uBwXLO+BAxp+WKW3LafWAcSjRFtbdXi
	 WRpLR/IjynHnQqnwPrxUMQRWDlouvla3WCQ9UCGHxgg0O0zdhsiImxHo6m/oYgT0avPF1
	 fnFy2ci8/qHS5wFNjk0JUQK1pwkfb2H4yQNZ44caHe/lSmVNWFoI85FU44WNw3tIj+hsg
	 fsK1374ZUgpi7tzbocm55azhPc1V+9+TDy/8uhF0JO17Rl7Fw6Z9Yu+wq5rLoxuJXzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791031035;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9mdP6VipUm0C6SyuY+M2zBzeUbWzLJgppmiI71ZF2lg=;
	b=EvX7Mpg/Zo8nk33jnRU8Ip/3WMnnVKhFA4GOU0LtIdsUolzvS4bggzu/gAMWZGp75PXc
	 nc/9hd1GYMPMBlhZ4Z8CZ3rTnn3z7TJWpmde3Y1k8DBAv85XBOuC7CU+tNONC4DnEOC8t
	 wFuhAG6Cn0MrqC/3sfbuWarK0w4xwQU96Vbv6hMHPa1VgPoCk+HrdpRyvbu2M0veTLv9s
	 K909KRzYZ+fdeLticAssLSTAuIq40EyG4EDvifOr7zZg9nzWYUmmi7X52Q7SzeLxyhEko
	 QGBzodK1sGpk7LbNkXVlVY9zxKij5/VOzYEwHovRM4yvYQnhJSxBkXKQBUuO++KNBWg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791031035;
	bh=9mdP6VipUm0C6SyuY+M2zBzeUbWzLJgppmiI71ZF2lg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WT2r2x+otr/5nhDgcME+Nj6KdQ/MW32nl3kTTIiF43DB/0VDUGfHup63+zoEOaXxT
	 AbP9+3Lq+uJkq7k4PP9jT6gerbX+gjw8PyrYEFH9JrKMYv/cbL5guVrYB2aTkudw9m
	 G3dcNm5NVJxYZ+oKy6jLXRGiuDtsA+H007lTyalG79xltsh2Ar6EXiRbXGYdCHt7RG
	 ymziRn5qUN/aJ0YlqIHGfn35rRFql9rUaq0XfPc3OCut45AkgEOvL7dmIcvqQpt8bA
	 PyiT10NwHsFMQgPRQFbo+KQt0ZudkLUC7gKux0JY24nC15++o7/u8OuOAIpi566DDY
	 B2x3aaaWVal3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74F2F809CA;
	Sat,  3 Oct 2026 12:37:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF16B32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B57DB60652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnejDBBcYaaz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:37:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B70BA60667
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791031032;
 b=LesAW3rksuSIcIjfE+GTkSuy9HvHBnO8Lxh5WNdYdmnLJ0IfDi5D4NFQFJaizlzk02PI
 LKPkvMMmtpbl7iDXzph8hom04wpWoPrVz09XqaB4sI/ESE+6FJEqU6cDDiRs9h2BoG5/W
 2Q5DmLYhyU0T53VHcjmaPYTYXZ9kadm+I/Pj6TFAKr8P1p27RhETxuH1z9gQUcJFppkjI
 nf9T6T1LBvHkIoBmeXw6r/BQlsnSQ64hjmWLiA9IpEbKf7y05twcZuAfW3FhgVg6EmtUr
 uazEFl46r2rt3YRD+4xExJkiS9M3SgRZfRRLT2pULIMUFx2MWxAgmItLnaZmSm519Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791031032;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=9M840BCpSGzJc255srUYC4jNdDWgFF/5F2LtNuzuERE=;
 b=Kx8C1xhccKfMTwYKxVPxiBNmdVB2JinRXmO8NGTMXYB46CQYWa/a7xzgkLe/f9XIm6NS
 i5UEhDIM7bBUFivMO7mz63FM8PfmIocjqbhhnZkpnv58aoM0ycvvo6Xlz8yU4UIc0Xz63
 HKD+5Pk6IxttU9oRRvK7dVUtbZ7vEXdu4rt5FDQ65Hn8BgoN0pWHRghTsPe13kw/pLnBv
 1pvTa39OKYTtbBdpIL78vWABH6FsqLv7eoiNyqTVClKM1R5/OpoVXHHpdY70sE7jBjteC
 5BWwJTBffEO1qUzfKK9tSCaupXYWj+2MlpBbniGa0ZjF+VYAA2ByDNDv9BXe39/76PA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TJMmUbKY; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B70BA60667
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:37:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 188421A10FC;
 Sat,  3 Oct 2026 12:37:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DEF9C604FF;
 Sat,  3 Oct 2026 12:37:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2C9A210328366; 
 Sat,  3 Oct 2026 14:37:09 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:37:08 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD28NJ0xMeAndZZ@windsurf>
References: <20261003084453.545653-20-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-20-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-networkx: bump to
 version 3.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 02:44:05AM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/networkx/networkx/commit/92392ba712131f01652a822b7dfb127e0762ee14
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
