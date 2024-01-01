Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0D6C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D9014369F;
	Mon,  1 Jan 2024 21:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D9014369F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dD9ZbB3UEw1P; Mon,  1 Jan 2024 21:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E30E436AA;
	Mon,  1 Jan 2024 21:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E30E436AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13ACF1BF3F0
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB8B943678
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8B943678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nvLfG6FGEAQi for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:18:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DA284367D
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA284367D
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB62B40003;
 Mon,  1 Jan 2024 21:18:21 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:18:21 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101221821.7b6dcfea@windsurf>
In-Reply-To: <20231231153748.5996-1-fontaine.fabrice@gmail.com>
References: <20231231153748.5996-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3Y7iwPSjxXOWNRj9jQtu/0wrPv8Hel0OMycdJmlJWM=;
 b=BEtBmSwDl7BN/OGlwFKu33ZLQrhX+dj/oa8JIFXLur4F7wrTf6WMslyJnPpuqtKvt7kHSO
 i7+bJLNV3fs2bulcuvQH+5UF+NzeJjIl7ZddKRqfektCWBC9bgMJ8CdNuNmLEDYPADQ22x
 44fNAVEY78gfq05s7i5bKBK6F185ATP1vpikE1OATUZHycQIXnMh8/+8PVNaQbwjpqJb/n
 +nfwagnq5c2pjwMsf6JCU36szMqdyuMUEusYgrVF8x0HOLYfLCQwY6plvQVJgzrQoRZnbv
 0qXvnD6Kdeht7r1/u1K9JnX5zoehkNxgXlZOXtLfLmfdHB0JxJSFoeq2SKV6hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BEtBmSwD
Subject: Re: [Buildroot] [PATCH 1/1] package/libsoup3: enable vala bindings
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 31 Dec 2023 16:37:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> vala bindings are needed to build gssdp 1.6 vapi bindings and avoid the
> following build failure since commit
> 0cd1096eb067542070a991120c953811d6e5e4d1:
> 
> FAILED: vala/gssdp-1.6.vapi
> /home/buildroot/autobuild/instance-2/output-1/host/bin/vapigen --quiet --library=gssdp-1.6 --directory=/home/buildroot/autobuild/instance-2/output-1/build/gssdp-1.6.3/build/vala --pkg=gio-2.0 --pkg=libsoup-3.0 --metadatadir=/home/buildroot/autobuild/instance-2/output-1/build/gssdp-1.6.3/vala /home/buildroot/autobuild/instance-2/output-1/build/gssdp-1.6.3/build/libgssdp/GSSDP-1.6.gir
> error: Package `libsoup-3.0' not found in specified Vala API directories or GObject-Introspection GIR directories
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e5fbfc95964beac314c9faffc2c12541d0a10a48
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libsoup3/libsoup3.mk | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

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
