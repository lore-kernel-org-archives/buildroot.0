Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E78CF9C6E
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 03:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ADCC80D46;
	Mon, 23 Sep 2024 03:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qij-VIREeCz; Mon, 23 Sep 2024 03:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1903B80D1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1903B80D1D;
	Mon, 23 Sep 2024 03:57:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB01B1BF947
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 03:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98EC1405E9
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 03:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Myau7ZauKK4r for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 03:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 048704059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 048704059D
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 048704059D
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 03:57:09 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 0ACCF440A74;
 Mon, 23 Sep 2024 06:54:40 +0300 (IDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240922181831.2901344-2-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Sun, 22 Sep 2024 20:18:31 +0200")
References: <20240922181831.2901344-1-dario.binacchi@amarulasolutions.com>
 <20240922181831.2901344-2-dario.binacchi@amarulasolutions.com>
Date: Mon, 23 Sep 2024 06:57:05 +0300
Message-ID: <87cykvt432.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1727063680;
 bh=axSjhlaXmycBN/3aIagMZHJknvVG9Zmo+7NGJgXFxw0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lgpnNHERzmpiHTgTPd4sc4HNxl06gZVE0eZzjEdeV9yHt/pktjIWy88UYPt/EWyKC
 PcZ71yeN9Yrd2dFPSWJ3bAVgfcPHE58dIv9PvQVlH9uGCaGjBjHI8LifAmOoA13Na1
 a9SxuRafRPUmKoE6RkQG2Srpm3l7XCE4NI4T7pGS1z2kv2rQxLBWiBY/NfVh/zrlyA
 4w4V6f2lKgDV1j8pxKVJPP/Xf3ooZxlDWw763MAv5OiIwlX+jAaeom1mtois3Ottkp
 q0lDNDk7nviC4lhPtZRmw5hOZrArtqS22pPYitD5sIeHKWFAZ5SwBBpiGMuwcFw4Y8
 KYkubz/eqMx9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=lgpnNHER
Subject: Re: [Buildroot] [PATCH v2 2/2] package/iproute2: bump to version
 6.11.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Petr Vorel <petr.vorel@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On Sun, Sep 22 2024, Dario Binacchi wrote:
> The building test using musl as the C library for the cross-compilation
> toolchain raised errors that required the application of two additional
> patches. Furthermore, it was necessary, by properly setting CFLAGS, to
> instruct iproute2 not to define structures already provided by musl to
> avoid redefinition errors (i. e. in6_addr and sockaddr_in6).
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Added in v2
>
>  ...04-bridge-mst-fix-a-musl-build-issue.patch | 73 +++++++++++++++++++
>  ...e-mst-fix-a-further-musl-build-issue.patch | 56 ++++++++++++++
>  package/iproute2/iproute2.hash                |  2 +-
>  package/iproute2/iproute2.mk                  |  6 +-
>  4 files changed, 135 insertions(+), 2 deletions(-)
>  create mode 100644 package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
>  create mode 100644 package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
>
> diff --git a/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch b/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
> new file mode 100644
> index 000000000000..9dddfb6e7f26
> --- /dev/null
> +++ b/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
> @@ -0,0 +1,73 @@
> +From 0359ee6dc57ee8aa21a3f0f7404422c0f9372d3a Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Sun, 22 Sep 2024 14:00:42 +0200
> +Subject: [PATCH] bridge: mst: fix a musl build issue
> +
> +This patch fixes a compilation error raised by the bump to version 6.11.0
> +in Buildroot using musl as the C library for the cross-compilation
> +toolchain.
> +
> +After setting the CFLGAS
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +IPROUTE2_CFLAGS += -D__UAPI_DEF_IN6_ADDR=0 -D__UAPI_DEF_SOCKADDR_IN6=0 \
> +			-D__UAPI_DEF_IPV6_MREQ=0
> +endif
> +
> +to fix the following errors:
> +
> +In file included from ../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/arpa/inet.h:9,
> +                 from ../include/libnetlink.h:14,
> +                 from mst.c:10:
> +../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
> +   23 | struct in6_addr {
> +      |        ^~~~~~~~
> +In file included from ../include/uapi/linux/if_bridge.h:19,
> +                 from mst.c:7:
> +../include/uapi/linux/in6.h:33:8: note: originally defined here
> +   33 | struct in6_addr {
> +      |        ^~~~~~~~
> +../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:34:8: error: redefinition of 'struct sockaddr_in6'
> +   34 | struct sockaddr_in6 {
> +      |        ^~~~~~~~~~~~
> +../include/uapi/linux/in6.h:50:8: note: originally defined here
> +   50 | struct sockaddr_in6 {
> +      |        ^~~~~~~~~~~~
> +../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:42:8: error: redefinition of 'struct ipv6_mreq'
> +   42 | struct ipv6_mreq {
> +      |        ^~~~~~~~~
> +../include/uapi/linux/in6.h:60:8: note: originally defined here
> +   60 | struct ipv6_mreq {
> +
> +I got this further errors
> +
> +../include/uapi/linux/in6.h:72:25: error: field 'flr_dst' has incomplete type
> +   72 |         struct in6_addr flr_dst;
> +      |                         ^~~~~~~
> +../include/uapi/linux/if_bridge.h:711:41: error: field 'ip6' has incomplete type
> +  711 |                         struct in6_addr ip6;
> +      |                                         ^~~
> +
> +fixed by including the netinet/in.h header.
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://patchwork.kernel.org/project/netdevbpf/patch/20240922145011.2104040-1-dario.binacchi@amarulasolutions.com/
> +---
> + bridge/mst.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/bridge/mst.c b/bridge/mst.c
> +index 873ca5369fd6..c8f7e6606c3c 100644
> +--- a/bridge/mst.c
> ++++ b/bridge/mst.c
> +@@ -4,6 +4,7 @@
> +  */
> + 
> + #include <stdio.h>
> ++#include <netinet/in.h>
> + #include <linux/if_bridge.h>
> + #include <net/if.h>
> + 
> +-- 
> +2.43.0
> +
> diff --git a/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch b/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
> new file mode 100644
> index 000000000000..f4e7c317bf9c
> --- /dev/null
> +++ b/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
> @@ -0,0 +1,56 @@
> +From 62c4dfff5ff596984ece7960fba49b05d69f37a7 Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Sun, 22 Sep 2024 14:11:18 +0200
> +Subject: [PATCH] bridge: mst: fix a further musl build issue
> +
> +This patch fixes the following build errors:
> +
> +In file included from mst.c:11:
> +../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
> +   80 | _PRINT_FUNC(tv, const struct timeval *)
> +      |                              ^~~~~~~
> +../include/json_print.h:50:37: note: in definition of macro '_PRINT_FUNC'
> +   50 |                                     type value);                        \
> +      |                                     ^~~~
> +../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
> +   80 | _PRINT_FUNC(tv, const struct timeval *)
> +      |                              ^~~~~~~
> +../include/json_print.h:55:45: note: in definition of macro '_PRINT_FUNC'
> +   55 |                                             type value)                 \
> +      |                                             ^~~~
> +../include/json_print.h: In function 'print_tv':
> +../include/json_print.h:58:48: error: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
> +   58 |                                                value);                  \
> +      |                                                ^~~~~
> +      |                                                |
> +      |                                                const struct timeval *
> +../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
> +   80 | _PRINT_FUNC(tv, const struct timeval *)
> +      | ^~~~~~~~~~~
> +../include/json_print.h:50:42: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
> +   50 |                                     type value);                        \
> +      |                                          ^
> +../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
> +   80 | _PRINT_FUNC(tv, const struct timeval *)
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://patchwork.kernel.org/project/netdevbpf/patch/20240922145011.2104040-2-dario.binacchi@amarulasolutions.com/
> +---
> + bridge/mst.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/bridge/mst.c b/bridge/mst.c
> +index c8f7e6606c3c..fccb7fd68140 100644
> +--- a/bridge/mst.c
> ++++ b/bridge/mst.c
> +@@ -4,6 +4,7 @@
> +  */
> + 
> + #include <stdio.h>
> ++#include <sys/time.h>
> + #include <netinet/in.h>
> + #include <linux/if_bridge.h>
> + #include <net/if.h>
> +-- 
> +2.43.0
> +
> diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
> index 0760183b9e66..028a32439644 100644
> --- a/package/iproute2/iproute2.hash
> +++ b/package/iproute2/iproute2.hash
> @@ -1,3 +1,3 @@
>  # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> -sha256  91a62f82737b44905a00fa803369c447d549e914e9a2a4018fdd75b1d54e8dce  iproute2-6.10.0.tar.xz
> +sha256  1f795398a04aeaacd06a8f6ace2cfd913c33fa5953ca99daae83bb5c534611c3  iproute2-6.11.0.tar.xz
>  sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index 08b890b33117..ae95de045b02 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IPROUTE2_VERSION = 6.10.0
> +IPROUTE2_VERSION = 6.11.0
>  IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
>  IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
>  IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
> @@ -53,6 +53,10 @@ endef
>  
>  # workaround for static_assert on uclibc-ng < 1.0.42
>  IPROUTE2_CFLAGS = $(TARGET_CFLAGS) -Dstatic_assert=_Static_assert
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +IPROUTE2_CFLAGS += -D__UAPI_DEF_IN6_ADDR=0 -D__UAPI_DEF_SOCKADDR_IN6=0 \
> +			-D__UAPI_DEF_IPV6_MREQ=0

All these macros are defined this way already in musl
include/netinet/in.h which your patch above adds to #include. Are you
sure this is necessary?

baruch

> +endif
>  
>  define IPROUTE2_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) LDFLAGS="$(TARGET_LDFLAGS)" \

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
