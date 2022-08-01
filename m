Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A747C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2884109D;
	Mon,  1 Aug 2022 17:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2884109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDuHlMK2mNqO; Mon,  1 Aug 2022 17:04:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E44E4410A7;
	Mon,  1 Aug 2022 17:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E44E4410A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E8521BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7963881D4D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7963881D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bw5B7MfAf9Ct for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:04:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AAC581409
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AAC581409
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:04:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7CE8D1BF205;
 Mon,  1 Aug 2022 17:04:18 +0000 (UTC)
Date: Mon, 1 Aug 2022 19:04:17 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220801190417.061c2858@windsurf>
In-Reply-To: <20220728232357.270130-2-sen@phobosdpl.com>
References: <20220728232357.270130-1-sen@phobosdpl.com>
 <20220728232357.270130-2-sen@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659373458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmIHd6/xPmM5QGRuVS5zPHR+XI2XLmwxzhpt7jVaziY=;
 b=TYCM7hWwkIm0QOIAdnQMBsg6hF/oRu8+y9YKvPPeaMgmb897Qc6zBvH2oHFuP4Uwu9Kxz1
 V/Fs5kxNldhxEcui2Fi2KzqEGz2o79pda+aGPhZEpuyfqLWGGTRQM+3ufxyQSHtfIOkJsS
 3snckTC6VzRNbYuXF6uZePb+vUIsA6UV9tKG2NT705ixUBxsJImoT2gKxmd1XlGYuxMDwg
 Do0VbwKnoC+SwlHhftprKFPd3C+Zwii1sPJ6YSWAXogwSo7fsQwusUh8V6o10+ZwJ2rEXE
 DzKUGslj/vzXoUHBcsM7r/gpPq1KZgPQSH7sFH7KNQdClv7TCGIFQ1IftLm2Aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TYCM7hWw
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/pkg-stats: adjust
 column widths
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

On Thu, 28 Jul 2022 18:23:56 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> This adjusts the column widths, mostly for asthetics/legibility.
> 
> It is primarily for chrome based browsers, which like to
> linebreak on explicit hyphens, meaning every CVE takes multiple lines.
> 
> see: https://github.com/w3c/csswg-drafts/issues/3434
> 
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>

This doesn't behave extremely well here as it prevents wrapping of the
package .mk file path in the first column, making this first column
larger than it was. I guess wrapping on "/" would be ideally for this
first column.

Here the table continues to exceed the width of my large browser window
(with or without this patch), which is not very nice :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
