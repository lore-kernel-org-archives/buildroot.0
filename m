Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B94C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1383641880;
	Thu,  3 Nov 2022 21:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1383641880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8h5e8P8SjHI; Thu,  3 Nov 2022 21:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0263241844;
	Thu,  3 Nov 2022 21:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0263241844
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 799751BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 559EE6105A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 559EE6105A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pADJInTbZ_Qw for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:09:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3376105F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C3376105F
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:09:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4403A60008;
 Thu,  3 Nov 2022 21:08:56 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:07:18 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103220718.79541e26@windsurf>
In-Reply-To: <20221103200349.2685847-1-james.hilliard1@gmail.com>
References: <20221103200349.2685847-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkBlL0Wn1w5jh4VLz2jITju41DjuUgZL3yI0gjL4+jI=;
 b=FPW612hpRM2ZTFbzoiE0JSlhOnun//ENWBHFXTWDYiFNWNNmBXGsSkX1sNvzHPQxSDFdDQ
 d2qT3aNlMGxnRvKx2HiGqfSpGeBnJLQNuS6GIU1dosYFeFt/oTAv85Akm4eePwZgqQgCuB
 7WWsasPoqUuBn5NMPHF2/DKlia99eF8W8JRZTCN9qfssUt03hvxv7kHN+HYzz1BIlFIShb
 X2L/iOQrLdQ85Jqmjyl+iI6JEEvtxZV8TN7bAD0/AQN11ar6uW75UsEK1aBVHN6MG11S0D
 8To3WCby4h13ZfhAR5t5HVTdCWI4IvbV/94i4KLF0cfjxeDTYSSWojXZuB4ovg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FPW612hp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-thrift: bump to version
 0.16.0
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
Cc: Vinicius Tinti <viniciustinti@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 14:03:49 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License details moved to readme.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-thrift/python-thrift.hash | 6 +++---
>  package/python-thrift/python-thrift.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
