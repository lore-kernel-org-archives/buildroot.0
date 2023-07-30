Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BAFEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3643E61026;
	Sun, 30 Jul 2023 21:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3643E61026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCuR-2Z66VDR; Sun, 30 Jul 2023 21:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B596E6102F;
	Sun, 30 Jul 2023 21:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B596E6102F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ACA91BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D37D8404E9
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D37D8404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id en2k_-PMnhJb for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:53:55 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14E0740297
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14E0740297
Received: by mail.gandi.net (Postfix) with ESMTPSA id 062FEC0002;
 Sun, 30 Jul 2023 21:53:51 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:53:50 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230730235350.30e00fc6@windsurf>
In-Reply-To: <20230315100848.57061-1-giulio.benetti@benettiengineering.com>
References: <20230314233719.55e2f430@windsurf>
 <20230315100848.57061-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690754032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bW7CLycHTqilMntJMfN0kETR93oIcQLd/rPm2vFBIF4=;
 b=UpeBAkynoX5YGfJmTGpogFl0GLU7RyTjNilf5RVu3d1MGRtK72Onl+fDhGUyqCJfoquN3J
 GP9tHOp6DfGWTYW+Iq7LhES1US10Gw+87rpGsrtLjZwO74qscfRp4yJYdgSEp80ghLAqf9
 AuEAhIkeOUn+UEX4veL/gdTP8S2woGEtC2DxRoKpobOugF/CqT9QxX8cgU8DM9414ZCvVA
 cNBtTqQokkEKk4KXtXxd9yv1EQCdeWovyYcgusmJBnYs9uM3r/UQ1gwAC2m0UueaNWhev9
 QPUvomaOprueotM1/HBg97YAlJhpV06MM7HQgYjnnVm8b4j2xAf6v3pZgXcDCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UpeBAkyn
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-libconf: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 15 Mar 2023 11:08:47 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> python-libconf is a pure-Python reader/writer for configuration files in
> libconfig format, which is often used in C/C++ projects.
> 
> https://github.com/ChrisAichinger/python-libconf
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * add python-libconf package since it's required by swugenerator as
>   pointed by Thomas Petazzoni
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in.host                     |  1 +
>  package/python-libconf/Config.in.host      |  7 +++++++
>  package/python-libconf/python-libconf.hash |  4 ++++
>  package/python-libconf/python-libconf.mk   | 13 +++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/python-libconf/Config.in.host
>  create mode 100644 package/python-libconf/python-libconf.hash
>  create mode 100644 package/python-libconf/python-libconf.mk

I've dropped the Config.in.host file and option, as we don't need it:
for now, this package is only needed as a build dependency for
host-swugenerator. Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
