Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF918C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A873661031;
	Sun, 30 Jul 2023 21:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A873661031
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkzwAcecHW7E; Sun, 30 Jul 2023 21:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09ED861032;
	Sun, 30 Jul 2023 21:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09ED861032
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E03D1BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77853404B0
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77853404B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENgFsf8lCh5q for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:53:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05FE040B11
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05FE040B11
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0490B1BF203;
 Sun, 30 Jul 2023 21:53:55 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:53:55 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230730235355.3bd96a59@windsurf>
In-Reply-To: <20230315100848.57061-2-giulio.benetti@benettiengineering.com>
References: <20230314233719.55e2f430@windsurf>
 <20230315100848.57061-1-giulio.benetti@benettiengineering.com>
 <20230315100848.57061-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690754036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ioEkNI2DTXp9n7ISdmmJCWCCiaPoU73/ncKvJpTEsy4=;
 b=gQwGIfS6MRidfNuRQQDCixtdHDrDjpGLhdJeRIxztEpq0GlYcX0jdi4XJMGOfbCLud4BMH
 tjH7djduzXn0MFhMRoqQo2GkwOEu+RkPNsb79DOGTFpx4AMKSDHtoZM6EWaP4z/j7F7F5B
 lRzmdk34CwFGCyl4FGDCROD0SVUamW2I/HCwXygpO6EEI6dA/kITPJPM8a/aMHm6JVklJr
 uU2RSsCdFiDmn8FRQ85ijnxlRGU4xAWhWsifBK2F1LPWby2Tk41wvX8e5XKTK9LyOextfm
 8FeOecifSOT8QoalPbdTdsrfAuv86/6DaKwn7Pv4PvNGkmYehMQlVihFy/gMmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gQwGIfS6
Subject: Re: [Buildroot] [PATCH v2 2/2] package/swugenerator: new package
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

On Wed, 15 Mar 2023 11:08:48 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add swugenerator as host utility to generate images for swupdate with all
> the possible options available like encryption, passkey etc. Let's also
> add Giulio Benetti as package maintainer to DEVELOPERS file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * add host dependency to python-libconf
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in.host                 |  1 +
>  package/swugenerator/Config.in.host    |  6 ++++++
>  package/swugenerator/swugenerator.hash |  4 ++++
>  package/swugenerator/swugenerator.mk   | 14 ++++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/swugenerator/Config.in.host
>  create mode 100644 package/swugenerator/swugenerator.hash
>  create mode 100644 package/swugenerator/swugenerator.mk

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
