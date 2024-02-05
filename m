Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA306C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F7EB41A46;
	Mon,  5 Feb 2024 15:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F7EB41A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siZc91aTK-BG; Mon,  5 Feb 2024 15:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6A5419C3;
	Mon,  5 Feb 2024 15:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF6A5419C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 520241BF215
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3810760F0C
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3810760F0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVqMNTWrvCRG for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:11:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52E0C60EF8
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52E0C60EF8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AD7D20009;
 Mon,  5 Feb 2024 15:11:38 +0000 (UTC)
Date: Mon, 5 Feb 2024 16:11:37 +0100
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240205161137.5a56b402@windsurf>
In-Reply-To: <20240117234630.2728809-1-petr.vorel@gmail.com>
References: <20240117234630.2728809-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707145898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/iIrVZp+UE4GuTLujZL8WK6PKG26AO3Fw5eXGsNBhno=;
 b=DovJaeZlwIKApTQXKdKXqfY8xCRDxHTDlD8VftTb7fdppb62S/PWzs7XsenvAD5VtKKj3F
 XXkl3usxFE24herPEIed2vSXC4RczCtBDRmqpI/X/BomQPXBPd0apL1nkkbgz4TZmAJF+L
 9NkNsHzAt6yUP70/kn7RoBBXZ/7KzYKQwgjnEvGpCyd9EtWMCGAmzE6KM+7CUZDjXqtyDD
 m6WQ6cgno+KM98A0zBTVUM0zfs7+utGrVvcWWHUMT/CQn4A65qbeVVpddohw8sEkYm4VmE
 Wmk4tyVNj3lUtf747vAmUT80hEql6aeLSkG3oWZTsmtwktntAv6Zw1lnOeKpJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DovJaeZl
Subject: Re: [Buildroot] [PATCH] package/iputils: bump release to 20240117
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 18 Jan 2024 00:46:30 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/iputils/iputils.hash | 4 ++--
>  package/iputils/iputils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
