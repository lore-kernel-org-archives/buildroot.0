Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC7BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 20:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF94542587;
	Sat, 28 Oct 2023 20:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF94542587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id No12iKbeKw4p; Sat, 28 Oct 2023 20:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 037BA404DC;
	Sat, 28 Oct 2023 20:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 037BA404DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE10E1BF25F
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C48214187C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C48214187C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t572aImUI_Ap for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 20:45:38 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D12641869
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 20:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D12641869
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5F9152003EE;
 Sat, 28 Oct 2023 22:45:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Oct 2023 22:45:32 +0200
Date: Sat, 28 Oct 2023 22:45:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231028204532.GI2582@scaer>
References: <20231028151445.10334-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231028151445.10334-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698525935;
 bh=rFPM/vSVrD1FmffN+0Oentl9A1FCMH+wdlKTjykra1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EpFi8aEqF+E40VEpinaeOamC292FqZduEgGJRnB9+ZO5Bpdd7B1kZoxyU1O6KwRIY
 KDnTpdbjcNrjX56/E/DwOwzAqq7WJOXIuANdyfdyZOXNjlvrgOptfrEsvb7iRB3uvU
 j/C1BrJ+pPhSHb59SCUnuUjB95CezyPZVizEgSdxluPDXY0k/nB93GxX/mFUb7NRWh
 W27SFyCcuD2EIiPHT/yE+G8vlw/1xxqT69+fuvkPHqNq6MfrV6xhShFIRZixSp22u2
 vO/lN/qJcJBlAnUYbk1Sc4YW8pEIl0TeH7Tg2E1IbcDVuxbkjUGz7KJQKYTH/ED0RW
 1YZKO8CkY1dnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EpFi8aEq
Subject: Re: [Buildroot] [PATCH 1/1] package/spirv-headers: needs C++
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-10-28 17:14 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit 0a01085abeb7d8a097cb68b9f7f4faec7711543c:
> 
> CMake Error at /home/buildroot/autobuild/instance-3/output-1/host/share/cmake-3.27/Modules/CMakeTestCXXCompiler.cmake:60 (message):
>   The C++ compiler
> 
>     "/usr/bin/c++"
> 
>   is not able to compile a simple test program.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4b94edf6dee03e74ff53939aa228069cc6ba4292
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/spirv-headers/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/spirv-headers/Config.in b/package/spirv-headers/Config.in
> index fd20f301d4..e03a6ca1ee 100644
> --- a/package/spirv-headers/Config.in
> +++ b/package/spirv-headers/Config.in
> @@ -1,6 +1,10 @@
>  config BR2_PACKAGE_SPIRV_HEADERS
>  	bool "spirv-headers"
> +	depends on BR2_INSTALL_LIBSTDCPP

spirv-headers are selected by spirv-tools, so the dependency must be
propagated there.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  	help
>  	  Machine-readable files for the SPIR-V Registry
>  
>  	  https://www.khronos.org/registry/spir-v
> +
> +comment "spirv-headers needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.42.0
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
