Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF169C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B8C440B48;
	Mon,  5 Feb 2024 21:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B8C440B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TK-j0Bfhwopx; Mon,  5 Feb 2024 21:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FCB940C07;
	Mon,  5 Feb 2024 21:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCB940C07
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 488D61BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FB9781EAB
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FB9781EAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QcqLmirz3mZP for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:32:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 243BE81E10
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 243BE81E10
Received: by mail.gandi.net (Postfix) with ESMTPSA id 780F31BF205;
 Mon,  5 Feb 2024 21:32:38 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:32:37 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205223237.6bed1124@windsurf>
In-Reply-To: <20240126221323.1780561-1-fontaine.fabrice@gmail.com>
References: <20240126221323.1780561-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707168758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wq4SmkHE3v27JYlosb5Do6sZdp25ACus2WAv1LWSnwg=;
 b=mtifnLesKhBCFDhihPX7joyURF/YwB/05iI23mkVLELY+OgtqgBMjVj0Bw8oCEfH5j16Tk
 UzRvFOA6/g2Ieud62exXCFiW89mCOVl//ONfMWyQ4Kzl2/J3lvwMC3opWBPdTaRjutXHNE
 zEbwLQzyIm3pvpKbJaN6BIxHw62IyWxjFuX032fMc7qlJ3TF9mzI6pqaNGEQIfBBUL+8hC
 u7fxjPB+o6OqgvARdJXoeHy01k110sLdoeDVOxlrKVW9jrmRRzQAb/0oTjpQdVgoSwIYT1
 NzZtLQRtDyt0JOZ1LNX2RwvPWpEAFBgHy/+aoupZCsekKuQGPnLUW99Z8Ob6AQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mtifnLes
Subject: Re: [Buildroot] [PATCH 1/1] package/minizip-zlib: bump to version
 1.3.1
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

On Fri, 26 Jan 2024 23:13:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/madler/zlib/releases/tag/v1.3.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...lows-of-zip-header-fields-in-minizip.patch | 39 -------------------
>  package/minizip-zlib/minizip-zlib.hash        |  2 +-
>  package/minizip-zlib/minizip-zlib.mk          |  4 +-
>  3 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch

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
