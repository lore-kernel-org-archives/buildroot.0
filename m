Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6839EC02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 06:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A7B340B8F;
	Sat,  8 Feb 2025 06:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaPxMFzJMLTl; Sat,  8 Feb 2025 06:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1363408BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1363408BB;
	Sat,  8 Feb 2025 06:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 639741B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 06:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 469F3408BB
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 06:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmbUpIhNNyAb for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 06:57:58 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E40740891
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E40740891
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E40740891
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 06:57:56 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 7CB83BDE1E48;
 Sat,  8 Feb 2025 07:57:53 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 08 Feb 2025 06:57:53 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Earthquake <earthquake.de@freenet.de>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.30479.1738953323.3066252.buildroot@buildroot.org>
References: <mailman.30479.1738953323.3066252.buildroot@buildroot.org>
Message-ID: <821ad6d807229468d74621287b7b14ef@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1738997873; bh=O9ii9IvDwWNyrTzuddUdbCvCfOWAho70Z39ekOmbZRc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=0tPn5HpWhBxTqMc5KLeUPyH4DeUZ67dkWgUjEOQqGmjlYffYvyehTvEjMd2lHxPBZ
 GKubnUSREEX0Rj18xEbXDSEdMfUJML0qE5vrTbf3WXtrTf2Bmsx+hYcpYU+I9oiDh4
 Hbisl6Rk8bfZauExyYwOUPV/1FJkGr0ENRWRDNrs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=0tPn5HpW
Subject: Re: [Buildroot] generic-package compiler flags
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

Hi Alex,

On 2025-02-07 15:58, Earthquake wrote:
> 
> Hi,
> 
> I added another package to my buildroot via buildroot externals.
> Its a generik-package in the mk file and the BUILD_CMDS is
> 
> $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> 
> Within the package source-Makefile the -fPIC is added to CFLAGS
> CFLAGS += -fPIC
> 

Declared like this, CFLAGS will not be picked up by the Buildroot make 
script; Buildroot expects variables to be prefixed by the package name. 
A list of recognized variable names can be found in section 18.6.2 of

https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems

You might use something like this instead:

MYPACKAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) -fPIC

define MYPACKAGE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(MYPACKAGE_MAKE_OPTS) -C $(@D)
endef

> Outside of buildroot the package builds the lib as .so (-shared is also
> defined), but within buildroot the -fPIC option in CFLAGS is missing.
> 
> CFLAGS within the buildroot env is: -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64? -O2 -g0 
> -D_FORTIFY_SOURCE=1
> 
> How can I solve this and also change the -g0 and -O?

You can find these settings in the 'Build options' sub-menu:

	[] build packages with debugging symbols
	[] build packages with runtime debugging info
	gcc optimization level (...) -->

Within this sub-menu, there also exist entries for shared /static build 
and controlling PIC/PIE globally.

> 
> Thanks for an answere.
> 
> Best regards,
> 
> Alex
> 

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
