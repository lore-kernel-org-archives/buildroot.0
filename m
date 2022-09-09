Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A44ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 09:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C388760ADF;
	Fri,  9 Sep 2022 09:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C388760ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5rB8-qz0MOB; Fri,  9 Sep 2022 09:36:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD4D660881;
	Fri,  9 Sep 2022 09:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD4D660881
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEBED1BF3A6
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA65360881
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA65360881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZWpwoN2B33I for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 09:36:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08651607CE
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08651607CE
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 09:36:06 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id x1so1257674plv.5
 for <buildroot@buildroot.org>; Fri, 09 Sep 2022 02:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=99G+LbfX2f9PabIWQkX2C6Sr+tJVBfSHvTyzwRgxSKg=;
 b=cAF8M+YRirooNSnRQB+0J6vOY5prLfNcuV0op/B0t0WUQ3IsYN51qpf+GPvnKXLHn4
 qcsrM5G94YzZV5vC6boal114qXWpW7Smx5f06z9LwV9jMGeNMjq4BJmiC47qntRa6otT
 BzIibIfgOmMNG94iVfHqye6+Wo6t1Uuqu3NncBFuDKD1cRXT6iDKt6DKQKKrifWnkpti
 j3TIjoqdIyfvcPFrwyd76hBd4SICipo1mUkbFtUEIabu5aG4Zb7Rm7hfWmRaTAKQa30w
 w3TPqAi2wJPJnTD+gPwJdhZ5vjCZXkWwe05a89q6jRf/doPHSKXVB/HbDfY2PPrkm39C
 un9g==
X-Gm-Message-State: ACgBeo3rNn/SwG6gWp7xyzi5JhTyVPfauq9PiENmt63lvmY0mr/7PVBJ
 zd/Ny17Q83djDRa4y5DD4lIRLMKOO+ZKPDIiQog3S5pRG7lNPA==
X-Google-Smtp-Source: AA6agR6S3BNT7zax/Jq1JuIA7hhEQyWKxOfhb2S4FWsmOKuIkFFGIaBgqYcZxHB2vQ1ZNAvKo7jpXzRi/eINFlk/zEY=
X-Received: by 2002:a17:902:dac1:b0:172:eae4:950c with SMTP id
 q1-20020a170902dac100b00172eae4950cmr13044912plx.70.1662716162654; Fri, 09
 Sep 2022 02:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220908191904.823806-1-dario.binacchi@amarulasolutions.com>
 <20220908191904.823806-3-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20220908191904.823806-3-dario.binacchi@amarulasolutions.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 9 Sep 2022 11:35:50 +0200
Message-ID: <CAEyMn7Ygd-s7G8pbszseE8PKK=Zak_TZh1auv6be9LrQqKm=rA@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=99G+LbfX2f9PabIWQkX2C6Sr+tJVBfSHvTyzwRgxSKg=;
 b=j2Im+dq2/rG+kNza8eyxlMQqRfkVFXi6z3qggakGdbUua9fC2wLsOWRfjrBx6vH9nE
 yZXoeKbb/+0Zk7y9fvJxjI0OU+AcfRTpYxf+YQ3AuiAY3giImCCe8eqyv2gXCemM5A4i
 UPrhZaNkiRqBTLI26k+FRgk92zRfaviF2j6cBX/oDSk3frR+Ssd7zk6U98nVQNf0WSly
 UXzyOjCV7EgrqSZAQUpsgnBMWPtyphrb2jLuwhi/+Z2ZXCijjUpyw0g9/VgMzc7nwiYk
 /FadPqHrgmgF0RNXesRaM1yqxVvWHVmFu1fDqYdF2YaAR/zOil6C1+upaZE6cI5av8Z4
 Ming==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j2Im+dq2
Subject: Re: [Buildroot] [PATCH v5 2/2]
 configs/imx8mn_bsh_smm_s2_pro_defconfig: new defconfig
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 giulio.benetti@benettiengineering.com,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

