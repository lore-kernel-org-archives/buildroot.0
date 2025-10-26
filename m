Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6681FCCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 22:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37BEB4007D;
	Sun, 26 Oct 2025 22:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCqcNFW0Fjcr; Sun, 26 Oct 2025 22:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 983AC4114E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 983AC4114E;
	Sun, 26 Oct 2025 22:17:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F6A325B
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 22:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 079694114E
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 22:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrMEcYUa3zvR for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 22:17:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E76984114D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E76984114D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E76984114D
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 22:17:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A3F2119F54D;
 Sun, 26 Oct 2025 23:17:14 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 23:17:14 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 23:17:14 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20251025123035.1136084-2-dario.binacchi@amarulasolutions.com>
References: <20251025123035.1136084-1-dario.binacchi@amarulasolutions.com>
 <20251025123035.1136084-2-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9a45cee4beb75164cea82c46f2e984e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761517036;
 bh=jztU8+STg/ee8RUFx2cd51cYpa/uGLLlhOEvJObt1s4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p5g1noZZH+HEAF2qgjWmPr36bP2jtMiiDSTuj3x+V2k5XIKl0nzrCK3IeJtnI22vr
 s5hCN5CD/Q0w2TPQkfg5pWTzIUs+RIu3imoVXc4b/WbKZFnbFcMl5N6bfA441Ylow9
 OqsqDRgsz4QRYGGxHhwd/jQ7ysJWMT92k3WNP8g72eX2aFz6sTz0kcG2x66DFK/XuV
 62k/HCzlcdn3Ym0KdCzxlMHC8LEOxoGIQHdMcvWFD3bM2L7Yq1RJ3iy/P3u0Jb3OnE
 P0D7H42VvICe27KcT2ESI0OhZ2f+1yR7gttPgE1VYXFSCBZ305/Y+DTw93UR/pse4D
 3Tc9VePodz3vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=p5g1noZZ
Subject: Re: [Buildroot] [PATCH v2 2/2] package/openocd: bump to version
 88b9bd396d5a1f83c49fa1b28745fd7feaca2b2e
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

Thanks for the patch.  I have several comments, see below.

On 25/10/2025 14:30, Dario Binacchi wrote:

Could you add a comment about the commit introducing the issue, please?
For example:

Since Buildroot commit 283821fc3 (package/jimtcl: bump to
version 0.83) openocd v0.12.0 is failing to build.
https://gitlab.com/buildroot.org/buildroot/-/commit/283821fc31c4890f141111cbc5994e36703c91eb

> The error reported by autobuild could have been fixed by backporting
> commit [1], but this would not have fully fixed the issue. Other build
> errors related to libgiod appeared, which would have required a large
> backporting effort. This made it more reasonable to bump the package to
> the most recent commit, since no new version had been released despite
> many commits since January 2023.
> 
> Update LICENSES/license-rules.txt hash due to:
> - Add dual/CC-BY-4.0
> - Drop SPDX tag 'GPL-2.0' and use 'GPL-2.0-only'
> 
> Update LICENSES/preferred/GFDL-1.2.txt hash due to:
> - Replace the obsolete address of the FSF in the GFDL-1.2
> 
> Fixes:
> https://autobuild.buildroot.org/results/4f79a456d6e88e33be2a279e5288debd1f27c183
> 
> [1] 
> https://sourceforge.net/p/openocd/code/ci/95603fae18f81eebdafc5b318e70f9e2cdefab9e
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> Changes v1 -> v2:
>  - Drop --enable-internal-libjaylink  in the configuration options
>  - Add libjaylink dependency in case of JLINK SEGGER support.
> 
>  ...01-configure-enable-build-on-uclinux.patch | 19 ++++++++++---------
>  package/openocd/Config.in                     |  2 +-
>  package/openocd/openocd.hash                  |  8 ++++----
>  package/openocd/openocd.mk                    | 11 +++++++----
>  4 files changed, 22 insertions(+), 18 deletions(-)
[...]
> diff --git a/package/openocd/openocd.hash 
> b/package/openocd/openocd.hash
> index 938711d86c0f..52e9acfb882d 100644
> --- a/package/openocd/openocd.hash
> +++ b/package/openocd/openocd.hash
> @@ -1,15 +1,15 @@
>  # From http://sourceforge.net/projects/openocd/files/openocd/0.12.0/

