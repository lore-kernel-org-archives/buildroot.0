Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE17C71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C90781EB1;
	Mon, 11 Sep 2023 20:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C90781EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6Kj-mKlTn7y; Mon, 11 Sep 2023 20:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4224C81EEE;
	Mon, 11 Sep 2023 20:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4224C81EEE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A14521BF357
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D35961037
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D35961037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UIs6sKRcUvxc for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:07:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9088C61052
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9088C61052
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABACB1C0002;
 Mon, 11 Sep 2023 20:06:46 +0000 (UTC)
Date: Mon, 11 Sep 2023 22:06:45 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230911220645.58fe838b@windsurf>
In-Reply-To: <20230911193301.1438190-1-giulio.benetti@benettiengineering.com>
References: <20230911193301.1438190-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694462824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sb0NevUUGP28WNwtPT77qUpYA/XGWDu0Dvlp5DYooMM=;
 b=JMR4RWX5rOJRce4Vjg4t5mxpNtuaQHMOEU9Pk51859t0FfbLg7Fzr61/CJ0PHlSULpk1Jq
 ZIz79xqTiyOW7gWM2PlZ/YAcQ1RsZI1hNTNR6m9KPU49K9GikvtFt15uvax7azFjhyzb0S
 YVhBi9Wn84T9BJ/0sxU//qdSX9nXKWeEMz02PvIJN6jm2hqh4oentoF424h4KmmFTe8ssw
 07r1qaUkht+bUjL/uCnmr7sn6+Nxs2jJ7hcLL1KDSYmpFLiuR79uJcE4VIGJBCbLIWJpiW
 /ArF0jI11Gyk3z+ciVzw+3uP4KureJ3k9srd9GvKBg7oRThLHWaCZMnE3ufI0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JMR4RWX5
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: bump version to
 2023-08-07
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

On Mon, 11 Sep 2023 21:33:01 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Starting from commit:
> https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=958227890690290ee766aaad1b92f3413f67048c
> VERSION macro should be defined by mmc-utils Makefile itself but it doesn't
> work in Buildroot because it needs to be in a git repository clone. So
> let's mimic what they do in the Makefile by picking the first 6 SHA1 git
> commit digits and set them to -DVERSION.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/mmc-utils/mmc-utils.hash | 2 +-
>  package/mmc-utils/mmc-utils.mk   | 9 ++++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)

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
