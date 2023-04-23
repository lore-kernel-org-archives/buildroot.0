Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7A8C77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 16:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD39410DC;
	Sun, 23 Apr 2023 16:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD39410DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HicIPcW-5XLq; Sun, 23 Apr 2023 16:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A094148D;
	Sun, 23 Apr 2023 16:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A094148D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D8D21BF48D
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 16:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76E5C60AD5
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 16:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E5C60AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlsL8c8kTVZf for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 16:40:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DE2F60A6D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DE2F60A6D
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 16:40:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f69d:4ee8:8d2a:132a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C6E7AB00593;
 Sun, 23 Apr 2023 18:40:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 18:40:25 +0200
Date: Sun, 23 Apr 2023 18:40:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: MidCheck <mc.xin@foxmail.com>
Message-ID: <20230423164025.GL2696@scaer>
References: <tencent_E605AD09EB02769EC2D19F376A1239F80406@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_E605AD09EB02769EC2D19F376A1239F80406@qq.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682268032;
 bh=GHWOVnrG5D7Em2fNhykmIAluha0OswqlrJ9nzfOhMR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EyTiF9LMqLAs1GAWAx4Bn97PpwXKwFVs/9G6mN/dRYwjyY3tC4MZCIvWLPDztHaqN
 r75izqDrfyeuQJW9I3FAfoBCKYBuLQ9wme/jzhgktKSwQ6YJm/iZqe8BPRxgaUXl5J
 Wpl3Zhcq0kyAlndahlqIZx0/CJ7TLlpfWgu8pdUTC/acvs+bze0NB5MPYVfYNX9Q7o
 VkRlB7WOgisJSvL6vxLYDSIic3SqfC7a9kRBMo35V9MHZ447UXHrreMHFoHaRfxgZs
 /gL6C/JaYC+NZzZAjhx3lexB3eB26OtjJFpdCg+hH3+ID220vueCC6X0cHPLeF05E/
 zHT6m5WZAVJfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EyTiF9LM
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: add the
 processing when LIBPATH is a directory
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MidCheck, All,

On 2023-04-23 23:54 +0800, MidCheck spake thusly:
> When built with the system's toolchain, the output is as follows:
> >>> toolchain-external-custom  Installing to target
> >>> toolchain-external-custom  Copying external toolchain libraries to target...
> make: *** [package/pkg-generic.mk:384: /root/buildroot-2022.02.11/output/build/toolchain-external-custom/.stamp_target_installed] Error 255
> 
> After echo the value of LIBPATH, I found it is a directory:
> /root/buildroot-2022.02.11/output/host/x86_64-buildroot-linux-gnu/sysroot/etc/ld.so.conf.d

This is weird that you get an ld.so.conf.d in your toolchain. Is it a
toolchain we can have access to? How did it get built?

> So it caused the script to execute the "exit -1". When I added the processing of the directory, it was successfully built.
> 
> Signed-off-by: MidCheck <mc.xin@foxmail.com>

Please, use your real name, not a nickname. Note that it must also match
the authorship. Non-latin-script characters are perfectly OK.

> ---
>  toolchain/helpers.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 24c482923a..e0ab991bec 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -28,6 +28,10 @@ copy_toolchain_lib_root = \
>  			elif test -f $${LIBPATH}; then \
>  				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
>  				break ; \
> +			elif test -d $${LIBPATH}; then \
> +				mkdir -p $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
> +				cp -r $${LIBPATH}/* $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
> +				break ; \

The proper fix would be to exclude directories in the find on line 13.

Indeed, LIBPATTERN is the argument to copy_toolchain_lib_root, and in
the case of external toolchains, is each item in TOOLCHAIN_EXTERNAL_LIBS,
the first of which is ld*.so.*, which we expect to only match files, but
in your case matches a directory.

As I understand it, ld.so.conf is not used at build time to find
libraries, so having it in the staging is useless.

Also note that having /etc/ld.so.conf.d in the target is not supported,
and that Buildroot will explicitly fail at the end of the build if it
sees such a directory, as it is not possible to have proper ldconfig
setup in cross-compilation; see the top-level Makefile, lines 753-756,
and commit 9c4072348960 (Makefile: drop ldconfig handling). And so it is
even weirder that your change makes the build succeed...

Regards,
Yann E. MORIN.

>  			else \
>  				exit -1; \
>  			fi; \
> -- 
> 2.40.0
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
