Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359EEC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057E5822FD;
	Tue,  6 Feb 2024 12:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BggB8W8ch3vh; Tue,  6 Feb 2024 12:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D9E8234A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30D9E8234A;
	Tue,  6 Feb 2024 12:58:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD08F1BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F38D40534
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F38D40534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z8MVkqL1IFgR for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:57:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65C6941500
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C6941500
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1B90FF806;
 Tue,  6 Feb 2024 12:57:54 +0000 (UTC)
Date: Tue, 6 Feb 2024 13:57:54 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206135754.2ab265ba@windsurf>
In-Reply-To: <20240110043921.1077310-1-james.hilliard1@gmail.com>
References: <20240110043921.1077310-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707224274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ivvl76rhg5uBdmGiEDQzvALJLV1x9kYMnd9qZjqdP0=;
 b=btBusVYID0c2K19ijNM4iaG+pzPSGxLAKiyVvS4CuMc2NQIeK/FH5lYriovs/ptstDv6QD
 CLQ0CuwaFLbEH+svmc9U2n7C3iC3sScFVqrse0/kv053nZtD6N5cCsxInh+MWXO1bmRB5V
 oYmpvkfANdXUmqrYWE8zQm7eKy78T5iNjmlNf4zMOXTFGYdKA0ju1Q+4vj4n0SLB2sVkgv
 vHyufax7ebYcAhgBelwoHiP+ncz2jLa5RwPA09VJSX5A+VWdA7NWA2/xchI93MQZwztRl7
 MQX74fV470KhLDMCcz75epYYQjxcXgsKmbAwrgq8qn/MDzg6IDR8B8VvvoDYBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=btBusVYI
Subject: Re: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.43
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 21:39:21 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
>  package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
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
