Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2938EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 20:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC5E41C5F;
	Wed, 12 Jul 2023 20:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC5E41C5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDHPa-2fCwJo; Wed, 12 Jul 2023 20:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3947D41D66;
	Wed, 12 Jul 2023 20:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3947D41D66
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CFE41BF400
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 20:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1340E82E5F
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 20:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1340E82E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBd7IAu78lNW for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 20:57:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85C8682612
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85C8682612
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 20:57:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84790C0002;
 Wed, 12 Jul 2023 20:57:17 +0000 (UTC)
Date: Wed, 12 Jul 2023 22:57:16 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20230712225716.19da51c3@windsurf>
In-Reply-To: <20230611233619.128038-3-grzegorz@blach.pl>
References: <20230611233619.128038-1-grzegorz@blach.pl>
 <20230611233619.128038-3-grzegorz@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689195437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HawjRX1Y4xz4uxGvFm/AYHcorzMU+uvCowNL28K+RFs=;
 b=c/c19wWLh5KSXYAMzyi/vQUpUnq/D0bVT+R5TLvnb3qV9Oo5zEoV+r8BQaZ9i8lX7yh48z
 Qwr4fadEHAxpWOJk7DT88+Z2qr3lDHRD1xe4c9bXA373sPURH61dnftIX75o65lyKmUhY1
 8Y/ipJa6ZssbJREU435QL4tlaAToWNw91Kl8FpvWuT57ezgHIBUMV4BbEU6K8j9JeVA2rP
 3wXe9eC6pe2CGBHu6jaJrxq2YzJxp2u10HLyPyIZoT3GdmzFnSL6wDXKQanmesy44+uEoh
 bCIEwpjx2cFV4vC1Kw++GsZJEs2Mp+lGd+Fct40Bfh8GUvKWFUne4eL+Y19JtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c/c19wWL
Subject: Re: [Buildroot] [PATCH 3/6] package/python-hiredis: bump to version
 2.2.3
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

On Mon, 12 Jun 2023 01:36:16 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  ...0001-setup.py-fix-build-with-gcc-4.8.patch | 43 -------------------
>  package/python-hiredis/python-hiredis.hash    |  4 +-
>  package/python-hiredis/python-hiredis.mk      |  4 +-
>  3 files changed, 4 insertions(+), 47 deletions(-)
>  delete mode 100644 package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch

I applied this patch, but there were several issues with it:

(1) It was breaking "make legal-info". Indeed the COPYRIGHT file has
    been removed, and replaced by a LICENSE file, with different
    contents. This required changing the .mk file and .hash file

(2) The commit log was not mentioning was the patch was removed

(3) The .checkpackageignore file was not updated to account for the
    removal of the patch.

I've addressed all 3 issues, and applied!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
