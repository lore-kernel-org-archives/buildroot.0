Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F38C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFA7B84C2D;
	Wed,  1 Nov 2023 16:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFA7B84C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xc2bNHl43Xi5; Wed,  1 Nov 2023 16:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C77CF84C33;
	Wed,  1 Nov 2023 16:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C77CF84C33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7003F1BF35B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5480740185
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5480740185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1NQIhIl9I8d for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:01:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1A5F40180
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1A5F40180
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B34E1C0006;
 Wed,  1 Nov 2023 16:01:38 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:01:37 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231101170137.60391f35@windsurf>
In-Reply-To: <20231029204828.81352-1-giulio.benetti@benettiengineering.com>
References: <20231029204828.81352-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698854498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vL5t43AVB/Y7PvonQZHL9w7W4L6x31MSEcKb7gZ6KKo=;
 b=aXBkA9mTjiR1V73g6kIBL3tgTqZ6+fZlsS16D48ftj5prULR2lvHECUP+AzOFP44S2kFRz
 NcYqlHnQvV0yebzyhbh71zGAtGRyLLMS/mgAnRSL2Jq39eay0vUJsINnnpmOEzhqB3rhSW
 D+U6t6pXCbrotggohdDZv7UyiphDKTPYLARBvtpa7Kw4FzWhlnHO8r84ceaMi5vIStGdMD
 y4cP4FX8JM1Sr/1rGEHkpBeXzNi4YT3CF5P0dsmmLDWYALgc2T16jIQ6HdxKitNd4b+on7
 dqmuSdrcKrPZWQ9A+4wLqGn5YAGCZkXvh8azvtbBAZW3c2hSyX2ZlVAqU0lSlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aXBkA9mT
Subject: Re: [Buildroot] [PATCH v2] package/libnvme: needs host-swig when
 python is enabled
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 29 Oct 2023 21:48:28 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/a63d18fd318783d7e3d1cede062c9c7cacb10282/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * moved host-swig dependency under python3 check as suggested by Yann Morin
> ---
>  package/libnvme/libnvme.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
