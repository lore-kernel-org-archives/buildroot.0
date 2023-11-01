Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE24C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 20:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D32AA40908;
	Wed,  1 Nov 2023 20:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D32AA40908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1IP0oIOKg64; Wed,  1 Nov 2023 20:54:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 695204088F;
	Wed,  1 Nov 2023 20:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 695204088F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E07A71BF5DB
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 20:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EF1D43273
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 20:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EF1D43273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqICCXJoU7DY for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 20:54:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78FCC40127
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 20:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78FCC40127
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13CFA20005;
 Wed,  1 Nov 2023 20:54:33 +0000 (UTC)
Date: Wed, 1 Nov 2023 21:54:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231101215432.0d5a4581@windsurf>
In-Reply-To: <20231030064101.362244-1-bernd@kuhls.net>
References: <20231030064101.362244-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698872074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKHEVIZhXr7vn5adTeGQ6Vrttp5kWlmZlLXPlH/FM4A=;
 b=W7EGEXN6jC1Ar/8JOG8Ul87NHUDHZmBfb79UEPTUk57BkgHnxJNqFqdNq0TYnFozUQ7cnC
 9NEUC7zyNLthsykkA4LZJRrdVZJohjkNCkefQEn6LIy9WoEyqFyD91EpI4tzor6L6IB9RG
 mkfoGk+33bG2Umjx2KaYrGpYhHy0KTTXN3/AO9D2xh0gMzF9/MUv52V72vVfCd24IRbFME
 xqMvc7+X64x2DEeptntEEYKX5NjbcUn+wAeLCllmFljEQ9o7cLl7WWnX/ePG/Yl4OTcmOm
 9zLVqO7T0AZdoZa0rIG88PDd2ki6Aip2JymaVS6pTI+/qRPAFDDTeIHo8nCSSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W7EGEXN6
Subject: Re: [Buildroot] [PATCH 1/2] {toolchain,
 linux-headers}: add support for 6.6 headers
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Oct 2023 07:41:00 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> And add (and default to) 6.6 to linux-headers.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/linux.hash                                    |  1 +
>  package/linux-headers/Config.in.host                | 13 +++++++++++--
>  toolchain/Config.in                                 |  5 +++++
>  .../toolchain-external-custom/Config.in.options     |  6 +++++-
>  4 files changed, 22 insertions(+), 3 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
