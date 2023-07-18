Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C467AEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 806B6606C6;
	Tue, 18 Jul 2023 20:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 806B6606C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0cz5Ya1taMJG; Tue, 18 Jul 2023 20:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A01D36102C;
	Tue, 18 Jul 2023 20:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A01D36102C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8F81BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 124A340589
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 124A340589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7pBVOwMwzMWp for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:54:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2805840280
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2805840280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:54:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E8D1E0004;
 Tue, 18 Jul 2023 20:54:01 +0000 (UTC)
Date: Tue, 18 Jul 2023 22:54:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718225400.799d1b2a@windsurf>
In-Reply-To: <20230715204804.3340437-1-bernd@kuhls.net>
References: <20230715204804.3340437-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689713642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4uz4iM0edwcvVw6fiEPx4AJBGTetSiofq5YdNDW18Q=;
 b=S6sNC0pNmgPGyEP8j8Es7HxIr4IF/y0MSpck/9UQqpp/7S8eQ53E9RgDAekcWIf9LOqRlI
 z06qbsyYriPEwBHLfPJJHPFWEDS0vvEjFo8U0A+fP+WnB91WVo/HcihDvj5QKVQVyMVm9W
 qzNJtPW2Brt8xphqZqKe/fTJJfO9yc+8bf/jo6u5uwu6eJfmK9jiDoSFHaTW4WQjvIVsFC
 nJIoofD9RkiZo8Sw3FOBNCGwClevLHO69kLrGTCuqbvvawXmR/2yAtiWabQVyum/IkN4MK
 InG9hUqtRxGK5Pm1a6fVUeHk6xZ6XlJ4roQqYYHB9R7XoP+00NxOEe3a82eM5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S6sNC0pN
Subject: Re: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: bump version
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
Cc: Philippe Reynes <philippe.reynes@softathome.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 15 Jul 2023 22:48:04 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Switch from tarball to git checkout, upstream does not provide tarballs
> anymore: https://sourceforge.net/projects/ibmswtpm2/files/
> 
> Rebased patch.
> 
> This bump introduces compatibility with OpenSSL 3.x:
> https://sourceforge.net/p/ibmswtpm2/tpm2/ci/920ce656af833ce6fb2b76c34cf8f58a4b6a4175/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-Use-LONG_BIT-to-define-RADIX_BITS.patch   | 14 ++++++++++++--
>  package/ibm-sw-tpm2/ibm-sw-tpm2.hash               |  5 +----
>  package/ibm-sw-tpm2/ibm-sw-tpm2.mk                 |  6 +++---
>  3 files changed, 16 insertions(+), 9 deletions(-)

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
