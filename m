Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE57C7618A
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 12:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB8FA405B0;
	Mon, 20 Mar 2023 12:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8FA405B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEqSCio3DxBK; Mon, 20 Mar 2023 12:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6123403A2;
	Mon, 20 Mar 2023 12:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6123403A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 721BE1BF3FC
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 12:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42A1A40673
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 12:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42A1A40673
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iyx8m76S15h9 for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 12:44:27 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D71DE408F4
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D71DE408F4
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 12:44:26 +0000 (UTC)
Received: from [172.20.10.9] ([151.46.37.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id eElJp6e0IdwECeElJpzkx7; Mon, 20 Mar 2023 13:37:17 +0100
Message-ID: <c81a2a9a-1834-3f05-9789-1587f007a114@benettiengineering.com>
Date: Mon, 20 Mar 2023 13:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US, it
To: Jens Kleintje <scooby22@web.de>, buildroot@buildroot.org
References: <20230320115508.1249295-1-scooby22@web.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230320115508.1249295-1-scooby22@web.de>
X-CMAE-Envelope: MS4xfD+5E5XwA5itdvsjprKXIN2vl2WdvgSxcWC3Qd+ssiucsgMoL6hBISs/RmC5XGEaXn3s7vckfoYuvmY6j0/nNeO7Z9l+keIKhzaztrQbL3k+qwdUxHJj
 qLjHIXVsJr3zWxuJCoXdPd7hTfXz+sWWR+w80FGWVFRuq5MxJjresreVkha12mfVPIik7Bq+Lxgva0Ryfe5WtJggPHhZlKWIOVXRtHOlwm294IBnQjsCUFvF
 15yb7dNu5c7I5izH8DRBzccxbV0AzyI3TLQ+eU6rtP1StOmAzg8/AbvY0U2T5Wh6L3vaknDzrHFglwham51vemvMPTaLrfWhz1fkLCrT9w8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679315837; bh=syp6kkQNQFVhEBiNjLba0mjuVTGQftvs95EFsANtXPY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=OSWmEB3dC3JwYu/vnlJI7gjF6U1+J/XX0UrANL8N3JRgftE+PRx4vYiVzukCe7SeO
 WRU65WX/A6YOU0FUy1xxgdhXmKwfdZlD2ViIkDo82fhNALy5iqVfr4QaJKp43V3CXX
 ZtaJwscZvqPeVmJlkTGmMAhqDZIGxt4BaQB/j6eclKeJQ8ZNi+QyMg7R/pfgbG2kEi
 oFwpDxKNpYb/0ZNA2Jvg2wku7JYE+1EYwXt6xx/tNtTCF6yK8KTUL9KcQ9m6McH5SM
 KKeQvWtnlVv52VWxyIpjOnLUjDpykNPlU9xR/1/QV2H1OVnzrm6If0GHJJlv1ShOnv
 32MbBNRuov8Ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OSWmEB3d
Subject: Re: [Buildroot] [Patch 1/1] esp-hosted: new package
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
Cc: Jesse Taube <mr.bossman075@gmail.com>,
 Jesse Taube <jesse.taube@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jens,

On 20/03/23 12:55, Jens Kleintje wrote:
> The package provides a kernel driver for esp32 as wifi module.
> The project https://github.com/espressif/esp-hosted/tree/release/ng-v1.0.2.
>   configures the esp32 as a wifi module. The host and the esp32 can be
> connected via sd bus or spi. This package supports only the host sd
> connection.
> On the esp the firmware from
> https://github.com/espressif/esp-hosted/releases/download/release%2Fng-v1.0.2/ESP-Hosted-NG_release_v1.0.2.tgz
> needs to be flashed.

me and Jesse in Cc were working on this too. Have you checked that it
builds correctly with latest Linux versions? There are several PRs open
upstream for months(they are not reactive):
https://github.com/espressif/esp-hosted/pull/147
https://github.com/espressif/esp-hosted/pull/176
https://github.com/espressif/esp-hosted/pull/209

and those fix building on Linux 5.17, 5.18, 6.0.

So I suspect you need to add those PRs as local patches and check for
Linux 6.1 and 6.2

Best regards
--
Giulio Benetti
CTO/CEO@Benetti Engineering sas

> Signed-off-by: Jens Kleintje <scooby22@web.de>
> ---
>   DEVELOPERS                         |  1 +
>   package/Config.in                  |  1 +
>   package/esp-hosted/Config.in       |  8 ++++++++
>   package/esp-hosted/esp-hosted.hash |  2 ++
>   package/esp-hosted/esp-hosted.mk   | 17 +++++++++++++++++
>   5 files changed, 29 insertions(+)
>   create mode 100644 package/esp-hosted/Config.in
>   create mode 100644 package/esp-hosted/esp-hosted.hash
>   create mode 100644 package/esp-hosted/esp-hosted.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b6d288c54f..2d2559242c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1483,6 +1483,7 @@ F:	package/openfpgaloader/
> 
>   N:	Jens Kleintje <scooby22@web.de>
>   F:	package/gcnano-binaries/
> +F:	package/esp-hosted/
> 
>   N:	Jens Rosenboom <j.rosenboom@x-ion.de>
>   F:	package/sl/
> diff --git a/package/Config.in b/package/Config.in
> index 0f8dab3e71..89a6dacbc1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -494,6 +494,7 @@ endmenu
>   	source "package/edid-decode/Config.in"
>   	source "package/edk2-non-osi/Config.in"
>   	source "package/edk2-platforms/Config.in"
> +	source "package/esp-hosted/Config.in"
>   	source "package/eudev/Config.in"
>   	source "package/ev3dev-linux-drivers/Config.in"
>   	source "package/evemu/Config.in"
> diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
> new file mode 100644
> index 0000000000..b1f44aa956
> --- /dev/null
> +++ b/package/esp-hosted/Config.in
> @@ -0,0 +1,8 @@
> +comment "esp-hosted needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_ESP_HOSTED
> +	bool "esp-hosted"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  Wireless driver for esp32
> diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
> new file mode 100644
> index 0000000000..6be9337159
> --- /dev/null
> +++ b/package/esp-hosted/esp-hosted.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 5538d6aa0f322801ddd8428d131f485e7e490be871d9cdf650afb894bb485905 esp-hosted-ng-v1.0.2.tar.gz
> diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
> new file mode 100644
> index 0000000000..53e5d3bcc0
> --- /dev/null
> +++ b/package/esp-hosted/esp-hosted.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# esp-hosted
> +#
> +################################################################################
> +
> +ESP_HOSTED_VERSION = ng-v1.0.2
> +ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,refs/tags/release/$(ESP_HOSTED_VERSION))
> +ESP_HOSTED_DEPENDENCIES = linux
> +ESP_HOSTED_MODULE_SUBDIRS = esp_hosted_ng/host
> +
> +ESP_HOSTED_MODULE_MAKE_OPTS = KERNEL=$(LINUX_DIR) \
> +			      CROSS_COMPILE=$(TARGET_CROSS) \
> +			      MODULE_NAME=esp32_sdio
> +
> +$(eval $(kernel-module))
> +$(eval $(generic-package))
> --
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
