Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE818EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 13:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ECB5611B4;
	Wed, 12 Jul 2023 13:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ECB5611B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTXguHluOdQA; Wed, 12 Jul 2023 13:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50DBA611B1;
	Wed, 12 Jul 2023 13:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50DBA611B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 414F91BF3CB
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 13:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B56340518
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 13:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B56340518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QM13dOdfEcvy for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 13:46:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980F240165
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 980F240165
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 13:46:30 +0000 (UTC)
Received: from [172.25.4.220] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JaAlqNaf01ZFgJaAmqzuVb; Wed, 12 Jul 2023 15:46:28 +0200
Message-ID: <7774d2a3-145f-44a3-e744-ae213a387e71@benettiengineering.com>
Date: Wed, 12 Jul 2023 15:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US, it
To: Jamie Gibbons <jamie.gibbons@microchip.com>, buildroot@buildroot.org
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
 <20230712125154.1361000-2-jamie.gibbons@microchip.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230712125154.1361000-2-jamie.gibbons@microchip.com>
X-CMAE-Envelope: MS4xfKw/AGDZ3nAp24mRBE3rSJ3dliivR3x9LOFolCBrxnXLqxu5ljbnSheRFpLfCld9LlBDPyD9LepOjzPsSGd0H3tL6JGY/6W89dS0ZQgBUMGdJ5llJyrC
 +NpDwNIAT58KWfpPAvlnGTy1kZ500cSqOCHpzk91iMD5Ks5ezum4Nul4tuY46qCvb8wtB8AA9Ple6n9+SIyWWbJshIb9WCTrvQE2+LnLjGZ6PVXrfBTBnIry
 TG7Z9FhC74/Nc2NDYcCHn49pBr1s5DKphA4nOtWQkyAPuRahTCwjoz6pjT4knHS5Xb1DxXp+4QAXOfs7ItWbS/HrT1wkZqX0cflsBQ3xZnPxZVYr/+BKzYFh
 VLMFH8wuJeeXIUHFRoGLbnj3R4215lWBP50XnPZb3ptFHIVbRMxX4prX9ydia/AsST5HMPOCJAtvwZVUMzYiTXfRe1GQORdGWCmk8BRV8KYhxAmLQCzE5zpN
 wztwjV9GFcgGickl
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689169588; bh=RCNkCjal9iI4CzStgMv6OZ2rVnnEnrteabSP5duSx/8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=XBoSCmkDLJE2gXQRIBkgS4e1VlUqb1l3TEWiZBbxXhXGiB643KToBqRfUzRU/Iws1
 hQG8TeDjyvBrRrpBkWo6NDuQHLBq+NQ30SGQ30vk460sb9U/O1IPoDR30jdds/s/k1
 fGi+l0ws7SMQ0/yeIMqx8JH2G+H3/79idd1mdZx4ZjJ2OUsh4xPmu/QYJ1QsuT+xMp
 ieh3v7esBhXOL53MtJDXH364rrdLsQAzy6s6eecQzQaq//dHHRdhPmW8yQrBYUZLiq
 qALq8/PW/dCztx2yH3Ei9tvwbbPloBGAabsbaE2TVnHz15qkJbu/xvzfJpSDzHe0aT
 OXuZ+EplnM3gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=XBoSCmkD
Subject: Re: [Buildroot] [PATCH v3 1/2]
 package/microchip-hss-payload-generator: add host package
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
Cc: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/07/23 14:51, Jamie Gibbons via buildroot wrote:
> The Buildroot icicle kit configuration uses the Hart Software Service's
> (HSS) payload generator tool. This tool creates a formatted payload
> image for the HSS zero-stage bootloader on PolarFire SoC, given a
> configuration file and a set of ELF binaries. The configuration
> file is used to map the ELF binaries or binary blobs to the
> individual application harts (U54s). Add the HSS payload generator as a
> host package to support this.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> Reviewed-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

For next time remember to report the changes on every patch too, not
only on the cover letter.

Thank you

Best regards
-- 
CEO/CTO@Benetti Engineering sas

> ---
>   DEVELOPERS                                    |  3 +++
>   package/Config.in.host                        |  1 +
>   .../Config.in.host                            | 11 ++++++++
>   .../microchip-hss-payload-generator.mk        | 25 +++++++++++++++++++
>   4 files changed, 40 insertions(+)
>   create mode 100644 package/microchip-hss-payload-generator/Config.in.host
>   create mode 100644 package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0918e9f721..2f039a2405 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1459,6 +1459,9 @@ F:	package/pangomm/
>   F:	package/rpm/
>   F:	package/yad/
>   
> +N:	Jamie Gibbons <jamie.gibbons@microchip.com>
> +F:	package/microchip-hss-payload-generator
> +
>   N:	Jan Heylen <jan.heylen@nokia.com>
>   F:	package/opentracing-cpp/
>   
> diff --git a/package/Config.in.host b/package/Config.in.host
> index dcadbfdfc1..42856c09df 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -58,6 +58,7 @@ menu "Host utilities"
>   	source "package/mender-artifact/Config.in.host"
>   	source "package/meson-tools/Config.in.host"
>   	source "package/mfgtools/Config.in.host"
> +	source "package/microchip-hss-payload-generator/Config.in.host"
>   	source "package/mkpasswd/Config.in.host"
>   	source "package/moby-buildkit/Config.in.host"
>   	source "package/mosquitto/Config.in.host"
> diff --git a/package/microchip-hss-payload-generator/Config.in.host b/package/microchip-hss-payload-generator/Config.in.host
> new file mode 100644
> index 0000000000..6584692729
> --- /dev/null
> +++ b/package/microchip-hss-payload-generator/Config.in.host
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR
> +	bool "host microchip-hss-payload-generator"
> +	help
> +	  Microchip PolarFire SoC Payload Generator. This tool creates a
> +	  formatted payload image for the HSS zero-stage bootloader on
> +	  PolarFire SoC, given a configuration file and a set of ELF
> +	  binaries. The configuration file is used to map the ELF
> +	  binaries or binary blobs to the individual application harts
> +	  (U54s).
> +
> +	  https://github.com/polarfire-soc/hart-software-services.git
> diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> new file mode 100644
> index 0000000000..df62e121e7
> --- /dev/null
> +++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# microchip-hss-payload-generator
> +#
> +################################################################################
> +
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.06
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE = MIT
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE_FILES = LICENSE.md
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_DEPENDENCIES = host-elfutils host-libyaml host-openssl
> +
> +define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_BUILD_CMDS
> +	$(MAKE) -C $(@D)/tools/hss-payload-generator \
> +		HOST_INCLUDES="$(HOST_CPPFLAGS)" \
> +		LDFLAGS="$(HOST_LDFLAGS)"
> +endef
> +
> +define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_INSTALL_CMDS
> +	$(INSTALL) -D -m 755 \
> +		$(@D)/tools/hss-payload-generator/hss-payload-generator \
> +		$(HOST_DIR)/bin/hss-payload-generator
> +endef
> +
> +$(eval $(host-generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