Am Do., 8. Sept. 2022 um 21:20 Uhr schrieb Dario Binacchi
<dario.binacchi@amarulasolutions.com>:
>
> From: Michael Trimarchi <michael@amarulasolutions.com>
>
> BSH SMM S2 PRO (SystemMaster S2 Pro) Board is an add-on board which
> provide input and output interfaces to a dedicated carrier board. It is
> designed mainly to provide graphical/video and connectivity interfaces
> to the appliance.
>
> Board support package includes the following components:
> - mainline Linux kernel 5.19.7
> - mainline U-Boot 2022-07
> - Default packages from buildroot
>
> https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
>
> Add Ariel D'Alessandro and Dario Binacchi as co-maintainer, we work
> together on platform mainline
>
> Build and tested using:
> docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314
>
> Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Heiko Thiery <heiko.thiery@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Tested-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes in v5:
> - Update the commit description.
> - Bump the kernel version to 5.19.7.
>
> Changes in v4:
> - Update the commit description.
> - Bump the kernel version to 5.18.19.
>
> Changes in v3:
> - Update the commit description.
> - Bump U-Boot to version 2022-07.
>
> Changes in v2:
> - Change commit subject line.
> - Use the buildroot's output directory if the binaries directory is
>   not passed as a parameter to the `flash.sh' script.
> - Replace the linux.config file with an architectural defconfig and
>   a config fragment for the changes.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  DEVELOPERS                                    |  4 +
>  .../imx8mn-bsh-smm-s2/linux.fragment          |  0
>  board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf |  4 +
>  board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh      | 23 ++++++
>  board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg  | 17 +++++
>  board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh |  7 ++
>  board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh |  3 +
>  board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt    | 73 +++++++++++++++++++
>  configs/imx8mn_bsh_smm_s2_defconfig           |  2 +-
>  configs/imx8mn_bsh_smm_s2_pro_defconfig       | 41 +++++++++++
>  10 files changed, 173 insertions(+), 1 deletion(-)
>  rename board/bsh/{ => common}/imx8mn-bsh-smm-s2/linux.fragment (100%)
>  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
>  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
>  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
>  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
>  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
>  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
>  create mode 100644 configs/imx8mn_bsh_smm_s2_pro_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d63cb22cce1d..cb2c10d322fb 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -216,6 +216,8 @@ F:  configs/snps_archs38_haps_defconfig
>  F:     configs/snps_archs38_hsdk_defconfig
>
>  N:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> +F:     board/bsh/
> +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
>  F:     package/axfsutils/
>  F:     package/mali-t76x/
>
> @@ -675,6 +677,7 @@ F:  package/xinetd/
>  N:     Dario Binacchi <dario.binacchi@amarulasolutions.com>
>  F:     board/bsh/
>  F:     configs/imx8mn_bsh_smm_s2_defconfig
> +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
>  F:     package/uuu/
>
>  N:     Dario Binacchi <dariobin@libero.it>
> @@ -2108,6 +2111,7 @@ F:        package/python-pyzmq/
>  N:     Michael Trimarchi <michael@amarulasolutions.com>
>  F:     board/bsh/
>  F:     configs/imx8mn_bsh_smm_s2_defconfig
> +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
>  F:     package/python-spidev/
>
>  N:     Michael Vetter <jubalh@iodoru.org>
> diff --git a/board/bsh/imx8mn-bsh-smm-s2/linux.fragment b/board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
> similarity index 100%
> rename from board/bsh/imx8mn-bsh-smm-s2/linux.fragment
> rename to board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
> diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> new file mode 100644
> index 000000000000..911135474253
> --- /dev/null
> +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> @@ -0,0 +1,4 @@
> +label buildroot
> +  kernel /boot/Image
> +  devicetree /boot/freescale/imx8mn-bsh-smm-s2pro.dtb
> +  append root=PARTUUID=%PARTUUID% rootwait rw
> diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> new file mode 100755
> index 000000000000..17b20f009771
> --- /dev/null
> +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> @@ -0,0 +1,23 @@
> +#!/bin/bash
> +
> +if [ $# -eq 0 ]; then
> +    OUTPUT_DIR=output
> +else
> +    OUTPUT_DIR=$1
> +fi
> +
> +if ! test -d "${OUTPUT_DIR}" ; then
> +    echo "ERROR: no output directory specified."
> +    echo "Usage: $0 OUTPUT_DIR"
> +    echo ""
> +    echo "Arguments:"
> +    echo "    OUTPUT_DIR    The Buildroot output directory."
> +    exit 1
> +fi
> +
> +IMAGES_DIR=${OUTPUT_DIR}/images
> +
> +${OUTPUT_DIR}/host/bin/uuu -v -b emmc_all \
> +  ${IMAGES_DIR}/flash.bin \
> +  ${IMAGES_DIR}/sdcard.img
> +
> diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> new file mode 100644
> index 000000000000..bc100b171dd6
> --- /dev/null
> +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> @@ -0,0 +1,17 @@
> +image sdcard.img {
> +       hdimage {
> +               partition-table-type = "gpt"
> +       }
> +
> +       partition imx-boot {
> +               in-partition-table = "no"
> +               image = "flash.bin"
> +               offset = 33K

I was just wondering that the offset here is 33k. I had remembered
that for imx8mn boards the offset is 32k. Or am I wrong? Are you sure
that you start the bootloader from an SD card and not from eMMC?

[SNIP]

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
