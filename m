Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38010C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFBAF80B97;
	Sun,  6 Aug 2023 12:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFBAF80B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfbI93-Ywnl8; Sun,  6 Aug 2023 12:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27671819D6;
	Sun,  6 Aug 2023 12:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27671819D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8631BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0CF881BC0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0CF881BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id feHC4mpk_MiQ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:26:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2F7B818AC
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2F7B818AC
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEB3BFF802;
 Sun,  6 Aug 2023 12:26:29 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:26:28 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230806142628.254749aa@windsurf>
In-Reply-To: <20230804062006.2398819-1-neal.frager@amd.com>
References: <20230804062006.2398819-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691324790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I29dYqaV6Oc2/vMQMGnq/H2tjbbjIUSNZ3sr9rEFl1E=;
 b=jDRoNam4DM3i6x77RvBIn6DIoa+MBBv/SB+w3EWO/Ej/a4pKM8AxzwhRVcPpHd5IgbADUn
 WIXl0/Qa4Ag4UvbVYzE0iIXHPuU+dixiTVeMyeGbqw5MMlgCdAuSIW6v+gY8ip0ijt8yYu
 Cs5EZXYFYUB65QwlC38bSTjANVyOMC7XyLzM9dSvbquvXX/Iv5IiwmJd9Rq7qBFWebe6GQ
 Z+Wt+SXdargPVj+D+jbamSZZWU1/bJhc/u6Rh/ccm1A5Oz5PiYiBgu1uzFmlPpTXYj79KN
 zSd7SExt2IfojOQr3y5ZeTmpfb3U8IkQprqW4b/wCH6C9X775LN27QbNWPtXbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jDRoNam4
Subject: Re: [Buildroot] [PATCH v2 1/1] board/versal: clean shellcheck issues
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
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 4 Aug 2023 07:20:06 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch cleans up the shellcheck issues in the versal post scripts.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>   - Removed " from lines within the cat command as they are not needed
>     to clear the shellcheck issues.
> ---
>  .checkpackageignore        |  2 --
>  board/versal/post-build.sh |  5 ++---
>  board/versal/post-image.sh | 14 +++++++-------
>  3 files changed, 9 insertions(+), 12 deletions(-)

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
