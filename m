Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F74CE74ADB
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 21:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E31A8845A8;
	Tue,  3 Dec 2024 21:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgCbM08YQwif; Tue,  3 Dec 2024 21:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD083845A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD083845A3;
	Tue,  3 Dec 2024 21:51:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 211272073
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CACA40D03
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-18SbYBcG4T for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 21:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E5DD40C9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E5DD40C9B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E5DD40C9B
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:51:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 127382003CC;
 Tue,  3 Dec 2024 22:51:28 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52338])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Dec 2024 22:51:28 +0100
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 22:51:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20241202174008.1134667-6-bernd@kuhls.net>
References: <20241202174008.1134667-1-bernd@kuhls.net>
 <20241202174008.1134667-6-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <00da17b37c509a32a98aadfe3cb74566@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733262695;
 bh=YKJtFj9P3VT/LIR1zWbtnueD1Gr3IX1FyRfopuKo+HI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XFcEqkvGo73AcvEFw7L43s279dyOPH58OShrUWTj2LrSP704NJmTFANK6ALzn6UK8
 owuNrbtyGFwuiZg4c5bGP69HYI+9A8EvHLq858xVziFbR3oOsLS4u3isBsgLCf3HPy
 sHyw1ciKp84jOTJzhLHRwSerjchrzjU85VyexHclaldSQL9JaoKgD9Uhdnjk9tWSkh
 QTd+2y3cHmkUWN6kc/By80faX+1afNqtA87h/x1g3Z6lWN1vw/v+r40d3QVhs7TIHp
 QIf2HLVOie7LJ7sVlnz0MFQR+rL1/yDFLOPs+EPP1Wt73GArCiBMCjdwioOB7HzeXu
 R3pQHSYU680xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XFcEqkvG
Subject: Re: [Buildroot] [PATCH 6/7] package/{mesa3d,
 mesa3d-headers}: bump version to 24.3.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 02/12/2024 18:40, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2024-May/000762.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-June/000763.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-June/000765.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000766.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000767.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000771.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-August/000773.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-August/000776.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-September/000778.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-September/000779.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000780.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000781.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000782.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-November/000784.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-November/000786.html
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.1.x:
> 
> Added dependency to llvm & Co. for iris driver due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=a512c2a8b572c5da360873320dbbd343c6223cd6
> 
> Added host version of mesa tool intel_clc needed for target build of 
> the
> iris driver.
> 
> Added dependency to host-python-pycparser for etnaviv driver due to
> upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/etnaviv/hwdb/meson.build?h=24.1&id=2192e620bb0c68b75ff45165d0b117c7ecb77268
> 
> Added dependency to host-python-ply for intel vulkan driver due to
> upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/intel/vulkan/grl/meson.build?h=24.1&id=dc1aedef2bd054884685ad971a3ef5be07ecd101
> 
> Although this dependency exists since mesa3d 22.3 it is only needed 
> when
> intel-clc is enabled, this dependency is added with this patch so no 
> need
> to backport this dependency to older buildroot trees.
> 
> Update configure parameter of glvnd option due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=4f25b84b2460524d375424a81b42faa4d99c8e60
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.2.x:
> 
> Added dependency to host-python-pyyaml to host and target build, needed
> due to upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/a3813327575e8875c8c3ed24b5f45a0b7ba64446
> 
> Rebased patch 0002 due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/gallium/drivers/vc4/meson.build?h=24.2&id=da70827656757cd070faac7aff5ca057f1e7fb8a
> 
> Renamed BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST to
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE and added new option
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE due to upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/010b2f9497ab256d9e8041207902948331af5b4b
> "gallium/meson: Deconflate swrast/softpipe/llvmpipe"
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.3.x:
> 
> Rebased patch 0002 again due to upstream commit:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/25ba90fd888cef431c2098c8afdb0a2bbd34b303
> 
> Removed dri3 configure option:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/8f6fca89aa1812b03da6d9f7fac3966955abc41e
> 
> Removed gallium-omx configure option:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/9b6c27a320ab4b0fcf1fb16220ae7c3d3f06f7df
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  Config.in.legacy                              |  7 +++
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...tion-to-disable-optional-neon-suppor.patch | 18 +++---
>  package/mesa3d/Config.in                      | 28 +++++++--
>  package/mesa3d/mesa3d.hash                    |  6 +-
>  package/mesa3d/mesa3d.mk                      | 58 ++++++++++++++-----
>  6 files changed, 88 insertions(+), 31 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 63360b42b8..a10dde7eda 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
> 
>  comment "Legacy options removed in 2024.11"
> 
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> +	bool "mesa Gallium swrast driver was replaced by softpipe"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
> +	help
> +	  The Gallium swrast driver was replaced by softpipe.
> +

Making BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST a legacy option breaks
all runtime tests using Mesa3D. This makes the testing of this series
a bit more complex.

I think this patch should also handle the runtime tests. If _SOFTPIPE
is really an equivalent of _SWRAST, it could changed with:

     sed -i 's/SWRAST/SOFTPIPE/g' support/testing/tests/package/test_*.py

Then, we should be able to test with the commands such as:

     utils/docker-run make check-package
     utils/docker-run support/testing/run-tests \
         -d dl -o output_folder \
             tests.package.test_flutter \
             tests.package.test_glslsandbox_player \
             tests.package.test_glxinfo \
             tests.package.test_kmscube \
             tests.package.test_python_qt5 \
             tests.package.test_weston

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
