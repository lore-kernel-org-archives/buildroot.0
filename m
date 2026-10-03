Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB3FCA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED54441430;
	Sat,  3 Oct 2026 12:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCmMhHGMb9WA; Sat,  3 Oct 2026 12:55:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 041CF41418
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032103;
	b=nVB6vq6dc7/8iwuirAAxn9wL9mLdyFzRHq3qvzh9F2mMC1Dq2plqRC0sD0JMIfXgjIyU
	 QZaaRGm+cIEF3Lqn7hQgR2czEmPn+mCb8VOgsPALG6DHxBZ/h26KTuqwdWn1yCkg9rwdi
	 TR5eVbmAgZLhU4KzvN7mJqxV8SFWtI80RQHy4TvJGArYYGRS4LvUL0pOKBaSd7CIPQl5/
	 ecDqFbdWXIs+G9aPD8XX6GxwLe5hreIpEwQ+gEWOrFsCsbMpo6j5CAXKGM6yNqdly00ia
	 yH/7AUFknnum5+22HU2O8zwZhx0fS99MMb5H+9A/s4tjvCA/slCjOOnRdMrc9up+V6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OsYJmat+c/232zSh/Cyiah+MUQ1tBt4lqBvYmPuenTE=;
	b=tNtKtPaBV2/ZtC5yildIlDH/jBhRCc/XHz8K+OOQoTehPbLw2E8F2fbFbqyhSka7r9xp
	 I40W6mV4xKMuz9mhwpUI3dMEEldgrIwQW0kU+WzyEBXffZ6Hdypz0bx8TbaGhwEbwiZCU
	 wIe+TTtPc+ndW6Mm2Qu/4w59f4vPygugVLh31841CNuoX6JOGcERTg0AReI4cEwonQIik
	 jLkOLqMzQC6id9yesBoZM4EZcFOkziRdMVGGxSy77Qexkm8XCdE912Bg0duTqdhsRiAWC
	 Gkq4BXSCNIvUQq3R67uNvh7myKkWIzfJvFyRoTyp/1xCUsHPuZVINxHLBFBDnMbzRAg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032103;
	bh=OsYJmat+c/232zSh/Cyiah+MUQ1tBt4lqBvYmPuenTE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qCCB3utartcuiezOQVsVJM2dPtXN4+8RB4qYjRSwvlOr6W6VOgqC4tsENK29RSrYS
	 ASk86xB9vn07crLipblNaNvtuqgufcuYpiiwTvNH5s49yPnl3xdcmm666jnnC5JlMp
	 7aoaX4395ZiLpYuvwjbxjDiLLtYx8oO4T+zh3dZ/1QPZxMuzLTn7C+wnTSce4veERc
	 30622tRgjQdlvam4kg6q63OBSoC4seTS2xUyJTPlzcLQvfjFtS8F1OUWFDagrGJ5M+
	 ETAkGWbuxnj9x406KPolUvF5jTBFUGLOZhk5ZNJ7NpNSMBY2TNx+29ASv/Tdxr8oF7
	 cbng6ig18dnzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 041CF41418;
	Sat,  3 Oct 2026 12:55:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3657B1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BD0A81393
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HI-IfgHFcZjC for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:55:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 39AE181368
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032100;
 b=f4UID5Q/b72nBy5Nw4rVHCDmabkWJGOch4YXrWHu+woQJ5vfAtJ6sPINKzJ556UuRiKT
 w2XEApb3TmNLQzFVdqn+vBid3+3TgwONQ6HJ9NAffUEAavMTsESSTy1Kc8qS773jo5l1c
 IHqZIlt8ujOogGhEU9eGtiosy7mEjgEEwdPbvdSlZZbiHQ+bnrx0Hzpz5qWh7nQfFrA4l
 n7roy7H8rgpqD50ilrf6AJXx1X8am9SxqZGWgaXGoZ53IRL+nIrGW0/JQ168UIkW/3c7j
 7/mpaxdqzvQWKz3kHeuQL4OttN9C/MRcqrkG73tldgX19v73DREoZoyHxY1UPTjHYtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032100;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Sg+vP/JdSV/tiUTuQwGcTpJvE9a/vlLzXwNmc1jIHBI=;
 b=T9LmgzzyTWC4kYrs+DmtBiORvEZOnfxajOhp5oBd9bZV6VB3ukolNARWKe7mxWwWRtPX
 t8fa9gi+zJTjtdoNtrHuEj5IUEeYVA3BcTrU1P5QU3yheZNN4zGXEOWNCT1sBX1+MebwG
 bk8zGhXAtGdV6WjGFrfY7vDLlL5MDBUVI1Xvq2uOPPRy3mi7kOJdVgP7zs7d3XbgWMcsV
 Aow/PELbaSYJIEfQTXgwi0M4P6D7eWyMPCpu4yZZibOrgVMwBSEDKTlUYJL7FDpDplV5A
 OLlaWCxcDH9o/XgGVwnwl2QtjB6+rh6ppDtIkSXqAAb2qXJql5um0NUID36u5ptw5Cg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ILib6JOu; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39AE181368
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 532204E41129
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 28446604FF;
 Sat,  3 Oct 2026 12:54:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47388103283A3; 
 Sat,  3 Oct 2026 14:54:57 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:54:56 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD7HdCZW_rWhMGF@windsurf>
References: <20261003084453.545653-35-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-35-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/scons: bump to version 4.11.1
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

On Sat, Oct 03, 2026 at 02:44:20AM -0600, James Hilliard wrote:
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
