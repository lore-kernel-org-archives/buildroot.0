Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA90BE9536D
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B425240C4D;
	Wed,  4 Feb 2026 10:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLDpVXSdIrmp; Wed,  4 Feb 2026 10:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0722C4060B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770200863;
	bh=d2oBvBXsTqNoagOqBv0UpFvd5zK3BdbxKShBrg9bIUs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gjNKQn0dNWlHph+UR6nh3sn3whwI6KVPLJt/0J1iK6warG8+gDsunMM0cTC5pghiO
	 2WSJfgwT8YZudN4/kCN6moB71pSuDEg1Cz6DMuv4IBX5mp0SzznEujkhOiH4WrLRAr
	 WxhRT+avMaImBSNHED/0dqghggoKODiX7fn912OPKsj9MeC12poRje+LEAqq+l6/6T
	 jfKNFMk2kpyuPz2pWCXPhWf98m4dh3n8kJcarbfoQQO8ie8+lP9XKxQ4A7qhJe8tQA
	 Oi8rWlvrFKuDQa3AsswH9XBYtANPaG3Zh5xC7+r0/Sv3uhtLrUaeIjHIbSrB6NRsB8
	 bquUu3df+ZtcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0722C4060B;
	Wed,  4 Feb 2026 10:27:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40CA8F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E17C60A6F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kv0qBtS3hXf for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEFA5606AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEFA5606AA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEFA5606AA
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:27:40 +0000 (UTC)
Received: from [172.18.235.89] (ip-185-104-138-159.ptr.icomera.net
 [185.104.138.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6C2312C829CD;
 Wed, 04 Feb 2026 11:27:38 +0100 (CET)
Message-ID: <25c14b31-4d7d-46ea-ae04-aa09ee901d49@bubu1.eu>
Date: Wed, 4 Feb 2026 11:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>
References: <20260117183656.3790665-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260117183656.3790665-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770200858; bh=2cnYEKSCDSQRyeAyzY3nDD2asoZuNSlaxYSbISrHSvw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=giCgxh1ZMQNK7vBPNSzcWDzUR1gnRkbeZ36Lf6tk6DQkZH6sgCvoX5uJP//v9Yjle
 rIdx+f/Q2BKG8Iw7Wx28hYf5hm/Zdo6sZ0JPTey6gp0Lv5RjE6LR1EV+xOhBJHl/V2
 71SLkOJqiy0CIFy+/E0iggxieghA0OWtEaGCcxDx8EjRIuiZPPzoXS525bMRut1KmK
 nARB8gqMtIi+Rl6C3GNRZCaFbkc9k4VSjp3rDb0cRtOH/6c4pX3q0Cmunrbe333MQh
 Lap/0rnuubAmhYyU5jegFzzXI4TnLC5RZsQ31PHboukDE0kVC6XIRiqyHcNsVPRUPg
 QrPK4dUmUBJrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=giCgxh1Z
Subject: Re: [Buildroot] [PATCH 1/1] package/wine: bump to version 11.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/17/26 19:36, Julien Olivain via buildroot wrote:
> For release notes, see:
> https://gitlab.winehq.org/wine/wine/-/releases/wine-11.0
> 
> The --without-osmesa configure option was removed upstream, in
> commit [1]. This commit removes the options from _CONF_OPTS.
> 
> Also, since upstream commit [2], the /usr/bin/wine program became
> a "tool". It needs to be enabled when cross-compiling. As suggested
> in [3], this commit adds --enable-tools in WINE_CONF_OPTS.
> 
> This commit also updates the LICENSE file hash, after year
> update in [4].
> 
> [1] https://gitlab.winehq.org/wine/wine/-/commit/370e7d9a50593077e958f3efcc70254990bfe6f3
> [2] https://gitlab.winehq.org/wine/wine/-/commit/6d28db86c9c2559e67a4820175416aff20f7abec
> [3] https://bugs.winehq.org/show_bug.cgi?id=57847
> [4] https://gitlab.winehq.org/wine/wine/-/commit/ab59cc16c56fa7400c2076990b53ea95f6889902
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12754203663

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
