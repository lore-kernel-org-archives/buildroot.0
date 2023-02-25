Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1ECC64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7959640C47;
	Sat, 25 Feb 2023 09:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7959640C47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bETLtN8rI10J; Sat, 25 Feb 2023 09:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A46D240B8A;
	Sat, 25 Feb 2023 09:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A46D240B8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 397151BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20B4341673
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20B4341673
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dw0QL1fqHmdm for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:40:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC23541626
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC23541626
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:40:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 48CA260002;
 Sat, 25 Feb 2023 09:40:41 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:40:40 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225104040.2aaf653b@windsurf>
In-Reply-To: <20230225092227.9308-1-fontaine.fabrice@gmail.com>
References: <20230225092227.9308-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EX494P8cYXg4Svh7eq6j4R3ie6g2r9QkfKXPRWw2k60=;
 b=TIPD0IT/gTEp5LZMZCBvZDepbX7DX8eGvrePP2yZJmSpsmssoOHKPZ8pSBdPJe4jGWvgYP
 YVwm4lDz0SPE7Nbq1CjBRd53iO3hhW3tcL/tbOwRIRIt+E0wtkf2E6MMQKxG4YPI2fIjcA
 3fn37LrU3MErkXCMei/5W1+2TLMlCRTgJJkBxaqbTayxsL0biLteFErSJP238eM6Fjpp9N
 80vL99q36AgJ2pdimjqZKx6u9bq972Helqm48EU3yLObfPCBE+cfytLg4ZXZmlLnc8FxbX
 Qm/YHYrr3QGxFmSNLfFJ+PijksAfuc34+fwwlLSErExDeYmX2sAp6pTRbp62Hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TIPD0IT/
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add
 ti-k3-r5-loader handling
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

On Sat, 25 Feb 2023 10:22:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the addition of the package
> in commit 0189bcb47c7733c36fcbcb88fbf26f57958db576:
> 
> make[2]: *** No rule to make target '_defconfig'.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d7449b2b2f2349af672bfeee832b89a223a7d9cc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 5 +++++
>  1 file changed, 5 insertions(+)

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
