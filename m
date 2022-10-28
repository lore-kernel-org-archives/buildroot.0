Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1ACECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB2A410D2;
	Fri, 28 Oct 2022 06:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB2A410D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFn5Zw5H28Du; Fri, 28 Oct 2022 06:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9F80410C8;
	Fri, 28 Oct 2022 06:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9F80410C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1841C1BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E419780C11
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E419780C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_rch989pyfY for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:52:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D1E380B52
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D1E380B52
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:52:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 883EC4000E;
 Fri, 28 Oct 2022 06:51:59 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:51:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221028085158.483b0c09@windsurf>
In-Reply-To: <20221026023505.616591-1-james.hilliard1@gmail.com>
References: <20221026023505.616591-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666939920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaSIjtGyXW5AQ8C3l8YXTq91zdUIQ7CHS9t/t1+tjOA=;
 b=ILMpKW0jQvfsC+B2UlEnt5wgLFAFCw7pD+JRkbcAdwU0qFKQvsHsIkg8kX/gRG+fED2KWF
 2hqAdR+bW4HyZagc8BDTjpRnXyheht9hTGX6f8lQipflIaAU/diExRsabUSZtGX5KMiOFL
 mafdDHahXhyaUvIlQnORqIVXEreG81vlTknI/pjWjrneixd/M7Tcj+eW80jbwM3ar1YSMM
 pvYtY8NdI8rJlcq+lTmcl6tzFDdpWEik9CI8KqJ+z/8Qtao4fHoUk/PcLkF/+cL582mRle
 ugHycPgkgaiAjsK1nboLpIxvOD9dne7KgQZ1EN5XPLKi1RzdzZKwj8SkAv4EIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ILMpKW0j
Subject: Re: [Buildroot] [PATCH 1/1] package/python-numpy: bump to version
 1.23.4
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
Cc: Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Oct 2022 20:35:05 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to date update:
> https://github.com/numpy/numpy/commit/4fc42f99b7f96b1000c777a478f58e2744bb3656
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-numpy/python-numpy.hash | 8 ++++----
>  package/python-numpy/python-numpy.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
