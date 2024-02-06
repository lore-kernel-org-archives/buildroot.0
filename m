Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1217EC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1D9C40266;
	Tue,  6 Feb 2024 14:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1D9C40266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5pk_rhAtT49d; Tue,  6 Feb 2024 14:13:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDA3D41ECD;
	Tue,  6 Feb 2024 14:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDA3D41ECD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C4BB1BF576
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 325A161122
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 325A161122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WL7AbgRqgyNz for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:13:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB2A6606FF
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB2A6606FF
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCF5F1BF203;
 Tue,  6 Feb 2024 14:13:27 +0000 (UTC)
Date: Tue, 6 Feb 2024 15:13:27 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240206151327.0855d4b8@windsurf>
In-Reply-To: <ZYa0TdSBU2JrexMt@landeda>
References: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
 <20231220200110.1819507-3-thomas.petazzoni@bootlin.com>
 <ZYa0TdSBU2JrexMt@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707228808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFTLlwBm87fQaQsqAofrNs5mHCoYw8KhjIVGbATp2LY=;
 b=frmviuGKFj3lBJ0ixk6v7BqPPZvsde6m2vXcCPwZTqdKX9NICdHh5gK+w02CJn+yaWAy6J
 cMif2MX2b+MsExjSrk//G474uFU8JURIcoaq5EjaY3SlXWbRI7C4igwqE4AYukiRzX18Rm
 qY/R/BymSfDwxII2hJKpvvFlHArOW0Sd/XLwUi/X4l8oYo6RlpULUfObWaD+o7aYOYcJa6
 0MxZpxuR/F4gEli8ZiFFoHpDbRUTOQh2B275S04THc9u5jkoxFbLODlFuVPG5/dYPbjlAD
 4HwlkUBrhCv8P27cSnUTbiaPUxchSXL93AzrWa1IWmLwldFIGj8mydFDErDi4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=frmviuGK
Subject: Re: [Buildroot] [PATCH 3/3] package/glibc: ignore CVE-2023-0687,
 disputed
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
Cc: peter.verbrugge@technolution.nl, Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Sat, 23 Dec 2023 11:19:57 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> This CVE is supposed to be fixed by 801af9fafd46 (gmon: Fix allocated
> buffer overflow (bug 29444)) which is in 2.38:
> 
>     $ git tag --contains 801af9fafd46
>     glibc-2.38
>     glibc-2.38.9000
> 
> So the CVE DB should be updated to state that glibc >= 2.38 is not
> affected.

Good point. Sorry for the delay in getting back to you. I just send a
mail to the NVD maintainers, Cc'ed to the Buildroot mailing list. I'll
mark my patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
