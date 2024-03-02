Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3539C5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 07:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E833408C7;
	Sat,  2 Mar 2024 07:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vna90fT5dY6a; Sat,  2 Mar 2024 07:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D5D4403B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D5D4403B9;
	Sat,  2 Mar 2024 07:12:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D90761BF3C6
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 07:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D627A83B47
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 07:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BfRbaD-u7O2m for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 07:11:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7749283AE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7749283AE0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7749283AE0
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 07:11:57 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4227BrUg020054;
 Sat, 2 Mar 2024 01:11:53 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4227BrGI031356
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 2 Mar 2024 01:11:53 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 2
 Mar 2024 01:11:53 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 2 Mar 2024 01:11:53 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4227Brqc101662;
 Sat, 2 Mar 2024 01:11:53 -0600
Date: Sat, 2 Mar 2024 01:11:53 -0600
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-amarula@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <buildroot@buildroot.org>, Romain Naour <romain.naour@smile.fr>,
 <michael@amarulasolutions.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, <bryce@redpinelabs.com>, Anand Gadiyar
 <gadiyar@ti.com>
Message-ID: <20240302071153.3unarvailjqsgz2q@dasso>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
 <20240302012253.anhxdj3ozc6e73sz@dasso>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240302012253.anhxdj3ozc6e73sz@dasso>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1709363513;
 bh=ThYn4BcHSRB6R2UM+kg9uA3R7tyn+/1/SIfIMmt1H9U=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=njBZ1ROf4W4/0Q26zsmMF7jSgdfXlDILhuOcS/tD1YrrxzI5mFiB+s9YtBTIo8kU+
 msTfoMSIeLmlmd6Rn2GFId7Yx5bQZNGsG8uySHzKajPlFAQ+7hN+zVwt+aYlQkC9+w
 8WaQK/67a+iWTPbwmC9FJvkLc8DIPITz6nO7d1fY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=njBZ1ROf
Subject: Re: [Buildroot] [PATCH v8 00/23] Add support for AM62x-SK HS-FS
 devices
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On Fri, Mar 01, 2024 at 07:22:53PM -0600, Andreas Dannenberg via buildroot wrote:
> Hi Dario,
> 
> On Fri, Mar 01, 2024 at 02:35:57PM +0100, Dario Binacchi wrote:
> > The SK-AM62B-P1 is the newest version of SK-AM62 which includes
> > high-security field-securable (HS-FS) silicon to optionally customize keys
> > and encryption for security applications.
> > This requires enabling the BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS option,
> > which, however, was buggy. This series fixes the errors and bumps the Linux
> > kernel and U-Boot required for such a new device.
> > 
> > Furthermore, this version complete the series by updating the
> > ti_am64x_sk_defconfig too and remove ti-k3-image-gen, as requested by
> > Romain Naour:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20240224205654.1546744-17-dario.binacchi@amarulasolutions.com/
> > I have successfully executed compilation tests for all possible combinations of platform and security type:
> > am62x -> GP, HS, HS-FS
> > am64x -> GP, HS, HS-FS
> 
> Thank you for the changes and the updated submission. I'll build and
> boot-test your v8 on all 4 hardware variants of the above platforms
> and report back before the end of this weekend.

I just finished build and boot testing all 4 device/security
combinations without any issues:

1) AM62 GP
2) AM62 HS-FS
3) AM64 GP
4) AM64 HS-FS

For this I applied your v8 series on top of...
75a3562324 ("support/scripts/pkg-stats: sort CVEs in HTML output")
...and performed 4 individual completely clean builds.

Then, I boot tested all 4 SD card images on the respective HW platforms
(4 different SK boards). The boot logs of each case look pretty clean
and about as expected and I've archived them here [1] if somebody is
curious. While the boot logs show there's further work needed (e.g.,
updating TIFS/DM device firmwares to more current versions, enabling/
fixing power off functionality) all what I saw should be done as future
work and not as part of this series. I think it does a great job making
those device families accessible and enabling said further development.

So for the series:

Tested-by: Andreas Dannenberg <dannenberg@ti.com>

[1] https://gist.github.com/adannenb-ti/35feca65e7d86a7e062a36c48efddc63




