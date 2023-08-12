Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3686FC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E52B6405A1;
	Sat, 12 Aug 2023 20:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E52B6405A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdhg8wSvLDhE; Sat, 12 Aug 2023 20:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E74540579;
	Sat, 12 Aug 2023 20:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E74540579
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEDB1BF4E4
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 002D74151F
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002D74151F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NumnVZNa7kvL for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 20:22:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 839F741517
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 20:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 839F741517
Received: by mail.gandi.net (Postfix) with ESMTPSA id 214D3E0003;
 Sat, 12 Aug 2023 20:22:36 +0000 (UTC)
Date: Sat, 12 Aug 2023 22:22:36 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230812222236.3501211d@windsurf>
In-Reply-To: <20230221160036.2903448-1-fontaine.fabrice@gmail.com>
References: <20230221160036.2903448-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691871757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwCHblKBR6IEWidAY109Ulnoa+24CDn5JhgbOSUVxxM=;
 b=GXi1fvHSps7QTtdP9eC9COH+3zSGWrmqPVA6y6NSuMhX9/DMu0OWHWuB3WO3rYqjM1+6ku
 aWmM4m/tilSpYEd2y+RypHdQQLf+AzPfqi/GAzIxbAWjdlqKIkE7RLewH88koFE6Ekn0IX
 tLOmbaY7vY8RYNxY0SBuahmE+H3KLgV2ZDwDHQtNKI2w5vRok08M6su9mF2f1itUP3F0K6
 QGCKrCN6eUZ/jV3hGrqgXglTj5P2FnoY9hH83sfxCr5ie5U5AF2I3DuirABccC/twDGebl
 wQJVM63VJjRvYoedZOdqoe2Q/cfeTFKyHGBi9D4rLQvKoPymSF4rD7+Hz5s4fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GXi1fvHS
Subject: Re: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-codescape-mti-mips: disable
 gdbserver
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Feb 2023 17:00:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure:
> 
> >>> toolchain-external-codescape-mti-mips 2018.09-02 Copying gdbserver  
> Could not find gdbserver in external toolchain
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ead304285a9cf32bf6b9dcc7fc30acece25ec680
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../toolchain-external-codescape-mti-mips/Config.in              | 1 +
>  1 file changed, 1 insertion(+)

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
