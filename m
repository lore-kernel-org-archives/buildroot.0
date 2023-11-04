Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E3CC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B16D460F7F;
	Sat,  4 Nov 2023 17:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B16D460F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7dRoiwGR8tO; Sat,  4 Nov 2023 17:35:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0013D60C08;
	Sat,  4 Nov 2023 17:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0013D60C08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 161141BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D56E54085A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D56E54085A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ID-YO7iFWY4 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:35:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95EAC402B1
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95EAC402B1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63A4FC0002;
 Sat,  4 Nov 2023 17:35:03 +0000 (UTC)
Date: Sat, 4 Nov 2023 18:35:02 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231104183502.5798b12b@windsurf>
In-Reply-To: <20231009161817.2832969-1-adam.duskett@amarulasolutions.com>
References: <20231009161817.2832969-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699119303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5eP0FtALandTpk70oTRKktUrlb7FPTThC9EoS7mkN8=;
 b=TH5GNYeERsu7x6YJHhFPp+qloiHzT5+L2D22SD071I6cRJDm3fOGsvMLGoVzHrTzGmBqF0
 O6leVbQCdTTNYoe0yBEGvTp601UOMtN8ApTjY3TI8bNLuCz1Ck99i1hPsLo/nI3J1Q/Pn2
 PjxR1Rxa5iMbQNh9+Ogik0A65/n21Q2ea+8LwHnFAnvrMtH/3tIQW6xgsymxWY03U+vhy4
 goDMHRrc+h3Jv+nk70+CxY8o88KobjBxccJuEQU7csrvEfXwpkHAHiI0IoOIKuifhuwAkL
 i28MFscQgTnNDSRtasukUazSke614FwCfpOys5DZ4WX5qHSSfktryb08hXiO7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TH5GNYeE
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic: Auto-install
 selinux modules only for upstream refpolicy
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

On Mon,  9 Oct 2023 18:18:17 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> The description of REFPOLICY_CUSTOM_GIT states:
> 
> The custom refpolicy must define the full policy explicitly,
> and must be a fork of the original refpolicy, to have the
> same build system.  When this is selected, only the custom
> policy definition are taken into account and all the modules
> of the policy are built into the binary policy.
> 
> Currently, if a user definess their own policy, a package containing a selinux
> directory would add to their custom policy, which is not what they would want.
> Disable applying selinux policies in selinux/ directories for custom git
> refpolicies.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/pkg-generic.mk | 3 +++
>  1 file changed, 3 insertions(+)

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
