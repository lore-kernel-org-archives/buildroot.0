Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A469C5DF8C
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 20:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F40381315;
	Fri, 21 Aug 2026 20:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15Uy1h0f4WjY; Fri, 21 Aug 2026 20:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787344342;
	bh=LTqtcANV4LEW3+Fxv8mT4X3h+vkkH63ipLEq5I6nIgA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FARpKGOXvvOcV17Gy9MMpT2r1dVm/gll7zHTsi4nEt9CoUAPIiFdaqcoV3/VdOBnb
	 xWIQuqXBcTfN/eXEa4QyHazbL6QEfSjs5CQZA3R1k5Bsq2mbbzrqRvIEMCsuZcyWUd
	 /kVktc44tUrFik61op44paDUFoCO6tIkTFW2b9CBZG+L6olY5v4Rs9nlW+owj3mQge
	 /wye8XU/BtMBvTU/18OaBqhyZDvWrB56JFNTkiXLvINy+GxV9pXWMeeXmzUua5Tkjx
	 aPQtX1hoEcDKYjb8IUOhUuig5DQPkiQtsz8LHldzWS3QfJxCxnClgCCzmqxAhMFkg8
	 wqTmaNZRQ4+1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17ADB812F9;
	Fri, 21 Aug 2026 20:32:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4881F263
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39FD240C2D
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtCFQMKx3low for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 20:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4405440A23
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:32:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5D01B19F59C;
 Fri, 21 Aug 2026 22:32:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Aug 2026 22:32:15 +0200
MIME-Version: 1.0
Date: Fri, 21 Aug 2026 22:32:15 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260820202736.1301073-1-thomas.petazzoni@bootlin.com>
References: <20260820202736.1301073-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <7835a37209bd499aaf4ac7e31e7ed966@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/igh-ethercat: backport upstream
 fix to build with Linux >= 6.19.0
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

On 20/08/2026 22:27, Thomas Petazzoni via buildroot wrote:
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/9b270904b2f7cf9eaa661c98370c582a61ff2342/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
