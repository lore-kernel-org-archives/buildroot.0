Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C6DC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80EEF817B5;
	Mon, 15 Aug 2022 09:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80EEF817B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceKy2Zzzp-RF; Mon, 15 Aug 2022 09:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C64678176E;
	Mon, 15 Aug 2022 09:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C64678176E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AD2A1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72B828176E
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72B828176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-pJcPBAyARK for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:39:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F27681768
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F27681768
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:39:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 674F4240003;
 Mon, 15 Aug 2022 09:39:16 +0000 (UTC)
Date: Mon, 15 Aug 2022 11:39:15 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220815113915.33c6816b@windsurf>
In-Reply-To: <20220814202300.GM2854108@scaer>
References: <20220813093627.369221-1-ju.o@free.fr>
 <20220813125424.6caa746b@windsurf>
 <e0634cb156656205a84bc7ecce8a9412@free.fr>
 <20220814202300.GM2854108@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660556356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6z4n2V/9ycO8FqfM2oeKUajyUEMhRLLG9mpAMNJIQM=;
 b=D5Hr1iv0iyELtdzjBEyVubmOsJpaA2NZusrrdZhljvlN1fmo/SF2KlSXEfz7zJNWf43n4x
 mRCSx+mKZ1sgfzvNWDbsZgHUjUuNt4my6k/Kxe1YMRzJuwuKE4Nhir7cLeSSgIiN1wI//1
 CA1wtdgvN9qlOXOHrOM1/J4K97IjkvmZYZw2zxr/tVIH+PoFhUzcTuF3wwGJthQEQ1Fq1g
 pJhwahNRf2BoT7O4ZMMj6fNNzH1/zblqp7Z33mvOXovR7Py4lpEQJ2H/Bz//qremhLs47V
 wq4sa2A6syPWXOZOxiW9GYmO7lMwOBr3sG4fYrDvEGJ0i3fiqjbI7y+JSUDpHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D5Hr1iv0
Subject: Re: [Buildroot] [PATCH next 1/1] package/linux-backports: bump
 version to 5.15.58
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 14 Aug 2022 22:23:00 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> But then, one could argue that this is the same with other packages that
> get requirements on newer kernel headers (and thus probably about newer
> running kernel). We can't hold back forever.

True. But even systemd only requires 3.13, which is much older than the
minimum 4.4 kernel that would be required by this linux-backports
update.

> The alternate solution is not great: we could add a version choice:
> 
>     config BR2_PKG_LNX_BACKPORTS_5_15_X
>         bool "5.15.x (for kernels back to 4.4)"
> 
>     config BR2_PKG_LNX_BACKPORTS_5_8_X
>         bool "5.8.x (for kernels back to 3.10)"
> 
> But this is not ideal... :-/

That is the sort of solution that I was thinking of, indeed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
