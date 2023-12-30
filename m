Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40360C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EACA860AAC;
	Sat, 30 Dec 2023 18:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EACA860AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qK0Psd6K_VXC; Sat, 30 Dec 2023 18:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3890960A7D;
	Sat, 30 Dec 2023 18:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3890960A7D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4E671BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD993414C9
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD993414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gs9RxuDSklJn for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:00:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 767AF4149D
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 767AF4149D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89633E0002;
 Sat, 30 Dec 2023 18:00:54 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:00:53 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231230190053.728c993e@windsurf>
In-Reply-To: <20231230095051.40929-1-fontaine.fabrice@gmail.com>
References: <20231230095051.40929-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wfluik+pOwjopp8ECzRN8IeGD4qV0+F1XfOBlMScI7E=;
 b=IeaV/gCCgtStjTsfavYHnsifBkm1xZN7zptCsr8NTdS8wONdb75otRYQMhkudn0HwnWoLd
 FU5OucinucCSrac46Wi3SPQGGhXuycZQo/Kxe1cVBrrXkXA7qvToziEIOwRSL6JCB5pohk
 wO75Z3jRU5dVy5pkIPyB6/gn6rudp6IgLS8bBhiAxwN/L1tROXZ1aWnZ9DO6VP24uw1Smh
 bz83bfwWn7csEr2LwOVBV+rhmB1D9HLbORQU2YoawQXXRO1z3AXa/+dP8quBXtyoZ0Z3Gb
 yTcp31/XH373uP/ouNOa4SqrYRCpdj+1LLhOQiFKB/JuDaOvFyi0cmL7awrObw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IeaV/gCC
Subject: Re: [Buildroot] [PATCH 1/1] package/upx: bump to version 4.2.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 10:50:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/upx/upx/blob/v4.2.1/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/upx/upx.hash | 2 +-
>  package/upx/upx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
