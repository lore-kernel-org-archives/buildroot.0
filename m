Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F154DE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B6080C1C;
	Wed,  8 Jan 2025 23:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Etxhx9I9e-sK; Wed,  8 Jan 2025 23:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDAAF80C36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDAAF80C36;
	Wed,  8 Jan 2025 23:00:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCDEB1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AADA1605F7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUIFnUndMlvk for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:59:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95791600C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95791600C4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95791600C4
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:59:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 09F1F19F5A7;
 Wed,  8 Jan 2025 23:59:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41044])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Jan 2025 23:59:50 +0100
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 23:59:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Guillaume William Brs
 <guillaume.bressaix@gmail.com>
In-Reply-To: <20250108213411.2091627-2-thomas.petazzoni@bootlin.com>
References: <20250108213411.2091627-1-thomas.petazzoni@bootlin.com>
 <20250108213411.2091627-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <5506e72e7b04aa3cfb4737a0e84f850d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736377193;
 bh=6Un1rE3vsOcKqhwHumBs1jEUCP8Vw9zUzh0gyOLPISA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l4loVrXxWnYeDmjZXBln9d9FfC35L7fnPGX/ts775ONeiC5BeTPFbAXmDdMnpbzmy
 PoZBbPZlTot7d7j1T7nzwLd84Bsl1+jC77Jow+tGnhJFcMemCMvlFY9bWwrnrGb5rg
 G8YcDS8xL2wxmOOop1fHrq1MJqySEMsrFb+rmOXxYAoIdCSrscOsFstA16ZJmouaTY
 qdMKBQ0a5eRccj/c1d6drEkpPdcpz4KN+wCAdMV+9kqceSbIxicTdHLCdH+GRoI/Up
 Q7bjyVY6cMfqRFHFli+1UAW0rHQTJhyJMWDZI8ZVPTnKFiPT+O9pbsXT/aAy8ZlqJh
 mcn9c2R014byA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l4loVrXx
Subject: Re: [Buildroot] [PATCH 2/3] package/libxcrypt: make available only
 with glibc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/01/2025 22:34, Thomas Petazzoni via buildroot wrote:
> libxcrypt has been added as a replacement for the libcrypt
> implementation that was part of glibc, but dropped from glibc starting
> from version 2.39.
> 
> However, libxcrypt was made available for all C libraries, and this is
> unfortunately causing some problems as it can clash with the libcrypt
> implementation provided by the C library.
> 
> In particular, linux-pam has been consistently failing with uclibc, in
> BR2_PER_PACKAGE_DIRECTORIES=y builds, with the following build
> failure:
> 
> opasswd.c: In function 'compare_password':
> opasswd.c:133:27: error: invalid application of 'sizeof' to incomplete 
> type 'struct crypt_data'
> 
> What happens is relatively tricky, but let's try to break it down:
> 
> - uclibc-ng install a stub libcrypt.a (no shared variant, as for
>   shared libraries, everything is in libc.so), and crypt.h
> 
> - libxcrypt installs libcrypt.so.* and crypt.h
> 
> So there is no "clash" on the library itself, but there is a clash on
> the header file.
> 
> Since we're using BR2_PER_PACKAGE_DIRECTORIES=y, when building
> linux-pam, we are creating the per-package STAGING_DIR by copying the
> STAGING_DIR of linux-pam dependencies, i.e both the libxcrypt
> STAGING_DIR and the uclibc-ng STAGING_DIR. But the latter ends up
> being copied last, which means that at the end of the day, we have in
> the per-package STAGING_DIR of linux-pam:
> 
> - The libcrypt.so from libxcrypt
> - The crypt.h header from uclibc-ng
> - The libcrypt.a from uclibc-ng
> 
> When the ./configure script of linux-pam tests whether the library has
> crypt_r(), it concludes that yes it's available: and indeed
> libcrypt.so from libxcrypt has it.
> 
> So it tries to use 'struct crypt_data' and 'crypt_r()', but those are
> not supported in uClibc-ng, and so cannot be found in the <crypt.h>
> header. So even if the ./configure script and the linux-pam code has
> some logic to fallback to crypt() if crypt_r() isn't available, this
> fallback doesn't trigger because the installed libcrypt.so does have
> crypt_r().
> 
> Basically what happens is that uclibc-ng + libxcrypt is a combo that
> violates a golden rule of our BR2_PER_PACKAGE_DIRECTORIES=y
> implementation: packages shouldn't overwrite files from each other.
> 
> To avoid this situation, we make libxcrypt only installable on
> glibc. This isn't a problem because as of today, BR2_PACKAGE_LIBXCRYPT
> is always selected "if BR2_TOOLCHAIN_USES_GLIBC".
> 
> It should be noted though that the case of an older glibc (which still
> had its own internal libcrypt) + libxcrypt continues to exist. It's
> less likely to cause trouble though, as the libcrypt implementations
> are much more similar.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/560f66b0311d02dc884732221d6870ae3c38067c/
> 
> Note: we do not add a Config.in comment for this glibc dependency,
> because libxcrypt really is a "replacement" library to fill in the
> void left by libcrypt's removal from glibc. There isn't realy a point
> showing "libxcrypt needs a toolchain w/ glibc", because with musl or
> uclibc-ng, the libcrypt functionality is directly part of the C
> library.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
