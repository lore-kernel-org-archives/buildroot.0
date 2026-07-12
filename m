Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2042C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 15:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D7A66069B;
	Sun, 12 Jul 2026 15:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQqBfw0JuDkl; Sun, 12 Jul 2026 15:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D762760643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783869984;
	bh=hql78Zp3UIk/ZMZ3zqyzKtIH08km57IJR4kT3KPVCUQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U9dqwztisTQXgrAduIsa1YQlo4btYgH3JjdNJ6jr2RHFRvCza3sVR9wbnm5MM5XbT
	 9y9yYu5s+wf+UPfDY03brrsMaS56Mct/FvemEWAspthkZmMZijv4RYFC842z465CS9
	 UPYwxkKAVxjK9zM+ERnZvKAmEoRyAQbIICIY5yvO4eCrG77sYjJboVDAHNnrd+uhyG
	 lld3kUagu6A8TRbF7eqgDcEA2TgAPpXzx9otzDI2xg/ZSkGcZZA8KduhIQcG37zhww
	 mkQEfUJHi57Qti6/J43wrWf48kt5ZBG+MqNn1Ae74rX37VOe0UO2prsOshaaYIKocI
	 dzNoqBx+q8cIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D762760643;
	Sun, 12 Jul 2026 15:26:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77B5422F
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69D1D4019E
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ofpawLeeR4V for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 15:26:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45C1040180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45C1040180
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45C1040180
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:26:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1B93CB0056A;
 Sun, 12 Jul 2026 17:26:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jul 2026 17:26:17 +0200
MIME-Version: 1.0
Date: Sun, 12 Jul 2026 17:26:17 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
In-Reply-To: <alIHpvT_JG8YujB3@waldemar-brodkorb.de>
References: <alIHpvT_JG8YujB3@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <247e5657498a0a9d493d167fcbb4c9da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783869979;
 bh=m7l8f1h3vI428hKHEccGFBU1Q36/vxBuk7jjQRILSRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aXeCxhfyJ3ILkyngUtnppk+mop8DOFVH8oB8IszxXEHpFIU43FEmnv9FC5V3rMz91
 14O/UHEfPLz6UzyyESnu6hoOMQ7ZdSrSntMCqgsxE9/wY4JHm6GzqUwKAqFkQWl0Qm
 lPtItez9dGkj9mohMQS9rmow6IQFCHos5Jps1TU/41M4e/6FOf0dujRcl/4QjXmspq
 RIsfAIj5F2sz9DG0O/EdzBrbLtk7VXeRzQoUYQ4XKYT01pstNyaL6BQGIFkCS//7R1
 cvGGf7kcEB7uyeOWnvQumEWnpOSMj82CFjqIxfYZOjoH7LeemyQs20ST1M9r9uDBJB
 bGPetl2NVg8Ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aXeCxhfy
Subject: Re: [Buildroot] [PATCH] configs/ci20: bump Linux to 6.18.38 and
 U-Boot to 2026.07
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

On 11/07/2026 11:06, Waldemar Brodkorb wrote:
> The patch bumps the Linux kernel to version 6.18.38 and U-Boot to
> version 2026.07.
> 
> Tested on ci20.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
