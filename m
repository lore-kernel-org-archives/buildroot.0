Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21801C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 10:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C3C60B43;
	Sat,  6 Jan 2024 10:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8C3C60B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sukMc3DdSbkd; Sat,  6 Jan 2024 10:13:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BF9B60AD0;
	Sat,  6 Jan 2024 10:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BF9B60AD0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 827661BF3A6
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 10:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CBCD405CE
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 10:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CBCD405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAd3C8BGzy_o for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 10:12:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D7D640488
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 10:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D7D640488
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BEB0240002;
 Sat,  6 Jan 2024 10:12:54 +0000 (UTC)
Date: Sat, 6 Jan 2024 11:12:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240106111252.0e3cb8ff@windsurf>
In-Reply-To: <20240103191151.2777684-2-bernd@kuhls.net>
References: <20240103191151.2777684-1-bernd@kuhls.net>
 <20240103191151.2777684-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704535974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5610YhxoAVGlvSqZpFtFyLgxVlelr1T1l1CNT02ovg=;
 b=TV/KINPKrzWslMIzqzCAE1FF+5vf7mfwNeXO2FbM1iBcthEtwo76cIjYH1tAF/optkzspZ
 G4DGAyJHmsi4D0E5Dscst+BGnLj8xElR8JXTnAmonohXn5Wt48SJ/FjxNMHvB66FzTvr6W
 pwnUWebF2xY/2ft8NWZSjIvv+sl7fyfs7GUGgDsSyVh0tiyMnXbyhAzU+kLS047/DK0CVd
 qexIOzPzLlSz75SVvEO+s8eem0r6KVe/4rQtWbGqWmilrHDXjxnHmyjyCj+VOWCDrYqNuq
 V+2UC7fpz216xBBrcH4OFvGMulOZOSIefua+79li61b6VNVRqkpUgEs+kOCaYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TV/KINPK
Subject: Re: [Buildroot] [PATCH v2 2/2] package/exim: do not build
 perl-based utilities
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Jan 2024 20:11:51 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Upstream added various utilities, for example exim_id_update
> with commit https://github.com/Exim/exim/commit/46a36afae41f63de654269c8a0b7cf5852a85a14
> which is a "Utility for one-time upgrage/downgrade between exim message-
> id formats, around the 4.97 transition" which would add a dependency to
> host-perl/perl so we build and install only the needed exim binary.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: removed comment before EXIM_INSTALL_TARGET_CMDS, reworded commit log
>     text (Luca)

I've added a reference to an autobuilder failure fixed by this, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
