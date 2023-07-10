Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1D2EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 681AF4007C;
	Mon, 10 Jul 2023 16:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 681AF4007C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0-JJ3A3xEmP; Mon, 10 Jul 2023 16:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68521401D3;
	Mon, 10 Jul 2023 16:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68521401D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A35FB1BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CCB381F93
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CCB381F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTeQrpvEPsQq for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:20:17 +0000 (UTC)
X-Greylist: delayed 23:51:59 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 444D881F8F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 444D881F8F
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:20:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F3D2FF80A;
 Mon, 10 Jul 2023 16:20:13 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:20:12 +0200
To: t123yh.xyz@gmail.com
Message-ID: <20230710182012.20a5eeb4@windsurf>
In-Reply-To: <20230710135752.1849099-1-t123yh.xyz@gmail.com>
References: <20230710135752.1849099-1-t123yh.xyz@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689006014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWwW+R0I8ZiCjgyDvmTCxag9ccGoDRAk3r1ylDvYuq0=;
 b=F9ZGsVzu9IoB8cx8EJ+al6VKmeWIjPlfYjDbVocVPI7JCDazVvLHRptTK9yVK2PSaEzIrX
 /JOmAPg1BebvdI+z6cSJ6wOTfY6+Fi3sPMZGYzJIQ1nrd2HvLm52nQjISz1Ik8G9juyr3Y
 B3dADKKdaU/cLYFMqWdKJWyGlBMz05U08vsyYGn3gq7LyIrg/a0+785ByBhyJrFfqjM6he
 GlI4FK6bt8NrKaltqJ0Iz9f2Jfc9TwLfk5fvDYS7pEXrRZ4bF+znu5KkIFgWcPEKJEw1Rt
 2rgWZ2tCkIdXNwG+jKMbqK5Ro1DyK+DfvRY9OpzBCwBB/YHk4ZI+hoUUG9iiFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F9ZGsVzu
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix AC_CHECK_FILE
 error
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
Cc: Marcin Bis <marcin@bis.org.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yunhao,

On Mon, 10 Jul 2023 21:57:52 +0800
t123yh.xyz@gmail.com wrote:

> From: Yunhao Tian <t123yh.xyz@gmail.com>
> 
> Commit [1] in bluez5 introuduces AC_CHECK_FILE against ell library,
> which produces the following error when configuring:
> 
>   checking for ./ell/ell.h... configure: error: cannot check for file
>   existence when cross compiling
> 
> As this check is not critical in our use case, this patch removes the
> relevant lines in configure.ac and configure to prevent errors.
> 
> [1]:
> https://github.com/bluez/bluez/commit/1106b28be85ac9586d1758839226e163e9030ee2
> 
> Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>

Thanks a lot for this patch. However, I think there are several issues with it:

(1) We don't want to patch both configure and configure.ac, we want to
    patch only configure.ac, and use BLUEZ5_UTILS_AUTORECONF = YES

(2) AC_CHECK_FILE supports a cache variable that should allow to
    preseed the result of the check. So passing
    "ac_cv_file_${srcdir}/ell/ell.h=yes" should work-around the check,
    of course assuming the relevant quoting is added to prevent
    mis-interpretation of ${srcdir} in this context.

(3) Using AC_CHECK_FILE here is really horrible. The bluez5_utils
    configure script should be improved to use pkg-config to detect the
    external ELL library.

I think in Buildroot for now (2) would be acceptable, but (3) would
definitely be a nice contribution to upstream bluez5_utils.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
