Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2250DC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7B5C4091F;
	Mon,  1 Jan 2024 21:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7B5C4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmixcaG3QFBh; Mon,  1 Jan 2024 21:25:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8F4E408E6;
	Mon,  1 Jan 2024 21:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8F4E408E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 853AC1BF954
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8CF541D66
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8CF541D66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d65KyofjBQBT for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:18:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFF9741745
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF9741745
Received: by mail.gandi.net (Postfix) with ESMTPSA id 076A4C0002;
 Mon,  1 Jan 2024 21:18:13 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:18:13 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101221813.2bfe6943@windsurf>
In-Reply-To: <20231230213622.1394276-1-fontaine.fabrice@gmail.com>
References: <20231230213622.1394276-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2y4wvKq79xTeeuuq272GflE7LzuTZGNuAH+AD6YK7/g=;
 b=S9V51MxvWu6O8/eSUD/JhNZzLJApufagZAp879axJ+iQks2q9ZXdKjhCbg2r5C4TENO/Oa
 Uq46sX8jSvXIqjrLUQis1NFcHMMpgKWk0yf+G80Mlz3f+91FVognA28BVjWnBfb7B3ELot
 b5wJZmLt0dpupQXDR+quYHm6yMyAZoW1sTjuFy4wR+wk6DIHltomp9WV442dFNuqQWguL/
 goyf/XFQ3rKvjBoVu8tPoowu2NqHaPwrOn/GjxMOtyQGN67dptpd3Y8m4+MlZpzZ+wlflR
 fnV75P/qLQ46mQmuR7N7rVVKTQAo0JdExSLucYfVTYeQlg+uRy39phximt7rKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S9V51Mxv
Subject: Re: [Buildroot] [PATCH 1/1] package/scrypt: bump to version 1.3.2
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
Cc: Parnell Springmeyer <parnell@digitalmentat.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 22:36:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of COPYRIGHT (update in year:
> https://github.com/Tarsnap/scrypt/commit/c6e440c4f51eeb4aaf5e490734f46cdb06f4b4c8)
> 
> https://github.com/Tarsnap/scrypt/compare/1.3.1...1.3.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/scrypt/scrypt.hash | 6 +++---
>  package/scrypt/scrypt.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
