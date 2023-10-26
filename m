Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBBAC25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6217D41E36;
	Thu, 26 Oct 2023 16:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6217D41E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiLJgTd_ZR8n; Thu, 26 Oct 2023 16:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CA7F41D7C;
	Thu, 26 Oct 2023 16:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CA7F41D7C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 390AB1BF976
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1351883E91
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1351883E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAwsWv9lCGIN for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:07:54 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E578E81499
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E578E81499
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC212C0009;
 Thu, 26 Oct 2023 16:07:50 +0000 (UTC)
Date: Thu, 26 Oct 2023 18:07:49 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231026180749.7d372629@booty>
In-Reply-To: <20231020114236.4129636-7-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-7-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698336471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mxvUK0kpl/sHwNyWJgLJu+B3XubEPnMXXLpHynvutnA=;
 b=GPRjmvBB4OLWs+0kW371+d6ADZ6cF3MwbqnSFknpMI/y9UJsmjEwnzFOjJfV/Od5lFlzOz
 LiTyytYnXVhu0R3y/XOc4DSmGbJnvphYAnQoXOl/B1fbGIJ06qle9/R0j4GHKRdSD6JyzI
 fJIpYWL0sH4yYmYrer/iAxz6VRLcJJSbQd7M6bJROz6+3TZ2PEJoCPDkliCS5MT0S3I0gi
 t/gQgBRdNG5bqxIcKfHlJy3F/xn4puFISL0IRB0IAKC2TeM0JpPHWMm8vvlykH1mrzgmFq
 pHffV4u4OMNw7kOoTrW5+snrhROsaMek3QE2Mdsyt1kLTFoDycSQxmQ4KHJTvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GPRjmvBB
Subject: Re: [Buildroot] [PATCH v6 07/10] configs/zynqmp*: build pmufw source
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 20 Oct 2023 12:42:33 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch migrates the zynqmp config files to use the new
> zynqmp-firmware package for building the zynqmp pmufw from source.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
