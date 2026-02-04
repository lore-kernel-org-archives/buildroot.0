Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DECEA7943
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A8C8133C;
	Wed,  4 Feb 2026 19:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sx3UPaiikZlx; Wed,  4 Feb 2026 19:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A75812FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770234909;
	bh=nbuTKQEsG4a3W9WePphpNDiRDE6hykDv9afv+iKNcrs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b82CZqba1mrdXhrNhLfJVTw8JqNpvTOUkQeQC5msVQ7oRyYt6TkCxhKKH5Xr32xFp
	 KBFAYi/FOLj2Sl5CifdAFwWhnHNxUQlOFer+Hd4WeJsEXQpm0mVzJuac6QKUVp1Wua
	 L8vqLvRKVz4baYnAjTSwTKvEvCCh6eaK/c2U5fcmYsozDwk7kCIcK0T9zxT7swirGq
	 Sd8bbEvIevv9Mj/uJzIf9kHLmZXDDMhFPFnXRyTI+XQ9Y9aULaookLRWhw/5jgp0/U
	 5XM4Rdse1K5FijxyOTo3vTnXegx+N78BMX3F3/aFQPPdakUDInW3LX/BkGjsizEoQQ
	 GpJH4MBsdyLpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A75812FF;
	Wed,  4 Feb 2026 19:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8A35173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D4D84030F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyjmp1V1U94X for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71B2A40275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71B2A40275
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71B2A40275
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:55:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 76CCC4E423F6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:00:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3011360705;
 Wed,  4 Feb 2026 17:00:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 126F4119A865B; Wed,  4 Feb 2026 18:00:06 +0100 (CET)
Date: Wed, 4 Feb 2026 18:00:06 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <aYN7C3WqtgyIlDWF@windsurf>
References: <20251229094010.2472544-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229094010.2472544-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770224407; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=WVAfALvAyvTqpEt6GJxoG+0B+sv8LAKGL7e/DG3t3H4=;
 b=HiI8XdgQIsaNU8GKATk2HxOjEokWk/SyIcm2Nf3tR9ub3XgFm8etoxKudFC/AkhL5+MZEW
 7RHq2AUgSXVpjT4YJPnROPj5Vkno2jHqA42509vKWRavgBZvrbkCCllPTc6Hp7AlWvP8IE
 iCAW0bAeR/VtRF7wLKeBDAnkQqpvH5SpVoBUw2XjKO4kQ1c1xfVr1bS8QxiQd7gRtFXTjX
 H/b+mIPmtfMBkoheYgYMfIVDoawWEZbYXW9rV7ijce9s0OtN+ryaWiP6f8FrQvKE1EwToW
 HR/Nm6Ma0bPHlPd0IbSdiwIJRCCbD4clXqDDsA8ihGpRhwdLS+dWu8JoZAKxTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HiI8XdgQ
Subject: Re: [Buildroot] [PATCH v3] package/dash: fix build failure due to
 wchar
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Dec 29, 2025 at 10:40:10AM +0100, Giulio Benetti wrote:
> Since commit [1] package dash requires wchar so let's depend on it to
> fix build failure. Doing so makes default non-busybox shell dash to
> depend on wchar. This is too restrictive since this way wchar becomes
> mandatory, so let's switch default non-busybox shell to bash.
> 
> [1]:
> https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=c0674f487c7aec2a3bdf6795cea7e60c9530c360
> 
> Fixes:
> https://autobuild.buildroot.org/results/e9108ebd9fb8c471add1c5a7f581757175fa5f15/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks a lot, applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
