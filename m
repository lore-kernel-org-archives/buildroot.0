Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FDDC636CD
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCD8B6FB5A;
	Mon, 30 Jan 2023 21:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCD8B6FB5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08otVIe4nyG0; Mon, 30 Jan 2023 21:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 439FB6FB48;
	Mon, 30 Jan 2023 21:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 439FB6FB48
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 967A51BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 706F06108E
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 706F06108E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYyMw8mhrYhE for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:12:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4DE610BC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C4DE610BC
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:12:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 73A8C240006;
 Mon, 30 Jan 2023 21:12:43 +0000 (UTC)
Date: Mon, 30 Jan 2023 22:12:42 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230130221242.2aa95b6e@windsurf>
In-Reply-To: <20230130174339.36794-3-bernd.kuhls@t-online.de>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-3-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675113163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNVyRtQjLho7ms/Ynr/8n3SfySxdDeT52tQ0KAeYJAE=;
 b=YqECv/XN8lMifotzoHEA8i7Zanf49RA4u4DTwZPIKpwu4jUKMxVuOB9cP8xZjW4xvA/EQK
 k+qVLCeBqmy73MCFppYvR8VIXZOqN989nqFBzL3hM9KVmMNjsBsjldzdGTe/vmScBaqeuC
 BVCvhVChMwOsgsbFO9JAGkpNqxD20dOMzzSoB+ILaUrNLWmaeiptVtddwQd8fJT5eWRpnk
 hNFezfi0D8FT+oJAmOZNtQz2LC8tqFjXmPIq9HeR9joRQRe+7L8MFqzz95T+Cus53gdqHi
 vmVJwW7zsh00ogkeISDIheDLa5rGJ1BcnKSZ4X5FfZ1AYDw3lmCCE/Sj2hdTmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YqECv/XN
Subject: Re: [Buildroot] [PATCH 3/5] package/libva-utils: bump version to
 2.17.1
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
 Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Jan 2023 18:43:37 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> -sha256  646c9bfff6a83504c48de2c786c9514ca30c5e916127faf00f143ef8147ee950  libva-utils-2.16.0.tar.gz
> +sha256  6ea5993c3eba230a979fa9d35b4cad8df06d4474a773dc0918033bf50353f966  libva-utils-2.17.1.tar.gz

Are you sure?

ERROR: libva-utils-2.17.1.tar.gz has wrong sha256 hash:
ERROR: expected: 6ea5993c3eba230a979fa9d35b4cad8df06d4474a773dc0918033bf50353f966
ERROR: got     : ef681558ce294453945247e5874ceee5a7d3c08ff078ff1cc2a2e357871a81b6
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
