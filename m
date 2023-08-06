Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256C5C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE0B3819BC;
	Sun,  6 Aug 2023 12:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE0B3819BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBhv_WcyApfW; Sun,  6 Aug 2023 12:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F08DE81EA2;
	Sun,  6 Aug 2023 12:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F08DE81EA2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A064A1BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6967A402A7
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6967A402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Q5MbcLSPXY8 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:05:39 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FBE4402E4
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FBE4402E4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61EEE240002;
 Sun,  6 Aug 2023 12:05:37 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:05:36 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230806140536.0f5dac52@windsurf>
In-Reply-To: <20230804193801.93049-1-giulio.benetti@benettiengineering.com>
References: <20230804193801.93049-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691323537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJiE97hrqotSFjHyD7dxue16H51gCx+ECpvIdjerhb4=;
 b=ZoYtQlmtaPzwhec9JS8Md8efGPF7RH103AB0n5q8oKstfmSKyiRUxFVyb2GmPPXoi2ogZo
 +y1ifVz2SEAbUXrtOmcSlUJJqe6rY7/K4biXw72YLQ+lnkU4kYKJSbyKdnjQ0R5AgM1KME
 ZoGtQ0xJfQ5QqoS9Eoeuuas6FiVgxj7rIhHN1iMSR/KQ/XXPH7v41A/+hBysWBgtRfVxlP
 9GTXQxO0kY/VNtbtxWAjP3klxzRU1MWaO1irT/sVM7e4FrneMgn2eCqxlQ16VoLrvK51y7
 GeBfkoqW+ur7IKPeTra6ZxiViP/pf7/8aeadwka6I2BsmA50RtoAmT0EgYwOwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZoYtQlmt
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.1.1
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

On Fri,  4 Aug 2023 21:38:01 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/harfbuzz/harfbuzz.hash | 2 +-
>  package/harfbuzz/harfbuzz.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
