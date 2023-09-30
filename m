Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FDAE77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4586981871;
	Sat, 30 Sep 2023 14:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4586981871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HwkidmRZUTd; Sat, 30 Sep 2023 14:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71348817ED;
	Sat, 30 Sep 2023 14:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71348817ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1706E1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3336813F8
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3336813F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xr77eAEy_Mug for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:39:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D08F683D57
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D08F683D57
Received: by mail.gandi.net (Postfix) with ESMTPSA id E94E660008;
 Sat, 30 Sep 2023 14:39:40 +0000 (UTC)
Date: Sat, 30 Sep 2023 16:39:40 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230930163940.10ffb6cd@windsurf>
In-Reply-To: <20230930141147.937885-1-ju.o@free.fr>
References: <20230930141147.937885-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696084781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJqjF1rKomQnlV7vPhwfvk80O0/58wMY6V+236SoSG4=;
 b=FevHNkA+SbxJGzzVndN0fob/6JryqDw+BsWQMvSo5d7l0TXLF0KMTnE+1Vsc6Ds6hW4a+W
 Ky2xWwIaqcttxZTKMFYQKcimDXz6j/O7qSB0vsCwvnWDzJ/W2XOV8wcEdQzUrWtx22ViBg
 8o0b9EWs3FVOwESrSt4fi99CsW2eHGbzR64rAy7Y7OiwQYvZR/2FJ/H3M2PQ3+TTNDYPQG
 7nyZ3qwxybRDQxnXLl2NPmDckiquzKeCmIXeueAfoPfbuKo0vzrdIWSN74OnUyaEuqjHX0
 LTrXCzK45BqQHZCdEJh53Hoj79NsPloAwltO7vLq768F2/vaEjJrIzgHSoZG0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FevHNkA+
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.3.4
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

On Sat, 30 Sep 2023 16:11:47 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v2.3.3, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.4
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit c77e25c with commands:

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
