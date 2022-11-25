Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559AFC4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 22:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F044840635;
	Fri, 25 Nov 2022 22:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F044840635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sv487qDWQS5N; Fri, 25 Nov 2022 22:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CB4A401AE;
	Fri, 25 Nov 2022 22:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CB4A401AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 423D11BF3D0
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 114EA822CE
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 114EA822CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNnURWmYBzRe for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 22:19:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E25AE81AF4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E25AE81AF4
 for <buildroot@busybox.net>; Fri, 25 Nov 2022 22:19:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D42A01BF204;
 Fri, 25 Nov 2022 22:19:33 +0000 (UTC)
Date: Fri, 25 Nov 2022 23:19:32 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221125231932.64bdb57f@windsurf>
In-Reply-To: <20221122064325.30941-2-francois.perrad@gadz.org>
References: <20221122064325.30941-1-francois.perrad@gadz.org>
 <20221122064325.30941-2-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669414774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYv1gNAH+CHN1x2saggh/sNTj3MAV48CH7Xkqh/xlwQ=;
 b=Nn6pblpJNb27VtSsD+96DVELdnJzzCqw3JHWNCYpNPWeN0CIcBv5/U5RhTxAC+Yf2bq7AO
 0Dfpc5yagOCRZD3Gbq5lrtrZh05Hrx3Jx39hO82linU9hzVVjqR9DVMk/x6NO8U+qQtACZ
 h/+yQ3wJTFEzmGmQvWVQeT7AfPcJryS0B98i3nJW3+8AX8/os1wKGPqdP99pIFEGrhBqTr
 YVZMkCTJWeJvtfLvrnK7pwTYgQyRhQhDX/6PVw0x3q2E/HppfuTULsu6qfAqI4JspcwmNd
 VlOst8kNPgx8DzMrHHBTxk9y+fFi0IGTgcb1jhP1QJxU1NsVgdbXLzhyG8GW6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nn6pblpJ
Subject: Re: [Buildroot] [PATCH v2 1/3] package/qoriq-cadence-dp-firmware:
 add install in target
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 22 Nov 2022 07:43:23 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> This firmware is loaded by u-boot.
> This firmware must be shipped in /boot with the kernel & dtb,
> there are 2 cases of installation:
> - in $(TARGET_DIR)/boot, in order to be in the rootfs
> - in $(BINARIES), in order to be bundled into a boot partition
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk  | 6 ++++++
>  1 file changed, 6 insertions(+)

Thanks, series applied to next. Along the way, I've reworded a bit the
commit of PATCH 1/3 to make it clearer.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
