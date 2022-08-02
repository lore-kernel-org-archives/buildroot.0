Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D764BC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 21:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63CA160E37;
	Tue,  2 Aug 2022 21:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63CA160E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9B4uy6njHJA; Tue,  2 Aug 2022 21:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C96560E33;
	Tue,  2 Aug 2022 21:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C96560E33
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 081781BF28F
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6F6981771
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6F6981771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kb8ScL4ARln for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 21:42:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C4918176B
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C4918176B
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 21:42:28 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Izekob1RS34GkIzekonFxb; Tue, 02 Aug 2022 23:42:27 +0200
Message-ID: <ec581e94-906f-a7dc-2f49-0599648fb187@benettiengineering.com>
Date: Tue, 2 Aug 2022 23:42:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org
References: <20220802200522.4619-1-x-shi@ti.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220802200522.4619-1-x-shi@ti.com>
X-CMAE-Envelope: MS4xfIKy8iwq5YRUJcvs4j+8xUHdRTXn7Iq3HyRW9qI0DHlAh0GN9pPlnslJVvgBDk5MCH1NHYoD8rOjMAUX4GfbAp8G+HSoN5wL/F1YbMsKFJJcrk14WzdN
 x/sJiq8+anI9Ij4uBt2NU95Q8KZuXHOOfnE+poA+bnVA00aOMeYTllI3MzW5dxbPtS3Khi5xmZe7D6esL8knPedbpk7ppw+SScFnEn2LYBmlormABD4HCNjz
 c4OEiy02BPjSZddGiHy9unGHXbkoeJovkfoDKUwMLOmMtsImbPoVYTQsbyXhapNIeyq5GqLDwa7Pu/i/JeaVsQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659476547; bh=CN8eyvKUlGuzA286DS3qBdDgAHhU9AbcfIX4+4C8Fo4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ih1fUDM/AkCOM4k8TcP4W1PA0dFNsbomy1tDCmJcI4FiXm6c3jj4JZD8hEwoiRqUN
 n2GjmfSj4Wr46mu29oq5hY+9Sq5ycVpwKBkIvPqxSrW0YUBoQhfXMoE3zAShKPKo2P
 tsWsffChzu8OPNttXO/OYf/m1YSpB4hVHOUfrE1DjzL1CXiBxXf5PH33uS1Zx99z0G
 LYJzeJjUUJ/N6co61a+pdoBmN1HJjDR2JsK/ukUuGZ/Bq72S/t0P/uhMndSGRLBCxh
 /23uSr5lfPBVUBzwlVRxqonUMjBdXaWl4U8uP4I6oqHtOkPgpHvMzwqN/D3ebkaaU2
 QkgOsiWCplnGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ih1fUDM/
Subject: Re: [Buildroot] [PATCH v3 0/3] add support for TI's AM6X boards
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Xuanhao,

can you please set this patch:
https://patchwork.ozlabs.org/project/buildroot/list/?series=311753
as superseded since there is V3 now?

Thanks a lot
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 02/08/22 22:05, Xuanhao Shi via buildroot wrote:
> The series applied the changes requested by Thomas Petazzoni and
> Giulio Benetti to the previous patch for adding support to TI's
> AM6X boards ([1]). Specifically, it added support for the
> AM64x_sk board only for now, but more k3 boards will be added
> in the future.
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2022-July/647882.html
> 
> Changes in v3:
> - Fix boot/ti-k3-r5-loader package's build options and dependencies.
> - Fix boot/ti-k3-image-gen package's config
> - Add more details in board/ti/am64x_sk's readme
> - Trim configs/am64x_sk's toolchain options and
>    fix uboot and genimage dependencies.
> - Remove board/ti/am62x_sk and configs/am62x_sk for now due to some
>    firmware dependency problems. Will be added back in the future.
> 
> Changes in v2:
> - Revert arm-gnu-toolchain back to version 10.x due to a bug.
>    When the pre-packaged GCC was built, it could be targeting
>    a newer x86_64 architecture than the processor being used.
> - Add boot/ti-k3-r5-loader package that builds a separate U-Boot
>    for the R5 cores on TI's K3 devices.
> - Add boot/ti-k3-image-gen package that builds the full boot binary
>    tiboot3.bin from the spl built from ti-k3-r5-loader.
> - Add board/ti directory to include sdcard config and board information
>    for AM64x_sk and AM62x_sk boards.
> - Add the Buildroot defconfigs for AM64x_sk and AM62x_sk.
> - Add to DEVELOPERS list.
> 
> Xuanhao Shi (3):
>    boot/ti-k3-r5-loader: add new package
>    boot/ti-k3-image-gen: add new package
>    board/ti/am64x_sk: add new board
> 
>   DEVELOPERS                                | 12 ++++++
>   board/ti/am64x_sk/genimage.cfg            | 27 +++++++++++++
>   board/ti/am64x_sk/readme.txt              | 49 +++++++++++++++++++++++
>   boot/Config.in                            |  2 +
>   boot/ti-k3-image-gen/Config.in            | 24 +++++++++++
>   boot/ti-k3-image-gen/ti-k3-image-gen.hash |  2 +
>   boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 33 +++++++++++++++
>   boot/ti-k3-r5-loader/Config.in            | 13 ++++++
>   boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |  2 +
>   boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 45 +++++++++++++++++++++
>   configs/am64x_sk_defconfig                | 48 ++++++++++++++++++++++
>   11 files changed, 257 insertions(+)
>   create mode 100644 board/ti/am64x_sk/genimage.cfg
>   create mode 100644 board/ti/am64x_sk/readme.txt
>   create mode 100644 boot/ti-k3-image-gen/Config.in
>   create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
>   create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
>   create mode 100644 boot/ti-k3-r5-loader/Config.in
>   create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
>   create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
>   create mode 100644 configs/am64x_sk_defconfig
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
