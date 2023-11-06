Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8120DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF21421C1;
	Mon,  6 Nov 2023 22:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF21421C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9RdlT_qouQK0; Mon,  6 Nov 2023 22:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3DAA42149;
	Mon,  6 Nov 2023 22:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3DAA42149
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69A881BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42B58612CA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B58612CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pg9GPUbDZGc7 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:53 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F5BF61286
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F5BF61286
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A22B60003;
 Mon,  6 Nov 2023 22:25:51 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:24:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232413.56949ae3@windsurf>
In-Reply-To: <20231105061704.2855717-1-james.hilliard1@gmail.com>
References: <20231105061704.2855717-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Msbz/7yn+ZihIhrhpRZktyQQNuBtJSM8oAMuOZ8mdX4=;
 b=PvHYK5n/k7Up0gcpSNCBIcrm4Iu8SgTMNwOkYvaLtWohK7uM0GL+3wpmIrCTjDfLGVixJr
 1dn0wE8gR5DEyUg/NwZ2H/+PMtMu7Wi5gDjJHQh7Jc9BSHp6SFw58SoTDzATNwR8RME/7E
 Xc97j2VoKfyvd6EiJ02pSZsyjvltF3QWYkCOLI2GGZaGA5+ceGTqRVsp+0O+ttVZVF6X/x
 CEVqTcPmm6TWJx3efl765C5b/Ebr7TPBKhbflblBxCSHSbp1H93/X0+A/0Ke5O8MWkTWV2
 jiQHflxFi9JCxIPi/fp59mdw42c5FG0X9EFnFSj02STxGowxUxxcsuUrhmBV8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PvHYK5n/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-smorest: bump to
 version 0.42.1
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
Cc: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 00:17:04 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
>  package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
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