> Also yesterday I was able to get graphics to work on AM62x with a few
> patches based on top of your v7 series, using the Imagination Rogue
> Power VR GPU driver and Mesa, and was able to run (accelerated) Weston.
> Will pobably submit an RFC of this next week.
> 
> --
> Andreas Dannenberg
> Texas Instruments Inc
> 
> 
> > 
> > The AM62x HS-FS configuration has also been tested on the SK-AM62B-P1 board.
> > 
> > Dario Binacchi (22):
> >   configs/ti_am62x_sk_defconfig: fix BR2_TARGET_OPTEE_OS_PLATFORM
> >     setting
> >   configs/ti_am64x_sk_defconfig: fix BR2_TARGET_OPTEE_OS_PLATFORM
> >     setting
> >   configs/ti_am62x_sk_defconfig: explicitly set the ti-k3-r5-loader
> >     version
> >   configs/ti_am64x_sk_defconfig: explicitly set the ti-k3-r5-loader
> >     version
> >   boot/ti-k3-r5-loader: bump to version 2024.01
> >   package/python-attrs: add host variant
> >   package/python-rpds-py: add host variant
> >   package/python-referencing: add host variant
> >   package/python-jsonschema-specifications: add host variant
> >   package/python-jsonschema: add host variant
> >   boot/ti-k3-r5-loader: set binman environment
> >   boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option
> >   package/ti-k3: move TI_K3_{SECTYPE,SOC} out of the image-gen scope
> >   package/ti-k3: disable HS-FS for AM65 SOC
> >   boot/ti-k3/ti-k3-r5-loader: install tiboot3.bin
> >   configs/ti_am62x_sk_defconfig: bump U-Boot version to 2024.01
> >   configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.18
> >   board/ti/am62x-sk: generalize post-build.sh
> >   board/ti/am62x-sk: move post-{build,image}.sh to board/ti/common/am6xx
> >   package/ti-k3: fix BR2_PACKAGE_TI_K3_SOC setting for am64x SOC
> >   configs/ti_am64x_sk_defconfig: bump U-Boot version to 2024.01
> >   configs/ti_am64x_sk_defconfig: bump Linux version to 6.6.18
> > 
> > Romain Naour (1):
> >   boot/ti-k3-image-gen: remove package
> > 
> >  Config.in.legacy                              |  7 ++
> >  DEVELOPERS                                    |  2 -
> >  board/ti/am62x-sk/genimage.cfg                |  7 +-
> >  board/ti/am64x-sk/genimage.cfg                |  7 +-
> >  board/ti/common/am6xx/post-build.sh           | 58 ++++++++++++++
> >  board/ti/common/am6xx/post-image.sh           | 11 +++
> >  boot/Config.in                                |  1 -
> >  boot/ti-k3-image-gen/Config.in                | 77 -------------------
> >  boot/ti-k3-image-gen/ti-k3-image-gen.hash     |  3 -
> >  boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 54 -------------
> >  boot/ti-k3-r5-loader/Config.in                |  5 +-
> >  boot/ti-k3-r5-loader/ti-k3-r5-loader.hash     |  2 +-
> >  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       | 12 ++-
> >  boot/uboot/Config.in                          | 23 +++---
> >  boot/uboot/uboot.mk                           | 12 ++-
> >  configs/ti_am62x_sk_defconfig                 | 22 +++---
> >  configs/ti_am64x_sk_defconfig                 | 22 +++---
> >  package/Config.in                             |  1 +
> >  package/python-attrs/python-attrs.mk          |  6 ++
> >  .../python-jsonschema-specifications.mk       | 10 +++
> >  .../python-jsonschema/python-jsonschema.mk    | 14 ++++
> >  .../python-referencing/python-referencing.mk  | 11 +++
> >  package/python-rpds-py/python-rpds-py.mk      |  1 +
> >  package/ti-k3/Config.in                       | 61 +++++++++++++++
> >  package/ti-k3/ti-k3.mk                        |  7 ++
> >  25 files changed, 263 insertions(+), 173 deletions(-)
> >  create mode 100755 board/ti/common/am6xx/post-build.sh
> >  create mode 100755 board/ti/common/am6xx/post-image.sh
> >  delete mode 100644 boot/ti-k3-image-gen/Config.in
> >  delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
> >  delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
> >  create mode 100644 package/ti-k3/Config.in
> >  create mode 100644 package/ti-k3/ti-k3.mk
> > 
> > -- 
> > 2.43.0
> > 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
