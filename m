Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95811C43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 13:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 120374188E;
	Thu,  2 Jun 2022 13:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EoKjszNKYUAM; Thu,  2 Jun 2022 13:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09B7A4150F;
	Thu,  2 Jun 2022 13:48:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED4DB1BF32D
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 13:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAD8560E0B
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 13:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtX3RpREByrH for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 13:48:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8E2C60B2E
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 13:48:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C02ED240002;
 Thu,  2 Jun 2022 13:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654177732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORksRiLiBFjx17R2eS2k/6xaqb/JpeQ07DpM0uF0zkg=;
 b=BpgaUQ9WHOnORNz5nXWwoEFxOJi3qtmnIknFIH+k9tuksiiCzAG09npYpgHjZgfEDdSDHU
 +qBGBGYFNlAMmHFMUTE1OWdbtP7fu12hOuTv0Z+wvTPfxEld1j2/4BH4Zy3eCBd2BFqHHZ
 EdaAd+R7pOsjJ7gfsgEddA1WSt1hRhGvETHdJ/v7Fs55umQBpfOGwYPJon6jm2nFFff//a
 zZCoUgSYG8oxWvZ2UM9V3fIjaPSuYSKmiXnYyEpwQG52iWsEMAcGSYeakk/VH1hnDd8pJw
 YHrZ4E1ArlXknLXNF0/kDCm96qRTQEjC3uO5dmF0qzA6baObkkznnFpRsigraQ==
Date: Thu, 2 Jun 2022 15:48:50 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20220602154850.5e93c0e4@windsurf>
In-Reply-To: <20220523224646.2151739-1-aduskett@gmail.com>
References: <20220523224646.2151739-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/python-sip: bump to version
 4.19.25
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
Cc: Manuel =?UTF-8?B?VsO2Z2VsZQ==?= <develop@manuel-voegele.de>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 23 May 2022 15:46:45 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> This version is the minimum version needed to support newer versions of PyQT.
> 
> Changes:
>   - Update the URL as this version is not hosted on sourceforge.
>   - Add --no-stubs to prevent the error: No such file or directory: sip.pyi
>   - Add 0001-remove-join-from-sip-h-files-string.patch to prevent python-sip
>     from attempting to copy the entire hosts /usr directory when installing.
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...-remove-join-from-sip-h-files-string.patch | 33 +++++++++++++++++++
>  package/python-sip/python-sip.hash            | 10 +++---
>  package/python-sip/python-sip.mk              |  6 ++--
>  3 files changed, 40 insertions(+), 9 deletions(-)
>  create mode 100644 package/python-sip/0001-remove-join-from-sip-h-files-string.patch

Applied to next, thanks. However, I would really like the patch
0001-remove-join-from-sip-h-files-string.patch to be submitted
upstream. Of course, it probably can't be accepted upstream as-is, but
this can create the discussion that will hopefully lead to an
upstream-acceptable solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
