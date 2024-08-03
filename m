Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698E9C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 06:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C7860611;
	Sat,  3 Aug 2024 06:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TqlzXFEYofJ; Sat,  3 Aug 2024 06:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0786760629
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0786760629;
	Sat,  3 Aug 2024 06:34:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 271601BF5DA
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 06:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21F0560629
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 06:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iUt8ZZc7ZBE for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 06:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8657960611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8657960611
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8657960611
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 06:34:37 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1BF8335364DB; Sat,  3 Aug 2024 08:34:35 +0200 (CEST)
Date: Sat, 3 Aug 2024 08:34:35 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <Zq3Pe9f7NIAMWCG7@waldemar-brodkorb.de>
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240728115817.743185-1-dm.chestnykh@gmail.com>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722666875; bh=U72A0/FKxg4jblZ8ZglISM7RQus2/uVuVgerJdBAjow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LD7DoW2gyO/RQ6lBFUETcvx4M0Te201VyL54CEzCmMlLDZoBObF5FmuKS13ktfUp2
 QorsMprngzUkR5x4PUFdM31Ntc6XH9f7cox8JM2fIDj/OD73WQf4sVyYu5LIUe+JDz
 T2YMJL4hsaY801c9qL4nVgXnZJtdmB47168d5geJwRdNanf3eQxQbeR1cElJIMP+YN
 XXdCsY/uWMN2xBunOBnCXyDhHSK+SnZqpJQ+gW4TGLOWw99oeEq+jzD3eXQ5DlVk1q
 FCRAPEYI9HjpknYvwfcoeEWIjRcvG+ya60eCKcLrvOf0Y7tn31kuko5Q8Qcv6C3NWa
 CRizzbr/5sFag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=LD7DoW2g
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x
 kernel headers
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dmitry,
Dmitry Chestnykh wrote,

> Provide correct grouping for preprocessor
> conditions to avoid building ld.so with
> undefined macroses which are in use
> 
> Fixes
>   package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch

Here you have to add the autobuild failure.

> Upstream:
>   https://patchwork.ozlabs.org/project/uclibc-ng/patch/20240728115224.725666-1-dm.chestnykh@gmail.com/

You can update Upstream to the uClibc-ng commit:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=841d0729883ee0de606de161c1d6a5c37cedf575

Your Subject is wrong, too.

Can you respin your patch?

best regards
 Waldemar
 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> ---
>  ...ix-arc-build-with-4.x-kernel-headers.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch
> 
> diff --git a/package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch b/package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch
> new file mode 100644
> index 0000000000..359d1e98c6
> --- /dev/null
> +++ b/package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch
> @@ -0,0 +1,34 @@
> +From 1afc19eb6a7948afbcf3dd19091ce127a355ebcb Mon Sep 17 00:00:00 2001
> +From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> +Date: Sun, 28 Jul 2024 14:12:39 +0300
> +Subject: [PATCH] [ldso] Group conditions after `&&`
> +
> +If the conditions are not grouped we can reach
> +this block even if `__NR_stat` is not defined.
> +
> +`defined __NR_stat && ((!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__))`
> +gives us false but `LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))`
> +may give us true. So if linux headers version is below 5.1.0 and
> +__NR_stat is not defined we can have compilation error
> +
> +Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> +---
> + ldso/include/dl-syscall.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
> +index 9ec0eac60..180d03012 100644
> +--- a/ldso/include/dl-syscall.h
> ++++ b/ldso/include/dl-syscall.h
> +@@ -141,7 +141,7 @@ static __always_inline int _dl_stat(const char *file_name,
> + {
> + 	return _dl_newfstatat(AT_FDCWD, file_name, buf, 0);
> + }
> +-#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__)) || (LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))
> ++#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__) || (LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0)))
> + # define __NR__dl_stat __NR_stat
> + static __always_inline _syscall2(int, _dl_stat, const char *, file_name,
> +                         struct stat *, buf)
> +-- 
> +2.45.2
> +
> -- 
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
