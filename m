Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FADDECAAD3
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 20:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF5BF417C3;
	Thu,  1 Sep 2022 20:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5BF417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJ675RuxHUOa; Thu,  1 Sep 2022 20:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 829E0417A5;
	Thu,  1 Sep 2022 20:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829E0417A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BF931BF575
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7348E827BA
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7348E827BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uz4RwiDrJW-L for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 20:51:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7DC8827A8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7DC8827A8
 for <buildroot@busybox.net>; Thu,  1 Sep 2022 20:51:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D88EC1C0004;
 Thu,  1 Sep 2022 20:51:33 +0000 (UTC)
Date: Thu, 1 Sep 2022 22:51:33 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220901225133.2d71b452@windsurf>
In-Reply-To: <20220901194825.GM68979@scaer>
References: <tequdh$10ie$1@ciao.gmane.io> <20220901185825.GL68979@scaer>
 <ter0vs$i38$1@ciao.gmane.io> <20220901194825.GM68979@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1662065494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XP5IxNO0tIUDAv3yAMikCLC2YHLy3lV49ls3JLNMpwA=;
 b=GAo8E1gviwUZQAflQHJbcqbOShYf82KfhMhj8DMo1IAnkJV6baEslUojKBYPPv4bBh+RrL
 fgtL3/k4EnSH5X8ykTSyGrI28Ondy4IufRYWWxYKe7d9mV+uHoODoUtZcyxii/vX4ZSXBv
 LnRvLO2oyL36oxLInL74KJAXuzcR0WsexDm509NbaGsaXCIqQLOEx26agmFE6EKW7c0XyR
 X4cskujvHsGjVoCNI+fSg6GeFGS8AWhyUaVAYlYsb+AtRosY9zguQy/bcpE7GwCWb99pGM
 20M1TvNMn3sGyXhlCZWGjlFGrmjybgth4sh95rkkJC67+pFxsmmYfXx69ajmoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GAo8E1gv
Subject: Re: [Buildroot] sftp-server for use with dropbear?
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
Cc: buildroot@busybox.net, Grant Edwards <grant.b.edwards@gmail.com>,
 buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 1 Sep 2022 21:48:25 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> If you are using a custom toolchain, then the conformity of whar is
> checked. You must select BR2_TOOLCHAIN_EXTERNAL_WCHAR (or deselect it)
> if your toolchain has wchar (or does not have it). Not doing so is going
> to result in a buildtime error. See toolchain/helpers.mk, line 306,
> which calls check_uclibc_feature, which will error out if the setting is
> not correct.

I think we also do these checks for non-custom external toolchains, at
least if I recall correctly.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
