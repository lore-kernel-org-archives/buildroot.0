Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23722C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 11:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF80E41403;
	Sun, 30 Jul 2023 11:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF80E41403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAf_0aSPSxLg; Sun, 30 Jul 2023 11:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 998C34087C;
	Sun, 30 Jul 2023 11:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 998C34087C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D57781BF3DC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAD474087C
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAD474087C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLmyOZylwfSJ for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 11:33:30 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0427C40869
 for <buildroot@uclibc.org>; Sun, 30 Jul 2023 11:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0427C40869
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 69545C9581
 for <buildroot@uclibc.org>; Sun, 30 Jul 2023 11:27:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3636160005;
 Sun, 30 Jul 2023 11:27:11 +0000 (UTC)
Date: Sun, 30 Jul 2023 13:27:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730132710.0d52cc18@windsurf>
In-Reply-To: <pan$70d94$efb9e899$b44728f9$86f0fbf9@ID-313208.user.individual.net>
References: <20230726171923.334017-1-bernd@kuhls.net>
 <20230728221509.1127286e__5257.07515641756$1690575343$gmane$org@windsurf>
 <pan$70d94$efb9e899$b44728f9$86f0fbf9@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690716431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1pD9r3WgJpQ6euFFdhmYB7nYXV6OD0Xoi/x4qyD+Gk=;
 b=gn1irNHb6yiCBwR/GxvDzStac/bYRoN+xB4IOyD1zBD0iDyDAolnfJW6B+CHef+KpGSR44
 6pCQ9m+tKw3q7YtrPcd5WVmIeocYnMPeSUSVSmetavkVC0gLIq+U5tv+r9qhn4XGTg9tyR
 hoR7XFhO62yfsjJ+vaHYXwt5sAlFEbKoTGMy77S9cOJ38SsVm8IfrHu32Pq92Fb6pIc3Tn
 woCmIJBvX6plhnI7qtx1AgINFLt/OrnADVmgyENth/Fkz2FItXH0hP/uvt8KIc6Mu6TGG9
 62uu4MMKgUulo0akWli3CFjoopSIhgjc7JEr1qB478m35FB+igorMFTaUIELLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gn1irNHb
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.76.4
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun, 30 Jul 2023 12:54:00 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> BR2_PACKAGE_LIBGLIB2=y
> 
> finished without errors:
> 
>                              arm-aarch64 [ 1/45]: OK
>                    bootlin-aarch64-glibc [ 2/45]: OK
>                bootlin-arcle-hs38-uclibc [ 3/45]: OK
>                     bootlin-armv5-uclibc [ 4/45]: OK
>                      bootlin-armv7-glibc [ 5/45]: OK
>                    bootlin-armv7m-uclibc [ 6/45]: SKIPPED
>                       bootlin-armv7-musl [ 7/45]: OK
>                 bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
>                bootlin-m68k-68040-uclibc [ 9/45]: OK
>              bootlin-microblazeel-uclibc [10/45]: OK
>                 bootlin-mipsel32r6-glibc [11/45]: OK
>                    bootlin-mipsel-uclibc [12/45]: OK
>                      bootlin-nios2-glibc [13/45]: OK
>                  bootlin-openrisc-uclibc [14/45]: OK
>         bootlin-powerpc64le-power8-glibc [15/45]: OK
>            bootlin-powerpc-e500mc-uclibc [16/45]: OK
>                    bootlin-riscv32-glibc [17/45]: OK
>                    bootlin-riscv64-glibc [18/45]: OK
>                     bootlin-riscv64-musl [19/45]: OK
>                  bootlin-s390x-z13-glibc [20/45]: OK
>                       bootlin-sh4-uclibc [21/45]: OK
>                    bootlin-sparc64-glibc [22/45]: OK
>                     bootlin-sparc-uclibc [23/45]: OK
>                     bootlin-x86-64-glibc [24/45]: OK
>                      bootlin-x86-64-musl [25/45]: OK
>                    bootlin-x86-64-uclibc [26/45]: OK
>                    bootlin-xtensa-uclibc [27/45]: OK
>                             br-arm-basic [28/45]: SKIPPED

Because this one was skipped, none of the tested configurations had
BR2_ENABLE_LOCALE disabled I believe, so your test didn't actually
verify what I asked :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
