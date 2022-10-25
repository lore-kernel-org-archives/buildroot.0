Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBD7C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F983402B1;
	Tue, 25 Oct 2022 18:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F983402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_IKUuNBUQjm; Tue, 25 Oct 2022 18:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5540B402A9;
	Tue, 25 Oct 2022 18:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5540B402A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8B611BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B461C4012B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B461C4012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KM34hVOUMSbX for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:23:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9692F4010C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9692F4010C
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:23:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D96860004;
 Tue, 25 Oct 2022 18:23:11 +0000 (UTC)
Date: Tue, 25 Oct 2022 20:23:09 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221025202309.506460be@windsurf>
In-Reply-To: <20221023204719.31316-1-fontaine.fabrice@gmail.com>
References: <20221023204719.31316-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666722192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0q/NDXaQBwDlaEF4uzzyfrhEF7al+d6zN/QKNGMBtM=;
 b=kyBJwjLBLI2H/v1vZgOZ0kolBvEe/N9Rprz3DGca2PNLSnTcQcS9LEIdEkKMRTIq4lvpQK
 81RmFbU4LVn1gCLCqK5DCazAGNwuoenEEsNorJESCeVGy6DxvQzjD1UJ10goPQ7gES3Ee1
 BH1EVwyg+Ok+9JffiebLItw7YJ3Ir9CrXZTEOLJd8p9E4W526J+dmPNJgrj2cOTKQJ+q10
 3U/e0FXl+46v2a3Kh5fIDaEfH4OAKzy9QSkg7ckiOKOBOCDpRWSwJxc1C8RFRglNGSc8Oj
 rxGJeGhxYgqG0fWxKzXfQUr1eGiFJy9DR8ze2sgEGTT4wQEHRaRoqqwB/oWF5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kyBJwjLB
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: bump to version 1.6.38
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Oct 2022 22:47:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Version 1.6.38 [September 14, 2022]
>   Added configurations and scripts for continuous integration.
>   Fixed various errors in the handling of tRNS, hIST and eXIf.
>   Implemented many stability improvements across all platforms.
>   Updated the internal documentation.
> 
> Update hash of LICENSE file (update in year with
> https://sourceforge.net/p/libpng/code/ci/723b2d9f2e2bb65c605274ee052f9773e594a5aa)
> 
> https://sourceforge.net/p/libpng/code/ci/v1.6.38/tree/CHANGES
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpng/libpng.hash | 10 +++++-----
>  package/libpng/libpng.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
