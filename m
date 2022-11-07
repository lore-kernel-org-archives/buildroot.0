Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE93C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 08:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0969B400C4;
	Mon,  7 Nov 2022 08:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0969B400C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9miMA34DO3dm; Mon,  7 Nov 2022 08:25:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEC3240391;
	Mon,  7 Nov 2022 08:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEC3240391
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86F6D1BF2B1
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 08:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 422B260AC3
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 08:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 422B260AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NywUoz22hk84 for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 08:25:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ADD660608
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0ADD660608
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 08:24:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E3926FF808;
 Mon,  7 Nov 2022 08:24:56 +0000 (UTC)
Date: Mon, 7 Nov 2022 09:24:55 +0100
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20221107092455.3e4c972e@windsurf>
In-Reply-To: <a68289a542b9c7e28e8486e4b8b58070@umbiko.net>
References: <a68289a542b9c7e28e8486e4b8b58070@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667809497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=saT+UZhH0UQii13vcsBjpCpR+UZBKQlCh1LoWsrbeWo=;
 b=oZZBI/0qQBmS9piX3j51XCrAeXovHMa8XVvRSfRNjAJYiszx9VSdMl/JTNDlqJbe1bb1tI
 vOnX0AvQ5437ehz9jYugGgKOQtSLHtAv/LbMipD7xI0/EFD8vKkfMdyfkKxFBd/11X6Lwr
 MJlvI6r8OlkGwBHxbBCMOGQZzZ7qKVB+paVeb8Oghtia2UsHmO7wHXlpX+Zxo5E2QnoD/1
 pmoW2GrvnkWrA6HWDIDkg3ExFxOHG5jsWsX8PFKJc3OxRFcxcqX+jimqpPlNMRb2whc7zJ
 lrDGC86Ne2Li/2nK4Eco37jKah5CPskvHKEvm+u8meFIMkV4Lilmg1zbW0V+PA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oZZBI/0q
Subject: Re: [Buildroot] RFC: package/boost: build failure
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 07 Nov 2022 06:38:43 +0000
Andreas Ziegler <br015@umbiko.net> wrote:

> The development branch of boost/intrusive contains a fix for this 
> failure which, unfortunately, is rather longish [2]. Easy extraction of 
> the relevant part of the patch is not possible, due to massive changes 
> to the whole code.
> 
> I can think of three options to deal with this issue:
> 
>    (1) Use the commit [2] as is, even if it changes more than the failing 
> code

To me the commit [2] is not that large, and would be OK to backport as
an interim solution until 1.81 is released.

Thanks a lot for this investigation work, much appreciated!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
