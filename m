Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E554CC43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 13:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8912583DF4;
	Thu,  2 Jun 2022 13:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhbFyOarQ8jM; Thu,  2 Jun 2022 13:49:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC4CC82CE4;
	Thu,  2 Jun 2022 13:49:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75D291BF32D
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 13:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7364482C84
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 13:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3jqUV52dXOW for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 13:49:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8881783E02
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 13:49:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 853B0C0005;
 Thu,  2 Jun 2022 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654177752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RrCkNxP0bbv+tV0/LDkEjo8WguqpKqC4Bt67NASF3rc=;
 b=cG1KELxAkpSWw/8l9UEjT9Q+nFQa4hxVcDDLT/Sv+X6zyqjPoQINb+2A6TV3Ye9MwOuJd6
 u7R0H8nJaoiVpPoPq/H4M8AYNUvoveRX/+hBAMR9bOFQExp2WxEbvKV++rYMuCj46jslpi
 gNZlcWnDjfULwM987DMiJjGnJyz1TVz06wVwz5X0RzERFq+cLaQh1mMldko0Rk6p/cR57h
 dgg7zV6w0tJfL4yJeAa15oorIvFU9rbi0G3pjlSFdvp25C4dr0p+PsmyWpuSCfj2QqiL+4
 714za2aiHtXRhi6ouRYbWCqJKbOEmQI1FUqMkIQoxYKZICr1PdxtA9Hd5nJslw==
Date: Thu, 2 Jun 2022 15:49:10 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20220602154910.78da545c@windsurf>
In-Reply-To: <20220523224646.2151739-2-aduskett@gmail.com>
References: <20220523224646.2151739-1-aduskett@gmail.com>
 <20220523224646.2151739-2-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/python-pyqt5: bump to version
 5.15.6
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

On Mon, 23 May 2022 15:46:46 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> - Change the site from sourceforge to pypi.
> - Remove upstream or uneeded patches.
> - Change qtdetail.out to qtcore, as the qtdetail.out file is now QtCore.out
> - Remove the QtWebEngineCore module, as the module has been moved to a separat
>   PyQtWebEngine package.
> - Add the --assume-shared option as Buildroot forces QT5 to be built as a shared
>   library.
> - Parallel install is not supported, as some install targets depend on
>   previously installed targets first.
> 
> Tested with test-pkg -p python-pyqt5 -a in an ubuntu 20.04 container.
> 45 builds, 10 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  .../0001-configure-skip-qtdetail.patch        | 37 +++++++++------
>  .../0002-fix-QtCoremod.sip-syntax-error.patch | 29 ++++++++++++
>  package/python-pyqt5/0002-fix-qt-5.6.2.patch  | 28 -----------
>  ...uttonHint-and-WindowCancelButtonHint.patch | 27 -----------
>  ...drop-qttest-qtestmouse-waitforevents.patch | 32 -------------
>  package/python-pyqt5/python-pyqt5.hash        | 10 ++--
>  package/python-pyqt5/python-pyqt5.mk          | 47 +++++++++----------
>  7 files changed, 78 insertions(+), 132 deletions(-)
>  create mode 100644 package/python-pyqt5/0002-fix-QtCoremod.sip-syntax-error.patch
>  delete mode 100644 package/python-pyqt5/0002-fix-qt-5.6.2.patch
>  delete mode 100644 package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
>  delete mode 100644 package/python-pyqt5/0004-drop-qttest-qtestmouse-waitforevents.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
