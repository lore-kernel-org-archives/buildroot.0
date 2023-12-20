Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7740DC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26EDD403EA;
	Wed, 20 Dec 2023 20:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26EDD403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2-dVPxuduUe; Wed, 20 Dec 2023 20:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3079E43706;
	Wed, 20 Dec 2023 20:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3079E43706
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AC161BF255
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DABE08219D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DABE08219D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYmAuhoglR5T for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:59:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4448F81D18
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4448F81D18
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9633620004;
 Wed, 20 Dec 2023 20:59:32 +0000 (UTC)
Date: Wed, 20 Dec 2023 21:59:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231220215931.354467ee@windsurf>
In-Reply-To: <20231125013807.213822-1-james.hilliard1@gmail.com>
References: <20231125013807.213822-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703105972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejsxd34fWqcGVOW4StZOTfYtAENzYTIqoh+/cXDnqqc=;
 b=I7MlXm/E+A1ula9j72Hcv7GhYxmqkVJgzqtOxjwErChaBAc+R6+KV3yBwRtRhOlFXnYJSo
 tLcvUSCa6SzoCKig3IIJxpCH26RIMIHSFwhUUsf8FCP5iHnFQZrPXLed86TgxlSi9lJyBH
 b2blcuLd01JunotAetq/+/rcdCuYhhGDuoCdnk2DlLp4r1QABRtJEDRBgoCJg7VOFf6emk
 R9CsmjjfkrKjJu4DrA2ThvctGu8YL8vlkeNn/ZTgWhqdWF2a1QY+DOy0g+cmzzTBVLphMH
 xnucRxc7uw0BOzu41FHbDelPV2SiDRWx1jDNECbclsf9nEhGk3VD/TfvV0AmVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I7MlXm/E
Subject: Re: [Buildroot] [PATCH 1/4] package/python-pyproject-metadata: new
 host package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Nov 2023 18:38:04 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-pyproject-metadata.hash                 |  5 +++++
>  .../python-pyproject-metadata.mk                   | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/python-pyproject-metadata/python-pyproject-metadata.hash
>  create mode 100644 package/python-pyproject-metadata/python-pyproject-metadata.mk

I have applied the entire series, but to be honest, your patches could
REALLY use some more detailed commit log. I had to research in the code
of python-meson-python why it needed host-patchelf. It sounded a bit
odd at first sight to see this dependency in such a package. It would
tremendously help the review process, and increase the confidence in
the patches if you could provide a bit of background information.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
