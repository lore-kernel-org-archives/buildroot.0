Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51151ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1AEE843A6;
	Sat, 17 Sep 2022 15:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1AEE843A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81ek_6MuX_jB; Sat, 17 Sep 2022 15:53:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 535E68439A;
	Sat, 17 Sep 2022 15:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 535E68439A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 725D01BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AD938439A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AD938439A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IwoCFJsHfiyk for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:53:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A57780C12
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A57780C12
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:53:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E0CF51C0002;
 Sat, 17 Sep 2022 15:52:59 +0000 (UTC)
Date: Sat, 17 Sep 2022 17:52:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220917175257.1080cdd7@windsurf>
In-Reply-To: <20220912071239.2848460-1-james.hilliard1@gmail.com>
References: <20220912071239.2848460-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663429980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8qri0lbEJ3wZvmaznPCSJMpX8et3eT5SQ1887kmx7k=;
 b=ZG1hLXmO1tGonY+zR8lCgJ4JJqptfiJF2bdIUbR8j21LipXHH6zmEl9NvzcfWlbCvMh3ra
 uzeK5DPMeoztDVpSJhIHgJ5VUThynxx/boK8m1iEAgVTYI7n8f+cN1m0zoDeDHjjF4A8Tg
 XcK/IkIZ/zaZ8sDi+VJS98xuMo194SSsBqPU+rrImtVxaNm+LJKq1Zx3w2q3Fvxu98UlZh
 pXFONfgRgR1hJMoXWK1vSbt84PhXcaWDsxx11bO85XP/ADsxR1kvXR7Pb96IEUVvbnAE3v
 QK6oMXOc7BYMs4nGFdzTSmJPB+xYVCUmkdqbVUyweytujpJa+6kPIstVpmVwYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZG1hLXmO
Subject: Re: [Buildroot] [PATCH 1/1] package/icu: clear TARGET env variable
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

On Mon, 12 Sep 2022 01:12:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> If the TARGET env variable is set icu may try to use it.
> 
> To prevent this from causing issues clear it from the icu env.
> 
> Fixes:
> >>> host-icu 70-1 Building  
> PATH="/home/buildroot/buildroot/output/per-package/host-icu/host/bin:/home/buildroot/buildroot/output/per-package/host-icu/host/sbin:/home/buildroot/bin:/home/buildroot/.local/bin:/home/buildroot/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> PKG_CONFIG="/home/buildroot/buildroot/output/per-package/host-icu/host/bin/pkg-config"
> PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
> PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
> PKG_CONFIG_LIBDIR="/home/buildroot/buildroot/output/per-package/host-icu/host/lib/pkgconfig:/home/buildroot/buildroot/output/per-package/host-icu/host/share/pkgconfig"
>  /usr/bin/make -j33  -C
> /home/buildroot/buildroot/output/build/host-icu-70-1/source
> cd ./config; \
>     /usr/bin/make -f pkgdataMakefile
> rm -rf config/icu-config
> rebuilding config/icucross.mk
> rebuilding config/icucross.inc
> /bin/bash ./mkinstalldirs lib
> /bin/bash ./mkinstalldirs bin
> /usr/bin/install -c ./config/icu-config-top config/icu-config
> rm -rf pkgdata.inc
> chmod u+w config/icu-config
> mkdir lib
> mkdir bin
> LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/Makefile.inc
> | grep -v '#M#' | uniq >> config/icu-config
> config/icu-uc.pc updated.
> config/icu-i18n.pc updated.
> /usr/bin/make[2]: Making `all' in `stubdata'
> LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/mh-linux |
> grep -v '#M#' | uniq >> config/icu-config
> cat ./config/icu-config-bottom >> config/icu-config
>    (deps)     stubdata.cpp
> chmod u-w config/icu-config
> Note: rebuild with "/usr/bin/make VERBOSE=1 " to show all compiler parameters.
> make[3]: *** No rule to make target 'bpf', needed by 'all-local'.  Stop.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/icu/icu.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
