Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B35C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A2C18214D;
	Tue,  6 Feb 2024 17:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QT35sfaKt-8r; Tue,  6 Feb 2024 17:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8C5382AED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C5382AED;
	Tue,  6 Feb 2024 17:52:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CC1C1BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2359340B67
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2359340B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIzDx_QAqOHr for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:52:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B39EF40A39
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B39EF40A39
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5C6040003;
 Tue,  6 Feb 2024 17:52:34 +0000 (UTC)
Date: Tue, 6 Feb 2024 18:52:34 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240206185234.04a67c61@windsurf>
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707241955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Elp5WFb+o4KzRooxQbbbHjiRx0rcwdOHCV6TKzgF3ZY=;
 b=ScQZyzeB4R+JOLy4BOeid4oSfhU3PZPnSIJMgDsgXzaXSjEM5IFPlvk6U8wHyu0efO/Ydy
 xIMX6NAljLZNsySiJgzywLZJcOYXJlPqSaAEWmLopkYEr2VzuWj8WA/VGDCLCLNWoJdbnf
 bzuX1DPzt2PczR9VuszNohY/Tp9uSAqUY0vNi1gnTUWIK7ezKX1zbM+P9WikmNvMwWw6qv
 SrEb7eDWSXXy4pqO3fEJ4wjHVhfBFhWEqOnnmY6Tw+k5qftCfdSOuc8fu4bexKeF2puCk4
 NayqZJN6F3610NOfpIA0Y8e73ZOVIKXoJRAoYwQ/FZNHBQW0i0lLumGihkHtzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ScQZyzeB
Subject: Re: [Buildroot] [PATCH v9 01/11]
 toolchain/toolchain-bare-metal-buildroot: new toolchain
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jan 2024 11:22:13 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch adds a new virtual package for adding a bare-metal
> toolchain to Buildroot. For now, it depends on nothing, so it will not
> actually build anything, but it defines some options that will be
> needed by the various packages that will be part of this toolchain
> build process.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Signed-off-by: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  DEVELOPERS                                           |  4 ++++
>  toolchain/Config.in                                  | 10 ++++++++++
>  toolchain/toolchain-bare-metal-buildroot/Config.in   |  9 +++++++++
>  .../toolchain-bare-metal-buildroot.mk                | 12 ++++++++++++
>  utils/checksymbolslib/br.py                          |  3 +++
>  5 files changed, 38 insertions(+)
>  create mode 100644 toolchain/toolchain-bare-metal-buildroot/Config.in
>  create mode 100644 toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk

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
