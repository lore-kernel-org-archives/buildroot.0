Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2891ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D417416BA;
	Sat, 17 Sep 2022 15:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D417416BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDfZyMJg7P7f; Sat, 17 Sep 2022 15:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DB4441143;
	Sat, 17 Sep 2022 15:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB4441143
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8FCB1BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADB804055F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADB804055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1z4FGqvuojl for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:27:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E23D40420
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E23D40420
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:27:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 842E91C0007;
 Sat, 17 Sep 2022 15:27:40 +0000 (UTC)
Date: Sat, 17 Sep 2022 17:27:39 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220917172739.08047619@windsurf>
In-Reply-To: <20220911214206.3641655-1-giulio.benetti@benettiengineering.com>
References: <057e0c0f-ce16-1c0f-3406-3694bb83321b@benettiengineering.com>
 <20220911214206.3641655-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663428461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOyWLQ/ity1jfBbXlEPBsCraz63V75FZ3CuD7RK8oMs=;
 b=iqnkWmyljiQQ1V50T1HhMnPTr8vJucKeOo97gHXcxo/5cGzjj04AQbm2QflTU1SFvUsT7z
 hT5X0IOrJDG+l9Z0w052AnSO7jo8MjtvXYwr1c6/Rx5MxBF7IuDyhXw6Gkal0TO+zFFtuF
 4d86Ie2taEx/SjbvFY3gSdlifYZ0mobuqyfZUlw2ybMuz5t74xokqDHBvSuKZGTfcdC8aH
 QwRI7hio2C67MPRL6sMNsbabYP76+d00jH0cw3JRt9QAolpr4hkMgmHcyRbS5kLF/G4OjS
 fJXCslk4yZ+QK+d1ozuz123zm2mWBIwGF7rftqxy+CAxjG1GOzGHtZrj3xBR/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iqnkWmyl
Subject: Re: [Buildroot] [PATCH v2] package/rtl8189es: fix build failure due
 to missing Linux options
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Sep 2022 23:42:06 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This driver requires:
> CONFIG_NET
> CONFIG_WIRELESS
> CONFIG_CFG80211
> CONFIG_MMC
> to build so let's add them to RTL8189ES_LINUX_CONFIG_FIXUPS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/4b7/4b7b5bbf5b3839d99397eb2597dd7be79f403233/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * add also CONFIG_NET and CONFIG_WIRELESS to be sure CONFIG_CFG80211 is
>   selectable
> * add Fixes: in commit log
> ---
>  package/rtl8189es/rtl8189es.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
