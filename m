Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A122CCFA02
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 18:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A4242095;
	Sat,  1 Nov 2025 18:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCSQY_EQ9T0L; Sat,  1 Nov 2025 18:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 293D742038
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 293D742038;
	Sat,  1 Nov 2025 18:19:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA3CC222
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D115184C4A
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsVPhZ8Jgzwi for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 18:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E7DE84C48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E7DE84C48
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E7DE84C48
 for <buildroot@busybox.net>; Sat,  1 Nov 2025 18:19:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0FBC05FFBA;
 Sat,  1 Nov 2025 19:19:01 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Nov 2025 19:19:01 +0100
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 19:19:01 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251016092827.601321-1-francois.perrad@gadz.org>
References: <20251016092827.601321-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <a8084925b4326b45d42619d218a8e758@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762021143;
 bh=RCdB0RWOHdgTw/vvsSqQWY5b6YNAcOiSjdcABCexu8g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jNgrmjKjoa/+rZHeBcdyXkOzlrpR4aDvhbonSJO5Tv1NmUcMK3SwhipxOXuAd+tvA
 w4h9j40fDSVWrvNRF9ZM3FB6oGo3ATJmQO55sasmfOGmmYeuX3HLKmDAGvRKZTfm0d
 +/EF04S2BZq2WlKBQwxMkuR8js6F2wpEBUQ/SnLIQtpc2rfLi15VNeOArAUK6N0Pw1
 BeWRtmDW6eQ7oP88pz/tQADA4qYr7hVMDw6P6ocP6qtFBNBCBJPr0YR1F60VT5Jl7y
 rc+Cy9yN92TQYjqC+eTNNuvo9JKjGMhcUY+cb8RKFBVX0NMZkBip/5Xc8PTTXdeZcH
 dc5J4tPV6X1vQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jNgrmjKj
Subject: Re: [Buildroot] [PATCH] package/janet: bump to version 1.39.1
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

On 16/10/2025 11:28, Francois Perrad via buildroot wrote:
> remove upstream patch
> 
> diff LICENSE:
>     -Copyright (c) 2023 Calvin Rose and contributors
>     +Copyright (c) 2025 Calvin Rose and contributors
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
