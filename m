Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64E2C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FF6341D65;
	Thu, 26 Oct 2023 16:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF6341D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHRj3hFOHs0R; Thu, 26 Oct 2023 16:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77BA841D58;
	Thu, 26 Oct 2023 16:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77BA841D58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1354B1BF976
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E16CD42D60
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E16CD42D60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id di3_yhFzcPUp for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:07:15 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C1CC42D28
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C1CC42D28
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2084A1C0006;
 Thu, 26 Oct 2023 16:07:12 +0000 (UTC)
Date: Thu, 26 Oct 2023 18:07:11 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231026180711.77ef7b24@booty>
In-Reply-To: <20231020114236.4129636-4-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698336432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufSwFe2tPyiSQO6MkWJQ2bZgNw2DjCJ9mV8oexmsPUI=;
 b=f4jgmVXfAb5mCPMbF+gEyj/7GzUZpmriEzIY6MoFPnk4cEOldRb6xycEqi8IXlV7DPEM9e
 grXaUHubIjAOpHzeC6Uhk6W1MI5NPB0qUqDveY2EmSmkoRyTkcbbNraGzO/G8ldAuJnvev
 pFaboHQu9SC6kcYm+35WvtLPlZKxk4g2uMF/03mfHBbZnFjklcwon3G0WnnhjjFFjaHS3u
 O9d05GjTw+azeV6d5Oan7TufBMZS4Kr5u6mXlhiSwuvzkBMs3hNv+PLyLWd3Y1ikrjUxmS
 CVAzGfVcdYdqe27uSeOzmucMuvBu0327eSXocq3mFiztGbhutae3MVZX0RtHgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f4jgmVXf
Subject: Re: [Buildroot] [PATCH v6 04/10]
 toolchain/toolchain-bare-metal-buildroot: new toolchain
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

On Fri, 20 Oct 2023 12:42:30 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new virtual package for adding a bare-metal toolchain to
> buildroot.  By default, this package will configure a bare-metal toolchain
> for the Xilinx microblaze little endian architecture.  When configured for
> the Xilinx microblaze architecture, this toolchain can be used to build the
> microblaze firmware applications for zynqmp and versal.
> 
> Signed-off-by: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
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
