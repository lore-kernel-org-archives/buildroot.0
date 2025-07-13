Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5BFC83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 10:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ECEB409F3;
	Sun, 13 Jul 2025 10:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdPFhOUuewU2; Sun, 13 Jul 2025 10:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 892B5408AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 892B5408AA;
	Sun, 13 Jul 2025 10:36:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FF06106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAC73817A7
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vg4bGwt9toUN for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 10:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3DB281A73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3DB281A73
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3DB281A73
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:36:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6AE202003CE;
 Sun, 13 Jul 2025 12:36:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 12:36:43 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 12:36:43 +0200
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Cc: buildroot@buildroot.org, Fred Lefranc <fred.lefranc+evs@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <CAGkXw1XQXKAxnjudTsiM4jcVcH0pYhzLD6bxg4H5VGDi1bt1tQ@mail.gmail.com>
References: <CAGkXw1XQXKAxnjudTsiM4jcVcH0pYhzLD6bxg4H5VGDi1bt1tQ@mail.gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <41add64e1392d3584206104ee4d09192@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752403006;
 bh=mTJsF11HPqB+OwpEA7wZWj7IqxaE7ItbHbXf+EAICwY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eGi/SvDYXcs1SWpI8ZIWMM3UGXghiZd+G2G3GFI54z9YJJyWV8mpM5HZb7F3nw9mJ
 Ru47ewfiFFqzDwU831W/n6CZhPlUex7zYBq3OrLEiFJ1koFhYw5gH0x+cSOuppLJ0g
 ROTQfi6eZEsKkK4O8QFVR4D6qt+1nk232LuF4Z0PKYDjUq2VCeOc0CgErwYao7hr5D
 PyjZ2q0GuqRgRQWXpBwskriEVvI/j1YrVTjmUaIvgGqzreimm3iDRbOcolPn2fc+SH
 z45P+B/CYNuvccZyRv7bljW+b0OQVf7swj9+0nwx0mfSAYN9dqT+VmikGoyrkt3UbH
 gg+UEGMlYg0Fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eGi/SvDY
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 3.2.1
 (lts branch)
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fred,

Thanks for the patch!

It was not applying as is, due to word wrapping. Could you make sure
to send patches with git send-email to make sure they are correctly
formatted please?

When doing a bump like this, could you add a link to a change log,
or a release note in the commit log?

For example, adding:
"""
For the change log since v2.6.22, see:
https://www.haproxy.org/download/3.2/src/CHANGELOG
"""

On 23/06/2025 11:00, Fred Lefranc wrote:
> Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
> ---
>  ...mic.h-may-need-compiler.h-on-ARMv8.2.patch | 36 -------------------
>  package/haproxy/haproxy.hash                  |  4 +--
>  package/haproxy/haproxy.mk                    |  4 +--
>  3 files changed, 4 insertions(+), 40 deletions(-)
>  delete mode 100644
> package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
> 
[...]
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index 77195d966b..06d0c7bd26 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -HAPROXY_VERSION_MAJOR = 2.6
> -HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).22
> +HAPROXY_VERSION_MAJOR = 3.2
> +HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).1

This bump is introducing build failures for static builds.
See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1923624453

haproxy introduced a malloc_trim() symbol in
https://git.haproxy.org/?p=haproxy-3.2.git;a=commitdiff;h=eaba76b02dd41e0a1a2e85a3e71f91dfc529916d

Then tries to override it with libdl calls:
https://git.haproxy.org/?p=haproxy-3.2.git;a=blob;f=src/tools.c;h=aee750b4180c22c1b360305bf9ecc38a157d2c1e;hb=f4d1a4e279bcb00f758dfbf037e3808512df113b#l5480

Even if there is logic avoiding those libdl calls, the final link
fails due to this multiple definition of malloc_trim symbol.

You can reproduce the issue with commands:

     cat >.config <<EOF
     BR2_aarch64=y
     BR2_STATIC_LIBS=y
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
     BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE=y
     BR2_PACKAGE_HAPROXY=y
     EOF
     make olddefconfig
     make haproxy

Could you have a look to either fix those static builds, or
adding a Kconfig logic to restrict only to dynamic builds?

>  HAPROXY_SITE = 
> http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
>  HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
>  HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
> --
> 2.25.1

Can you send an updated patch addressing those comment, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
