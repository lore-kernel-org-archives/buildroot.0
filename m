Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7182C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A05610AE;
	Mon,  6 Nov 2023 19:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A05610AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAULY1NV2cCr; Mon,  6 Nov 2023 19:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADD2D61263;
	Mon,  6 Nov 2023 19:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADD2D61263
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 180AD1BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 406F741A2A
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406F741A2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ge9_izdK-NMw for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:40:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F6F4417CE
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F6F4417CE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45C62FF80F;
 Mon,  6 Nov 2023 19:40:40 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:40:39 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106204039.48602e9b@windsurf>
In-Reply-To: <20231105213923.82625-1-fontaine.fabrice@gmail.com>
References: <20231105213923.82625-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CW9yjop1VyMlUSziUOdUhORfk0ofJ2SjRIfjIM2ETVQ=;
 b=YCYPAi+mIS1vqPXoZuNzcsiPjXDMhF6gDWS6y9u0Sb9vXePMZDj9FhQkUyvbkmAzpCv5+i
 XcvzAT+3PbJ1xXZNR466wOiN/qkRduANdFQvUao5qbMu9k12S+lSlN6yL2nawxZ0jrS+bF
 BzGOwAYkDVyQeODc8trqS++EXCAPaRFAFLchInGfIBRR/AfUJQNPhjymGnA4HqlwM7BXq5
 5DTznxrXI4pl4j2ph3iUA4R35v6MTKlSVWAfaTutOQzlRMfxKsL5gUDAf9KWIUbccFp9Yn
 ElPUCtpaUQUkeaaoiiOQXN98k+hBKrPNhSGTNBohG2jtqsK8BBc8X790qEAglw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YCYPAi+m
Subject: Re: [Buildroot] [PATCH 1/1] package/ranger: bump to version 1.9.3
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
Cc: Thijs Vermeir <thijsvermeir@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 22:39:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to github to get latest release
> - Drop patch (already in version)
> - Update RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME as scripts/ranger
>   symlink to ranger.py has been removed
> - Update hash of AUTHORS and add LICENSE file:
>   https://github.com/ranger/ranger/commit/8263cbac888c9619bc024071bafb7b3223a7da83
> 
> https://github.com/ranger/ranger/blob/v1.9.3/CHANGELOG.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...heme-check-for-compiled-python-files.patch | 31 -------------------
>  package/ranger/Config.in                      |  2 +-
>  package/ranger/ranger.hash                    |  5 +--
>  package/ranger/ranger.mk                      |  8 ++---
>  5 files changed, 8 insertions(+), 39 deletions(-)
>  delete mode 100644 package/ranger/0001-colorscheme-check-for-compiled-python-files.patch

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
