Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287E6C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DA014019E;
	Sat,  4 Nov 2023 17:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DA014019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjS7FUtfnE4G; Sat,  4 Nov 2023 17:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B040F4014D;
	Sat,  4 Nov 2023 17:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B040F4014D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6521BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49777812B9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49777812B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgw10_IU9LGr for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:40:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3747B812B4
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3747B812B4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 036EB1C0005;
 Sat,  4 Nov 2023 17:40:05 +0000 (UTC)
Date: Sat, 4 Nov 2023 18:39:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104183959.4dfef743@windsurf>
In-Reply-To: <20231104151944.84393-2-fontaine.fabrice@gmail.com>
References: <20231104151944.84393-1-fontaine.fabrice@gmail.com>
 <20231104151944.84393-2-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699119606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0ImpGg4zGegv8arNnFgQ/PvUYphUUJTRaqTqAjr5gA=;
 b=NhoVJpvqOY23GEdPsYI+pRG7dfM/6ZP2HYnjI/73g5Z0hJ9dfJ/FNLdhBf6BHsC7NQlk5n
 gdRXc+b6/mg1kRf9YywGVIuvncwL8nw4uQIR+TKW2HV0CXMXvusHtV7XjKEr/mhivBUo0Y
 0IgVcnfflMxLGoG+/u7OKTHPuG9/wQd08CUOO18ohZoJ0FrJG2yxOrweWgOWHB0lGk6+e+
 kUcgFZ9pdTQX4GvVSCLRv9urgOiMi+REo7vZsaRgKwD5fFcLOUCAW1m57TJ8jnpODBCsVe
 gXExORpstFEp+IALoWjbW05D+g5uAQqPnvaue4FOk0gLGFQ/C3HkzDfEkuFR2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NhoVJpvq
Subject: Re: [Buildroot] [PATCH 2/2] package/nut: fix python build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 16:19:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +Subject: [PATCH 2/2] m4/nut_check_python.m4: allow overriding of
> + PYTHON{2,3}_SITE_PACKAGES

Patches should be generated with git format-patch -N to not have
numbering (2/2).

> +
> +Allow the end-user to override PYTHON{2,3}_SITE_PACKAGES as this can be
> +useful when cross-compiling
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Upstream status? :-)

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
