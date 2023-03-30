Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845D6C6FD1D
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 12:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A8041FE5;
	Thu, 30 Mar 2023 12:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A8041FE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBIPSJPb95cO; Thu, 30 Mar 2023 12:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4213441FAE;
	Thu, 30 Mar 2023 12:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4213441FAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1E21BF4DA
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 12:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F19A60B01
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 12:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F19A60B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9HmEOMwy4wW for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 12:21:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDAFD60AEB
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDAFD60AEB
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 12:21:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9536D100008;
 Thu, 30 Mar 2023 12:21:34 +0000 (UTC)
Date: Thu, 30 Mar 2023 14:21:33 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230330142133.002fa797@windsurf>
In-Reply-To: <84821597-4e34-2e1c-99f5-4d03bdda0d45@mind.be>
References: <20230326130937.56650-1-f.fainelli@gmail.com>
 <20230328202533.GD3204460@scaer>
 <c7968ace-cfbb-1c54-bdde-083a37423686@mind.be>
 <20230329105022.6137bf1a@windsurf>
 <ffed7523-6dbe-6d61-03e7-57cdbc732097@mind.be>
 <20230329112855.6110cf8d@windsurf>
 <f4e1e805-4ab0-e187-8001-c5cfa9c0be00@gmail.com>
 <84821597-4e34-2e1c-99f5-4d03bdda0d45@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680178895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gY5UPfj7Wz/6k5ronlYZcemLOMg5JfYaBX1etUsvY4=;
 b=F0EUgpXrHOYLxB73uItUk7d1CdjsVLmKXV01s8Su6FE3Ps44rE4j6uoMM0r0s02qXo7eJv
 j7zg9vP4xeX7Swuod0ltTVtkJqHK/e3COKd/fR9DI8d/GM3JLxwfvdXe+Gy/i67fZRrWyy
 fkQKsWVMzQtRG4XKwNZJ/jI3hqFWUcvzRUheQ+n7+0RKBRA4kN9Z3eeAgi7q+Bw2A5Yr8C
 Dimn5VXW89nNezPWExpWXIp2KpicHK1W+P5OwvtDppU5+cjrFWnFsirmj3jWWM6+IiqKdS
 wUQ8PkrhGtNIpQRFjxMxTzWPh53kzVJXjPchfuWvxrWxn6k1KW+EADy3W9lyCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F0EUgpXr
Subject: Re: [Buildroot] Indicating upstream status [was: [PATCH]
 package/bluez5_utils: Fix builds with musl-libc]
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, marcin@bis.org.pl,
 d.lang@abatec.at, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Mar 2023 09:03:50 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   That's where I got my inspiration :-) I just find "Upstream-status" a bit 
> long, so I abbreviated it to "Upstream". Also, "Submitted" and "Accepted" are 
> not really useful because the upstream status is going to change while we don't 
> change our patch. In addition, a simple URL there is enough information. That's 
> how I got to:
> 
> For Submitted/Accepted:
> Upstream: <PR/mailing list/patchwork URL>
> 
> For Backport/Accepted:
> Upstream: <commit hash> [submitter@email.address]
> 
> For Denied:
> Upstream: Denied <PR/mailing list/patchwork URL>
> 
> For Inappropriate:
> Upstream: N/A + explanation why
> 
>   Only "Pending" is a little iffy - we just don't want "Pending" patches I guess.

This sounds good to me.

For the Backport/Accepted, I tend to like when it's the URL to the
commit on Github/Gitlab/Git repo rather than just the hash because then
I can just click on it and see the patch. Also who would be the
[submitter@email.address] in this case? The author of the upstream
patch? Why do we need to replicate that information in Buildroot?

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
