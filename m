Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D03AC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 13:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 370AD81F91;
	Wed,  8 Feb 2023 13:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 370AD81F91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMPOPi6x87ia; Wed,  8 Feb 2023 13:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7400581F82;
	Wed,  8 Feb 2023 13:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7400581F82
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41A961BF3FD
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1332140940
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1332140940
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HH21Fn0Xwog for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 13:34:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F33E4405E7
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F33E4405E7
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 13:34:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3721C24000A;
 Wed,  8 Feb 2023 13:34:52 +0000 (UTC)
Date: Wed, 8 Feb 2023 14:34:51 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208143451.5700d209@windsurf>
In-Reply-To: <20230206133836.412572-1-angelo@amarulasolutions.com>
References: <20230206133836.412572-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675863292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ka4Tzvw84TVVI+2ej/LGVXYVMJbfX1X4ZwXt00+iPiM=;
 b=lPuhzPxO++4ym1nlC03juaizZhzLqnIIHZoYk/g5B+CBZsfCFZuqIw2lr+6VHF9d4hK95r
 ybuWaqQFlLJhids0R7e/5PCIvfPrefH6mrjwiASa85VRcXAPWW4Bc4VdL6rXmhXjqAg5E3
 676QhLaxUlsX7iWULq5KORUpH0YPKUQYln6xHn7y6yeeGrFit4cBlL8e8NgHicsojwXopt
 gKDe02LkVVRoT+uxzEB7ad2rcxCLK59X2I7xiqFwDIdeNRFCRGvhuX/B3jiChfFAzdvRTX
 FNu29elSyROokSK0ItsngfyTXSUIhL14QVpTJXB9h3O3K4hegHnlxITae5VZBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lPuhzPxO
Subject: Re: [Buildroot] [PATCH v3] package/qt6/qt6serialbus: new package
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 Feb 2023 14:38:36 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Jesse Van Gavere <jesseevg@gmail.com>
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>                                                                              
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>                                                                   
> ---                                                                                                                               
> v2:                                                                                                                           
> * LICENSE/LICENSE_FILES: one per line                                                                                             
> * Selecting BR2_PACKAGE_QT6BASE_NETWORK to make the package compile,
>   fixes: "Failed to find required Qt component "Network".
> v3:
> * Bumped to version 6.4.2

I changed the installation commands to use DESTDIR= instead of
--prefix, like has been done for qt6base, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
