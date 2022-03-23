Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B879C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 19:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B449360FF2;
	Wed, 23 Mar 2022 19:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNcxb-WKu7UV; Wed, 23 Mar 2022 19:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA5CD60FEC;
	Wed, 23 Mar 2022 19:35:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1C2F1BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 19:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EA00400FB
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 19:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqSkFlcu846h for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 19:35:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0EC3400C4
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648064137;
 bh=dS9UDnOjQY8t56AIcdqfCiffTJIMaSPXu/F4FjL1FWQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kiZd9TyYZn4pqu0+8La+YBQDyhnmxKS1awemf4JzKE5TpJbgYUqcgisibbhZWRfvX
 MAb6jrwAJR6Dqq0MKTC9JZuV0upu5Xehd9B8PI9SCO4+TLmvYYxx+T6rxIetySN77z
 9Yht/HkN1iXqgPWi/ixjILL26Tad7XL87oxTROqs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.123]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sHy-1nS8h03UNW-004x6E; Wed, 23
 Mar 2022 20:35:36 +0100
Date: Wed, 23 Mar 2022 20:35:35 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220323203535.307d504a@gmx.net>
In-Reply-To: <c2c49834-638c-dbfe-bbba-7bcbe153a660@mind.be>
References: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
 <c2c49834-638c-dbfe-bbba-7bcbe153a660@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:DivGiuS4mlZY7RBtqmPgMqdW+Z6AYem4kDEqFOr61UNg6lSqxIR
 MFCYOXoJb5vhjoo4b3lX74+Nhg1Po4oohaCmiJ3NP7VqsYP938PSwZWF4a+Ee8cHEMrFbH5
 MqrSg/UzwfVH8OrowIB180VkGtP3WkjzqUUoHpAp20owWIQKXrr8dqSknkz/XCQxM5+vh9y
 2Qs+yPEVPNvVs3EFpUkyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G0L1Jkrb+IE=:v2/banv5lXos5vRtJ9u0D/
 Oe/EFpcFEuDoAvB5uFwy1zr+aGcZiA4bgEm5A0qWLooDmQ0yeiAgIqjbVYQ4G/ASVxxHYC5mR
 lUwuU10G15O86W6zArklh36s29mFkt1DSa2gqqoE/XmI0lVnSVRoyV8BMs3aRQIS0V3euvmmB
 8VljUuodYnxzycC9jMFTpfaVpu5B5DohZ49GsCDv4eRqfs/wPtnjsM5aCkJh1PFN3CTb6cdr5
 KKYakprDDRWPWrlZyHBoJ+pxZzx47C605u2hvitd0o5sp9XLw0hujr4id8nTs7Tar06tMmr0P
 frzFFBWchRtaohUunIZFZvhI7Cg6sPRA8uvOpQBe4ppkirB2rne4X/pUGIjK76oump+liqRZ+
 chpP8BZ6seYHGUoDwMCa+/ZVm/2SbU92nwDzMgWayJMA9DQQhfvAtcGU2kJamaNY4P1+UE8JC
 PfTQy+vhhtG53UHrNez+QmGnozheETGCv/lFOrhq7Q/yXxKeD3eKMm1fXgf4tyg/V1+2MoUDl
 I9FvQUiVJAjeHFT6uFwAFyfQcQYznH9JL2h2l3GpIJXkElnVXTcI63YLc7j84jZv81lEpOU2+
 BYLxosUskF5I7A6xzMTAoA0frdjX0a7HVkvH9KympF9JdwiyFoIZ6s8v2cqUsQGvBIrcQDdK0
 3X/orN3EUFXaRNfKUPGuGx3qive1Ed14ih7yufOidiR/F/tVxz2TLLIrjQNLlLCV17rJzBiF3
 YSU22rEkjkUoXqeLqCkBRU1ZzcxFLxnC5aATecfqT42JLLeuGPA9X8oKxLaTBZUanHVmrpr8y
 IwyczVn7EEMHxK3nvGvgLYKb7UZmaHdMKDNrDHUv1d1pzsU9ZJZiShiGo60rYq7G9WQf/HdcP
 UcTS2on6MONHTYdbU7yTFVZtSKvz72vN8D+9w4Z8exQMWSmw7yuKgud3VUE3x2/QSJuW/U67F
 vo8cGM+ZH4N/kb5PuEw15gH6PXiXwM9o6LXoRAQWe8Xop54/FxdVHVio3ROZbkmH1up1UKU4G
 uFBHJFO4A0sHtBWyDxdYrqrCGkD+jPvMcGJbiRn5eZCY5bw4qJBEp4TFdXoaS0RMEw93rbBkb
 TzKDe0VJyWKnLA=
