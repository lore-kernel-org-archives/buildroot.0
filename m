Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE57C4167D
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 10:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4235284AEF;
	Wed,  1 Nov 2023 10:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4235284AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTA4lwFJrpyz; Wed,  1 Nov 2023 10:53:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E10084AF5;
	Wed,  1 Nov 2023 10:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E10084AF5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6DFB1BF20D
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADC7561423
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC7561423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEgCuzU9cD0C for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 10:52:59 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E281F6FA39
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 10:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E281F6FA39
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:67d2:c63c:7c2a:c31])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8685C19F745;
 Wed,  1 Nov 2023 11:52:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 Nov 2023 11:52:53 +0100
Date: Wed, 1 Nov 2023 11:52:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101105253.GA114892@scaer>
References: <20231030085054.31859-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231030085054.31859-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698835975;
 bh=zB5xnB5WZTcbj3aBeXg1/3UGgZ8qpbl+3ofDZcCh9zM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=REVV2sfWO5bpVnM+YN5bM9sEhwAXVaGhDDrkHnimd8P/lzih2hyraiW7Tgjr+z+6d
 gD0E0Z3fcJ2pBSpyk+F2QwXP97ELhPNoXEJDMuW7/1xNFfoW3wQjFtd8XTi2bj+M8v
 H2NJ38pDydgvi9AbqcxjxqN2EPsG1lI0dY/AIV2B8z8TjI71I6PrNYTqwgsACMfuvm
 ENn9uNOmnoH+3bg6Hj8dlnYsqeBwzzqA8PxVTenbUhmnsOjegRw/V8k6v1HlIIjjk4
 SwhArf0+UUELJMSzNGt5T8w1hBl93czWbMM9gxfeGTjK9hQhqf3M+Ir0+B90FyGIKs
 PWc+nLGyaLqXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=REVV2sfW
Subject: Re: [Buildroot] [PATCH 1/1] package/sedutil: fix build with gcc >=
 13
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

Fabrice, All,

On 2023-10-30 09:50 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure with gcc >= 13:
> 
> In file included from ./Common/log.h:45,
>                  from LinuxPBA/LinuxPBA.cpp:25:
> ./Common/DtaOptions.h:33:5: error: 'uint8_t' does not name a type
>    33 |     uint8_t password;   /**< password supplied */
>       |     ^~~~~~~
> ./Common/DtaOptions.h:1:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b6feb4fb33d595414b61174deb9867e8c30cd186
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0002-include-missing-cstdint.patch        | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/sedutil/0002-include-missing-cstdint.patch
> 
> diff --git a/package/sedutil/0002-include-missing-cstdint.patch b/package/sedutil/0002-include-missing-cstdint.patch
> new file mode 100644
> index 0000000000..07a617c5e7
> --- /dev/null
> +++ b/package/sedutil/0002-include-missing-cstdint.patch
> @@ -0,0 +1,31 @@
> +From 927cd88cad7bea94c2eebecc18f7881f0defaccb Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 26 Jan 2023 23:36:29 -0800
> +Subject: [PATCH] include missing <cstdint>
> +
> +gcc 13 moved some includes around and as a result <cstdint>
> +is no longer transitively included [1]. Explicitly include
> +it for uint{32,64}_t.
> +
> +[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream: https://github.com/Drive-Trust-Alliance/sedutil/pull/425
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + Common/DtaOptions.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Common/DtaOptions.h b/Common/DtaOptions.h
> +index c012af1d..7530a0b7 100644
> +--- a/Common/DtaOptions.h
> ++++ b/Common/DtaOptions.h
> +@@ -21,6 +21,7 @@ along with sedutil.  If not, see <http://www.gnu.org/licenses/>.
> + #ifndef _DTAOPTIONS_H
> + #define	_DTAOPTIONS_H
> + 
> ++#include <cstdint>
> + /** Output modes */
> + typedef enum _sedutiloutput {
> + 	sedutilNormal,
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
