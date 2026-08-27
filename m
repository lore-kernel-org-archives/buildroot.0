Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3FCC61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 20:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E39C340814;
	Thu, 27 Aug 2026 20:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYZtaM7lB6Wp; Thu, 27 Aug 2026 20:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787863291;
	bh=cNAyfEHOEuCMYF7k60bZU3TEcnmW6xvGpHX3enBr80Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SgTxTUWlXBf2Mwmg0vn1U3QRwc9lnHeajNmFGHWKz2Y2JTc2nJ1JGzoZzWav0pAvD
	 Khn3FV7x+5GJTRvzTulktiOwe9AHSOki4dZ97uNmCfUzQf16vR1qCP4rqrw4JmxcbB
	 80wJM1W0uioibWVTRilyNLu7nJbPpeI3Rqz+t5RiWV/9SlzH54TwkeXWu3bKbWSMZ3
	 RVp2ynxPEdkXAKXLUqd7Eg4BpbPQ7MqZLXGk4ngA9X94j3xzBhTJ+4M1lo/ggpE7NL
	 p8RE0QPMXmrYv+aosjO0UKNqU5+LughqFJlLJQhHcbecLScR6gLVKnfaeGbG9cJ/cf
	 p/NDKYkSbbyJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD014075C;
	Thu, 27 Aug 2026 20:41:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C342355
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 824E540143
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01E_GI9oUW01 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 20:41:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F8A74011D
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:41:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 19F942003C6;
 Thu, 27 Aug 2026 22:41:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Aug 2026 22:41:24 +0200
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:41:24 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260826163955.37127-1-thomas.petazzoni@bootlin.com>
References: <20260826163955.37127-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <1b418dcd361fa27f2012b2efe09dbd5c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/olsr: fix build with GCC >= 15
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

On 26/08/2026 18:39, Thomas Petazzoni via buildroot wrote:
> This commit introduces a patch, submitted upstream, that fixes the
> build of OLSR with GCC >= 15.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/650edf74dec513ad540f80f4d3ef8c8222dfd711/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
