Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9D4C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 20:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE2982173;
	Sat, 23 Dec 2023 20:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE2982173
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZP6h9upqObX; Sat, 23 Dec 2023 20:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1CC98216C;
	Sat, 23 Dec 2023 20:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1CC98216C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B18E01BF32A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96C50405A7
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C50405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLk0VHvJepyH for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 20:00:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 434CF40591
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 20:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434CF40591
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D0D120004;
 Sat, 23 Dec 2023 20:00:34 +0000 (UTC)
Date: Sat, 23 Dec 2023 21:00:33 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231223210033.39b7c410@windsurf>
In-Reply-To: <20231129180429.436635-1-adam.duskett@amarulasolutions.com>
References: <20231129180429.436635-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703361634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPSO3+IuB74bFmTWUWtYZMBc+LQ0kav7cG9qCs88AkU=;
 b=XAo11i8vAiPXTXVOhYsXAXuqSorHuK9hQ2XKPFmLq8CDGI4m+XTfLpLEPtXifkaiNlyql7
 4P4LJNvpROzbYqKP0OH5bvTjhQbmm17H3nac6Je/DjivMTwPYmryb9e8ty+kNYx7aBarl+
 jiqGCkQVEJLGaLzQjBSDUA1MzJTj+TYSYOLv+ZH0EGDYOgV7HKCDMi5bmEbNiK5y819rQS
 ZbZIrTJA3JUSQVmT2/rGC+kZxfbxBcHkmbOLIz6uNci1QjXi4eKPuHSMNiFAFr96RNefyz
 jjf0uuee27M+X+JpF9dANSp3LOslQ6AdAKZ8hg2Kg68XSovrptO5ccj3S1Z7VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XAo11i8v
Subject: Re: [Buildroot] [PATCH 1/1] package/openrc: bump version to 0.52.1
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

On Wed, 29 Nov 2023 11:04:29 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> The runscript and rc binaries have been removed in this release. However,
> Buildroot does not use those binaries, so only a simple version bump is
> necessary.
> 
> Fixes:
>   - cgroups being inconsistent
>   - Start-stop-daemon did not work correctly on Linux 6.6
> 
> Tested on Debian 11 and Fedora 39 with the following command:
> ./support/testing/run-tests tests.init.test_openrc
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/openrc/openrc.hash | 2 +-
>  package/openrc/openrc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
