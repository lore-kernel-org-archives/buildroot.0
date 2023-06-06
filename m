Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4129AC7EE24
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 15:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBA661283;
	Tue,  6 Jun 2023 15:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBA661283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDvEnfcqbTy3; Tue,  6 Jun 2023 15:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04F3D6126F;
	Tue,  6 Jun 2023 15:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04F3D6126F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07A9C1BF36B
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 15:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D31F4418C8
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 15:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D31F4418C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8RxOzv8phWd for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 15:41:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A54141895
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A54141895
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 15:41:37 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 0B0A1BDE7EB1;
 Tue,  6 Jun 2023 17:41:35 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 06 Jun 2023 15:41:34 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Timothy Groves <the.tail.kinker@gmail.com>
In-Reply-To: <mailman.2494.1686026379.114519.buildroot@buildroot.org>
References: <mailman.2494.1686026379.114519.buildroot@buildroot.org>
Message-ID: <9bbed1f622dcd34dc0a4811427ce9635@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1686066095; bh=YaOjSoyItyXzdQnd/hGtrfMBQYefrbakPP/nIUuFsRU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Eck5cRXd+p4gEofT3sXQmOolbn4G9NVWUIo4C7tN49lUGCxcWp1PzDQiMRTqOmzWT
 Y8SKhhQbhZrhJTidtwKlSgzOjf3f5CKcCdzCnbFVyzbnccj8xM1C1p4iU6xrqbPMtG
 GCWuTcS/xrB8qe+N5p11svG+5Bp4+XhCqiuh7Qtg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=Eck5cRXd
Subject: Re: [Buildroot] Total newbie in over my head
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Timothy,

On 2023-06-06 04:39, Timothy Groves wrote:

> So I've gone over my settings six ways from Sunday, and confirmed that
> they all appear correct, to the best of my knowledge.? And still this 
> is
> all I get:

You should be able to load the kernel interactively, so try entering 
'bzImage' (or <path>/bzImage) at the boot prompt.

 From the boot message "No DEFAULT or UI configuration directive found" 
you are missing the syslinux.cfg file. As far as I know, this is not 
provided by Buildroot. One minimal file looks like this:

DEFAULT linux
PROMPT 0

LABEL linux
   SAY Booting Linux ...
   KERNEL /boot/bzImage

At least in my configurations, iso/syslinux needs one additional module, 
so BR2_TARGET_SYSLINUX_C32 needs to contain ldlinux.c32.

Kind regards,
Andreas

> I cannot find any suggestion online about what I've done wrong.
> 
> -------------- next part --------------
> An HTML attachment was scrubbed...
...
> URL: 
> <http://lists.buildroot.org/pipermail/buildroot/attachments/20230605/e49219fc/attachment-0001.png>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
