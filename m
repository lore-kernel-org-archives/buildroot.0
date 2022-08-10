Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13126C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BE9982919;
	Wed, 10 Aug 2022 21:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BE9982919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rd1_HtFgttU7; Wed, 10 Aug 2022 21:15:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D901682882;
	Wed, 10 Aug 2022 21:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D901682882
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8525A1BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6050D82882
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6050D82882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEfvj_Qa5IIA for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:15:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AEF81D5F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48AEF81D5F
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:15:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 35C211C0004;
 Wed, 10 Aug 2022 21:15:14 +0000 (UTC)
Date: Wed, 10 Aug 2022 23:15:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220810231510.72575c9c@windsurf>
In-Reply-To: <20220810053102.2625513-1-james.hilliard1@gmail.com>
References: <20220810053102.2625513-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660166114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNacj4GDZK/IBrRcTDQ77HjuBwGK5orcGtgLcVBNqIQ=;
 b=A6hR/vLqcTZTHyh6M1D5qJfQ38tg+h8+pKirr7EnVsQ38ZGIZd+kWnX+m/gOwEPWSpCNsb
 MWi8+iX6c9OkbdveXycbnug8mVqG4XzgJ6QHr1m196mFQTMaJKD8uMtHlTX98rPT+yu0Q1
 4sAiqxrsCNcS9p7dEAWSx8CRLSdGNJBwORghxtADUiW7wV8Prvll3QDLQInXSkBlyoGcsI
 F1Tk6EBQfO41ScNHlKlSuc52NRLHf7e7mv3N8F0FCuBt8ib4r35WHZzT2le6kkVQWEfL/w
 GxyrqwLAD6ehvvcBromM63V5xkmBdxt4ak7K3J/jLR46Nw9Tz5Lzn5k31vnmig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A6hR/vLq
Subject: Re: [Buildroot] [PATCH 1/3] package/python-setuptools-rust: bump to
 version 1.5.0
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Aug 2022 23:31:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
>  package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

All three applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
