Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C6DC3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44F03405F5;
	Mon, 25 Dec 2023 20:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44F03405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFdc_uA8m5yp; Mon, 25 Dec 2023 20:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5405240636;
	Mon, 25 Dec 2023 20:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5405240636
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA211BF94D
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AA4E80EC9
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AA4E80EC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJBIL77yzMsa for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:45:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4388580ECF
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 20:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4388580ECF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 674EB20002;
 Mon, 25 Dec 2023 20:45:36 +0000 (UTC)
Date: Mon, 25 Dec 2023 21:45:35 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231225214535.17d78fdd@windsurf>
In-Reply-To: <20231225193842.87962-1-francois.perrad@gadz.org>
References: <20231225193842.87962-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703537136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KXtVvxyd7QwoUfxWCdfEumSru6ZP4yjKKVdY4oC4aKo=;
 b=NS9REEjkXVDxTDSsRO4PvQn/3vcfDyKmyxe1B6MBWgIOignfFpFXys8t1ZcMQs14xdpBAm
 nCEWC0yXnGjFfehLtgZQ6WCm65QZmhZVLFfUYwkVkPJW5awqd14WODi0KRKzafd78HHkqM
 xjgIa31fBeq4dG9r9TQvt8KmDq1ZRPwki61ipPZNUZEKZXtQILCX5ja0Ur94N96kluKPco
 8ttWKfR1QuouDtgxyBwDQ1dTHVlaitapKgR6BfL3mHCDKeOXr7jUeBbKZvp/F7DeuDLuPF
 QK3akmQ6q0qKhKsRhSEKiPepmfsqwG+yelkeprLeblzrUhRKKvxnoBKYeIt7Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NS9REEjk
Subject: Re: [Buildroot] [PATCH] package/libatomic_ops: bump to version 7.8.2
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

On Mon, 25 Dec 2023 20:38:42 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libatomic_ops/libatomic_ops.hash | 2 +-
>  package/libatomic_ops/libatomic_ops.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
