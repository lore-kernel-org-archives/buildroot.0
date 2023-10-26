Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88220C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31A2441DB1;
	Thu, 26 Oct 2023 16:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31A2441DB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jVgHmGNa5gV; Thu, 26 Oct 2023 16:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A6B441D7C;
	Thu, 26 Oct 2023 16:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A6B441D7C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0CF1BF976
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 075B842D60
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 075B842D60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDYPkxcLDIn3 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:07:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8C8D42D28
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C8D42D28
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD477E000C;
 Thu, 26 Oct 2023 16:07:19 +0000 (UTC)
Date: Thu, 26 Oct 2023 18:07:18 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231026180718.61871471@booty>
In-Reply-To: <20231020114236.4129636-5-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-5-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698336440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5IxyATevU50OUw+gdM4pJCqL+8sc+HU7Hfa82h9z6M=;
 b=iS08Z+hmQF6cpTcJRAjoS2qXZvnr9oedhzOyzSfIkFkR6kvfv72VgAUih94D7hBTJ82p5M
 Yli/A1NeXvBnUpL4Hv6kQcSd+h4Ry5aglSgZjqwFWAnzGsSaSH6cQmPR9awMD8GbtuvTHF
 7HpWuRE5MbmNMbVcS0ehzbrydLfTH7h4AhKJOKSPkmwk4W+QUvkyMLABoK1whQt33OFE90
 zhZCUa8nH9GYp9TDBTG6HQuuQIzMtNk5fm+ejWCSVupywtQyvsq0FHGRtQx2Ygir/yVwNn
 Yk1UsU0vW9Q0o+gHdhmoCvJ1EP0iuwFcTyIov+SFZGcednuVkigqToRzUn52Tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iS08Z+hm
Subject: Re: [Buildroot] [PATCH v6 05/10] boot/zynqmp-firmware: new boot
 firmware
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

On Fri, 20 Oct 2023 12:42:31 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.
> 
> A patch is required to enable parallel building of the pmufw.  This patch has
> been submitted upstream internally at AMD / Xilinx and will be included with
> the 2023.2 release of the embeddedsw repository.
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
