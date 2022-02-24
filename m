Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB34C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 14:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4717833A0;
	Thu, 24 Feb 2022 14:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbVjGZqxG_zQ; Thu, 24 Feb 2022 14:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CF2382FEA;
	Thu, 24 Feb 2022 14:08:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD8D1BF2B8
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 14:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0870A4046D
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 14:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rTr_LMAWQOVZ for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 14:08:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A19BF4026E
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 14:08:08 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4K4F9f3RV2z9sXS
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 15:08:06 +0100 (CET)
Message-ID: <9f038ee9-b8c4-3c56-36eb-971690a40b8c@othermo.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645711684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZKFPCpc2yahh2VbMmXthJuWLlHQc0UsRimAEYibLS8=;
 b=L3+IhieGE0xa7hsAgqF8VsqGmMQSMRtpNG7IkERk10iEvhDjSQ2jD8cqcLvSkdJlvvuUGQ
 y5kO3H07LW1kUmKMsRzpI1fhhe/C6TVEAkqb21cuLH/2uULk87Oop/ZtLxfX1f/3kvReuc
 cG+XFqcCoL2PD/qlkYHeIWesbljch4dj7TIaZW+Um+/3kWKJyaRkQ0USMcU9ZzDNOnziwk
 7HENTGVv1bElQT/kJIy0JGDNg8JrYODbqBtiiytQy0aFM1i/aJG7ynV6qT4RQEptR0PWGy
 jUFaURoVpEIUODP7ZM+UI7BagZtittTaH4iQ6dBJPvzh8f+VZgA/UKy3D6Tovg==
Date: Thu, 24 Feb 2022 15:07:59 +0100
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220221120657.4095013-1-tianyuanhao3@163.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220221120657.4095013-1-tianyuanhao3@163.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: remove unused
 sqlite
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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



On 21.02.22 13:06, TIAN Yuanhao wrote:
> Dependency on sqlite has been removed since v17.04.0-ce.
> 
> See: https://github.com/moby/moby/pull/30208
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Tested to work on arm64, various docker functionality still works fine.

Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

> ---
>   package/docker-engine/Config.in | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
> index 911cbfe428..1f0efb8fcc 100644
> --- a/package/docker-engine/Config.in
> +++ b/package/docker-engine/Config.in
> @@ -9,7 +9,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
>   	select BR2_PACKAGE_CONTAINERD # runtime dependency
>   	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
>   	select BR2_PACKAGE_IPTABLES # runtime dependency
> -	select BR2_PACKAGE_SQLITE # runtime dependency
>   	help
>   	  Docker is a platform to build, ship,
>   	  and run applications as lightweight containers.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
