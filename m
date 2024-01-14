Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A3FC4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 12:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD92F418D0;
	Sun, 14 Jan 2024 12:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD92F418D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c5u7S0OeOqAE; Sun, 14 Jan 2024 12:33:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFA94418D2;
	Sun, 14 Jan 2024 12:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFA94418D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 013811BF59E
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 12:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBF1C418D2
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 12:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBF1C418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3h69mXuoF5Ft for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 12:33:37 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C033B418D0
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 12:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C033B418D0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5724013F846;
 Sun, 14 Jan 2024 13:33:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 13:33:31 +0100
Date: Sun, 14 Jan 2024 13:33:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZaPUmxh3jgrzCmEc@landeda>
References: <20240113100654.85904-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240113100654.85904-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705235614;
 bh=J/2BZux5j20IDyuMeK7Rs2IRL+JBXPEQPn5Uhsy6c2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zw9w9PhHBAs6/E5/c7BYMsfJkEdmFVQXAErHMjb92RTZKaQhYw7F89GrGlZftmdg0
 hkvz0VvEDZMjCGZHXy52BbNPmnPc10zyi3nL783JLPoUyeKwcK18d7yZ9DamF3Gr+U
 Fz2j8oiVRaBU9TljJd+vZbaAIWkSPMTFaedzEP5xxQXc4xht6ity87C1R07WAF4l+U
 hjKyCV8DxU03BpyrXUIdKcoFO55hI/OxWcEBciZhPcGchN2kmJMb38YHBOr33ir7O2
 6/ldPn09CONVzW66copnMVe2q6NsRTtz+C7gwJSIT2aAUF3c/ffj3XCEql3qoxwpiQ
 djd27il7tL6vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zw9w9PhH
Subject: Re: [Buildroot] [PATCH 1/1] package/apcupsd: set LD to TARGET_CXX
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

James, question for you, below...

On 2024-01-13 11:06 +0100, Fabrice Fontaine spake thusly:
> As found out by Yann E. Morin in [1], apcupsd configure script is ugly,
> and uses gcc to do the link line-wrapping which will raise the following
> build failure with gcc 13:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/13.2.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/13.2.0/../../../../powerpc64le-buildroot-linux-gnu/lib/../lib64/libsupc++.a(eh_alloc.o): in function `std::basic_string_view<char, std::char_traits<char> >::compare(unsigned long, unsigned long, char const*, unsigned long) const':
> eh_alloc.cc:(.text._ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmPKcm[_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmPKcm]+0x44): undefined reference to `std::__throw_out_of_range_fmt(char const*, ...)'
> 
> It will also raise the following build failure on sparc/arc:
> 
> /home/autobuild/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/arceb-buildroot-linux-uclibc/sysroot/lib/libsupc++.a(eh_throw.o): in function `__exchange_and_add_dispatch':
> /SCRATCH/arcjenkins2/slaves/ru20-custom-arcgnu2/workspace/arcoss_verification/arc_gnu_toolchain_release/arc_gnu_toolchain_release/bd-uclibceb/gcc-stage2/arceb-snps-linux-uclibc/libstdc++-v3/include/ext/atomicity.h:82: undefined reference to `__gnu_cxx::__exchange_and_add(int volatile*, int)'
> /home/autobuild/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: /SCRATCH/arcjenkins2/slaves/ru20-custom-arcgnu2/workspace/arcoss_verification/arc_gnu_toolchain_release/arc_gnu_toolchain_release/bd-uclibceb/gcc-stage2/arceb-snps-linux-uclibc/libstdc++-v3/include/ext/atomicity.h:82: undefined reference to `__gnu_cxx::__exchange_and_add(int volatile*, int)'
> 
> Instead of trying to patch the configure script as advocated by
> Yann E. Morin, set LD to TARGET_CXX as:
>  - this solution is quicker
>  - usptream is dead (last release in 2016)

Last release was 3.14.14. Too bad they did not do 3.14.15.. ;-)

Seriously, though: is apcupsd still needed, when we have nut that
handles a large number of UPSes:
    https://networkupstools.org/ddl/APC/

James, as you were the one to introduce apcupsd: what does apcupsd do
that nut does not provide for?

>  - this solution has already been used in other packages (nodejs, zmqpp)
> 
> [1]: https://patchwork.ozlabs.org/project/buildroot/patch/20200812171821.2517-1-Evgeniy.Didin@synopsys.com/
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6096c3ddc5edf3204635c2c90246c2e8c8e074e7
>  - http://autobuild.buildroot.org/results/d8a/d8a3ab31c5b86871c7e1117f4ffa7b6cedfcb7e0/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

> ---
>  package/apcupsd/apcupsd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
> index 80ed0b0832..97e6d6a558 100644
> --- a/package/apcupsd/apcupsd.mk
> +++ b/package/apcupsd/apcupsd.mk
> @@ -71,8 +71,8 @@ APCUPSD_CONF_OPTS += --disable-usb
>  endif
>  
>  define APCUPSD_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/platforms
> +	$(TARGET_MAKE_ENV) $(MAKE) LD="$(TARGET_CXX)" -C $(@D)/src
> +	$(TARGET_MAKE_ENV) $(MAKE) LD="$(TARGET_CXX)" -C $(@D)/platforms
>  endef
>  
>  define APCUPSD_INSTALL_TARGET_CMDS
> -- 
> 2.43.0
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
