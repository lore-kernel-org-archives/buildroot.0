Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C05C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 20:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C32384078C;
	Wed, 22 Jan 2025 20:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KStnG7gKGoKy; Wed, 22 Jan 2025 20:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4CD9412D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4CD9412D0;
	Wed, 22 Jan 2025 20:57:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A565B88
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2822D606CF
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DX-LCk1eBMDi for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 20:57:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A1496069F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A1496069F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A1496069F
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:57:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 213A8B00565;
 Wed, 22 Jan 2025 21:57:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43976])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jan 2025 21:57:07 +0100
MIME-Version: 1.0
Date: Wed, 22 Jan 2025 21:57:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Dugast <francois.dugast@intel.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 thomas.petazzoni@bootlin.com
In-Reply-To: <20250121084101.2052867-1-francois.dugast@intel.com>
References: <20250121084101.2052867-1-francois.dugast@intel.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2a3e2d17d7de2edbdb51d69f8be87493@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737579431;
 bh=jmJ9CbyGAVYKiZUEKJE70ePlTCdq7S8IApjZCeNyvj4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C5kf2yWhJ1kD9lALyC+DyJ1MuVCz2BUR2Ke/ExAd2zx66WSH0gMyVkf7sisPdGcaq
 g+EK1/cljGakraBqlK42Mp3o3h7aBRvcJ8l9YAPbp4yhAau+8fPBfZ05ZhFI8t6XHZ
 zxN+U96Skdnc2ZsKF5iO2+Z9tHn+bf3l+YvCbrel3fORScEVDPhg7sHM1UbPbVxvn8
 zDuoDhAHc1UYGmQrilu/tZV98rmIKAG6vr7SsF045ekvjxL1u6gBS2rcmasMd6RqKH
 Vf7OvFtLzjI3J+VDqbEtrcfAfR9IVaqADxwSW5pU6yiHSOtjWfqOm5n/n2K/AoumiG
 jJZ0PkZ18Us6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C5kf2yWh
Subject: Re: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: add option to
 enable tests
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

On 21/01/2025 09:41, Francois Dugast wrote:
> Leave IGT tests disabled by default but allow users to build them with 
> a
> new Kconfig option. Those tests are helpful to sanity check GPUs on a
> system.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
