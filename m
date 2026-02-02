Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D73E7DF08
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA1A40BA3;
	Mon,  2 Feb 2026 16:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwMDKStwDuJ2; Mon,  2 Feb 2026 16:46:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB8C40BA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770050770;
	bh=od/0lf7fGCuWUDocevLAehC9ymi33X9yzpxU+QOZudo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mIXG4ysl59LRHHY9cDkHirGZ1+HCHWs2cwbaInY3k0Ar0Dze3LQI2lRWHqZxGOGov
	 P7bipHKLSZoROpuo40rLSDs7rcJZ7rlLXtulu8IsSxJUwno79NvqV9FLJl4cfL5WX8
	 Xke7f8SbKkwGeRHjJbcX6geWQ4Hvv754Rf23FZvbtuHM+uq9VDP4Uqs0IbYTBxvX+r
	 /4SVdIhoggiZ95X0jhT0bxR7Of0zxTAuQ0BeLZHy/0UcjxeD9QpCtztSP81C87pT4g
	 PolhbWsBLkNpY4fpz1Qt1cgB2PDu5+y2azv0UxFJITnny8Jsc2Q9Q/w63YIOCm2ptU
	 8F/WPFTP8x5Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FB8C40BA5;
	Mon,  2 Feb 2026 16:46:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BED861E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABBC7813EA
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9zOiv4NXf1E for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:45:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 45D438146B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45D438146B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45D438146B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:45:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5D29F13F8B9;
 Mon,  2 Feb 2026 17:45:52 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:35762])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 02 Feb 2026 17:45:52 +0100
MIME-Version: 1.0
Date: Mon, 02 Feb 2026 17:45:52 +0100
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: buildroot@buildroot.org, guenther.harrasser@mobileye.com
In-Reply-To: <20260202141045.1913969-1-jimmy.wesolowski@mobileye.com>
References: <20260119144010.1646792-1>
 <20260202141045.1913969-1-jimmy.wesolowski@mobileye.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <a062166d22db6b02629b21913b366fb2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770050754;
 bh=wwyzZr49ayfs+3x6dd0OcdqJfRgYAMQhcKWDfybs4gM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jWiVu1Sys8xx0KyTlL7yhYrkNczSMGtmeW63ml5Jcgtvbpwjae7ECybRONenk/jEx
 31K3lQe7vn4b6JAMjSR6MEyc4vA9fun/rn6bFKw4vJd4csdLn48s8QQcGUX2IXT1qO
 TpVG6ic2wiwDF3FmZ0CCkNQTKupoGC7HpRX1MW1252bs9aNVGDreudyb8e3u1dL2rG
 2OV2m8PSeOKxA/A6AwXZFzcYTvmTQ4nKrumdWQNz29/xT6RNkhSbXPuXhvTGrsYx3f
 qNchm5cvrV4ylMhomrM45LkO1SRTp29juwBJYyJYbxV4AWPqMr8TYkGz/VSG/ZbfVU
 J+LjmW2VY0C5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jWiVu1Sy
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/run-tests: specify
 multiprocessing method
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

Hi Jimmy,

On 02/02/2026 15:10, Jimmy Durand Wesolowski via buildroot wrote:
> Since Python 3.14, the multiprocessing library API has changed:
>> On POSIX platforms the default start method was changed from fork to
>> forkserver to retain the performance but avoid common multithreaded
>> process incompatibilities.
> https://docs.python.org/3/library/multiprocessing.html
> 
> Since this is expected to be under "if __name__ == '__main__'", we need
> to have this in support/testing/run-tests regardless of how this will 
> be
> fixed in nose2.
> 
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>

Applied to master, thanks.

For info, I slightly reworded the commit log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/3d2141bceefda32bef06ddda594eaf8665913276

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
