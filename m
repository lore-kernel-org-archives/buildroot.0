Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693CCC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11B48405B0;
	Sun, 13 Nov 2022 21:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11B48405B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9A3U88a5xRqX; Sun, 13 Nov 2022 21:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 305E6405A7;
	Sun, 13 Nov 2022 21:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 305E6405A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4511BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37EFB60BD4
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37EFB60BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMEPdMnI0cWz for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:55:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 210DB60596
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 210DB60596
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:55:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 74EB420004;
 Sun, 13 Nov 2022 21:55:04 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:55:03 +0100
To: Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <20221113225503.158e605e@windsurf>
In-Reply-To: <3b6d0a97-f4d9-9f03-7d25-e769e27bb57c@grandegger.com>
References: <3b6d0a97-f4d9-9f03-7d25-e769e27bb57c@grandegger.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668376505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIkOKUn4O7d4jb+nEJQSQfC4nwFbAssrv4lUvvqchZU=;
 b=lbDZ+ZWTZjknsgIqQeBk7iuZ41/1zgnHcobwiwPK/J72Y0nzKsDCKyRdCiMYbbMyKQqLYW
 g613f3iiP5B1rLD7Cm2xv9Yc7IYVm78DBhajB/JpMmy/eAkuZLOcP7VoXMaaZzTy9NbWCt
 ekuiZwNoD4fzTplc521JsKDYZbRIvqZti2j0l5CBoze3LcjpJn3MgB0Ss2P9yyZc0xWOCp
 mbyNt64HcU6zVRb8kyg66FaueXWmPWepooVSWhKoRwlPFDKhS+O9KdUMGjqfk0FoUuJ5M8
 hfU99ByXF8m4vLHmU3i2u88I9Ypfl0Hjkc/y5gtr0APQbq+vPAl/flwPybNGag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lbDZ+ZWT
Subject: Re: [Buildroot] [PATCH v3] package/udisks: add config option to
 support mounting in /media
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Nov 2022 09:38:02 +0100
Wolfgang Grandegger <wg@grandegger.com> wrote:

> Support mounting in /media instead of /run/media for compatibility
> with the Filesystem Hierarchy Standard (FHS). This is also required
> for backward compatibility with udisks1.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> 
> ---
> Changes since v1:
> - explicitly disable the option if not selected

I'm not sure exactly why, but your patch didn't apply cleanly. Maybe
some whitespace damage caused by your e-mail client (we recommend using
git send-email to submit patches). Anyway, I fixed up the conflicts,
and pushed your commit to our next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