Here, the comment about the hash source no longer applies. Could you 
change it to
"Locally computed", please?

> -sha256  
> af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f6043075afa  
> openocd-0.12.0.tar.bz2
> +sha256  
> a3aab64cc28ae7ac38b2794173f59f96ad4dc261e00aba362ad6ebbd741dd139  
> openocd-88b9bd396d5a1f83c49fa1b28745fd7feaca2b2e-git4.tar.gz
>  sha256  
> 1b8f7e37ee5afbbf95c2a4d62b12b25232e29538692663b434318503a9a88419  
> COPYING
>  sha256  
> 034da732b4f3079b8783fff756613c1cff89dec5ac80c5cdd90532b7539922a1  
> LICENSES/exceptions/eCos-exception-2.0
> -sha256  
> 0a37155eb8bc0cb94477a0cae4f030e39da9317374e8a9f597e9229fd09aff78  
> LICENSES/license-rules.txt
> +sha256  
> 405b1becc5e999efe12116634c308287774a5401efdaca06a8370926e3686cc1  
> LICENSES/license-rules.txt
>  sha256  
> f3ba76203a7b6993db31f987559cc4c621ae1ff78119ced2a669756c2c5fd3b1  
> LICENSES/preferred/BSD-1-Clause
>  sha256  
> 6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  
> LICENSES/preferred/BSD-2-Clause
>  sha256  
> 1483f15e9fddc73b5df0acab1c42d21ecd0bf6ade8a79179fb90c09f13d03dcd  
> LICENSES/preferred/BSD-2-Clause-Views
>  sha256  
> 7a83b1aeb460458db9a4bd521d7f237c45b1650f6e60ea5ffc71e49472454de3  
> LICENSES/preferred/BSD-3-Clause
>  sha256  
> 5cf024f6e3611d5c6fb98748d1a0ad99b8cf9ffe46f2d60fa10c299cd29e0a75  
> LICENSES/preferred/BSD-Source-Code
> -sha256  
> f35396f4095619f986736ca5e2976b313d381463a35c921c9ae677cc7eb83e28  
> LICENSES/preferred/GFDL-1.2
> +sha256  
> b984d86747c3ea68cca62477716de626a5d6e96f00f64fe13649e28fde81b47e  
> LICENSES/preferred/GFDL-1.2
>  sha256  
> 76515be2d7334a1a038f775238c9a4c2b37e19514248e5eea0434cdfee526f9d  
> LICENSES/preferred/gfdl-1.2.texi.readme
> -sha256  
> 7d35bc44da7bb763022e3c2c32cfc0125dd222060bc50992420599d8e65f6c0a  
> LICENSES/preferred/GPL-2.0
> +sha256  
> 8b57184d532ff63b57776f33b6f3b50020295da3c7ba3a63fb2f26e4968cde3a  
> LICENSES/preferred/GPL-2.0
>  sha256  
> 323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  
> LICENSES/preferred/MIT
>  sha256  
> 9a41b56594cd89743ca72f188318c9871661847074dd16497ae0c695fe3ab9c9  
> LICENSES/stand-alone/GPL-3.0
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index a563cc6a9e31..3e4393275cda 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -4,9 +4,11 @@
>  #
>  
> ################################################################################
> 
> -OPENOCD_VERSION = 0.12.0
> -OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
> -OPENOCD_SITE = 
> http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
> +OPENOCD_VERSION = 88b9bd396d5a1f83c49fa1b28745fd7feaca2b2e

Could you use the "git describe --abbrev=40" format, please?
(you'll need to update the hash file too). In that case:

OPENOCD_VERSION = v0.12.0-1240-g88b9bd396d5a1f83c49fa1b28745fd7feaca2b2e

Also, this new version fails at install stage, in the Docker reference 
image.
See: https://gitlab.com/jolivain/buildroot/-/jobs/11856828069

It's probably working on hosts providing the "install-info" program,
from the "info" package.

Could you have a look, to make it work in the docker image, please?

> +OPENOCD_SITE = https://git.code.sf.net/p/openocd/code
> +OPENOCD_SITE_METHOD = git
> +OPENOCD_GIT_SUBMODULES = YES
> +
>  OPENOCD_LICENSE = \
>  	BSD-1-clause, \
>  	BSD-2-clause, \

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
