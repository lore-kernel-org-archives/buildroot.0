Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AC5C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07BB382F76;
	Wed, 21 Sep 2022 20:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07BB382F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x0ksgHC1iJJP; Wed, 21 Sep 2022 20:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42A9182C99;
	Wed, 21 Sep 2022 20:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42A9182C99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCD201BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A66AA410C4
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A66AA410C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgFzoEvegSt7 for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:09:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE1F410C3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EE1F410C3
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:09:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BEC99FF804;
 Wed, 21 Sep 2022 20:09:16 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:09:14 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220921220915.588532b0@windsurf>
In-Reply-To: <20220917203816.213152-1-fontaine.fabrice@gmail.com>
References: <20220917203816.213152-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663790957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1x+UJO68rIiHVfBy3wQmVqU1OEcrZbNObaDx/UzmzCU=;
 b=jkcF+trJo9A6Ag+kfChvRLmMymjo5mSHtqLGCLrab0HGwWcMYdRXIeI/soXPhU2fkIn8NY
 4wIZAk202u5DcBBaB4q7jsrjavf046knIpvFdkzs6f0vPDMCQ/zQZokHY1/dGNYFxqjMVa
 Wkid6X2aFXDbANSuAkTzG2mIObIyOlET/NGKL3Gxq6+Q8ssG2Rek+nATtmacLpbkc0ToPz
 Eql6Cd5b6sPMwyxsta13pC5zuYK9kKaREf5gkcX/Lfk/HY5d4mzbyQD1KOg88w+1hSDf/o
 xQOGjJgnpWOeedg7KP8PXdXdwY7tpQ1H266JISNgwuWuY/cdwM43Vs/yPHOdig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jkcF+trJ
Subject: Re: [Buildroot] [PATCH 1/1] package/dracut: bump to version 057
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
Cc: Thierry Bultel <tbultel@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Sep 2022 22:38:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> kernel tarball is not provided anymore:
> https://github.com/dracutdevs/dracut/issues/1850
> 
> https://github.com/dracutdevs/dracut/blob/057/NEWS.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dracut/dracut.hash | 2 +-
>  package/dracut/dracut.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

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
