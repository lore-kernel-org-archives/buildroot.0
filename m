Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F532C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0927B41D3B;
	Thu, 26 Oct 2023 16:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0927B41D3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mr7Rc-8KIhPr; Thu, 26 Oct 2023 16:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D27BA41CE4;
	Thu, 26 Oct 2023 16:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D27BA41CE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 174E61BF976
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2CD942D60
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2CD942D60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHObhO5YN-Cr for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:08:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C404F42D28
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C404F42D28
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8892B1BF204;
 Thu, 26 Oct 2023 16:08:11 +0000 (UTC)
Date: Thu, 26 Oct 2023 18:08:10 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231026180810.15bac13a@booty>
In-Reply-To: <20231020114236.4129636-9-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-9-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698336492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfPIM8aLTvNvB7OP6FlTJ66H2vKaAEmxS7OvMp3NBQ4=;
 b=mWkEjyUvDSriIJ49qbx8Kaj5fQd3nBkzU/iR2Z7W6ph7HBqK4qjHUL+/ZTRi+xHg16DTJ/
 ZI2E0KKXQ46qLBbok2/0FllT4riIb4pHfb6p3C3Hof955rpvgFjtMn92k3sgxpxH5gcIZR
 H7D4gu9MZ9E1hztIYmGy1Rc2URk4bluJ8kIuUyHw1figHGvnGOMl2IeRdkk/75P7I0ALsS
 AvSdVmW1g060b4GPCf8ZYnIvffzn74M2LfXUTHHum9DJBRPcc/JGfZu6DzFNszVBUk00K9
 Bw+EfZpWUhvgiYKvkjMc6cBjJ851lHGzVwUDM7LTe/HrdJwTsAJUR0fzrtZMWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mWkEjyUv
Subject: Re: [Buildroot] [PATCH v6 09/10] configs/versal_vck190_defconfig:
 build plm and psmfw source
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

On Fri, 20 Oct 2023 12:42:35 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch migrates the versal_vck190_defconfig to use the new
> versal-firmware package for building the versal plm and psmfw from source.
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
