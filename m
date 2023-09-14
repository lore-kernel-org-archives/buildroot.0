Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C137EEAA6A
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 19:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C28841E8C;
	Thu, 14 Sep 2023 19:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C28841E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id micChwnKbdmK; Thu, 14 Sep 2023 19:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A6FF402A1;
	Thu, 14 Sep 2023 19:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A6FF402A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 129D31BF3C3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFF116129E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFF116129E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LefLDDcbPFea for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 19:49:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C56BE60D6E
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 19:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C56BE60D6E
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF358240002;
 Thu, 14 Sep 2023 19:49:43 +0000 (UTC)
Date: Thu, 14 Sep 2023 21:49:42 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230914214942.41dd792a@windsurf>
In-Reply-To: <20230914191726.28670-1-giulio.benetti@benettiengineering.com>
References: <20230914191726.28670-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694720985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SnEw77FAAW/NBZwTlY1HKUq4zLglc+DfnYLHickvyos=;
 b=mfeEpSMKg+NAqkGMr65d2EuwE4gtCAhLNx9qvVghtO+cWFQ+a9ZbMSBTpUUDQzX0X7B/lQ
 kRghbCxR7ZJPLm+Ta/jtr1XkqEwpaZol/VNQ708UWhZrk+HZV2s26pZ/O28/BlzNDs+0EX
 zl3zDWo1BA15SxXnX9NazhKIPszvEIyxjTFPPfrhqwNhLNxaVIAbUSUlV3ioLSpIs8aAhZ
 LKW/L/84tP0F0H3G5ufnCPkq48WgUmsGRN/tJaX/OqW4bq4jruNaFMLneudEP6fs/TLpZo
 MONdz51wCiVm2ane5An1M2YP3td8zwcaOKl68lTx8xrIobMNcrx9s03t6g8RzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mfeEpSMK
Subject: Re: [Buildroot] [PATCH] package/apache-utils: new package
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
Cc: Jim Reinhart <jimr@tekvox.com>, James Autry <jautry@tekvox.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 Matthew Maron <matthewm@tekvox.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Thu, 14 Sep 2023 21:17:26 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> Build htdigest and htpasswd utilities only without building entire Apache
> package.
> 
> Cc: Jim Reinhart <jimr@tekvox.com>
> Cc: James Autry <jautry@tekvox.com>
> Cc: Matthew Maron <matthewm@tekvox.com>
> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

Thanks for the proposal. I'm always a bit "meh" when it comes to adding
a new package that uses the same source code as another package. It
causes extra maintenance work (you need to update both packages, apply
patches to both, keep tracking of CVEs for both, etc.).

What is the use case for needing this without the Apache server? Can we
change the Apache package to instead allow installing only those tools?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
