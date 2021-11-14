Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59338C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:09:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E30EF60F70
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E30EF60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8EC760716;
	Sun, 14 Nov 2021 14:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsVAcA4c0aFD; Sun, 14 Nov 2021 14:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CAD5606D3;
	Sun, 14 Nov 2021 14:09:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9BA1BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D14880D22
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZG1GAT01qf27 for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:09:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B1F480D0D
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:09:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8BC8820002;
 Sun, 14 Nov 2021 14:09:08 +0000 (UTC)
Date: Sun, 14 Nov 2021 15:09:07 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <20211114150907.0170eb25@windsurf>
In-Reply-To: <20211108192742.456355-1-texier.pj2@gmail.com>
References: <20211108192742.456355-1-texier.pj2@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mxml: bump to version 3.3
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

On Mon,  8 Nov 2021 20:27:42 +0100
Pierre-Jean Texier <texier.pj2@gmail.com> wrote:

> mxml 3.3 is a bug fix release. Changes include:
> 
>   - Cleaned up usage of free throughout the library
>   - Added more error handling to the library
>   - Fixed potential memory leak in mxmlLoad* functions
>   - Fixed mxmlSaveString with a buffer size of 0
>   - Fixed MXML_MINOR_VERSION value in "mxml.h"
>   - Fixed POSIX threading support for MingW
>   - Fixed some minor memory leaks found by Coverity.
> 
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
> ---
>  package/mxml/mxml.hash | 2 +-
>  package/mxml/mxml.mk   | 2 +-
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
