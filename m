Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B296C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25B71417F4;
	Thu, 27 Jul 2023 10:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25B71417F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ax0nFHN88JbW; Thu, 27 Jul 2023 10:35:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EAFB4025D;
	Thu, 27 Jul 2023 10:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EAFB4025D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 161B11BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E20AB4025D
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E20AB4025D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RE86LUIt7Cu9 for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:35:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4A88401C9
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A88401C9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1696E60002;
 Thu, 27 Jul 2023 10:35:37 +0000 (UTC)
Date: Thu, 27 Jul 2023 12:35:37 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230727123537.4039db96@windsurf>
In-Reply-To: <20230725213609.19784-1-ju.o@free.fr>
References: <20230725213609.19784-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690454138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BeDeRRSACl1YDr6sV0AGPxrT1JAHfgdjR1Upr2D4ls8=;
 b=P9rw9NrYtwIcwaaH6paaSVhFD4ynkvixzm9qKRh/48JaSMgNSiTIqHi30Ia3gUALmdbFuo
 ygC7SY6wr+SX0tDPMg5ZmQ1jbWOBlvhoed+cikCRsqahvKwyTGIhQM+2Qb0IEj6CPj36eU
 W2bOmdeJNR0bkLMIWZNBhp2iEPtv0jjhMxRxjtTThvDM26UlDkApLPHkqS0be403ikpqXR
 H+Tx7ppqAzBE6Dv5CUYZvpNTWRTvdWJ1Munl/DHQG1I14Nm2w11IILDWCaHmFBf03P1gfq
 IJ/4SQun2nnH0iLeX6Pbey4STKbfgFY+Rvq3GrVQeypkSA9U0TIbdXeHbkfg9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P9rw9NrY
Subject: Re: [Buildroot] [PATCH v3 1/1] package/acpica: bump to version
 20230628
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

On Tue, 25 Jul 2023 23:36:09 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 20220331, see:
> - https://github.com/acpica/acpica/blob/R06_28_23/documents/changes.txt
> 
> This commit also drop the patch removing -Werror in CFLAGS, as an
> alternative is now available upstream, merged in [1]. This commit is
> included in release 20221020. The build commands are updated
> accordingly to set the new NOWERROR=TRUE option to achieve the same
> behavior.
> 
> With the patch removal, .checkpackageignore is also updated
> accordingly.
> 
> Upstream commit [2] also introduced a use of wcslen() and <wchar.h>.
> This commit was first included in tag R10_20_22 (version 20221020).
> Therefore, this new version need wchar. The new depedency is added.
> 
> The _SOURCE file is also changed from acpica-unix2 to acpica-unix,
> as the current acpica download page at [3] shows:
> 
> """
> Note: The unix2 source package is deprecated since the dual license is
> now included in all source modules (along with the Intel
> license). This package will be removed from future ACPICA releases.
> """
> 
> The _SITE url is also updated to the new download link, since the
> acpica website now redirects to Intel:
> 
>     curl -si https://www.acpica.org | grep Location:
>     Location: https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html
> 
> The license file hash is also updated, due to the copyright year
> update. It is also worth mentioning that the files in the new archive
> have three alternative licenses in their headers: Intel, BSD-3-Clause
> and GPL-2.0.
> 
> Finally, since a SHA1 hash is published on the download page, it is
> added to the hash file.
> 
> This version bump is motivated by the introduction of RISC-V related
> definitions.
> 
> [1] https://github.com/acpica/acpica/commit/3fd0f940408fc01a2c52c5be5f2beb0218a3d907
> [2] https://github.com/acpica/acpica/commit/cd6a30897593f6052abf0b9a791671dcf07b9596
> [3] https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/download.html
> 
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks a lot for the super extensive commit message, this is very, very
good as it clarifies all changes making the review extremely easy.

Applied to master, of course!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
