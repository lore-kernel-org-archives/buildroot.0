Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40467C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 11:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEBBE82443;
	Mon, 14 Feb 2022 11:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLPByjGJtMdy; Mon, 14 Feb 2022 11:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE31B81D9F;
	Mon, 14 Feb 2022 11:59:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A12E41BF20B
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 11:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F6D681BF5
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 11:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5EnvqSpPGsf for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 11:59:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DC3581D9F
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 11:59:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:892f:28b2:cec5:360f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2F6C22003A4;
 Mon, 14 Feb 2022 12:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644839947;
 bh=QiKwAUWmprHs+xYQZVoVATp/ClRxPGlWMQpYR4LelTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PUCfw2G9ilYY0k/zR+83OvKALBtB72ZoM5jYfTLYYQMxguRgxwdNArsvDVNshVsbI
 Nk1Qab7FAgXNoyR6joqBTiJEHVdVLQzkl5DHRtSnfvTY8ujtP2nTY46WOWPLcksndk
 ZbN7K2ga6K0LvSesSubtNdRaNwLtXis3ckUop+2V055MpsDlnAxrdS27z5jfUsKCbD
 +ho9LcZ8y+32WTboNLLLxNneAzP4BMdva3DAyk5twgPdfHsVsJPp584/e89SR5wftV
 7PGT1iSS0czTG89iEIcacYIttRroUoTf02Hg38kOXi3dfzxcYmDbFi8KXsbjEGsMlQ
 k9woNnaeM25sw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Feb 2022 12:59:02 +0100
Date: Mon, 14 Feb 2022 12:59:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220214115902.GB38097@scaer>
References: <20220214110559.2176506-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214110559.2176506-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: set
 BLUEZ5_UTILS_AUTORECONF
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
Cc: Marcin Bis <marcin@bis.org.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-02-14 12:05 +0100, Fabrice Fontaine spake thusly:
> Commit 572d08ee4a731b203b2d3aaf720a48f622609371 forgot to set
> BLUEZ5_UTILS_AUTORECONF resulting in the following build failure:
> 
> /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/10.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: gobex/gobex-packet.o: in function `g_obex_packet_set_data':
> gobex-packet.c:(.text+0x698): undefined reference to `util_memdup'
> 
> It should be noted that previous commit didn't fix any build failure
> with libglib >= 2.69. It only fixes the following warning:
> 
> profiles/battery/battery.c: In function 'read_initial_battery_level_cb':
> profiles/battery/battery.c:162:2: warning: 'g_memdup' is deprecated (declared at /home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/glib/gstrfuncs.h:257): Use 'g_memdup2' instead [-Wdeprecated-declarations]
>   batt->initial_value = g_memdup(value, length);
>   ^
> 
> So an other option would be to revert this commit.

That would have been a possibility, indeed, but I went for keeping it
instead.

> The 'real' build error that previous commit tried to fix was raised
> because rand was replaced by getrandom since
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/log/?qt=grep&q=getrandom
> but getrandom is not available until glibc 2.25:
> 
> plugins/autopair.c:20:24: fatal error: sys/random.h: No such file or directory
>  #include <sys/random.h>
>                         ^

But then this patch of yours does not fix this original issue, does it?

> Fixes:
>  - http://autobuild.buildroot.org/results/46f7dbfe1d80c7622d670ba1ac957e9e6077eb9f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master anyway, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bluez5_utils/bluez5_utils.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index 49f6eaac13..7c2561b864 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -13,6 +13,8 @@ BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
>  BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
>  BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
>  BLUEZ5_UTILS_CPE_ID_PRODUCT = bluez
> +# We're patching Makefile.am
> +BLUEZ5_UTILS_AUTORECONF = YES
>  
>  BLUEZ5_UTILS_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),bluez5_utils-headers) \
> -- 
> 2.34.1
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
