Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AEBE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0FD4059F;
	Wed,  8 Jan 2025 23:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D57trk6WnyFn; Wed,  8 Jan 2025 23:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E6D5405A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E6D5405A6;
	Wed,  8 Jan 2025 23:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D1887AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA74A80C37
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfwm_u-hPNvY for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:06:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDB1880DE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB1880DE1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDB1880DE1
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:06:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BC78A13F861;
 Thu,  9 Jan 2025 00:06:31 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:39402])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Jan 2025 00:06:31 +0100
MIME-Version: 1.0
Date: Thu, 09 Jan 2025 00:06:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20250108213411.2091627-3-thomas.petazzoni@bootlin.com>
References: <20250108213411.2091627-1-thomas.petazzoni@bootlin.com>
 <20250108213411.2091627-3-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <278c34858ad7a277eb70c291b5adca5e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736377593;
 bh=bcIUhs2bV2KYbykpfbuge/6fisCiUG4sDH0pd6VdirU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BUho8SGI65ZE7+ykHMmtnlHiH6jX2Ri/1lv49O/bWnsKIXgZdidmnY4WUHfhhtBlY
 rpUAdm4TcDOA3SJL5uetzJfg7P/rQMFrhIfzWfn2VJFNbG9iW6CROU2jPzOCoa+gkf
 I8Pg53/EGcroqaTjGHFsTa3urD5EbLqCTf0rKQnHl2xdVW1TiE/JZZ0u30uNPhbs5h
 abLGKE8omzwXh1gHBpwSQrdErugMeGFKPkAQ8vJ5ynDO6/AoRpweZtq6/tqWNLA8sC
 aWK+8DMLiX2a2OZ5lejg77WNok/+2RN22xEZVJ4YoUJKkfTQsG6wLNrloFEQ+2e2W+
 p92lchJEVH8Kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BUho8SGI
Subject: Re: [Buildroot] [PATCH 3/3] package/linux-pam: bump to version 1.7.0
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

Hi Thomas,

On 08/01/2025 22:34, Thomas Petazzoni via buildroot wrote:
> Changes from 1.6.1 to 1.7.0:
> 
>     build: changed build system from autotools to meson.
>     libpam_misc: use ECHOCTL in the terminal input
>     pam_access: support UID and GID in access.conf
>     pam_env: install environment file in vendordir if vendordir is 
> enabled
>     pam_issue: only count class user if logind support is enabled
>     pam_limits: use systemd-logind instead of utmp if logind support is 
> enabled
>     pam_unix: compare password hashes in constant time
>     Multiple minor bug fixes, build fixes, portability fixes,
>     documentation improvements, and translation updates.
> 
> Clearly from a Buildroot standpoint, the most significant change is
> the migration from autotools (no longer supported) to meson.
> 
> This deserves a few explanations:
> 
> * --disable-prelude option no longer exists
> 
> * --disable-isadir but is documented as Arch-specific PAM modules
>   directory, relative to SECUREDIR, which seems odd to use. It has
>   been set since the package was introduced in
>   04be7f0f8ca100afaf06b264332bc2cd61fbb3d0, with no specific
>   explanation.
> 
> * --disable-nis is preserved
> 
> * --disable-db doesn't exist, it can only take a number of values,
>   including "auto"
> 
> * --disable-regenerate-docu doesn't exist, but -Ddocs=disabled is
>   passed
> 
> * -Di18n is now handled, and LINUX_PAM_LDFLAGS is used to pass
>   TARGET_NLS_LIBS
> 
> * We continue to use --libdir and not -Dlibdir because meson-package
>   already passes "--libdir=lib" and we can't override that with
>   -Dlibdir (it fails at configure time), so we have to override with
>   --libdir.
> 
> Also: existing patch 0001 is dropped as it's upstream, part of 1.7.0,
> but another upstream backport is added to fix -Di18n=disabled builds.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This bump (and change to meson) is introducing build failures.
So I did not merged this patch. See my test-pkg run:
https://gitlab.com/jolivain/buildroot/-/pipelines/1616985492

Most failures seems to be related to my test config having:
BR2_PACKAGE_LINUX_PAM_LASTLOG=y

Could you have a look please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
