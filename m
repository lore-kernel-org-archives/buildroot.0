Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA252C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3AC5409DA;
	Mon, 13 May 2024 21:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpgVwuohcYlf; Mon, 13 May 2024 21:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A863A409AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A863A409AD;
	Mon, 13 May 2024 21:28:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13BEC1BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE759822FE
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLGB1NXeJK5c for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:28:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCEB3822FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCEB3822FC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCEB3822FC
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:28:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B4901BF204;
 Mon, 13 May 2024 21:28:04 +0000 (UTC)
Date: Mon, 13 May 2024 23:28:03 +0200
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20240513232803.1cafa524@windsurf>
In-Reply-To: <20240219184827.790288-1-raphael.pavlidis@gmail.com>
References: <20240219184827.790288-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715635684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/DmqH6ATM1qd3zdj7LIEKBaq9D29NP0OvizLm9G14I=;
 b=BvM2CKkH7WxcVfe/mGmefWD/3okbPC0Sb9Czp5CfLM38wm3078McWJ7zd+N3QFl5HOQs8e
 QyDmxN/W5W0FNSkKeubevho4+QcI+U6EnPAp6d6U6KmJuRLRTGtQW4hsPcmTPtx4UOApbr
 27Y39CINGqMe4WaKRV+nSBeINjdPL68Xc0vE+OHDNolz2o+bmT2t41hQaKTv9t047h1VHS
 tW0tmEcNi1P9yi7hvpKFlUq51sZHVvdORD3dlv6QFaAAbLx3lhJT1WTm8Pi192gelbeOJb
 eLYpFWcEDA2OnhAfcwZ2L/1pYTWaPRvm9y+Qkyiihhw3zVZGmo3cYaS95id0nQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BvM2CKkH
Subject: Re: [Buildroot] [PATCH v1 1/1] package/slirp4netns: bump to version
 1.2.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 Feb 2024 18:48:27 +0000
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>  package/slirp4netns/slirp4netns.hash | 2 +-
>  package/slirp4netns/slirp4netns.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
