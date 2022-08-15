Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7067CC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6CAA415D0;
	Mon, 15 Aug 2022 10:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6CAA415D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BzJeOsQwxKA6; Mon, 15 Aug 2022 10:01:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7F441581;
	Mon, 15 Aug 2022 10:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7F441581
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8A51BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45BF460625
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45BF460625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKGFGS9cpC3L for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:01:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF7AA605A7
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF7AA605A7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:01:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA85D240003;
 Mon, 15 Aug 2022 10:00:58 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:00:57 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815120057.6a188a67@windsurf>
In-Reply-To: <20220815094054.291874-1-fontaine.fabrice@gmail.com>
References: <20220815094054.291874-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660557659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ohdAZn5b7eihheWol4eMPNbA4HxKyGWPtXNphkf/CcA=;
 b=H2dCzKBe9ZHRoUsuw1i5TcNqDKwWdusXLmyma4/3YBjJIhce2h9yduXJxQiGCLmCozMalR
 3bg8XEynWjIodF35i+7xNTEhRxnHRmO9AKH7sh4u+i4QJVSK11hfeTwAz7Rn0mS6AfeXhv
 5pzLHqa9fhUQu8PlsMinnee8Ov/mzje9fnaI4zW03nWzgzV7gBRGcScFcimdpfsR53sFtO
 AEbQhAhHJ8+kyR6tibN2Ioq/eR5IjLZuZDwioXlLEM0rrEr8PMhx3yhLOkYzNC5dWeL1Ku
 heGLHRLXWYYnyrHe7MXHD/aVLHehYtqEzknFCeu2Yx60NzIHVJxi9SbwWjySnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H2dCzKBe
Subject: Re: [Buildroot] [PATCH 1/1] package/makedumpfile: set CROSS
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Aug 2022 11:40:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set CROSS variable otherwise makedumpfile will use it to undefine the
> host architecture through -U__$(HOST_ARCH)__ if $(TARGET) is not equal
> to $(HOST_ARCH). This will result in the following build failure since
> the addition of the package in commit
> adb64a97e79bcb4e28450dd858654003ec8706c3 if aarch64_be is cross-compiled
> on a aarch64 host for example:
> 
> /home/autobuild/autobuild/instance-5/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -g -O2 -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DVERSION='"1.7.0"' -DRELEASE_DATE='"8 Nov 2021"' -D__aarch64_be__ -U__aarch64__ -DUSELZO -c -o ./print_info.o print_info.c
> 
> [...]
> 
> makedumpfile.c: In function 'is_kvaddr':
> makedumpfile.c:1547:46: error: 'KVBASE' undeclared (first use in this function)
>  1547 |         return (addr >= (unsigned long long)(KVBASE));
>       |                                              ^~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e4e10364e1a24099ce31bf20eacf5adedf93e5a7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/makedumpfile/makedumpfile.mk | 1 +
>  1 file changed, 1 insertion(+)

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
