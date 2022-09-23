Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23065C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC09D40436;
	Fri, 23 Sep 2022 21:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC09D40436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5a9-q2mJ0W3u; Fri, 23 Sep 2022 21:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6E1240220;
	Fri, 23 Sep 2022 21:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6E1240220
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46DB11BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22AD140220
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22AD140220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZtHRo8w346UG for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:53:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED9244013B
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED9244013B
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:53:43 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.20.153])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bqc9oyNmT5z8Nbqc9o4CdC; Fri, 23 Sep 2022 23:53:42 +0200
Message-ID: <90c6436b-b286-d56d-dc9d-ed34a050a1c8@benettiengineering.com>
Date: Fri, 23 Sep 2022 23:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Anand Gadiyar <gadiyar@ti.com>, buildroot@buildroot.org
References: <20220923205543.1518798-1-gadiyar@ti.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220923205543.1518798-1-gadiyar@ti.com>
X-CMAE-Envelope: MS4xfGi+0l5nZbITFTFJ+zozX3rUvQjB16faVmk08DtFENNQl7/yU+vyPXa3bKXhpFJ0hpAR6F+RWQ1hYNAS3gnauO86j5YNFXWfYiVLZnSr17OmjBRTom2n
 scVFIV7musCM9x/eqykT6n5IIe8gYQXdPFtdiY18yrkDEE4ZPMN2rnbG19q3gStWw26+5qQi7uN/DxoBpy1+jw2oWHlcWhZ5676JmJsfnkB9fhCKmaptnfpA
 VVXqmEfnaXdBgH2UUA8N6QLMlN91kYjSACcDO8eAAs8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663970022; bh=kzQGAufPzag8HqVi/RxHm320lz5c6advlnZ54OBS72I=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=IdBJB85dgOG/5NO1FsxEYTVr3Wjl7YnDAtwYsXFkSnjzZMRb7zxM8Ny3MTXApATx6
 ZrF5q3EM8c2PlEUyCui9eJt8x+GdnZ++0xcxrFLN5GWws9pjBB1SlLfPrI76KhxCb6
 PLTkDgo2DdXUwqV7zneD3gs+7WJYemO95fdp2QpN9zXmcMy4h5NpxsV0bwYsnrA+ko
 Sear2iq83GPZUBS9BCAyyslCjOVmCvk8/EKA0ik3Tw8xrj6ncXZsbrP5iXORRRkQdp
 Ye1IKE+u9ry5ERVQD77SFvcQk8VtnNIipH7SmA2ASyzW83MubRM3QI5VCJ0Pj1vKto
 7I4RKGJf+TRrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=IdBJB85d
Subject: Re: [Buildroot] [PATCH v5 0/3] add support for TI's AM64x boards
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
Cc: Xuanhao Shi <X15000177@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Anand,

On 23/09/22 22:55, Anand Gadiyar wrote:
> This series introduces support for TI's AM64x SK boards.
> 
> It was previously sent out by Xuanhao in August and reviewed by
> Giulio Benetti (Thanks!).

It's a pleasure :-)
Anyway no need to respin to add my Reviewed-by's since Patchwork keeps
track of them.

Here we need to wait for a Maintainer to review and commit your patches
if everything is ok.

> If this looks okay, I'll mark the previous series as superceded
> in patchwork. 

Yes please.

Kind regards!
-- 
Giulio Benetti
Benetti Engineering sas


Let me know if there's anything more to be done to
> get these patches merged, as this is the first time we're engaging
> with the buildroot community and may not be familiar with the
> process.
> 
> We would like to add support for the AM62x SK as well, but are
> currently blocked by availability of some firmware. Hopefully that
> will get sorted out soon.
> 
> 
> Changes in v4:
> - rebased to latest master and retested
> - dropped OPTEE CUSTOM* options as we don't need them.
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
>   configs/am64x_sk_defconfig                | 45 +++++++++++++++++++++
>   11 files changed, 254 insertions(+)
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
