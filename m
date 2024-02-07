Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07486C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8DA080B4E;
	Wed,  7 Feb 2024 11:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCTUBZdrLHuZ; Wed,  7 Feb 2024 11:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B944680B64
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B944680B64;
	Wed,  7 Feb 2024 11:39:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9844F1BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 858E7402C3
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R95M0J-Rg0Ip for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:39:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.161;
 helo=smtpcmd14161.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D186D400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D186D400D0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D186D400D0
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:39:11 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XgGjrnFRgWf5XXgGjrkTaK; Wed, 07 Feb 2024 12:39:10 +0100
Message-ID: <8b908c45-80d2-428f-885f-febedfc5e4bf@benettiengineering.com>
Date: Wed, 7 Feb 2024 12:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hanyuan Zhao <hanyuan-z@qq.com>, buildroot@buildroot.org
References: <20240207074950.2049-1-hanyuan-z@qq.com>
 <tencent_09FFA925CC1CAC0076C6605FE496419B1308@qq.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <tencent_09FFA925CC1CAC0076C6605FE496419B1308@qq.com>
X-CMAE-Envelope: MS4xfFpss+3hxFh7JbbZ4SU2/cIIL1Bt77hNnetjG5v9xwdu2ojCSZInBfwGAmWsc8tdd22MokkrwuJeb7sgiVwvcFDuP4+1v2tZtFywCIbK7FljD6Y3EPRV
 pd/LgIof2rgVWl1eJNM0Jfa3zAwuhRaGuTLQaKcJPaxUV+yXG2VAW5Jb8gN5zWHtQgDhI2Jn3XuSsPVtHlmk2ocK9GDGzQfo9CmHYSA0ySVmpM6SYCxaPjVO
 F5LwKQnQSg1WQalv/A3/th3SC7S1DEYNTmeFi4OJra4YTmIbkQD75ZLBIytb6H6ySxLbGhbBCvwz9aMx4T/d43eDNrc1dXH5YQS0cEYtz3Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707305950; bh=n9LckZ5dqSUOpskcqis+M7F0WK3IhC1C9Hu+T5wcZAc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=HM5m/FF7KIm5sLUkAL9u96k1Lcw0NgOOJVQ+PGizo8opDkI3gvdHLl74Q8tWGyxgj
 GLSrFk0Dhv0l4ysbxy8hWrwk1m7OQvdzk3UPmnI1fAnKVnnXr82X1VFty/xh+WDDwD
 wYklJiZ17r6FAWKZWYrMwW9rSfSLHim/H4khA2sYkohsjtR2CX9aHiMkDGOkZ3LKzh
 +VeLQIOBs6QzYLwWNEMPlV10Qp7jB+iofJJHe5O55sun7VDBVzgfd8NxB1XiLM9LWZ
 atG5YD7w13m6eQKHE5UYOSJpT3U3BAaCiUByjFbgSWtqNG2cMnlMomfse5NGWTlfv9
 siiG5Eof4VV8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=HM5m/FF7
Subject: Re: [Buildroot] [PATCH v4 2/3]
 package/milkv-duo-smallcore-freertos: new package
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
Cc: Emil S <emil.soltys@outlook.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Hanyuan,

On 07/02/24 08:49, Hanyuan Zhao wrote:
> This commit adds the freertos support for the
> RISC-V dev board milk-v duo.
> 
> https://github.com/milkv-duo/milkv-duo-smallcore-freertos
> 
> Co-authored-by: Emil S <emil.soltys@outlook.com>
> Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
> 
> ---
> Changes v3 -> v4:
>    - Move the make recipes to the repo
>    - Bump the version to latest
> 
> Changes v2 -> v3:
>    - No Changes
> 
> Changes v1 -> v2:
>    - Set the depends and select logic
>    - Add host tools
> ---
>   package/Config.in                             |  1 +
>   .../milkv-duo-smallcore-freertos/Config.in    | 21 ++++++++++++++++++
>   .../milkv-duo-smallcore-freertos.mk           | 22 +++++++++++++++++++
>   3 files changed, 44 insertions(+)
>   create mode 100644 package/milkv-duo-smallcore-freertos/Config.in
>   create mode 100644 package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 322aba90b8..7be3316f71 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -565,6 +565,7 @@ endmenu
>   	source "package/memtool/Config.in"
>   	source "package/mhz/Config.in"
>   	source "package/milkv-duo-libraries/Config.in"
> +	source "package/milkv-duo-smallcore-freertos/Config.in"
>   	source "package/minicom/Config.in"
>   	source "package/msr-tools/Config.in"
>   	source "package/nanocom/Config.in"
> diff --git a/package/milkv-duo-smallcore-freertos/Config.in b/package/milkv-duo-smallcore-freertos/Config.in
> new file mode 100644
> index 0000000000..8503932461
> --- /dev/null
> +++ b/package/milkv-duo-smallcore-freertos/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS
> +	bool "milkv-duo-smallcore-freertos"
> +	depends on BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
> +	select BR2_PACKAGE_HOST_CMAKE
> +	help
> +	  This package is obtained from
> +	  https://github.com/milkv-duo/duo-buildroot-sdk,
> +	  from which we download the FreeRTOS ported to Milk-V Duo
> +	  into the Buildroot. This FreeRTOS will run in the small core
> +	  and will not do anything because it is simply a template
> +	  with some basic UART demos. You can realize your own ideas
> +	  by adding code to
> +
> +	  output/build/milkv-duo-smallcore-freertos-hash/cvitek/task
> +	  /comm/src/riscv64/comm_main.c
> +
> +	  If you say Y, then every time you make Buildroot, it will
> +	  automatically compile and include the FreeRTOS into the
> +	  fip.bin, which will then be packed into sdcard.img
> +
> +	  https://github.com/milkv-duo/milkv-duo-smallcore-freertos
> diff --git a/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk b/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk
> new file mode 100644
> index 0000000000..1d8d4fcf12
> --- /dev/null
> +++ b/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# milkv-duo-smallcore-freertos
> +#
> +################################################################################
> +
> +MILKV_DUO_SMALLCORE_FREERTOS_VERSION = 10b86e308ca2305a464ae2bb3eb868a72295f7ab
> +MILKV_DUO_SMALLCORE_FREERTOS_SITE = $(call github,milkv-duo,milkv-duo-smallcore-freertos,$(MILKV_DUO_SMALLCORE_FREERTOS_VERSION))
> +MILKV_DUO_SMALLCORE_FREERTOS_INSTALL_STAGING = YES
> +MILKV_DUO_SMALLCORE_FREERTOS_DEPENDENCIES = host-cmake host-ninja
> +MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV = CROSS_COMPILE=$(TARGET_CROSS) MK_ENV=$(TARGET_MAKE_ENV) TARGET_CMAKE=$(BR2_CMAKE) BUILD_PATH=$(@D)
> +
> +define MILKV_DUO_SMALLCORE_FREERTOS_BUILD_CMDS
> +	$(MAKE) -C $(@D) all $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV)
> +endef
> +
> +define MILKV_DUO_SMALLCORE_FREERTOS_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/cvitek/install/bin/cvirtos.bin $(BINARIES_DIR)/cvirtos.bin
> +	touch $(BINARIES_DIR)/empty.bin
> +endef
> +
> +$(eval $(generic-package))

It looks good to me, moving build system to repository made it really
easier, so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Just FYI, buildroot also deal with cmake package using:
$(eval $(cmake-package))
so in the future you can use that or other infrastructure that it
provides that you can find under buildroot/package/pkg-*.mk

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
