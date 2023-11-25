Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFF0C4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 21:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ABC460A74;
	Sat, 25 Nov 2023 21:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ABC460A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bs5avPSiYUVv; Sat, 25 Nov 2023 21:41:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AFBA60A4F;
	Sat, 25 Nov 2023 21:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AFBA60A4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A43991BF473
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ACF9400DD
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ACF9400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRmCs7uZDQvM for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 21:41:16 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AA0D400B8
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 21:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA0D400B8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3B51713F86E;
 Sat, 25 Nov 2023 22:41:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 22:41:11 +0100
Date: Sat, 25 Nov 2023 22:41:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231125214111.GP3177259@scaer>
References: <20231123215250.486862-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123215250.486862-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700948474;
 bh=Vpxw1Z4Ai+7IKSqYlfomG4qt4PGse91XAVcH2ErStck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dwHrVHPqu4hPhRsCfHPCI8scVjJ9vocuE3OqOaCMV2LZYRNosQVSsI5MWnYT3iV0u
 XZj52XlYvcEFrADfTx3iMBXmtbSDj1moAOF1W3Nvcg2GjFiaT31uExLlv2jM1c3qS5
 JuFZGNoUet1y1GL3vYhkn3Mp8kopu/rjJalNrKTb23MYaXENqTbcY01sKH8xK4pQw/
 ZsJCdjVCHU4b0mRWsTQvPceXYBnHaHC374otR1szHIpDU1FAdRYRgrzIFlET968PvW
 DjeO7puDYG13W05uSyCgvZVtSxlOPKAwYhaGjfn21VvrpIokPDQrr7qGN5kpgFAHSw
 +AIaOn6BGlOPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dwHrVHPq
Subject: Re: [Buildroot] [PATCH 1/1] package/oatpp: fix uclibc build
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
Cc: Alessandro Partesotti <a.partesotti@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-11-23 22:52 +0100, Fabrice Fontaine spake thusly:
> Fix the following uclibc build failure raised since the addition of the
> package in commit d5bba26801b352f591451cf73e0b7509de0e6850:
> 
> In file included from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.hpp:28,
>                  from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.cpp:25:
> /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/core/base/Environment.hpp:359:93: error: 'va_list' has not been declared
>   359 |   static void vlogFormatted(v_uint32 priority, const std::string& tag, const char* message, va_list args);
>       |                                                                                             ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bcdf7548ff752f936defd111d13c63245ea70cbe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...base-Environment.hpp-include-cstdarg.patch | 37 +++++++++++++++++++
>  package/oatpp/oatpp.mk                        |  6 +++
>  2 files changed, 43 insertions(+)
>  create mode 100644 package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
> 
> diff --git a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
> new file mode 100644
> index 0000000000..f02215d8a9
> --- /dev/null
> +++ b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
> @@ -0,0 +1,37 @@
> +From b3e8930ccbaeeb77a4cd8b0fffbe52a208aa9a29 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 23 Nov 2023 22:45:56 +0100
> +Subject: [PATCH] src/oatpp/core/base/Environment.hpp: include cstdarg
> +
> +Include cstdarg to fix the following build failure with uclibc-ng:
> +
> +In file included from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.hpp:28,
> +                 from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.cpp:25:
> +/home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/core/base/Environment.hpp:359:93: error: 'va_list' has not been declared
> +  359 |   static void vlogFormatted(v_uint32 priority, const std::string& tag, const char* message, va_list args);
> +      |                                                                                             ^~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/bcdf7548ff752f936defd111d13c63245ea70cbe
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/oatpp/oatpp/pull/895

It's been merged now, so I changed that to point to the actual commit.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +---
> + src/oatpp/core/base/Environment.hpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/oatpp/core/base/Environment.hpp b/src/oatpp/core/base/Environment.hpp
> +index fd77a5c6..05d5c949 100644
> +--- a/src/oatpp/core/base/Environment.hpp
> ++++ b/src/oatpp/core/base/Environment.hpp
> +@@ -29,6 +29,7 @@
> + #include "./Compiler.hpp"
> + #include "./Config.hpp"
> + 
> ++#include <cstdarg>
> + #include <cstdio>
> + #include <atomic>
> + #include <mutex>
> +-- 
> +2.42.0
> +
> diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
> index 621a549023..c8b0c9694a 100644
> --- a/package/oatpp/oatpp.mk
> +++ b/package/oatpp/oatpp.mk
> @@ -13,4 +13,10 @@ OATPP_INSTALL_STAGING = YES
>  # Only builds a static lib and headers
>  OATPP_INSTALL_TARGET = NO
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
> +OATPP_CONF_OPTS += -DOATPP_COMPAT_BUILD_NO_SET_AFFINITY=OFF
> +else
> +OATPP_CONF_OPTS += -DOATPP_COMPAT_BUILD_NO_SET_AFFINITY=ON
> +endif
> +
>  $(eval $(cmake-package))
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
