Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDBBC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 827E4421BC;
	Mon,  6 Nov 2023 22:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 827E4421BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hm_aA6CwuKlC; Mon,  6 Nov 2023 22:32:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C759D420B1;
	Mon,  6 Nov 2023 22:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C759D420B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9CC31BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75BCE824DC
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75BCE824DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_JS1VK8IBdp for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:01 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 735668234E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 735668234E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9018660007;
 Mon,  6 Nov 2023 22:25:59 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:25:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232513.4b3ec54e@windsurf>
In-Reply-To: <20231105044303.2816798-1-james.hilliard1@gmail.com>
References: <20231105044303.2816798-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkqP6b/9A4g8on9hA1Xg61oXhvv9pW5UiVofgRcIKK4=;
 b=eYq2lmHVOnTSTKlyI+cqnMJa0WVfLnwu1ZSyKVVqIYlNoaDZCU1IIVLiBsb27HPVicpfTr
 uwH6tafYS2D9eUkflOJme1+37oc3s2obTEuH27d76eACTFE+hEd83exMZkS+vhaPvSzV6s
 CnOjVF2Ds8jdvIl3+5jlSEwpHJJS1s6/ieMSdtcgsDRsOexpO6zwrhsPi17t8iZ5a/xom4
 daGqqzHqldN5zdV3dEV3axVkBTqx5YC/Ed1Xc4/zQbg/0wHMufq3hvZn49Q3Ry9x8Y10V6
 gRn2BsOfi/+dFJE54se9++YZ1F4s/XW8vrCTsLF1Pf5whUgHlTueDUGbo6yIFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eYq2lmHV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to
 version 2.12.0
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 22:43:03 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
>  package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
