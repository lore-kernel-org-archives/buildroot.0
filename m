Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04035CAC5BA
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 19:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5221814D4;
	Thu, 25 Sep 2025 19:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMCMipo7Hh-9; Thu, 25 Sep 2025 19:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4F1C842FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4F1C842FD;
	Thu, 25 Sep 2025 19:11:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58144177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A0E240A06
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZbw5nhSeNJr for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 19:11:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A1504098B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1504098B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A1504098B
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:11:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 63737780371;
 Thu, 25 Sep 2025 21:11:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 25 Sep 2025 21:11:03 +0200
MIME-Version: 1.0
Date: Thu, 25 Sep 2025 21:11:03 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250925005304.827639-1-fancp2007@gmail.com>
References: <20250925005304.827639-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9d08bb83af1e6ebb5abbf4d8eab8bdb9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758827465;
 bh=jaLUl4UDx+z37qOjSPewIhK10jfMmSZtF7xBt/wY9To=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dSYZujY3lUbtH9qMD87ZXGvOEzrUOUOVBFh7DpYya8pSrEXBCFOrBw9XtsSj4/K8K
 SdtwaeyeT9C2YOmf9Yz8iEnhrXCt/AfPOSeDsWbu1vhJUFz1TiZpj/o/r6EBTQbWQz
 Ru4EZArIXHtscgwIXMehbqXrmrZHUlE2ybaXNYyPaKpTJV3rIPIXeQ/2n7JmbtibN8
 G41KyNCpPvCn883iCcY4go7mpSJolQ0br3nZ+LtfUanvY5K9kAEBz0dtFkCHo6GfCb
 c0y2uYtWXMad4I1JfA0KJZy7uIg4pR1jxM8vrivy0YcLg/c6O/Ni62E7DHfSL64Ym4
 XhXXtSh8slHMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dSYZujY3
Subject: Re: [Buildroot] [PATCH] package/libiec61850: bump to version 1.6.1
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

On 25/09/2025 02:53, Scott Fan wrote:
> Release notes: 
> https://github.com/mz-automation/libiec61850/blob/v1.6.1/CHANGELOG
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
