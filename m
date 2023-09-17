Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F86CCD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B2EF61100;
	Sun, 17 Sep 2023 12:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B2EF61100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5aAFVA5P0Qg; Sun, 17 Sep 2023 12:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ACAD610F3;
	Sun, 17 Sep 2023 12:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ACAD610F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C04941BF870
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A660281E78
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A660281E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jTbaLMwAyWse for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:39:04 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 689F081E30
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689F081E30
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 95208B00563;
 Sun, 17 Sep 2023 14:38:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 14:38:59 +0200
Date: Sun, 17 Sep 2023 14:38:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230917123859.GO415981@scaer>
References: <20230916211714.1175631-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916211714.1175631-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694954342;
 bh=3bQghgeoGtw5+rx+gOdqwzeR8s/JQHGGWZh3cUvhwtM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rPBu5dl0Et0f5/9FP+TcSqArPF+fMk7GQTtD24SejL++JTnZhuNSG/Lk23wPRJMAi
 gPJk9DtklhM8W2Ejh1fFUjWvsh8DqOTgsL30O68J0WXAtKQDepWWMCl0DIJhf71SaC
 c26oV/MszTQSorrgOXGFrAKLAHNOSVtAKY61LAjT5k/OPofj7R/Lq2Gsv+er+sYRo6
 igmIT31U20X+MU538Ey5RmFcQw6GqkMmAJfT5snjtZcXcSIkwNFQpjdJaFMfXhA2bq
 CTWouA4HevA9hVfPW/oFD2K8h+ofXi8+Yt9OvTRx76f5AZbX21AM7VlM17iSSL8+aI
 mdiF6sYJkQLfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rPBu5dl0
Subject: Re: [Buildroot] [PATCH 1/1] package/fstrcmp: fix musl static build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-16 23:17 +0200, Fabrice Fontaine spake thusly:
> Fix the following musl static build failure raised because host libtool
> is not patched to manage "-static" as "-all-static".
> 
> /home/buildroot/autobuild/instance-2/output-1/host/bin/libtool --mode=link --tag=CC /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -Wextra -Wshadow -o bin/test_user \
> 	test_user/main.lo lib/libfstrcmp.la -static
> chmod a+rx bin/test_prelude
> libtool: link: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wall -Wextra -Wshadow -o bin/test_user test_user/main.o  lib/.libs/libfstrcmp.a
> libtool: link: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wall -Wextra -Wshadow -o bin/fstrcmp fstrcmp/main.o  lib/.libs/libfstrcmp.a
> /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
> /home/buildroot/autobuild/instance-2/output-1/build/host-gcc-final-10.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ffbee12f13e3d6c180d8891a428c6c490163083d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fstrcmp/fstrcmp.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/fstrcmp/fstrcmp.mk b/package/fstrcmp/fstrcmp.mk
> index 9c42159afb..cafb451833 100644
> --- a/package/fstrcmp/fstrcmp.mk
> +++ b/package/fstrcmp/fstrcmp.mk
> @@ -15,6 +15,11 @@ FSTRCMP_CONF_ENV = LIBTOOL="$(HOST_DIR)/bin/libtool"
>  
>  FSTRCMP_MAKE_OPTS = all-bin libdir/pkgconfig/fstrcmp.pc
>  
> +# host-libtool is not patched to make -static behave like -all-static

I was a bit confused about the mention of host-libtool here. So I
slightly reworded the comment to refer to ltmain.sh instead.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_STATIC_LIBS),y)
> +FSTRCMP_MAKE_OPTS += LDFLAGS="$(TARGET_LDFLAGS) -all-static"
> +endif
> +
>  # We need to install the package files ourselves due to upstream trying
>  # to install a .lai file which is missing because of rpath removal
>  define FSTRCMP_INSTALL_STAGING_CMDS
> -- 
> 2.40.1
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
