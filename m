Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29A6C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 917A960AD0;
	Mon, 14 Nov 2022 21:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 917A960AD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fpBOFFng2zSu; Mon, 14 Nov 2022 21:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC20605A2;
	Mon, 14 Nov 2022 21:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC20605A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 447701BF296
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C99B40012
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C99B40012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ayszQsuXVMaI for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 21:35:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6174400D0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6174400D0
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 21:35:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E6843E0005;
 Mon, 14 Nov 2022 21:35:34 +0000 (UTC)
Date: Mon, 14 Nov 2022 22:35:34 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221114223534.062f1491@windsurf>
In-Reply-To: <20221023085251.8723-1-fontaine.fabrice@gmail.com>
References: <20221023085251.8723-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668461735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NOcPpfsD5nX21NF3GG+b7zrYaQudYgcD8EjxX6T2rM=;
 b=F2qbrkBOHgZIFUOfnNR5MAQSjo94OqDosA9KiugLAzi+QRdJAZfzxLzkPtVDwwnh4vjpQx
 35KPmtuUgDmKNeFQzsBKEvDZKoxE3Y9Xj3nsaKOs9vl5MoRSDSkh7vPjqauuFw7/yq5KC9
 +IJ6VSDLvkhyT7Ct+fwl+n38Xalgbh7Gv1NgJxC70cfx8imfiwsowV1tpv3JMcQC96n46M
 6iESdDLM+Xhb63rnNI9jZ9RiDBauYKs2typO3pN4/mSb2SATAKGox7o7yKPeqvYlEpcQQ2
 JjzNFZbioqSxLKdbq6Q8MSK9teGlc3v13ln2dY17ho8JG/ZByfHcHv5yhP2ngQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F2qbrkBO
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/usbredir: bump to version 0.13.0
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

On Sun, 23 Oct 2022 10:52:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> usbredirserver was dropped by
> https://gitlab.freedesktop.org/spice/usbredir/-/commit/f4ffdce329305da2803684776f7659083a530819
> 
> Add an option to enable tools (and usbredirect binary) as a replacement
> to usbredirserver
> 
> https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.13.0/ChangeLog.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Peter Seiderer):
>  - Add libglib2 dependency
> Changes v1 -> v2 (after review of Peter Seiderer):
>  - Add an option to enable tools

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
