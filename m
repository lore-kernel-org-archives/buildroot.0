Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A77CC04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 10:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D47661172;
	Sat, 30 Jul 2022 10:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D47661172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id we7lyhNmZ-9K; Sat, 30 Jul 2022 10:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FAB86114E;
	Sat, 30 Jul 2022 10:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FAB86114E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BD301BF37B
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 10:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66ABA40278
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 10:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66ABA40278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LBAxeL_Jy0c for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 10:22:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0FD940145
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0FD940145
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 10:22:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6003C6012A;
 Sat, 30 Jul 2022 12:22:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 12:22:51 +0200
Date: Sat, 30 Jul 2022 12:22:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220730102251.GN3168@scaer>
References: <20220727221055.1838031-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727221055.1838031-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659176575;
 bh=PzoiqTvhaJiX1281JVoNZ/gg1m2IK2HzG+Q5FsBJ+AI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XK1HyaYPNWF9cRLuCkjM2P2dORD5qk9oVQBBoccga6rKQd8NM5CFHprGXUBuBrD83
 3NXr+F5TbwWaB3kkTWqYd7nq3Oy2eDrTQ41FFJkK7Tn3zyEQuYK0eoTIb3KCn270wx
 OfGgKbrq4OIyqnea5WxYZrtN7s9EDqCOHsTtSb+9ZOE0Tqh6TaBwhefJfCWCCp5zxA
 0P1aR9nuGOp0vQNFoBwoFHuQvu+s+WSCWdKE2CiHlMh3XxSwMyW36xTyUkKW9X16qa
 6ywnM/NzVNEKzr7tWruL+clIl4yqj06eXWRNNcD2FbCKhXtE0aApgbYuqtRbEpp8Qq
 /ZbExM6Z/7h0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XK1HyaYP
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: use statically linked
 host tools
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-07-27 16:10 -0600, James Hilliard spake thusly:
> This lets us remove the HOST_SYSTEMD_FIX_RPATH hack.

This will require a lot more explanations than just that.

Please, compare the length of the explanations in 35c11a027c88
(package/systemd: add host variant), that went to extra details about
the issue, with your patch that has just one terse line that does not
explain anything.

The commit log is not about stating _what_ is done, but _why_ it is.
A small note about the _what_ can be needed to summarise it, and what
you wrote is enough. But you need to really extend the explanations on
_why_ it is correct to now do so.

Which it is not entirely either:

    $ readelf -d host/bin/systemctl
    [--SNIP--]
     0x000000000000001d (RUNPATH)            Library runpath: [/usr/lib/systemd:/home/ymorin/dev/buildroot/O/misc/per-package/host-systemd/host/lib]

So, this is wrong, because it is going to use my system's systemd libs,
not the host ones. Also, it still looks into the per-package directory
instead of $(HOST_DIR). This does not prevent it to work, but is
semantically incorrect. It will however break in a system that does not
have the systemd libraries installed, or has incompatible libraries
(e.g. too old or too recent). So, the rpath fixup hook is stil needed.

Maybe you can do for systemctl as was done for the other tools? Or maybe
upstream should have a global option to build everything shared or
static, instead of one such option for each tool...

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...nalctl-allow-statically-linked-build.patch | 68 +++++++++++++++++++
>  package/systemd/systemd.mk                    | 28 +++-----
>  2 files changed, 76 insertions(+), 20 deletions(-)
>  create mode 100644 package/systemd/0002-journalctl-allow-statically-linked-build.patch
> 
> diff --git a/package/systemd/0002-journalctl-allow-statically-linked-build.patch b/package/systemd/0002-journalctl-allow-statically-linked-build.patch
> new file mode 100644
> index 0000000000..98ffb72cca
> --- /dev/null
> +++ b/package/systemd/0002-journalctl-allow-statically-linked-build.patch
> @@ -0,0 +1,68 @@
> +From d2dadbdc5618776e07e98baf8795cc8adebf05a1 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Wed, 27 Jul 2022 15:28:09 -0600
> +Subject: [PATCH] journalctl: allow statically linked build
> +
> +The journalctl tool may be needed on cross compilation hosts in order
> +to run --update-catalog against a target rootfs.
> +
> +To avoid reliability issues caused by shared linking allow journalctl
> +to be linked statically.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[Upstream status:
> +https://github.com/systemd/systemd/pull/24140]

That has been accepted now.

We are usually not too fond of feature backports, except maybe when they
fix a build/run breakage that we can't easily fix otherwise. But in this
case, we do not have a breakage, just ugly code, and the build succeeds,
and the system runs. So, I think that this cleanup can very well wait
for after we update to an upstream version that has this feature.

> @@ -781,6 +781,13 @@ HOST_SYSTEMD_CONF_OPTS = \
>  	--libdir=lib \
>  	--sysconfdir=/etc \
>  	--localstatedir=/var \
> +	-Dlink-udev-shared=false \
> +	-Dlink-systemctl-shared=false \
> +	-Dlink-networkd-shared=false \
> +	-Dlink-timesyncd-shared=false \
> +	-Dlink-journalctl-shared=false \
> +	-Dlink-boot-shared=false \
> +	-Dstandalone-binaries=true \

What is this new 'standalone' mode, and how is it related to statically
linking tools?

>  	-Dmode=release \
>  	-Dutmp=false \
>  	-Dhibernate=false \
> @@ -854,24 +861,5 @@ HOST_SYSTEMD_DEPENDENCIES = \
>  
>  HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
>  
> -# Fix RPATH After installation
> -# * systemd provides a install_rpath instruction to meson because the binaries
> -#   need to link with libsystemd which is not in a standard path
> -# * meson can only replace the RPATH, not append to it
> -# * the original rpath is thus lost.
> -# * the original path had been tweaked by buildroot via LDFLAGS to add
> -#   $(HOST_DIR)/lib
> -# * thus re-tweak rpath after the installation for all binaries that need it
> -HOST_SYSTEMD_HOST_TOOLS = busctl journalctl systemctl systemd-* udevadm
> -
> -define HOST_SYSTEMD_FIX_RPATH
> -	for f in $(addprefix $(HOST_DIR)/bin/,$(HOST_SYSTEMD_HOST_TOOLS)); do \
> -		[ -e $$f ] || continue; \
> -		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $${f} \
> -		|| exit 1; \
> -	done
> -endef
> -HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH

That we will eventually be able to drop this hook, is very good news,
though. But I think that is not urgent, and that we can wait for the
next version bump.

Regards,
Yann E. MORIN.

>  $(eval $(meson-package))
>  $(eval $(host-meson-package))
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
