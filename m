Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6D0C05027
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 15:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02C0D820BA;
	Fri, 17 Feb 2023 15:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02C0D820BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DltCdrqgbVa1; Fri, 17 Feb 2023 15:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53D5481F51;
	Fri, 17 Feb 2023 15:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D5481F51
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5C7E1BF311
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 15:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F41861ABA
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 15:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F41861ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S86qjhCxW-QO for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 15:10:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 757FD617B0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 757FD617B0
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 15:10:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4CCE16000A;
 Fri, 17 Feb 2023 15:10:41 +0000 (UTC)
Date: Fri, 17 Feb 2023 16:10:40 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230217161040.42a0c31a@windsurf>
In-Reply-To: <20221030182041.GX1058960@scaer>
References: <20221030175632.4139-1-fontaine.fabrice@gmail.com>
 <20221030182041.GX1058960@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676646641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MwXcY0Siv6pW1JMYKNLIoYwcD7PPFoH9aWjlOOZFlcY=;
 b=igQIztqmnUkupGebgnytk5q37tkXELbqTikZb6Uq6iEV4j+t90qZReVCoru7pEDWfSUFsh
 gLB7Gks8kdbu72j/O/mCDkUgYLzLihll7PjJtrt3hzhM2mUrqXVYUvm7nLqlcuAqNkMQCU
 DX65ml9pJ/SaEBZuxthvifMxTDvJr/K7kGuUrZmoJsl9OntvFvlzNNwGHKpsaNWoj2PwWr
 6XoEA6T1lWqikbI1WGua4vBBCuG3S2RdguG6J3X0vk1DfPWb1X2zjRElWvtsir8dxm+v00
 S6jz4YuzuhBpoLW9zlkG9eOoqGY+mjFWRbw/yarezO1k8dOk2wp1t55juYiv1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=igQIztqm
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/openipmi: add libexecinfo optional dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Sun, 30 Oct 2022 19:20:41 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Fabrice, All,
> 
> On 2022-10-30 18:56 +0100, Fabrice Fontaine spake thusly:
> > Add libexecinfo optional dependency as upstream rejected the patch to
> > add --with-execinfo=no  
> 
> Indeed, they rejected it, but they suggested an alternate solution:
> check for backtrace() and whether it requires -lexecinfo.
> 
> Something like:
> 
>     AC_SEARCH_LIBS(
>         [backtrace],
>         [execinfo],
>         ,
>         [AC_MSG_ERROR([backtrace() not found and no library provides it; maybe install libexecinfo])]
>     )
> 
> Regards,
> Yann E. MORIN.

Agreed, but for now, Fabrice's patch was good enough, so I applied
as-is. It will certainly be nice if Fabrice has the chance to work on a
better solution using AC_SEARCH_LIBS().

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
