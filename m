Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFF4CA0EFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 13:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D30181181;
	Sat, 30 Aug 2025 13:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAQ5ISKwxzpu; Sat, 30 Aug 2025 13:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5193281188
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5193281188;
	Sat, 30 Aug 2025 13:51:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 927CCFA
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C3FB401B6
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5OhWkfHlQaQ for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 13:51:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6196440028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6196440028
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6196440028
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:51:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id DAC5E13F86E;
 Sat, 30 Aug 2025 15:51:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 30 Aug 2025 15:51:12 +0200
MIME-Version: 1.0
Date: Sat, 30 Aug 2025 15:51:12 +0200
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
In-Reply-To: <540122c2-746a-4f61-a2b8-8c046e3cff3d@rnout.be>
References: <6e3994b190d42c3e8f45481e7f3438c9@free.fr>
 <20250828071402.175523-1-thomas@devoogdt.com>
 <540122c2-746a-4f61-a2b8-8c046e3cff3d@rnout.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <59a73efb7423ad217e51fb3331e4c386@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756561875;
 bh=LT7Uyz/ZnDGvPo8boSu3FMI1p/7cTTEyALjJnzSrs9s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AJdJ+JyM2A017Ha1vlNtLBXVpUsxYczg/BuSUY9c4bXVWMxPyXiJs7oCQTh3QjE6o
 cz2riydPXIjx6mv36SW4Kqm+361cqp8rxwkFuT5S5HCR/K8cJ4r/7pAuxTTd/1nR3K
 hCB0b9AkQBPyRZFltLGBFx1M5Ck1sTZZB31q0kKVbUMdkcV+Dh7ex7Wbh2qztTbPNo
 f0mXOerwOL0kxOytm7tUeI8RNTUAZxGNZgFgKkjqY45UMuDHWmSziO+rcIHgYp44o6
 mep/dW+EJOTxT6ggRVOV/FktY4egYMRNKmng9EcjtOFJ89WhPNPzrM+uS6rpdFxw6j
 +DlDProYxDgNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AJdJ+JyM
Subject: Re: [Buildroot] [PATCH next v2] package/lighttpd: bump to 1.4.81
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

Hi Arnout,

On 29/08/2025 19:23, Arnout Vandecappelle wrote:
> On 28/08/2025 09:14, Thomas Devoogdt wrote:
>> News:
>> - https://www.lighttpd.net/2025/8/13/1.4.80/
> 
>  Contains:
> 
> detect and issue error trace for HTTP/2 MadeYouReset VU#767506 
> CVE-2025-8671
> 
>> - https://www.lighttpd.net/2025/8/17/1.4.81/
> 
>  Contains:
> 
> security: fix to reject disallowed trailers
> 
>  So I've marked this as a security bump and applied to master, thanks.

Since the original submission was not containing those security 
references,
I suggested to mark it as "next". See:
https://lore.kernel.org/buildroot/6e3994b190d42c3e8f45481e7f3438c9@free.fr/

But since it is now merged in master the legacy option
BR2_PACKAGE_LIGHTTPD_LIBEV should have been moved below the
"Legacy options removed in 2025.08" (rather than 2025.11).

> 
>  Regards,
>  Arnout

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
