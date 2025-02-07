Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F34DC02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8DEF80E36;
	Fri,  7 Feb 2025 21:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CUjM-2KOQ9P; Fri,  7 Feb 2025 21:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D45580E19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D45580E19;
	Fri,  7 Feb 2025 21:15:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81CD3CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F3FA403FE
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-gfhwzcsy8T for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:15:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D7FE40224
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D7FE40224
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D7FE40224
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:15:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E873DB00539;
 Fri,  7 Feb 2025 22:14:53 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:47432])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Feb 2025 22:14:53 +0100
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 22:14:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250207192312.4058639-1-vfazio@xes-inc.com>
References: <20250207192312.4058639-1-vfazio@xes-inc.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <aa4e8d3f5f02ce31e3af95d79513d412@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738962898;
 bh=smHJ9VupwdqT4vdq1SdIwTGbtMV8QWyTVhJTYe1+j7E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xj+0k0Z7Am7Ky1y+LdZYAXQGBe8Nl9kqh6WZTTG5kF8QPDGiGrtVXsWUWzqpypoE+
 CxoxqVIAi81xnUgtGSGhgH6vPvld3S4OnoEqcBwMsOZktWqdsPO2FZW9GbP+oRpiV6
 ojjlBRaYxzmayokOdjFe20FeYpShvILvbPfh1uwXvAGwMW32PBvFXHglCCiUz0xotL
 ajfKP0bLomcVmd1O9KXzUSqM2U/9sAuM7ObEsGWGoncFcUyN17pN2l/aTpE8hegRRM
 ehav7WTT+9eJ2ev0pCTm9ILnBts2lwmQH5J2gkUiFa9n7dwtvMBgRgCJvE6VfOn6NQ
 zAZ84KmSQgOcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Xj+0k0Z7
Subject: Re: [Buildroot] [PATCH] package/python3: bump to version 3.12.9
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/02/2025 20:23, Vincent Fazio wrote:
> Brings a number of bugfixes:
> https://docs.python.org/release/3.12.9/whatsnew/changelog.html#python-3-12-9
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