Subject: Re: [Buildroot] [PATCH v3 1/1] package/rpi-firmware: fix missing
 files in overlays
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
Cc: Martin Bark <martin@barkynet.com>, "Sassen, Rutger" <rsassen@comecer.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout,

On Mon, 21 Mar 2022 22:56:41 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 17/03/2022 12:06, Sassen, Rutger wrote:
> > When supporting multiple hardware targets, overlay_map.dtb might
> > be needed to map overlay names to one of several implementations.
>
>   I've added a reference to the documentation.
>
> >
> > Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> > ---
> > Changes v2 -> v3:
> > - in Config.in use if statement instead of depends (suggested by Peter
> > Seiderer)
> > - mention the filename overlay_map.dtb in the help text (suggested by
> > Peter Seiderer)
> >
> > Changes v1 -> v2:
> > - instead of always copying overlay_map.dtb, make it configurable
> > (suggested by Peter Seiderer)
> > - do not copy README since it a special case, only needed when
> > installing overlays to a non-standard location (suggested by Peter
> > Seiderer)
> >
> > When supporting multiple hardware targets, overlay_map.dtb might
> > be needed to map overlay names to one of several implementations.
> >
> > Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> > ---
> > package/rpi-firmware/Config.in | 12 ++++++++++++
> > package/rpi-firmware/rpi-firmware.mk | 7 +++++++
> > 2 files changed, 19 insertions(+)
> >
> > diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> > index 8070dc3019..36054353f8 100644
> > --- a/package/rpi-firmware/Config.in
> > +++ b/package/rpi-firmware/Config.in
> > @@ -93,6 +93,18 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> > overlays, to support HATs (Hardware Attached on Top, add-on
> > modules).
> >
> > +if BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> > +
> > +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
>
>   In the end, I don't think this option is very useful. So I removed it...

Why to you think so?

I am still convinced the overlay map should be optional (in favor of explicit
overlay/feature loading/enabling instead of firmware magic) and the
overlay map is only one way to achieve a hardware dependent feature loading
(the other way is via Model Filters in config.txt, see [2])...

>
> > + bool "Install DTB overlay map"
> > + default n
> > + help
> > + Say 'y' here if you need to support multiple hardware targets
> > + and you need overlay_map.dtb for target dependent mapping of
> > + overlay names to one of several overlay implementations.
> > +
> > +endif # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> > +
> > config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
> > bool "vcdbg"
> > depends on BR2_arm # prebuilt arm binary, rpi-userland
> > diff --git a/package/rpi-firmware/rpi-firmware.mk
> > b/package/rpi-firmware/rpi-firmware.mk
> > index b46a7f5270..800b560070 100644
> > --- a/package/rpi-firmware/rpi-firmware.mk
> > +++ b/package/rpi-firmware/rpi-firmware.mk
> > @@ -57,6 +57,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> > endef
> > endif
> >
> > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP),y)
> > +define RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
> > + $(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb
> > $(BINARIES_DIR)/rpi-firmware/overlays/
>
> ... reducing the patch to just this single line.

Which renders the review process to void (as the option was introduced by
Rutger on my request and this is what I reviewed/acknowledged by the Reviewed-by tag)...

>
>   Please check if the commit [1] does what you need, if not I can recover the
> original patch with the Config.in option.

+1 for the Config.in option ;-)

Regards,
Peter

>
>   Applied to master, thanks.
>
>   Regards,
>   Arnout
>
> [1]
> https://git.buildroot.org/buildroot/commit/?id=da38cdead909aa133b9c468ddebf3f67c8d198f2
>
>
>
> > +endef
> > +endif
> > +
> > # Install prebuilt libraries if RPI_USERLAND not enabled
> > ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
> > define RPI_FIRMWARE_INSTALL_TARGET_LIB
> > @@ -83,6 +89,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
> > $(RPI_FIRMWARE_INSTALL_CONFIG)
> > $(RPI_FIRMWARE_INSTALL_DTB)
> > $(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
> > + $(RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP)
> > endef
> >
> > $(eval $(generic-package))
> > --
> > 2.20.1
> >
> >
> > *Disclaimer*
> >
> > This email communication is CONFIDENTIAL. If you are not the intended recipient,
> > you may not use, copy or disclose to anyone the message or any information
> > contained in the message and I ask that you please notify me by return email and
> > delete this communication immediately. Thank you.
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
