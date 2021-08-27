Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA8BC432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 20:11:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4382C60F6C
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 20:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4382C60F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1512B42789;
	Fri, 27 Aug 2021 20:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPrUTsjQ_Dlr; Fri, 27 Aug 2021 20:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAEB74278B;
	Fri, 27 Aug 2021 20:11:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8809C1BF4D6
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 20:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 767954278B
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 20:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsLo8SMY-jQo for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 20:11:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0A0242789
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 20:11:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a574:2179:f8:908b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2FDC5B00539;
 Fri, 27 Aug 2021 22:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630095107;
 bh=API8gZLiPoCeh2uPJ6GHre7RYvdned3JQVM5OUwAij0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PD+IXaSs/oYmHIB+mUhqTKzovMrOn8uivUX8RuUvzVPJ2TVM6qnlzhng4JzsSy0c8
 ojCrVV4lz3rhQGU9VoAvAOHQ4t0OoklLAPyzlBjbyH3U/5x20lCI4i6GQ646OJfQac
 KzJl1Pv4RL4Mnrot0URUYcuYNkF3MmrK4czGH8jSJUKAHvbWmL4T+gxGjGTzbz9bLc
 jPV2R/5Gw7rUK8Z9ytGzEYaTtRYMZBs3VW9/aHUvzF33WTpwquwq0Jon5Xkr50sV+t
 f3UvF+ZzE7j8irerKE5TkEu4lciJ5AtBf+ABSKl3Oq9HwgwCUU1HFESrhMeXXsv+0C
 JF7G8sGgiW4Ew==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 27 Aug 2021 22:11:40 +0200
Date: Fri, 27 Aug 2021 22:11:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210827201140.GD2661@scaer>
References: <20210827155805.1998314-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827155805.1998314-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: disable fuse-lseek on
 uclibc-ng
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-27 17:58 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure on uclibc-ng raised since bump to
> version 6.0.0 in commit 6b86c9335fc3ff381878156c6243454d4b688df9:
> 
> ../block/export/fuse.c: In function 'fuse_lseek':
> ../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
>   641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
>       |                   ^~~~~~~~~
> ../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
> ../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
>   641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
>       |                                          ^~~~~~~~~
>       |                                          SEEK_SET

I think the proper solution would be to #include <linux/fs.h>, maybe
guarded by #ifdef __linux__, like is done for example in:
block/file-posix.c .

And thus relax the requirement against musl at the same time?

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qemu/qemu.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 0bd3eafadd..70cf441c9b 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -94,11 +94,11 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
>  QEMU_OPTS += --enable-fuse
>  QEMU_DEPENDENCIES += libfuse3
> -# musl does not support SEEK_HOLE/SEEK_DATA
> -ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> -QEMU_OPTS += --disable-fuse-lseek
> -else
> +# musl and uclibc-ng don't support SEEK_HOLE/SEEK_DATA
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>  QEMU_OPTS += --enable-fuse-lseek
> +else
> +QEMU_OPTS += --disable-fuse-lseek
>  endif
>  else
>  QEMU_OPTS += --disable-fuse --disable-fuse-lseek
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
