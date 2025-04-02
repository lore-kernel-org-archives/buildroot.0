Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98080C36014
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 17:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BF1941729;
	Wed,  2 Apr 2025 17:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Kos-yPV8wXq; Wed,  2 Apr 2025 17:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A94413C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40A94413C8;
	Wed,  2 Apr 2025 17:40:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B230E117
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96F0A4019E
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHBYsklSIp23 for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 17:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C5DE40146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C5DE40146
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C5DE40146
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:40:12 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3BCD535203A0; Wed,  2 Apr 2025 19:40:10 +0200 (CEST)
Date: Wed, 2 Apr 2025 19:40:10 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <Z-12es9L_mQNJRM4@waldemar-brodkorb.de>
References: <Z-QAExADR8rp0Afq@waldemar-brodkorb.de>
 <20250402082625.599501-1-thomas@devoogdt.com>
 <Z-0auN0f7ln-1IJH@waldemar-brodkorb.de>
 <CACXRmJhEJ9RnLpiAjfp+mSZD-okUg8+-hY6zJ-i9Qt_zbNFYOg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACXRmJhEJ9RnLpiAjfp+mSZD-okUg8+-hY6zJ-i9Qt_zbNFYOg@mail.gmail.com>
X-Operating-System: Linux 6.1.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1743615610; bh=Mo9VZab55s3zXswB1Xtq1qQ1tExLWI8h+Yi+D21h5zs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rx8gW6Uhe/S9xFuhcKi4yojRcX/1M8gHDYM8W7ZKHAqDw8aGo2ZCEM7h15autaqEM
 Vl0s9fPd37K8BM8ttMmpN6xcLjyPuTuErgjME8jh3gy/XgHP2O42BQbslqtNxly3Qg
 i1BTceKj8tfW4nmsTQm9nkxIHSeW5JhsuckHYrgNONsE7N/ieK9JghSZ+iUEbNH8Oo
 OjbXV7GGZwG368Rlt6Ko5c6UX35emdv3fV08ZTMRVEMR6Cj6tHwB0mDiMpd8w3MQ6y
 qMDgLS8QW5JbQfKnRyYEe2d5b7rsx3VdB2VC46rDmZR2/rOhAWMG+NrzqPbCAkzdm0
 3VwrRj35Q9w6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Rx8gW6Uh
Subject: Re: [Buildroot] [PATCH v2] package/util-linux: bump to 2.41
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Devoogdt wrote,

> Hi Waldemar,
> 
> 
> What exact defconfig are you using?
> 
> I just ran this:
> $ cat util-linux.config
> BR2_PACKAGE_UTIL_LINUX=y
> BR2_PACKAGE_UTIL_LINUX_MOUNT=y
> BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=y
> BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT=y
> $ ./utils/test-pkg -p util-linux -c util-linux.config -a
> 
> No failing test, and multiple uclibc toolchains were tested alongside.

With this I get:
#
# configuration written to /home/wbx/br-test-pkg/arm-aarch64/.config
#
Value requested for BR2_PACKAGE_UTIL_LINUX not in final .config
Requested value:  BR2_PACKAGE_UTIL_LINUX=y                                                                                                     
Actual value:     BR2_PACKAGE_UTIL_LINUX=y

Value requested for BR2_PACKAGE_UTIL_LINUX_MOUNT not in final
.config
Requested value:  BR2_PACKAGE_UTIL_LINUX_MOUNT=y                                                                                               
Actual value:     BR2_PACKAGE_UTIL_LINUX_MOUNT=y

Value requested for BR2_PACKAGE_UTIL_LINUX_LIBMOUNT not in final
.config
Requested value:  BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=y                                                                                            
Actual value:     BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=y

Value requested for BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT not in final
.config
Requested value:  BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT=y
Actual value:     BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT=y

Why does it work for you? For me everything is skipped.

I use configs/qemu_mips64_malta_defconfig and activate uclibc and
util-linux via make menuconfig.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
