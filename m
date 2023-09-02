Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBF1CA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3B6B40CA1;
	Sat,  2 Sep 2023 07:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3B6B40CA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8-7Y8LIfvsz; Sat,  2 Sep 2023 07:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F07354171E;
	Sat,  2 Sep 2023 07:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F07354171E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE7BA1BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8369404ED
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8369404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIioW2bpwoYY for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:47:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5037D40AAB
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5037D40AAB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30200E0004;
 Sat,  2 Sep 2023 07:47:14 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:47:13 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230902094713.0e42841d@windsurf>
In-Reply-To: <20230830080013.1862029-1-thomas.devoogdt@barco.com>
References: <20230830080013.1862029-1-thomas.devoogdt@barco.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OY8maurjWhshU8EUe1bve0VVO2VHTv/BQPA/tGDIrKI=;
 b=csdWV5Or7iqvioCc1J3lDsTaSqhyBb+g+7OWqk6HQL5PbOPZDplu5TRpC4aEGBLIkyHKfY
 hS+zXxAPTgnyh0CTToi3i6CHZZAxgyRPAVZyOOOZaDqT0CR7KjlfAmXPDEjHbfdkVrNfDA
 SNEA92zVZt2Al6DRbQ4xfd+FsEjN1m0/5kf5JS8HiWp4/zRX8yWQCFfjWFDdptxaVG/pWm
 z0FLjaB4mXLJIfiLxJd0w5/i6NRl0Z1TYs8QcYFIy6TId8daGh6dHpjohlQmYRpRD/jgyh
 WVTzFdu5XV0U3qw19g/Vnl3Uq1Rt+OPdtnkvvJ4QkvhymB9sR/WzjSEWMGwG1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=csdWV5Or
Subject: Re: [Buildroot] [PATCH v2] package/libsrtp: bump to version 2.5.0
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Aug 2023 10:00:13 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> https://github.com/cisco/libsrtp/releases/tag/v2.5.0
> 
> See detailed change log:
> https://github.com/cisco/libsrtp/blob/v2.5.0/CHANGES#L3-L43
> 
> Dropped patch wich was already upstream.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
> v2: update .checkpackageignore
> ---
>  .checkpackageignore                           |  1 -
>  ...legacy-OpenSSL-to-fix-LibreSSL-build.patch | 86 -------------------
>  package/libsrtp/libsrtp.hash                  |  2 +-
>  package/libsrtp/libsrtp.mk                    |  2 +-
>  4 files changed, 2 insertions(+), 89 deletions(-)
>  delete mode 100644 package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch

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
