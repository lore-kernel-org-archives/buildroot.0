Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1468ECAAD3
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 13:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E6618135D;
	Mon,  5 Sep 2022 13:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E6618135D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIsbf8itW6_f; Mon,  5 Sep 2022 13:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04D681361;
	Mon,  5 Sep 2022 13:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04D681361
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A39D71BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 13:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 768D440481
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 13:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 768D440481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrKnkD2ddRx1 for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 13:47:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E14A4014C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E14A4014C
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 13:47:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1B554E0002;
 Mon,  5 Sep 2022 13:47:14 +0000 (UTC)
Date: Mon, 5 Sep 2022 15:47:14 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220905154709.0e283da6@windsurf>
In-Reply-To: <20220905162007.GB3611398@kodama>
References: <20220905122522.731095-1-thomas@devoogdt.com>
 <20220905162007.GB3611398@kodama>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1662385635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdPLprJqT2SIcWlYWwIreVxDFyAIRZhbqq0u3ZTuCZs=;
 b=KYAXP63BkFw4iv5rjr519HyFTwnoNndblyunB6d69MhizWIlg5oGCQKrWeAwBsRW1RWXMc
 PZvPzxy4N4s6ztsWQGIQ/AAuXQeb3cKB4MaxegSBO35e1ckKnB4/iEfPG8vbWnYyV+5fJi
 D/oV1YIKTNiMG4fAUrAxPS/LZEtLUsyvdbTFpdFFAR6xB6yeolF3FU2ZyZRLcHhb+ZPpf4
 KuNvTUhDM0flTPE5IFu2nKOAAKxZJ2s27bak8efn8Mn/Jdb5xFRxHEbqjL2DtdJQuJT31+
 YovO5IDrI0y6yFIlTTn1PG0SW9XC1y5URFI7/25QpPP4bYm0AlpaF/aKHAlumQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KYAXP63B
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: bump to version 2.37.1
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Mon, 5 Sep 2022 16:20:07 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> development releases. WebKit GTK (and WPE) follow the old-style GNOME
> versioning scheme:
> 
>   * If the second version number is odd, it's a development release.
>     - If the number is <90, it's unstable. Example: 2.37.1 is unstable.
> 	- If the number is >=90, it's a release candidate. Example: 2.37.90.
>   * If the second number is even, it's a stable release. Example: 2.38.0.
> 
> The versioning scheme is detailed here, too:
> 
>   https://wpewebkit.org/release/schedule/

This has come up many times for GNOME packages. Perhaps we should add a
comment above the <pkg>_VERSION variable which explains this?

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
