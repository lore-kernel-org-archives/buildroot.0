Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A85EE57CD
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 14:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FC2680B30;
	Sun, 10 Sep 2023 14:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC2680B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yK7XVgStBs8y; Sun, 10 Sep 2023 14:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FAC880B0D;
	Sun, 10 Sep 2023 14:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FAC880B0D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 445EF1BF255
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 14:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C57140330
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 14:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C57140330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HYnBzCt3WPMz for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 14:43:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B391440305
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 14:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B391440305
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90E0660004;
 Sun, 10 Sep 2023 14:43:26 +0000 (UTC)
Date: Sun, 10 Sep 2023 16:43:25 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230910164325.109c1500@windsurf>
In-Reply-To: <560e15cf1de5ea7a628dab0a4a275a2128cc5e15.1693937366.git.stefan@agner.ch>
References: <560e15cf1de5ea7a628dab0a4a275a2128cc5e15.1693937366.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694357007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6fXqIXKaBGy9PqDmQOv98UtQMCCgu5yGSoFtEKgTCc=;
 b=esiOfQeniWO9s+lY1D2hLFYRyu78J/lfNnuPLZ773KKhT8PYQfJPD+wJOFq6CBjiSwNKUr
 dIz5PBjcFy5J580bqsFF8jiux8TAL9fenAW/c9RPQDCQuIc4Ox0yHJMUFj5+CJF6NEhNwQ
 7Yqk/bWgc9uUKJTENjAlj6Kn+yoXprJgVEXm9iTofzWYq71MFwnVwMQlyQNzTgYIigPLX4
 YCYFq8gS2jmpmj11iXxdOASaMRORMJNAKUUiilX61+KVyMZpuy1Ousbw1Bc1s5OREC55o+
 v+hCl3ZIhHAHGlbNAT1KgunmaqKhfAU2hszIYfz1o6a2SP36Dqv0IETOM2x0sQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=esiOfQen
Subject: Re: [Buildroot] [PATCH] package/openvmtools: bump version to 12.3.0
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
Cc: fontaine.fabrice@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

Thanks for the patch. See some comments below.

On Tue,  5 Sep 2023 20:10:11 +0200
Stefan Agner <stefan@agner.ch> wrote:

> Rebase patches and bump version to 12.3.0. This also addresses
> CVE-2023-20867 and CVE-2023-20900.

So it is a security bump, to the commit title should be "security bump
to version 12.3.0"

The rebase of the patches is quite significant, so it would be really
good to have details in the commit log, such as:

- Patch 0001-...., rebase
- Patch 0002-...., dropped because it is now upstream
- Patch 0003-...., blablabla

> diff --git a/package/openvmtools/0001-configure.ac-disable-Werror.patch b/package/openvmtools/0001-configure.ac-disable-Werror.patch
> new file mode 100644
> index 0000000000..0ece3786a2
> --- /dev/null
> +++ b/package/openvmtools/0001-configure.ac-disable-Werror.patch
> @@ -0,0 +1,31 @@
> +From b978727972e1a8b7e3f14886395047e5809b7a81 Mon Sep 17 00:00:00 2001
> +Message-ID: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>

Are these patches generated with git format-patch? This looks weird.

> +From: Stefan Agner <stefan@agner.ch>

Please keep the authorship of the patches. This one was from Karoly
Kasza <kaszak@gmail.com> it seems.

Perhaps you need a preparation commit before the bump that moves all
patches to Git-formatted patches.


> diff --git a/package/openvmtools/0002-m4-do-not-force-I-usr-include-in-CPPFLAGS.patch b/package/openvmtools/0002-m4-do-not-force-I-usr-include-in-CPPFLAGS.patch
> new file mode 100644
> index 0000000000..5f383647e4
> --- /dev/null
> +++ b/package/openvmtools/0002-m4-do-not-force-I-usr-include-in-CPPFLAGS.patch
> @@ -0,0 +1,37 @@
> +From 1dbf439465d70a9c666910ecc9a6582946048202 Mon Sep 17 00:00:00 2001
> +Message-ID: <1dbf439465d70a9c666910ecc9a6582946048202.1693922825.git.stefan@agner.ch>
> +In-Reply-To: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>
> +References: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>

Really weird to see these fields here. Did you generate with git format-patch?

> +From: Stefan Agner <stefan@agner.ch>

Please keep the authorship: Yann E. Morin.


> diff --git a/package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch b/package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch
> deleted file mode 100644
> index b4e94d870d..0000000000
> --- a/package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch
> +++ /dev/null
> @@ -1,813 +0,0 @@
> -From 1dfab46d367d11e9132506ee0f7d3eb2ceff5f3c Mon Sep 17 00:00:00 2001
> -Message-Id: <1dfab46d367d11e9132506ee0f7d3eb2ceff5f3c.1652913832.git.stefan@agner.ch>
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Mon, 30 Sep 2019 13:32:35 +0200
> -Subject: [PATCH] Rename poll.h into vm_poll.h to fix build failure on musl

[...]

> diff --git a/package/openvmtools/0003-Rename-poll.h-into-vm_poll.h-to-fix-build-failure-on.patch b/package/openvmtools/0003-Rename-poll.h-into-vm_poll.h-to-fix-build-failure-on.patch
> new file mode 100644
> index 0000000000..c1e1ff277f
> --- /dev/null
> +++ b/package/openvmtools/0003-Rename-poll.h-into-vm_poll.h-to-fix-build-failure-on.patch
> @@ -0,0 +1,133 @@
> +From 21b87417e23de9e444ec02e93e42f72a3f9d4c02 Mon Sep 17 00:00:00 2001
> +Message-ID: <21b87417e23de9e444ec02e93e42f72a3f9d4c02.1693922825.git.stefan@agner.ch>
> +In-Reply-To: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>
> +References: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 30 Sep 2019 13:32:35 +0200
> +Subject: [PATCH] Rename poll.h into vm_poll.h to fix build failure on musl

