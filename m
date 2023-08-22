Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F073EE49AE
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E234B40213;
	Tue, 22 Aug 2023 20:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E234B40213
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVll5mt06yD8; Tue, 22 Aug 2023 20:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E4640206;
	Tue, 22 Aug 2023 20:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1E4640206
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1790F1BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEE0440206
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEE0440206
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGrdrylY6CGP for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:42:07 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81EFF40210
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81EFF40210
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F88F20003;
 Tue, 22 Aug 2023 20:42:05 +0000 (UTC)
Date: Tue, 22 Aug 2023 22:42:04 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230822224204.1b3c415d@windsurf>
In-Reply-To: <20230809205434.312601-1-ju.o@free.fr>
References: <20230809205434.312601-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692736925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=980Eq/dN5NCjB5QhZ/LtxaHdXZZm14qdgHediZ9+Uzs=;
 b=VlM827gWYLPjIMuxLJuK5g1GmaHx/MZPDVJii18oiuM9iYMUT3c9PRaBbP0Q83KcLMn1a1
 7SUeb9eSDEPjVt61QsrqmphPUJv+WSbJRPxOG9rAuoX7SNHWQOMMJTP4pN/pKzBXUQNmoi
 b6/fBiqo42y8b8iPZdyn1YTYu7sZ60T37kXNCBZ+FNEb5+Q0C2Sk0BTtXYABsvgW1dnCTP
 RK2GHTepQ9Uqs4OiJx9EOQm45viZzJv4ImH9mx92fep1gbM51RdwwssBAU2RBl9kXdUAk7
 g3GGMYVY/8+1YRZ1Nf6cZt2Fzyr2Mlhmrel2qVTn4BXfv+BOjjJdEW3IBf4Xcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VlM827gW
Subject: Re: [Buildroot] [PATCH next 1/3] package/kmscube: bump to latest
 commit ea6c5d1e
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Aug 2023 22:54:32 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Changes since commit 4660a7dc, see:
> https://gitlab.freedesktop.org/mesa/kmscube/-/commits/ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/kmscube/kmscube.hash | 2 +-
>  package/kmscube/kmscube.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
