Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C73E776C2
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 20:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E003416F8;
	Mon,  2 Oct 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E003416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_H7O9eGnp9f; Mon,  2 Oct 2023 20:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2225F40B56;
	Mon,  2 Oct 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2225F40B56
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 953911BF5F8
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 20:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68E1681947
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68E1681947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcB7cdDcDFJa for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 20:51:49 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A19B818D0
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A19B818D0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:71b1:17da:abc1:f019])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2A9B960134;
 Mon,  2 Oct 2023 22:51:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Oct 2023 22:51:44 +0200
Date: Mon, 2 Oct 2023 22:51:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231002205144.GD2957@scaer>
References: <20231002195159.3053254-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231002195159.3053254-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696279907;
 bh=bZHcknVC5CHLmKpymEgk5sfo+6XoJiTG7Nhrap10m3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ALfW6J39hJjbTdq3faHZAQF9cGcP/Uj47iyZJJwSQNf1VRWnS8MIW10wD/x3JbyQL
 VNMuy6lfs0EeEHLDrGu7ThjLXngct1XEZCJlpQY/dpFPTjQp0vJeYywbTi8qAlJM22
 JTgPxcuZ+ewW4oVnLPorXiTtKkkhhspZHmiXqhqr4+JpG2qH9h4GMJOzbjNNUE5iWS
 hEasr1Za1RPnce8CWlkrwygESP1XVu2Bp4WVYzXvJ8zKMSClNQ0ptsihFuKeMPwK3E
 +NX53/judAl0S5qNIFlc2iApX4tAs+dCihpNNmYUhG6vyeV29mWAtRncd4gHLA3+k/
 cqR29AkeCWMbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ALfW6J39
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: fix cross build
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

Bernd, All,

On 2023-10-02 21:51 +0200, Bernd Kuhls spake thusly:
> Fixes build error
> 
> Building dns library in /home/bernd/buildroot/br4/output/build/dhcp-4.4.3-
> P1/bind/bind-9.11.36/lib/dns
> ./gen: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found 
> (required by ./gen)
> make[4]: *** [Makefile:601: include/dns/enumtype.h] Error 1
> make[3]: *** [Makefile:595: include] Error 2
> 
> with this defconfig
> 
> BR2_x86_64=y
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_DHCP=y
> 
> Please note that this build error only occurs when the target and the
> host system have the same arch. For example this defconfig builds fine:
> 
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_DHCP=y
> 
> on a Debian 12 x86_64 host using glibc-2.36:
> 
> $ /lib/ld-linux.so.2  --version
> ld.so (Debian GLIBC 2.36-9+deb12u1) stable release version 2.36.
> 
> The error occurs since buildroot commit 34f8d874ee which bumped glibc
> from 2.37 to 2.38.
> 
> This patch is inspired by the Yocto Project:
> https://patchwork.yoctoproject.org/project/oe/patch/20230715212159.3265080-1-raj.khem@gmail.com/

That patch has an important tidbit of inoormation that yours is missing,
and that is important to get: this is passing the configure options to
the internal bind.

Indeed, I was very puzzled why passing the same --build, --host, and
--target as pkg-autotools already does, would fix the issue.

But indeed, isch dhcp internally configure a bundled bind, and messes
when doing so.

So your patch looks like it is correct.

However, I would challenge it on other grounds: ISC decided to stop
maintaing dhcp starting end of 2022, almost a year ago, when they
released the last version of dhcp.

Should we just drop that package now and be done with it?

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/dhcp/dhcp.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 7be40191c8..094d361e45 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -32,6 +32,9 @@ DHCP_CONF_ENV = \
>  	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
>  
>  DHCP_BIND_EXTRA_CONFIG = \
> +	--build=$(GNU_HOST_NAME) \
> +	--host=$(GNU_TARGET_NAME) \
> +	--target=$(GNU_TARGET_NAME) \
>  	BUILD_CC='$(HOSTCC)' \
>  	BUILD_CFLAGS='$(HOST_CFLAGS)' \
>  	BUILD_CPPFLAGS='$(HOST_CPPFLAGS)' \
> -- 
> 2.39.2
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
