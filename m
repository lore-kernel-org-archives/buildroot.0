Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FE7C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96BE2410DB;
	Tue, 23 Aug 2022 21:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96BE2410DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhlNKM-7w_XT; Tue, 23 Aug 2022 21:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51994410C2;
	Tue, 23 Aug 2022 21:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51994410C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 417B61BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C401813DA
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C401813DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfsfkX95JV86 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:57:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C223B813D9
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C223B813D9
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 21:57:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AB1D5240005;
 Tue, 23 Aug 2022 21:57:37 +0000 (UTC)
Date: Tue, 23 Aug 2022 23:57:36 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220823235736.7545824b@windsurf>
In-Reply-To: <20220810074547.2833007-1-fontaine.fabrice@gmail.com>
References: <20220810074547.2833007-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661291858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2C5dwUu3bz1LzcXyRy9GKakMNOpu3P0LXSrqrCLogo=;
 b=MAQJNujcaXYGZnfdNUNTVGKxBKj02oUIUyt1aWtqciLvQTxO9ZnqVG0MfcKArUx6ID5H12
 mrPpz63fHr/WdJbvodkQirDa07yCe0DrV2oY+OuYlw7SERK4dAHX0eNawOFOXYWj8ZdH1N
 47V2btPkjoQu0EUhpkKJqdFN5SWs21+ngm1CiV3ycIU7nqq/2IRaqXkxGudaCOR/Oa+5uH
 kF5uW7FJrp4TTFBi3e30FOe+vTjwEgEoU+CRpiylJFcTlgHuf9ut/2auE1OklMwffEZl4/
 zGOi+ViSfGOAAqDtzKj6JY5oWJXiIuMn05Dn8PbVhfMBuTqL+HtS0SysVCmWag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MAQJNujc
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: improve ARM
 trusted firmware fixup
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

+James in Cc as he did the initial genrandconfig fixups for
arm-trusted-firmware.

On Wed, 10 Aug 2022 09:45:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Improve commit 541e794a959914d1189570c3674908eb5db08ce8 by adding a
> custom case to make sure that a random configuration with an empty
> platform for arm-trusted-firmware doesn't fail:
> 
> make_helpers/plat_helpers.mk:15: *** "Error: Unknown platform. Please use PLAT=<platform name> to specify the platform".  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1b67220008223d1bcbe70b76d643f9d04362ba6b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 4 ++++
>  1 file changed, 4 insertions(+)

I've applied to master. But if I'm not mistaken, this change means that
arm-trusted-firmware will never be built by the autobuilders, as
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM will always be empty in the
random configurations that are generated. This means that the rest of
the arm-trusted-firmware fixups in genrandconfig are useless, no?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
