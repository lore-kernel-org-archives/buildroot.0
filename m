Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4ECC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E766F61244;
	Mon,  6 Nov 2023 19:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E766F61244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6NOYDU_bFNf; Mon,  6 Nov 2023 19:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31F056124C;
	Mon,  6 Nov 2023 19:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31F056124C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA6461BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B318B40899
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B318B40899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id koTxi9YVP5-q for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:30:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EE59404CA
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EE59404CA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5439A240003;
 Mon,  6 Nov 2023 19:30:09 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:30:08 +0100
To: hmaied.benabdellatif@etictelecom.com
Message-ID: <20231106203008.0743dabf@windsurf>
In-Reply-To: <20231106143037.6900-1-hmaied.benabdellatif@etictelecom.com>
References: <20231106143037.6900-1-hmaied.benabdellatif@etictelecom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hCovxTOBDa5nlkjRmB1Fl+2Xs+8VAxuYVsG5fE91oQ=;
 b=oqrLJvXCTVuGFWkbdQpNqxVEtPl7PBVIHMZ+ZhjKOo0YeR9psLhmBDZGD24VvK2/R4BX1z
 4x2XBtmc7UY0yM3f+cU/aTTlPfX2onr8wbx7zWDh/Xo56FeRR7/LB4DUcMZ1jT3aAeUcdV
 fRvtywB7CvG0Nd9cuo8PMX5HY1QMinmNZZdauJR1miYTtMxGylftECug+SCpOOZX8bJ9nW
 R/MWEPDzTy5owq3OSNaLK5fs6QDmXJZxbFbMW2CwH1xdXbZjtLAsBMxLyBCCE4NG8w41pP
 ydgNQz1RzYsnDXyxcTf58fKzMU2NOnlU4mGjxkVVcN/RGnqElSm+uKk1FiWH7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oqrLJvXC
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/openldap: bump version to 2.5.16
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
Cc: David Bender <codehero@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon,  6 Nov 2023 15:30:37 +0100
hmaied.benabdellatif@etictelecom.com wrote:

> From: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>
> 
> Stripping when cross-compiling and libtool static behavior are fixed in 2.5.16.

Could you clarify which issues you are talking about here? I don't see
any build failures of openldap in our autobuilders. Do you have some
specific Buildroot configurations that are failing? If so, which ones?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
