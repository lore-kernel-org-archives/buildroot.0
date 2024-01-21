Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EC7C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 13:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4FD041680;
	Sun, 21 Jan 2024 13:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4FD041680
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M3ZxWPXNx0fO; Sun, 21 Jan 2024 13:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEA13416A5;
	Sun, 21 Jan 2024 13:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEA13416A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4571BF577
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 13:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3283E82690
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 13:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3283E82690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5SCkExEq5k6 for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 13:12:12 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CF638267C
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 13:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF638267C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 019C813F8B5;
 Sun, 21 Jan 2024 14:12:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 14:12:05 +0100
Date: Sun, 21 Jan 2024 14:12:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Za0YJSXFxMiKvO0j@landeda>
References: <20240111105621.2321957-1-peter@korsgaard.com>
 <20240111105621.2321957-2-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111105621.2321957-2-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705842729;
 bh=71mGZHv+s3TEaCRrBDeQkL9ap7L1JODfCVmr90wCXL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bDgQ4oqmgTT/s8HNN5PwiK2IC0KMsJF7jIdqsUNTU3vFllGuADBEGiaiL3egmjNMj
 /9V+pIDKtWkqcLcz9bnzKNSIdJpTQukO7j50FiI89IspepXNrB+2XyKtaxSibN1dbq
 7kiJ04b521AAsu12SI/q4/HMKXWiyCT5S2x3aRLbvQLIQp/1r4GELcJirzLA8x8FC3
 72zKelJNWePKT/NGfP3vcnUEuLNyNc1pET7YSgYLPyAqqr06krmQyWj50BV5BVZCOA
 2X3ZiN71fNNd/LZvnvQ6q2o3QMSvjB04JLSQepvLC2vR/h+NmAPY1SHMOun7rdXqTc
 RmpednWHjM7fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bDgQ4oqm
Subject: Re: [Buildroot] [PATCH 2/2] package/micropython: drop GIT_DIR=.
 workaround
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-01-11 11:56 +0100, Peter Korsgaard spake thusly:
> Now that it is handled globally in TARGET_MAKE_ENV.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/micropython/micropython.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index e6eb536ea5..3d356c51d8 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -14,11 +14,6 @@ MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
>  MICROPYTHON_LICENSE_FILES = LICENSE
>  MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
>  
> -# Set GIT_DIR so package won't use buildroot's version number
> -MICROPYTHON_MAKE_ENV = \
> -	$(TARGET_MAKE_ENV) \
> -	GIT_DIR=.

I was way too sloppy when applying this patch: MICROPYTHON_MAKE_ENV
previously contained $(TARGET_MAKE_ENV), but now it is totally unset,
and the expansions of it have not been replaced with TARGET_MAKE_ENV,
leading to all sorts of build faiulures, like:

    LINK build-standard/micropython
    arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib64/../lib64'

I suspect it is also the issue reported by Julien in his micropython
runtime test:

    https://patchwork.ozlabs.org/project/buildroot/patch/20240116210556.589407-1-ju.o@free.fr/

I'll push a fixup patch that uses TARGET_MAKE_ENV

Regards,
Yann E. MORIN.

>  # Use fallback implementation for exception handling on architectures that don't
>  # have explicit support.
>  ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
