Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4143FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E55AF432C0;
	Wed,  1 Nov 2023 21:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E55AF432C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fX0oKQnKQLbq; Wed,  1 Nov 2023 21:45:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09183432A4;
	Wed,  1 Nov 2023 21:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09183432A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DAB21BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA7D34EEC8
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA7D34EEC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Og-PDtkX1qL for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:44:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 036DB4EE3E
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 036DB4EE3E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40E5A1C0009;
 Wed,  1 Nov 2023 21:44:32 +0000 (UTC)
Date: Wed, 1 Nov 2023 22:44:31 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101224431.330dcfa3@windsurf>
In-Reply-To: <20231016204251.5449-1-fontaine.fabrice@gmail.com>
References: <20231016204251.5449-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698875072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAxJJZ9d+5042zDFXbZE6IzCF1hFutBKGFRHiNdHla4=;
 b=gC2nGaGza9e7+lNQyXI6fO1VCySGP5h5pbTBIOcDFS5Xt7EPg0lWLjEdL4ut/XptMrXuCh
 2PspNFhVM4+SAHAhPtbjk8iLAAG/SkxAAGHGcmid1/1vNtduR7CJDIkaiRYnOxj+ghCDFz
 7nY7+FbhpqaJKFzlcQPXxLICVrRqGFwId5/RLPlP6o2yvGBzkhB66yna5Pq5LGxJzvDLtJ
 u5lSJCNvxTwbkinmDMHIk2eV8Jg2k0LNk77tu6n3kjashsI2kVOl58NhmCjMg+dY1vSnJc
 N7mlSEn9KXXth9vfKDr5YOO4jT9QLL9u1x23Pgs+ohxLwTWDDGLuykGbbVoejw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gC2nGaGz
Subject: Re: [Buildroot] [PATCH 1/1] package/oniguruma: bump to version 6.9.9
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

On Mon, 16 Oct 2023 22:42:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/kkos/oniguruma/releases/tag/v6.9.9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/oniguruma/oniguruma.hash | 4 ++--
>  package/oniguruma/oniguruma.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
