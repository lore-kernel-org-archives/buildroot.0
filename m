Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6A2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 13:56:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E21EB60EE7
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 13:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E21EB60EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 894D16083C;
	Sun, 10 Oct 2021 13:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NsUtDTGSxB3P; Sun, 10 Oct 2021 13:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02843606A0;
	Sun, 10 Oct 2021 13:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA7001BF403
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 13:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9981B606A0
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 13:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8dMCsLCfS8C for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 13:56:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57A7B60639
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 13:56:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id AE1D2240003;
 Sun, 10 Oct 2021 13:55:57 +0000 (UTC)
Date: Sun, 10 Oct 2021 15:55:56 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211010155556.7a2760b2@windsurf>
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 00/20] package/python3: bump to version 3.10
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Mauro Condarelli <mc5686@mclink.it>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Sat,  9 Oct 2021 13:55:03 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> In the following patch series python3 (eventually) gets bumped to version 3.10
> 
> - The first parts involve updating packages that are not compatible with 3.10.
>   Either by updating versions or adding patches.
> 
> - Then I fix a typo in python-pathvalidate
> - Then I complain about python-setuptools and split add support for both
>   setuptools 48 (compatible with python2) and 58 (compatible with python3.10)
> - Finally I update python3 to 3.10
> 
> This patch series has been tested against every python2 and python3 unit-test
> available in buildroot, including against https://patchwork.ozlabs.org/project/buildroot/patch/20211006203823.2740442-1-yann.morin.1998@free.fr/
> 
> In addition, I also selected *EVERY* python module to ensure all of them at
> least build against python3.10, and everything passes.

Thanks a lot for this effort! Should we have a configuration, or a test
case that builds all Python modules, to facilitate this kind of testing
in the future ?

Also, should we drop Python 2.x entirely before merging this, to avoid
the complexity on the setuptools package? Or do we consider the
complexity to be reasonable, and therefore we handle the Python 2.x
removal later?

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
