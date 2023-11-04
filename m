Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39AAC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90B2C82300;
	Sat,  4 Nov 2023 14:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90B2C82300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7ikVSOzlHCL; Sat,  4 Nov 2023 14:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE39D822FD;
	Sat,  4 Nov 2023 14:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE39D822FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B11C1BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B935822FD
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B935822FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RdjphaVkIS_F for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:02:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0406822FA
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0406822FA
Received: by mail.gandi.net (Postfix) with ESMTPSA id C02E1240003;
 Sat,  4 Nov 2023 14:01:58 +0000 (UTC)
Date: Sat, 4 Nov 2023 15:01:57 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231104150157.6830ab67@windsurf>
In-Reply-To: <7f1c47f6-91f0-438a-83ab-621eabf032b6@benettiengineering.com>
References: <20231013210841.153788-1-giulio.benetti@benettiengineering.com>
 <20231102190748.3232ab71@windsurf>
 <7f1c47f6-91f0-438a-83ab-621eabf032b6@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699106519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGqa0ya4ceLdFu7K0DtKr5TO8wQOONmLSbXaqEQFGEE=;
 b=atkp/mZCaS9ToCqnyH1bsidDKkNqiZZU8Ju3Q4catp+tyacZVwJ1AroR1ccmhk0mkaygOt
 3DxxU4LsmWlAi0xS4CP/kmACplHJCkCS42OoCslbrUrX8I7qtPtOz0/350OayK5V/zBANj
 Ky6ed9TfTOd8rA3dFFdoV5qUdGbvLJuDTW+OoqBzPvnVd7TY+q1aPmY8RS14X8LkpK8fnp
 4yH7Yyo0GZed/cDO/ocrUNoshA3KtlHSA6nStswuZht02iS7IYESkPO01hxe8c30ToEZYL
 wEI5Gmz6LfyFSP9kv88PYC5dO8fM6uDjeB+Yby43FCds84iR13z0V14tFiX4yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=atkp/mZC
Subject: Re: [Buildroot] [PATCH 1/2] board/bananapi/bananapi-m2-berry:
 switch to use extlinux.conf
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 2 Nov 2023 19:30:48 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Just rebuilt, flashed and given a run, this is the log, specifically in
> u-boot:

Hum, indeed, the U-Boot documentation says:

"Note that in the absence of any partition that is explicitly marked
bootable, U-Boot falls back to searching the first valid partition of a
disk for boot configuration files."

So, that's why it works.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
