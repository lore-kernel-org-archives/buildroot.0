Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29323C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA7E540CF4;
	Wed, 26 Feb 2025 14:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4C-tgyipY7v; Wed, 26 Feb 2025 14:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A85B40DA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A85B40DA3;
	Wed, 26 Feb 2025 14:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1372594F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 019274028B
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZfKKzZZ70lU for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 14:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 781DD400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 781DD400DA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 781DD400DA
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:38:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 328362808; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Feb 2025 14:38:12 +0000 (UTC)
Message-ID: <5cb9b337-7b71-43e4-a6cd-88aa7d0f838f@korsgaard.com>
Date: Wed, 26 Feb 2025 15:38:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: aperez@igalia.com, james.hilliard1@gmail.com, thomas.devoogdt@barco.com,
 thomas.petazzoni@bootlin.com
References: <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
 <20241218084337.3775491-1-thomas@devoogdt.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241218084337.3775491-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=IC4QQV9Rz73Q9NI+brlMv7LYkYekipq2sj8ZofS6B+YJBHmj7kBk10c8AVneqivUghEMNZeUk8d7jBpTJdsEGpPZ+UoB5ieA8KQSr1exPof7K8vrS5lGpetlHkXOWMTqc18M0h6OfqZHHQf2ToG73wtBKYH4n9oNdCV4dp+ZWBydOz8sFMY7Y4Ts5RzPZnuAbgdwjKBN4fXXOmojjTAUFs2tt6LYSmsY+CKHZvQs3qVpDarHc2iURs7MrB4vmOUhZ36JXtu0oAan5AQ70DNCsC6fOjZFX61WnYzVExepEpidT7Locb2eZ+0SxBfXEYMZ27eycHS/I4eMxPYjwjUTSw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=BjxwrIc5nmBhQsiWJAW5zyhWKUhBWEIQeTj/zQvbT3k=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=IC4QQV9R
Subject: Re: [Buildroot] [PATCH v1] package/pkgconf: fix sysroot being
 prepended twice to the pkgdatadir path
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

On 12/18/24 09:43, Thomas Devoogdt wrote:
> When building webkit, I got this build error:
> 
>>>> webkitgtk 2.46.3 Building
> GIT_DIR=. PATH="/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/bin:/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/sbin:/home/thomas/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
>   /home/thomas/.local/bin/cmake --build
> /home/thomas/br-test-pkg/bootlin-armv5-uclibc/build/webkitgtk-2.46.3/
> -j25
> ninja: error: '/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/wayland-protocols/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml',
> needed by 'WebKitGTK/DerivedSources/pointer-constraints-unstable-v1-protocol.c',
> missing and no known rule to make it
> make[1]: *** [package/pkg-generic.mk:289:
> /home/thomas/br-test-pkg/bootlin-armv5-uclibc/build/webkitgtk-2.46.3/.stamp_built]
> Error 1
> make: *** [Makefile:83: _all] Error 2
> 
> The sysroot path is prepended twice to the path. This error persists
> since a3b2bc8 "package/pkgconf: bump to version 2.3.0".
> 
> After digging into it, I found out that dropping "pkgdatadir" from the
> patch does fix it. This is, in fact, the same, or similar problem that
> was fixed in 3e74c13 "package/pkgconf: variable pkgdatadir also needs
> sysroot prefixing, wayland patch III" years ago.
> 
> I was not able to find out which pkgconf commit caused the behavior
> change. Commit a3b2bc8 bumped it from 1.6.3 to 2.3.0, which is a
> considerable big change.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

This is a somewhat scary change as it is hard to know if any other 
packages expect pkgdatadir to be the build time path rather than the 
runtime one, but it has been pending for a while and I guess to only 
real way to know is to give it a try.

So committed to master, thanks. Can you please have a look at the 
autobuilders the next few days to see if it causes any regressions? If 
so then we may have to revert it again for 2025.02.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
