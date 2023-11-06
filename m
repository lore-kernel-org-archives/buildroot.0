Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0440C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9126761245;
	Mon,  6 Nov 2023 19:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9126761245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lD6maS4iBVIS; Mon,  6 Nov 2023 19:33:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E335D6125E;
	Mon,  6 Nov 2023 19:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E335D6125E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 822311BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 686EE8242D
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 686EE8242D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbhsHwKh4zh2 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:33:47 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DE30820C3
 for <buildroot@busybox.net>; Mon,  6 Nov 2023 19:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DE30820C3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CCC6240004;
 Mon,  6 Nov 2023 19:33:45 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:33:44 +0100
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20231106203344.3f06deba@windsurf>
In-Reply-To: <20231106102959.15047-1-mf@go-sys.de>
References: <20231106102959.15047-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxYehRNHOoDOwT8NlVdHR81bwlJ9k2IsO+lB65Z/RhQ=;
 b=TrLZ/fMnxYRIZA63hVGxRIBdrTpgTVYRn2JRVnZsCt7IlMWK0UeZBR1GFJCBTePDkEq2Ab
 1naZx67s9dXtfsFWdMlhsmBcuz/vYgFPVnnFcovw06e2NHHCvi/pMwga41IFYgtJeFTLrZ
 pyRhTPCcoa0Ai5Ej30BFIj6/hLPWrb7B1xJuS9OO4Sp000T2EPCJKYS5NZgLtl8z6sLwd/
 h5LNJbhs71QC9TKwft6g4ae7knUjORohdSobCqXH7yciR6tfYmnbd21y5WNEuFrBLF5xXG
 sd4x+u//DN6QrfuFEYthvF1g+n+NJnGrgZZzZmQXQBEJuQp+AbW4eX5O8uD80w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TrLZ/fMn
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.28.5
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 6 Nov 2023 11:29:59 +0100
Michael Fischer <mf@go-sys.de> wrote:

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/sdl2/sdl2.hash | 4 ++--
>  package/sdl2/sdl2.mk   | 2 +-
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