This patch has the same title has it had before, but the contents are
very different. Why?


> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/vmware/open-vm-tools/pull/383]

This should be just:

Upstream: https://github.com/vmware/open-vm-tools/pull/383


> diff --git a/package/openvmtools/0004-Remove-assumptions-about-glibc-being-only-libc-imple.patch b/package/openvmtools/0004-Remove-assumptions-about-glibc-being-only-libc-imple.patch
> index 5960006f2f..2fa6834f1d 100644
> --- a/package/openvmtools/0004-Remove-assumptions-about-glibc-being-only-libc-imple.patch
> +++ b/package/openvmtools/0004-Remove-assumptions-about-glibc-being-only-libc-imple.patch
> @@ -1,22 +1,27 @@
> -From a0983d84185f04c4e40778fe951fde4439894882 Mon Sep 17 00:00:00 2001
> +From 7b28142ae2c34b2a2ef18128486d7125fa304fcb Mon Sep 17 00:00:00 2001
> +Message-ID: <7b28142ae2c34b2a2ef18128486d7125fa304fcb.1693922825.git.stefan@agner.ch>
> +In-Reply-To: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>
> +References: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>

Again, why are these added?

>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 16 Jul 2017 07:37:03 -0700
> -Subject: [PATCH] Remove assumptions about glibc being only libc
> - implementation on linux
> +Subject: [PATCH] Remove assumptions about glibc being only libc implementation
> + on linux

Not sure why this gets changed.


> diff --git a/package/openvmtools/0005-Use-configure-test-for-struct-timespec.patch b/package/openvmtools/0005-Use-configure-test-for-struct-timespec.patch
> index 3386faec15..dea62e5f7d 100644
> --- a/package/openvmtools/0005-Use-configure-test-for-struct-timespec.patch
> +++ b/package/openvmtools/0005-Use-configure-test-for-struct-timespec.patch
> @@ -1,4 +1,7 @@
> -From bf1eafb07297711baf9320b1edcca8a3376f117d Mon Sep 17 00:00:00 2001
> +From f4c472478a42bfd69406b49aab778d2038e6dee3 Mon Sep 17 00:00:00 2001
> +Message-ID: <f4c472478a42bfd69406b49aab778d2038e6dee3.1693922825.git.stefan@agner.ch>
> +In-Reply-To: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>
> +References: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>

Ditto (and same for all patches)


> diff --git a/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch b/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
> index abbc518362..37b476fb26 100644
> --- a/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
> +++ b/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
> @@ -1,4 +1,7 @@
> -From 6cc1c22cc30320f56da552a76bd956db8f255b6a Mon Sep 17 00:00:00 2001
> +From 7ab2810df0abd79419267d96e744ce880e229661 Mon Sep 17 00:00:00 2001
> +Message-ID: <7ab2810df0abd79419267d96e744ce880e229661.1693922825.git.stefan@agner.ch>
> +In-Reply-To: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>
> +References: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>
>  From: Natanael Copa <ncopa@alpinelinux.org>
>  Date: Wed, 18 Nov 2015 10:05:07 +0000
>  Subject: [PATCH] Use configure to test for feature instead of platform
> @@ -18,21 +21,23 @@ The features we test for are:
>  
>  This is needed for musl libc.
>  
> +Refit patch of open-vm-tools/lib/nicInfo/nicInfoPosix.c
> +
>  Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> -[Retrieved (and slightly updated) from:
> -http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch?h=sumo]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>

Hm? Why this change? You used an upstream patch? Or something else? Why
is the reference to the meta-openembedded layer dropped?

> diff --git a/package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch b/package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
> new file mode 100644
> index 0000000000..ae90361239
> --- /dev/null
> +++ b/package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
> @@ -0,0 +1,52 @@
> +From 640effa0a8cdf5d00efa329bcf8dfe01790b3fbb Mon Sep 17 00:00:00 2001
> +Message-ID: <640effa0a8cdf5d00efa329bcf8dfe01790b3fbb.1693922825.git.stefan@agner.ch>
> +In-Reply-To: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>
> +References: <b978727972e1a8b7e3f14886395047e5809b7a81.1693922825.git.stefan@agner.ch>
> +From: Stefan Agner <stefan@agner.ch>

Are you the author?

> +Date: Tue, 5 Sep 2023 15:03:56 +0200
> +Subject: [PATCH] Make HgfsConvertFromNtTimeNsec aware of 64-bit time_t on i386
> +
> +I verified that this function behaves as expected on x86_64, i386 with
> +32-bit time_t, and i386 with 64-bit time_t for the following values of
> +ntTtime:
> +
> +UNIX_EPOCH-1, UNIX_EPOCH, UNIX_EPOCH+1, UNIX_S32_MAX-1, UNIX_S32_MAX,
> +UNIX_S32_MAX+1, UNIX_S32_MAX*2+1
> +
> +I did not verify whether the use of Div643264 is optimal, performance
> +wise.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +[rebased against stable-12.3.0]
> +Signed-off-by: Stefan Agner <stefan@agner.ch>

There is a patch upstream with the same commit title, commit
36eea633611e678f3ea17a913c0990f319135c48. Why not take it?

Also, please update .checkpackageignore, as it references a lot of the
existing patches. Run "make check-package", it will tell you what's
wrong. Ideally, all patches should have an "Upstream:" tag. The ones
that don't can be added in .checkpackageignore to avoid the warning,
but we obviously prefer patches to be submitted upstream.

Could you have a look at addressing the above issues and submit a v2?

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
