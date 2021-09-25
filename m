Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A14C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:42:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9672B610CF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9672B610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4020E40410;
	Sat, 25 Sep 2021 14:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4EoFn1Oo522; Sat, 25 Sep 2021 14:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7315140400;
	Sat, 25 Sep 2021 14:42:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F5281BF868
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F2AB40400
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VKxRP9S1TnZf for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 14:42:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50B4E403FC
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 14:42:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5cb:5ead:8e76:4901])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id ED843780357;
 Sat, 25 Sep 2021 16:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632580926;
 bh=XonZzlP2eLPwY0HI/uVpuQJZyT49ziK3onLppsvRuvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cxc3t5oECDW3i6SGjPDgBs+NJVFDx1RDDIElZMEBAdEMDzGzBUP+ZcZHKI5K7dDQK
 4RWr3lHYdmjJXVgwW93u8m9IUGzXIjHrB9mvMtD2vPG2oGXHIdjYK8EuFFV44ZSzH6
 2yDDlOAZKxlKljD9/HcBWZsz1YKd6o7q0bVBG877T6YdYCckPVdnMJDOsHiz9utguj
 HDxl8v3l9WSgZasc17EFyqnwjmuu+eZCDVmkMdtbsk4mYcqoxiisX0cFeEhMm8Q+jK
 n7bw5clcC58ZlkJIwj8FFXctz6GzQvqKU1PtcSYMjfT4SweyRxKdEousN/5cm7pLWI
 PRVgOk8khAy6g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Sep 2021 16:41:59 +0200
Date: Sat, 25 Sep 2021 16:41:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210925144159.GN3176@scaer>
References: <20210922214627.828388-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210922214627.828388-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/liblinear: fix shared library
 install
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-09-22 23:46 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 2.43 in
> commit bdd05a2b1323b4bdfbcaf559e0567a7d09f4837d:
> 
> /usr/bin/install: cannot stat '/tmp/instance-0/output-1/build/liblinear-2.43/liblinear.so.3': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/97c2a3babe8f9df7cda069858f13e3be2508cf40
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/liblinear/liblinear.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
> index 3b137ed518..1ad734c756 100644
> --- a/package/liblinear/liblinear.mk
> +++ b/package/liblinear/liblinear.mk
> @@ -14,8 +14,8 @@ LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
>  ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>  # $1: destination directory
>  define LIBLINEAR_INSTALL_SHARED
> -	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.3 $(1)/usr/lib/liblinear.so.3
> -	ln -sf liblinear.so.3 $(1)/usr/lib/liblinear.so
> +	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.4 $(1)/usr/lib/liblinear.so.4
> +	ln -sf liblinear.so.4 $(1)/usr/lib/liblinear.so
>  endef
>  LIBLINEAR_CFLAGS += -fPIC
>  endif
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
