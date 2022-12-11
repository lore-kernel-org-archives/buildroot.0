Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3173C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ECD240361;
	Sun, 11 Dec 2022 13:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ECD240361
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0oQ9AboMvupM; Sun, 11 Dec 2022 13:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3776A4088F;
	Sun, 11 Dec 2022 13:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3776A4088F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83BED1BF20B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A85560BBC
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A85560BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKSfCzqq-fCU for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:46:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14341608F5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14341608F5
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:46:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 09C4A1C0004;
 Sun, 11 Dec 2022 13:46:11 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:46:11 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20221211144611.437eda70@windsurf>
In-Reply-To: <20221208133928.303101-3-heiko.thiery@gmail.com>
References: <20221208133928.303101-1-heiko.thiery@gmail.com>
 <20221208133928.303101-3-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670766372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aUoIaIrbngzsCBOAJpsGWK1/AGZhk8pOHybZswva6Xc=;
 b=Ypbt17Fr/VYlgFLS3lz2x2KuZZguB5CutA3y3ypQa7bN1DaI8U6/ppyr8w3RBeM8c3d2p8
 qsikFaijcyZW+HowvpPqz9jxpmuHvpnxpCsPHQG/w9yNEJ8CsndnKdhu2maS+FrYL5mui4
 DdSt3kkt4j5BUeG9jbd7eVQ5Oy56pW4HXw8+o/MHvGkW35NlSWQNDX41UCCLkAeXUWeYeJ
 9/z949N3SCo4v0+7v9JBDNAhe3zDfXD5pdPKEIZfzqduqU6VrI8W28Ibm75axpq4u9E3XC
 4Oz54ubvxbL3r38rrN28Pn7p3xajCvimlJMMM44MkH3fc0L2Dj3iekucwGgwQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ypbt17Fr
Subject: Re: [Buildroot] [PATCH v2 3/3] package/modem-manager: bump version
 to 1.20.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko!

On Thu,  8 Dec 2022 14:39:32 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> -MODEM_MANAGER_VERSION = 1.18.12
> -MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
> -MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
> +MODEM_MANAGER_VERSION = 1.20.2
> +MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.gz
> +MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
>  MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
>  MODEM_MANAGER_SELINUX_MODULES = modemmanager
> -MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
> +MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIES) host-libxslt

So D-Bus is no longer just a runtime dependency? Why? If that's really
the case then package/modem-manager/Config.in needs to be adjusted, as
it claims D-Bus is a runtime dependency.

>  MODEM_MANAGER_INSTALL_STAGING = YES
> -MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
> +MODEM_MANAGER_CONF_OPTS = \
> +	-Dpowerd_suspend_resume=false \
> +	-Dudevdir=/usr/lib/udev

Is this needed even when -Dudev=false? Doesn't -Dudevdir=/usr/lib/udev
belong instead the BR2_PACKAGE_LIBGUDEV==y conditional?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
