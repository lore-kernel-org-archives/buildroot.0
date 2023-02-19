Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8282BC05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 20:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E753405A4;
	Sun, 19 Feb 2023 20:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E753405A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2xF0iOJQCAp; Sun, 19 Feb 2023 20:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 555E740B7B;
	Sun, 19 Feb 2023 20:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 555E740B7B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A361A1BF2B6
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 20:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72968405AC
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 20:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72968405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDrJH-sYFvUe for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 20:55:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FE8E405A4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FE8E405A4
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 20:55:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4615A20003;
 Sun, 19 Feb 2023 20:55:41 +0000 (UTC)
Date: Sun, 19 Feb 2023 21:55:40 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230219215540.3968527c@windsurf>
In-Reply-To: <20230219142548.626439-1-fontaine.fabrice@gmail.com>
References: <20230219142548.626439-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676840141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAibIWPHf8CO8L2PP5u5rJLlaqK8cJgVgKLY25btq7w=;
 b=O+XMf5B8/8ssmZknoNmlsF4Utyd0+SWf4jpo82qp3k+jRysunqNTgKiNu0H9DQr/+jIfHM
 CxGiI3yg5LBxrCwU1ZbuENPPSDuOGynm7C9VRjYDe8mBYGrmo7hdWcMTn9nj4WBefwFuUe
 Y/w53XmR0ubJPmeozJ5+w+uz97YgHuBQVNs+/Q4rnFD0mnkZr4D5b1tHjKd9ugt1Od2xkO
 1D0HoXl7VcLBYBBcPscUn4Ob0/ATlxh0O0LTaCzspeQRHokuRLjNWz+48aplrf02yfSn0V
 hosxuOA0q15KrbR9t3JD21qUmdoPCLbgNyjIVxViGqWKAnY7Jt6n8sMuqG/BYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O+XMf5B8
Subject: Re: [Buildroot] [PATCH 1/2] package/speechd: disable kali support
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Feb 2023 15:25:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable kali support as it is not needed and raises the following build
> failure without C++ since the addition of the package in commit
> 9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:
> 
>   CXX      sd_kali-kali.o
> /bin/sh: line 1: no: command not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2f6c8b3674753d6a9f165117c70e7dad88505505
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/speechd/speechd.mk | 1 +
>  1 file changed, 1 insertion(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
