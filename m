Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4832CC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECC8840474;
	Mon, 18 Dec 2023 08:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECC8840474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jV_gmaEx-9Nx; Mon, 18 Dec 2023 08:14:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C526B405D3;
	Mon, 18 Dec 2023 08:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C526B405D3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28BF71BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0151E60D58
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0151E60D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pVxsIJ0bNLsQ for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:14:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B95A60B8B
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B95A60B8B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7075C1C000F;
 Mon, 18 Dec 2023 08:14:42 +0000 (UTC)
Date: Mon, 18 Dec 2023 09:14:41 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231218091441.2e22f4e0@windsurf>
In-Reply-To: <20231204211013.12452-1-bernd@kuhls.net>
References: <20231204211013.12452-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702887282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLl4unuCm+7QYlHq71UgVMPAArhxzryrjPKazEAiaII=;
 b=JcWeZTBH2BanXA4ygHiHurOmsNglDWCa2QVVFkNdnwjxcQUSzxKUx0YE2vDzuJuVtoWpyN
 UurA3A5PAZP1HP3PHcwnYDN5GgJoTZOHMmEmjnX5aMNwOv6Ehvkpsbxx6uKFxVt3kUtvjk
 oZ0UoeJIVm0X4PS52q6dVh/WbERkZndu4/3UpWOEDPFMClDNoxsM1u9BICItVnhboTM7I2
 3hmt0OcfSzvG94+USuLXiQ9YVhUOHy6jKbOwKHcFZ2mIA/AnoEoWkFCbTXIv225mKJsaiN
 jk0F+VkqhLgcmPE7GLtyZk25n/dyCGg67znTnkKCFJQvoJ88jSUkuooJsfmWhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JcWeZTBH
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.97
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

On Mon,  4 Dec 2023 22:10:13 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patches which are included in this release:
> https://git.exim.org/exim.git/commitdiff/4e9ed49f8f12eb331b29bd5b6dc3693c520fddc2
> https://git.exim.org/exim.git/commitdiff/d8ecc7bf97934a1e2244788c610c958cacd740bd
> https://git.exim.org/exim.git/commitdiff/158dff9936e36a2d31d037d3988b9353458d6471
> https://git.exim.org/exim.git/commitdiff/32da6327e434e986a18b75a84f2d8c687ba14619
> 
> Added upstream patch to fix build error.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |   4 -
>  ...Fix-regex-n-use-after-free.-Bug-2915.patch | 173 ------------------
>  .../0006-OpenSSL-fix-non-DANE-build.patch     |  28 +++
>  ...0007-Fix-non-WITH_CONTENT_SCAN-build.patch |  61 ------
>  ...08-Fix-non-WITH_CONTENT_SCAN-build-2.patch | 139 --------------
>  ...09-Fix-non-WITH_CONTENT_SCAN-build-3.patch |  49 -----
>  package/exim/exim.hash                        |   4 +-
>  package/exim/exim.mk                          |   2 +-
>  8 files changed, 31 insertions(+), 429 deletions(-)
>  delete mode 100644 package/exim/0006-Fix-regex-n-use-after-free.-Bug-2915.patch
>  create mode 100644 package/exim/0006-OpenSSL-fix-non-DANE-build.patch
>  delete mode 100644 package/exim/0007-Fix-non-WITH_CONTENT_SCAN-build.patch
>  delete mode 100644 package/exim/0008-Fix-non-WITH_CONTENT_SCAN-build-2.patch
>  delete mode 100644 package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch

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
