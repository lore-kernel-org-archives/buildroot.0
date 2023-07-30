Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EA5C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6AAE6101B;
	Sun, 30 Jul 2023 20:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6AAE6101B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YzoneC-pWqI7; Sun, 30 Jul 2023 20:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25E061019;
	Sun, 30 Jul 2023 20:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25E061019
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCF581BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A39A381A2B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A39A381A2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lauPHZeAoBRC for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:42:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AEA681A29
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AEA681A29
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9E9E40003;
 Sun, 30 Jul 2023 20:42:21 +0000 (UTC)
Date: Sun, 30 Jul 2023 22:42:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730224221.5d9e4dad@windsurf>
In-Reply-To: <20230730110031.3570266-1-bernd@kuhls.net>
References: <20230730110031.3570266-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690749748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdHTCh0dWI2sqPUBhiGp5aOoFvPIU2TikcYjAknSkuk=;
 b=LIH2PGIjXbKIDyfACt5V7Us9ILA5n3YtJvp2hvIJs9+Phy/WMRY5hCkmYp114mi/sRBQ7A
 ce1H/H40l9ZJfkeVjXzPTN01rwEsG3uaKltUYStFnma9UjiAzB/Lsa+73At0qRCurpw2GH
 1ojNEEcxQcgmX9NWbH8anYtGwpP5UArCoCRbVLhKILVPOt69JzpULzin1qr50bRGp6+F0Z
 UzPTfBTa/lREwjNUz4mQf4gkVTtrjQkD0rWb/C0842M6rU8G5NNGTCVTiCNjgJOlxEokwt
 map5YGnTAgYWNihcSsnK478nieNk/eAwveMopjfWBBq6rpZg7/OeIcQo28qtHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LIH2PGIj
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-audiodecoder-timidity: fix
 build with gcc-13
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

On Sun, 30 Jul 2023 13:00:31 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...001-MidiScan-include-missing-cstdint.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/kodi-audiodecoder-timidity/0001-MidiScan-include-missing-cstdint.patch

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
