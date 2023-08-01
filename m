Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828BFC00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 343B0611A4;
	Tue,  1 Aug 2023 21:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 343B0611A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yj-uNTwmlYnf; Tue,  1 Aug 2023 21:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBC77611A2;
	Tue,  1 Aug 2023 21:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBC77611A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AAE31BF860
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B6634049D
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B6634049D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_JzuXBceRod for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:06:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 631764052D
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 631764052D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30EF0E0003;
 Tue,  1 Aug 2023 21:05:57 +0000 (UTC)
Date: Tue, 1 Aug 2023 23:05:55 +0200
To: carrier.nicolas0@gmail.com
Message-ID: <20230801230555.4d63f141@windsurf>
In-Reply-To: <20230119132856.1801425-2-carrier.nicolas0@gmail.com>
References: <20230119132856.1801425-1-carrier.nicolas0@gmail.com>
 <20230119132856.1801425-2-carrier.nicolas0@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690923962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwdnrRGGBSGBwR3+o5el6qdDnUPTRfKMhuEOfEU99Z8=;
 b=dCUtjSfivdg7nnZRrQnQhg82Th4TTAYqZRXEOaphAQP7TP8qvkrhtA3oBZ4QWcc8ZDTCgD
 DfOnnaSwgvG1Wb7b4xdhLk22at4M/OpVEWGhkLZUX/G2brHwUIo5V+2RAUH3x/NWzE4Rn1
 CHIQRjKP3bSJqXO1Vl5kleRhndkLl4LrCrMoeTO0c+jLT+oGPDrWKzBQT50y/p7X+HNMGP
 H8wRbuOqia+d1dzKP49GdF2Uwg8haRaBTQUCOUAoqyMaUus82OQ4sK0377ppuWBhhihazl
 GpcvxL2keygS6f9nTA6nKokXNsLTrj9E0WBB8v9/3Q6i19g1zCNQs9ZcxGz1TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dCUtjSfi
Subject: Re: [Buildroot] [PATCH 1/3] package/oniguruma/oniguruma.mk: add a
 host package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 19 Jan 2023 14:28:54 +0100
carrier.nicolas0@gmail.com wrote:

> From: Nicolas Carrier <carrier.nicolas0@gmail.com>
> 
> This is needed for the creation of an host-php package
> 
> Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>

Tweaked commit title as:

	package/oniguruma: add a host variant

and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
