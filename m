Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF0BC001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 12:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF8F34169B;
	Sat,  2 Sep 2023 12:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF8F34169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtho8woJON4p; Sat,  2 Sep 2023 12:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0716341600;
	Sat,  2 Sep 2023 12:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0716341600
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B81061BF41B
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 12:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90DF0403A2
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 12:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90DF0403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdJMCjbAt3Sf for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 12:56:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77042401E1
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 12:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77042401E1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E08660003;
 Sat,  2 Sep 2023 12:56:05 +0000 (UTC)
Date: Sat, 2 Sep 2023 14:56:04 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230902145604.284bda77@windsurf>
In-Reply-To: <20230830085859.524233-1-neal.frager@amd.com>
References: <20230830085859.524233-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693659366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwTqXgTKz4Q8s50eNlR1dEbiV7brvX7QWGzvIyUtb+g=;
 b=N+d7c7bFv3gvDj1/MEoGbWSuVk+iPizAD0q16kdBawlzKdg5HRLiomeVT1p4VxsILeUcPs
 DfnBfRW0aq217fw3Pr7gkyo8CGfthf/Rm6V9tvBhFN9sqaOLzXZ8VtF56uz3zNvvJIxeym
 Xxg7BXzgql1oej/KD5486vLbL27DGmppG3W+ToTCDB6fLXw4TObn0wJCh0jTOSUV6QWMYx
 BJMlR5+1RCs7k7BM2rh53ha11UrUHYtZkwHMrrfGE2JKwEtvl4QqVeq+1d7l+Yqox7HkKZ
 Rvra07agAvQSIy4rWR4+c0Qay7hdIY8s48Vp/T/vdCh7xxPZHwlIRFJMnY5/wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N+d7c7bF
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
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
Cc: Bradley.Gamble@entrust.com, ibai.erkiaga-elorza@amd.com,
 michal.simek@amd.com, Neal Frager <neal.frager@amd.com>, david.evans@ebv.com,
 dylan.bespalko@amd.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Wed, 30 Aug 2023 09:58:59 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/board/zynqmp/kria/kr260/patches/uboot/1-3-firmware-zynqmp-Add-support-to-check-feature.patch b/board/zynqmp/kria/kr260/patches/uboot/1-3-firmware-zynqmp-Add-support-to-check-feature.patch
> new file mode 100644
> index 0000000000..994dcf8777
> --- /dev/null
> +++ b/board/zynqmp/kria/kr260/patches/uboot/1-3-firmware-zynqmp-Add-support-to-check-feature.patch

Could you please re-generate all patches with 'git format-patch -N' ?
This way:

 - They will not have zillions of e-mail headers

 - The file names will have a proper naming

 - The patch titles will not have 1/1

Other than that, I think this looks good to me. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
