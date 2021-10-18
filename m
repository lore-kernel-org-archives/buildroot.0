Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9F1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:22:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47CEF603E7
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47CEF603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13E94400EF;
	Mon, 18 Oct 2021 19:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i39UJZxR59pW; Mon, 18 Oct 2021 19:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E14240460;
	Mon, 18 Oct 2021 19:22:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6741BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 790C94021F
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tYAPEdj1vvgA for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:19:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE73D400EF
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:19:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E4A7F1BF207;
 Mon, 18 Oct 2021 19:19:29 +0000 (UTC)
Date: Mon, 18 Oct 2021 21:19:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211018211928.4467643f@windsurf>
In-Reply-To: <20211017093228.984724-1-fontaine.fabrice@gmail.com>
References: <20211017093228.984724-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/hidapi: bump to version 0.11.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 17 Oct 2021 11:32:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure raised since
> bump of autoconf to version 2.71 in commit
> ecd54b65c1f998a7ccd91f7c523e4ff38c4781da thanks to
> https://github.com/libusb/hidapi/commit/d15d594a415e5f51d2cd8ff8bb77b3765a539b98:
> 
> configure.ac:16: error: AC_CONFIG_MACRO_DIR can only be used once
> 
> https://github.com/libusb/hidapi/releases/tag/hidapi-0.11.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4e55332625b7e55b338368e231f7bc6086403a04
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/hidapi/hidapi.hash | 2 +-
>  package/hidapi/hidapi.mk   | 2 +-
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
