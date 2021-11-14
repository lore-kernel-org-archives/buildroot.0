Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D546FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:29:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67CF66112E
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67CF66112E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33CF040105;
	Sun, 14 Nov 2021 15:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LqFYJPXFiYUn; Sun, 14 Nov 2021 15:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C0A94017D;
	Sun, 14 Nov 2021 15:29:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E03AA1BF964
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D10BA80C36
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3k0iLDcbE-DV for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 15:29:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0315380C2D
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 15:29:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 30CD0240005;
 Sun, 14 Nov 2021 15:28:58 +0000 (UTC)
Date: Sun, 14 Nov 2021 16:28:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Leonid Yuriev <leo@yuriev.ru>
Message-ID: <20211114162858.589cfb6a@windsurf>
In-Reply-To: <20211025181410.1346690-1-leo@yuriev.ru>
References: <20211025181410.1346690-1-leo@yuriev.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.1
 (stable, bugfix release).
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

On Mon, 25 Oct 2021 21:14:09 +0300
Leonid Yuriev <leo@yuriev.ru> wrote:

> This is stable bugfix release of libmdbx. So it is reasonable to backport
> this patch to all applicable releases/branches of buildroot.
> 
> Please refer to the ChangeLog for more historical information and actual TODOs.
> https://github.com/erthink/libmdbx/blob/master/ChangeLog.md
> 
> Release notes: https://github.com/erthink/libmdbx/releases/tag/v0.11.1
> 
> Signed-off-by: Leonid Yuriev <leo@yuriev.ru>
> ---
>  package/libmdbx/libmdbx.hash | 2 +-
>  package/libmdbx/libmdbx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
