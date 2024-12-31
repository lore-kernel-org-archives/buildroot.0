Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A144FE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 15:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4323F60731;
	Tue, 31 Dec 2024 15:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljMWgXhYCL_E; Tue, 31 Dec 2024 15:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43C336076C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C336076C;
	Tue, 31 Dec 2024 15:59:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B218C972
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BD0A40B85
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIInTLKoAYcV for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 15:59:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3752A40B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3752A40B3C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3752A40B3C
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:59:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1680FF804;
 Tue, 31 Dec 2024 15:59:45 +0000 (UTC)
Date: Tue, 31 Dec 2024 16:59:44 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>, Grzegorz Blach
 <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
Message-ID: <20241231165944.44efb8ff@windsurf>
In-Reply-To: <4abf920a-3da8-457b-a287-cb57fc7fd20d@gmx.de>
References: <20241210162243.1541113-1-fiona.klute@gmx.de>
 <20241231115447.32f36592@windsurf>
 <4abf920a-3da8-457b-a287-cb57fc7fd20d@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735660786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5+k7oWZISSLM6Vf2nL76H+jqfO1t/QCevPu1itxLbs=;
 b=Zq0GS/Han0aI4GYD66Rk49pQ6Mn6+OP5KRH9aUMr53PigNvXW66lBR+fREM2pY/gIWz4U8
 Rzz4tTrtNWyrQ0W1fF5XwP7Q7qLOen4C3o4STCSuJTdta+6N21Ztt13uMLhTzSUk0Lx5z5
 Z1C4t+5H7orLHEpxKE9/9uoFD/SAIKK8Nr3qFyVlIRH7N+w3Q2laLdYdhc3wypF3V5No8Z
 4fkP/AEjrK4QMVJCmLkznNwKcd+e5GbpViVbEQ6GhtWAe/h+Rl+YRKqUFttgvqubTqkGrU
 V8NodMYTkkcGHC+7U7AM/LvDrxB3+jTz7pvZEBqlz8abSbAYgaSJnlBzmIasDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zq0GS/Ha
Subject: Re: [Buildroot] [PATCH v2 1/4] package/bluez5_utils{,
 -headers}: bump version to 5.79
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Tue, 31 Dec 2024 16:59:55 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> The input_get_userspace_hid function is implemented in
> profiles/input/device.c, apparently that doesn't get compiled if
> BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID is not enabled. If I enable it, the
> build completes. That looks like an upstream bug to me, either
> --enable-hog needs to be fixed so everything it needs gets compiled, or
> it needs to require --enable-hid.
> 
> I guess the quick fix for Buildroot would be to add a "depend on/select
> BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID" to
> BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG, the tricky part is that "select"
> would create a loop because BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID already
> selects HOG, so it'd probably have to be "depends on". Or we could wrap
> them into a combined option, but I think it'd make sense to wait for an
> upstream opinion for that.
> 
> I'll put making an upstream report on my list for next year, if you or
> anyone else wants to do it first please CC me. :-)

Thanks for the investigation! I agree it makes sense to report the
issue upstream, and hopefully have a fix soon from them. I don't think
anyone will beat you at doing the upstream bug report though :)

Happy New Year in advance!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
