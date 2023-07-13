Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5175CC001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECFC4417C0;
	Thu, 13 Jul 2023 21:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECFC4417C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6K3YVa4IBrte; Thu, 13 Jul 2023 21:11:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40274417B3;
	Thu, 13 Jul 2023 21:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40274417B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EB291BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27BE560BDA
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27BE560BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oGx7lJdPJ04b for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:11:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 102EF60BC6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 102EF60BC6
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:11:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB2EBE0003;
 Thu, 13 Jul 2023 21:11:27 +0000 (UTC)
Date: Thu, 13 Jul 2023 23:11:26 +0200
To: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Message-ID: <20230713231126.5f850a0a@windsurf>
In-Reply-To: <20230511173451.2293054-1-kris@embeddedTS.com>
References: <20230511173451.2293054-1-kris@embeddedTS.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689282688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4mcnMRf0OpouxaYfW4kjPOjew7fqTsOaLKLE7sPPqw=;
 b=DXWzPGLiVVMi83UINLf+7AQRzs1NtZ5/8AasgSJSkl2w7gM+sa/r7WtFDyiKsuzPww75+5
 8MJS47tyWmXAR8e1NpbXacR+79jvfofj4pJZUczH41hrzIcU30Tmb8Y/NSYxGSkoLc2pqx
 C0mSPOMogOW8jZ17N7GfAB6SByIsToz4vMxBXcsdc0EBMyiG8xs9IDfn3DerGYZc1bLHok
 JRjyDDiMnTyoLeH0To0upBAMV+MofkaA0DC6pLDIUCo/YBTdZedTjQ1T62jyI2GnR7m/TV
 zCZUfAUI2ptiz7E7a5kaS8QRmfWvYb2X/sap5rxPKqj/zwSAjWdEeLQmU9C+mA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DXWzPGLi
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add QCA9377 BT
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mark Featherston <mark@embeddedts.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 May 2023 10:34:51 -0700
Kris Bahnsen via buildroot <buildroot@buildroot.org> wrote:

> Deploy firmware files as well.
> 
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 6 ++++++
>  2 files changed, 11 insertions(+)

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
