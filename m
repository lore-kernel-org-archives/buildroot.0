Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D7AC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DA63401F8;
	Sat,  6 Aug 2022 21:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DA63401F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7fZrEXalYI1W; Sat,  6 Aug 2022 21:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 472A840117;
	Sat,  6 Aug 2022 21:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 472A840117
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67BCB1BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E9BE40117
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E9BE40117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvEuKSR5isKV for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:51:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02143400F1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02143400F1
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:51:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8587960004;
 Sat,  6 Aug 2022 21:51:29 +0000 (UTC)
Date: Sat, 6 Aug 2022 23:51:27 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220806235127.220d5546@windsurf>
In-Reply-To: <20220805200114.288208-1-sen@phobosdpl.com>
References: <20220805200114.288208-1-sen@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659822689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IatfGSd3kJOBTLnGh0fwV1n/Lzg+WpTs2UzwHOvAzB8=;
 b=CccnzwAVe2TFVl9/kpOrnz7c5hQREQa6x5AJWI3Kd1ovqtoTXB+IxETs7qCWzZcxolBvrN
 q3ArnaUt9Mrn1+C3JT4f1cs/ez6zHLM9oRfBEc+0BvwfiG9TnwQQ6QCsxXUxVnpvoByq8s
 ibxTDBIGZZ+1GuAEoCP7zwyzz2HCrGwHKb8E843q76plNEJeQfe5YtjBW244PqLhSvpeN9
 EZjYX4iWDbSTN1CrjpcSlTAsW2PGOo2RfRNDadVdLfeDcRG4UHl7qVURIjboe/Hv/AHgoe
 7tpQ9NFcZxuimo6wrUbmryOnA5DmtxkRR81CVG0daGn1ACAxQ00w1Kk2d7oBIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CccnzwAV
Subject: Re: [Buildroot] [PATCH v2 1/2] support/scripts/pkg-stats: move to
 procedurally generated row/column clases
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

Hello,

On Fri,  5 Aug 2022 15:01:13 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> Rather than having pre-baked classes in the markup for sorting purposes,
> all the cells in package-grid are iterated over at load time and given
> a row/column class.
> 
> example: https://sen-h.github.io/pkg-stats/b6f4cbddb14233c3ab3fdfea1e486c14871cfb2a.html
> 
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>

I am probably not versed enough into HTML/CSS/JS sorcery, but I don't
understand the benefit of this. Could you explain a bit more?

>  function sortGrid(sortLabel){
>  	let i = 0;
>  	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
> @@ -774,14 +785,11 @@ function sortGrid(sortLabel){
>  	const styleSheet = styleElement.sheet;
>  
>          columnValues.shift();
> -        columnValues.forEach((listing) => {
> +	columnValues.forEach((listing) => {

This is a spurious change.

>          if (fieldText == "see all " + fieldTotal + triangleDown){
> -		field.firstElementChild.innerText = "see less " + fieldTotal + triangleUp;
> +                field.firstElementChild.innerText = "see less " + fieldTotal + triangleUp;

This is also a spurious change.

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
