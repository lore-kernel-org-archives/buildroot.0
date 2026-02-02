Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131E1E7FDF2
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 22:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C38D481EB9;
	Mon,  2 Feb 2026 22:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtI61nJVnMlf; Mon,  2 Feb 2026 22:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE1A6822C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770070557;
	bh=qP4ppGvpKwBxsQQHa1SZClNCgHsdV9c0PRqx7XiRvWU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GrnlRQRuJPEeDj4AZTKt2Z1mUDm1Yhen8WCj9uetB5vT6npg26p9oNEJLpKySCtgh
	 pToAQ6uJ/Dbl6X9XIq2DmOMMWJj+A+fkzO3WBchi9mWVQ5v/nLmq+HGBZV4D8fiv85
	 c3LhgqDWcwD95OfZtBEbFl0MEnc7ukNy53NjUaXg4z39oVjRVR67Mrrd9q1G0saLRg
	 tJuszPeil5oGsDdNuY+ESHZB+edoMbVyiZ8QkmS5we6k1EnEQ29PukLyhBTaRtPZYp
	 6dVwp5C49rLhkrTgBzE2gfS0gd/LCW87w0vAdI1IYLULd62ApaPOqOJxTsLSLusDQP
	 HxgNidKA4JNew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE1A6822C1;
	Mon,  2 Feb 2026 22:15:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31BB8F4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28DBF822C1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aTz4Dwsv5zg for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 22:15:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25AE081EB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25AE081EB9
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25AE081EB9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:15:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BA0304E423CD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:15:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8106860767;
 Mon,  2 Feb 2026 22:15:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A56B1119A8888; Mon,  2 Feb 2026 23:15:50 +0100 (CET)
Date: Mon, 2 Feb 2026 23:15:50 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Message-ID: <aYEiBmonWlSG1LXB@windsurf>
References: <20260107140858.129302-1-buildroot@heine.tech>
 <20260107140858.129302-2-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107140858.129302-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770070551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=RJb+H3lvj5/+yl/ZkqhHIvWqmt2mXNWmh54zzVN79Tk=;
 b=FlHmNC6y0Pr4iokPc9AZIFGZvn++a9am8NG529GDCbvDl2/zV+06/PwzAj5jp5sl2Zixc6
 0xhsivE1Fc9hHflTf2Z0uofVwTjY+NinfjyMgu0mxforkAlA/uKtZeUhDaLd2qvoxq9s3+
 iAwkBC5xE+nMrrt3SliHm41CXIU3XCv9TzybB7SlMW6+pN/xFErriccyZgCabHOOkkI/q8
 sxiSqJWACWU+2Rc3/qa1tYy7xApd1iUnpvXeyFoG0SLZ7TEL39+up1Rzi4BsU/ZSP1L063
 /Chnl3fdO5qcVzL//tpQpRwU3pU3zlCvx8X+ZYmYyrMWEM82JPLE7REi5ZAvnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FlHmNC6y
Subject: Re: [Buildroot] [PATCH v2 2/3] package/libabseil-cpp: bump to
 version 20250814.1
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

On Wed, Jan 07, 2026 at 03:08:46PM +0100, Michael Nosthoff via buildroot wrote:
> - enforce C++17 as this is required since 20250512
> 
> Release Notes:
> https://github.com/abseil/abseil-cpp/releases/tag/20250814.1
> https://github.com/abseil/abseil-cpp/releases/tag/20250814.0
> https://github.com/abseil/abseil-cpp/releases/tag/20250512.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
