Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D328FC3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 22:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DAD781569;
	Tue,  6 May 2025 22:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxBcPpwxliFg; Tue,  6 May 2025 22:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BF2681EEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF2681EEE;
	Tue,  6 May 2025 22:28:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7E64CD
 for <buildroot@buildroot.org>; Tue,  6 May 2025 22:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB2FA400C1
 for <buildroot@buildroot.org>; Tue,  6 May 2025 22:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TO4aq-u3U4ge for <buildroot@buildroot.org>;
 Tue,  6 May 2025 22:27:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C77B540065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C77B540065
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C77B540065
 for <buildroot@buildroot.org>; Tue,  6 May 2025 22:27:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 53666B00576;
 Wed,  7 May 2025 00:27:53 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:50326])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 May 2025 00:27:53 +0200
MIME-Version: 1.0
Date: Wed, 07 May 2025 00:27:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250506142141.889473-1-titouan.christophe@mind.be>
References: <20250506142141.889473-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <c738caea1c8ef7f3ecd90b9d9c775343@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746570474;
 bh=+LUMmp0Ae0ZOP+OFedDZYOvM7p4hsPMG4a61tpAcfms=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uVqJpTrYGuIMWuQTEl/bg0ZuggK4CW+e4AetJoZB1d9oPD4wnYp4w0ysCRkDf4Uz3
 2lfn4sNgxjDkwjODaIJ/THGIv4hyQrdvuYO3ksyBhAWPYqN80nOHuV0No1SrXrCK3g
 VKZUsOoQUXY4cJBjk+aR4kZ7kXErf8Ma2HMTv3RedDhsa8SRy/4uWgT/wm7FnkAqQR
 VPJ5Xg6ojo3eyBRD35VOEQYRoKbAaiusFNiGQXcdnp/EPWuOdyMdevh8xJvv5o+aOW
 /SeHvQ+oYnjnrVwiinKQ0DknX/EeDbKSM5AatvWXbfY/20yiX6FeHaYJNwqngIkXNL
 gxzFlSnmTQfFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uVqJpTrY
Subject: Re: [Buildroot] [PATCH] package/redis: bump to v8.0.0
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

Hi Titouan,

On 06/05/2025 16:21, Titouan Christophe via buildroot wrote:
> From https://github.com/redis/redis/blob/8.0.0/00-RELEASENOTES:
> 
> =======================================================
> 8.0 GA (v8.0.0)    Released Fri 2 May 2025 12:00:00 IST
> =======================================================
[...]
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,10 +4,12 @@
>  #
>  
> ################################################################################
> 
> -REDIS_VERSION = 7.2.7
> +REDIS_VERSION = 8.0.0

This new version seems to introduce a build failure with the 
br-arm-basic toolchain.
See: https://gitlab.com/jolivain/buildroot/-/jobs/9950427878

For reference, "test-pkg -a" is building fine with the version 7.2.7:
https://gitlab.com/jolivain/buildroot/-/pipelines/1803867866

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
