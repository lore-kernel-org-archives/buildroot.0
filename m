Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277B3C43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 20:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 990F441757;
	Sun, 12 Jun 2022 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkFGGO6ZOd2Y; Sun, 12 Jun 2022 20:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4652E41634;
	Sun, 12 Jun 2022 20:37:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91ADC1BF3AF
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 20:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 800AB60B30
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 20:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzeZh-WtI5Vk for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 20:37:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E54A60ADC
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 20:37:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e0a2:2157:6a43:27a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id EC1397802CE;
 Sun, 12 Jun 2022 22:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1655066252;
 bh=QoF2HvrrD6ElTD5yZyiHm0xQNfMZnwlrvHDeYdZzyEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sapFcNcZjvkOELfyXpATNoHQy9NbtbzlPO0Pj3CT28fGuNLSYIzvu+txcSRrfCfwc
 u/ORq9IA32Cew7sj+zM+QrMZRk/j6E+cSvN0rPtwGuguMnjHT3UGg6UtpbOzeWlrNT
 C4CMSWfURtJyKEpxXJZRrFc4cT63e9M5s4gp65NPXKNnB5OoUZ9zqn/QHcHhym6VoH
 4UtwOSKWThRJygcEOxMcl+ySvOMWfj9rDz8JpNzJ+f2VLyO0H/Que74I8+3KZ4oTbN
 OhhEWkcMQxyV3HShXFwjnnl5FSOOeAINbI7h99GE0fJSuweIusvwN1ZIk5R/uwr52x
 1yyxpVFpAwzrQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 22:37:29 +0200
Date: Sun, 12 Jun 2022 22:37:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220612203729.GM427639@scaer>
References: <20220610210541.3643416-1-fontaine.fabrice@gmail.com>
 <20220610210541.3643416-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610210541.3643416-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/dmalloc: disable stack-protector
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

Fabrice, All,

On 2022-06-10 23:05 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with stack-protector:
> 
> /home/autobuild/autobuild/instance-1/output-1/per-package/dmalloc/host/bin/i686-buildroot-linux-gnu-ld -shared --whole-archive -soname libdmallocth.so -o libdmallocth.so.t libdmallocth.a
> /home/autobuild/autobuild/instance-1/output-1/per-package/dmalloc/host/bin/i686-buildroot-linux-gnu-ld: libdmallocth.a(append.o): in function `append_long':
> append.c:(.text+0x115): undefined reference to `__stack_chk_fail_local'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f808885dcbbe4322631fa57f72af23009babcb26
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dmalloc/dmalloc.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
> index 81ac467277..f0a05412c1 100644
> --- a/package/dmalloc/dmalloc.mk
> +++ b/package/dmalloc/dmalloc.mk
> @@ -12,7 +12,11 @@ DMALLOC_LICENSE = ISC
>  DMALLOC_LICENSE_FILES = LICENSE.txt
>  
>  DMALLOC_INSTALL_STAGING = YES
> -DMALLOC_CFLAGS = $(TARGET_CFLAGS)
> +# dmalloc must be compiled with no stack protection as it builds its shared
> +# library from its static library through --whole-archive, so forcefully pass
> +# -fno-stack-protector to override what Buildroot may have in TARGET_CFLAGS if
> +# BR2_SSP_* support is enabled.
> +DMALLOC_CFLAGS = $(TARGET_CFLAGS) -fno-stack-protector

At the risk of more goofiness, but the reference build issue had me
notice that dmalloc uses ld to do the link phase, while it should really
call gcc.

Indeed, I think the issue really is that -lssp (or the like) is missing
in the link command.

We have some very old, legacy, unexpained code that been there since the
dawn of times, that tweaks dmalloc's configure to shoehorn the cross-ld:

    $(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
    $(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(@D)/configure

This should be converted over to use gcc, which would then properly pull
in the libraries needed when SSP is on.

However, this is not going to be trivial -whole-archive is not known to
gcc, so it must be passed as -Wl,-whole-archive.

Furthermore, -Wl,-no-whole-archive must be pased after the static
libdmalloc.a library (as explaiend in the ld manpage).

So, thisis a bit of a bigger change, but I otherwise fdo not think that
disabling SSP is a good idea, especially for a library that deals with
allocating memory...

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_STATIC_LIBS),y)
>  DMALLOC_CONF_OPTS += --disable-shlib
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
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
