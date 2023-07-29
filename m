Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156B6C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD51760F84;
	Sat, 29 Jul 2023 22:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD51760F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNXpVEdMk6Pv; Sat, 29 Jul 2023 22:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECDF660F7F;
	Sat, 29 Jul 2023 22:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECDF660F7F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDCEF1BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3E3981F38
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3E3981F38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8__eHbWNcb8b for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:40:43 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F6E781F22
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F6E781F22
Received: by mail.gandi.net (Postfix) with ESMTPSA id 825DD20002;
 Sat, 29 Jul 2023 22:40:41 +0000 (UTC)
Date: Sun, 30 Jul 2023 00:40:40 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230730004040.0d0e8127@windsurf>
In-Reply-To: <20230614173033.1748392-1-bernd.kuhls@t-online.de>
References: <20230614173033.1748392-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690670441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqvvfhksTKOVxeSXL0w+re+4pezVMbzH5KYDet+7R1E=;
 b=FfVU7cu5T3h+xYDOydyi2o6SEDaSTFiuQzc882niFJ4tTN1ekSl3CfPpACsmbkoDfXZCFf
 yQ5/1+zUfUohyddPfDz93IthtpuWOOA+iwllvB78yxHSzzNSq3lnsE1hu3c3YKpgqfDWS3
 RUjfCxWHNLj/GW8/SDG9l7+RENoFEsIJfJMywlc0JGi/q+HEyAyZn0JCPYQfKQSdC2Xi8e
 L4vaabxVaIfTwuL6cLHwIvYq9vTeyo81hS56jqO1n8CC2p82enbNhNzxxgWDIHkYNhPfHu
 BhWVnfFj8M+3AzVpC9k1ROx+O1tg5I0RZdSjZVzLQdTFL1DI3AjCStvjAOrjNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FfVU7cu5
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xapp_xfd: disable gettext
 detection when not needed
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

Hello Bernd,

On Wed, 14 Jun 2023 19:30:32 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> +XAPP_XFD_CONF_ENV += ac_cv_search_gettext=no
> +endif

I have not looked too much into the details, but I don't think this is
the right fix. Indeed, xapp_xfd should obey to the standard
--enable-nls/--disable-nls option. There is some standard
autoconf/automake machinery to handle NLS, and xapp_xfd is not using
it, which is what is causing the problem.

See
http://thegreyblog.blogspot.com/2017/11/making-gettext-optional-during-build-of.html
for a starting point on how to fix this properly.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
