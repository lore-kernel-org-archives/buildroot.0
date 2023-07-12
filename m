Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA19BEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 09:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CD8561181;
	Wed, 12 Jul 2023 09:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD8561181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orTmp1dOk1sU; Wed, 12 Jul 2023 09:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E9116117A;
	Wed, 12 Jul 2023 09:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E9116117A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7177B1BF3EA
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 09:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AE176117A
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 09:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE176117A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3SG2tplSxIB for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 09:42:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA57361179
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA57361179
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 09:42:43 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.111.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JWFyq4JGdlgY2JWFyqrGjk; Wed, 12 Jul 2023 11:35:35 +0200
Message-ID: <179ceb1b-392b-1abe-5afb-dc33ac095512@benettiengineering.com>
Date: Wed, 12 Jul 2023 11:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Jamie Gibbons <jamie.gibbons@microchip.com>, buildroot@buildroot.org
References: <20230712083455.2349333-1-jamie.gibbons@microchip.com>
 <20230712083455.2349333-2-jamie.gibbons@microchip.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230712083455.2349333-2-jamie.gibbons@microchip.com>
X-CMAE-Envelope: MS4xfNj7Z3d1qatrSzrgceodtbfa1BrdQzwmn6EHY4tgtFLJjEpR5G7F3PV/wAV9wd6b0i3XKj9+OPBAOxUJai3nBcp7Hd5tIMgBDIYArOstQgT0xXmfugAH
 wZi0T02DAUB72mYAnYKq8MoWDVChd/3MViQjRkuHq4ygFqk0o/h5QbvlEUtMnoSbbeAFkVE3Q1vtGf53/ScNx6ede+MnsMdGjCG/y3xFY0YJN+uWquIABzZx
 DVtm3AcrnPCQSfJzlm1gorFMM98ZlnhkpvoNyjylgBAKKDcy1/Z2Qgr+S+NEA+VNn0LSHP1nqrpugDxB59QUWrxCJWEKzYx/a1SsNLSRZqopLMUMEZJRm6h6
 pneKXxHjFvDhA9GnXkHz+0NjjBp7EFoBuco1McK1uqUsPXNvH9DbwW5fWx2XIILuI4jQAhycjNNIAuQ7/IXDl0y5mWjhxcKQse947jfjMKi9T6iqiw8riSuf
 UmCJvKNtBswGEPyqSmpiM8PRt3iNJHblokaTUw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689154535; bh=1S8iVvjKUUs9tTCKmowIjXwXQICO555w2GhHFmRzx+M=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=DYcQ9249ii/0pemc67BkzIFt6mUQOkaesszFWMhIpPiZlMrdxkwK/h3wkd+S849sn
 reWaDwW2WPtMYs11yWYpy0vNUN9w69Tbz5Qy/WealLG9ulRWsgeSrjy5NDj7xHMOIB
 CdwPpp/p3nVK4USgE0ppMGbMRlIPmZrjnlYbTilpjGcI0REnAuot8r9XRtmKEi/NCw
 WdGY062s/bDuJ8dN6De82WBKYvo7ltVDA5pw1sAz3eopb7J3Hd8WPEqkIhLjgDl5AU
 jgHYHkMj019TUPQ0J1UcN/CVKjgGFcEvvzdorOsoa+hgbQn4iUlNs92qG7/AEJrbwK
 UCXUiIsb0LFzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=DYcQ9249
Subject: Re: [Buildroot] [PATCH v2 1/2]
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
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jamie, All,

On 12/07/23 10:34, Jamie Gibbons via buildroot wrote:
> The Buildroot icicle kit configuration uses the Hart Software Service's
> (HSS) payload generator tool. This tool creates a formatted payload
> image for the HSS zero-stage bootloader on PolarFire SoC, given a
> configuration file and a set of ELF binaries. The configuration
> file is used to map the ELF binaries or binary blobs to the
> individual application harts (U54s). Add the HSS payload generator as a
> host package to support this.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> ---
>   DEVELOPERS                                    |  3 +++
>   package/Config.in.host                        |  1 +
>   .../Config.in.host                            | 10 ++++++++
>   .../microchip-hss-payload-generator.mk        | 24 +++++++++++++++++++
>   4 files changed, 38 insertions(+)
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
> index 0000000000..1e21fbbb5d
> --- /dev/null
> +++ b/package/microchip-hss-payload-generator/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR
> +	bool "HSS Payload Generator"
> +	help
> +	  Microchip PolarFire SoC Payload Generator. This tool creates a formatted
> +	  payload image for the HSS zero-stage bootloader on PolarFire SoC, given a
> +	  configuration file and a set of ELF binaries. The configuration file is
> +	  used to map the ELF binaries or binary blobs to the individual application
> +	  harts (U54s).
> +
> +	  https://github.com/polarfire-soc/hart-software-services.git
> diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> new file mode 100644
> index 0000000000..7344d208c1
> --- /dev/null
> +++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# microchip-hss-payload-generator
> +#
> +################################################################################
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.06
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE = MIT
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE_FILES = LICENSE.md
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_DEPENDENCIES = host-elfutils host-libyaml

here you need to add host-openssl to avoid build failure.

When you test build please use buildroot/utils/docker-run so you won't
use your distro host libraries/utilities and you can catch this kind of
build failure due to host dependencies.

Thank you!
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> +
> +define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_BUILD_CMDS
> +    $(MAKE) -C $(@D)/tools/hss-payload-generator \
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
