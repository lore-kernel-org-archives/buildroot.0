Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EC4EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 21 Jun 2023 15:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49C67408BA;
	Wed, 21 Jun 2023 15:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C67408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o5Yruc_O7K6j; Wed, 21 Jun 2023 15:32:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFB86408C4;
	Wed, 21 Jun 2023 15:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFB86408C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F27781BF3BE
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 15:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE82E408C4
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 15:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE82E408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7I8XD9JUHbao for <buildroot@lists.busybox.net>;
 Wed, 21 Jun 2023 15:32:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7352408BA
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7352408BA
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 15:32:06 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35LFW5Fw122335;
 Wed, 21 Jun 2023 10:32:05 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35LFW5dv067414
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Jun 2023 10:32:05 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 10:32:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 10:32:05 -0500
Received: from dasso (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35LFW5eU029644;
 Wed, 21 Jun 2023 10:32:05 -0500
Date: Wed, 21 Jun 2023 10:32:05 -0500
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230621153205.kzdumpzy7jn2sugh@dasso>
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-8-dannenberg@ti.com>
 <6cdc63a2ff8ddc7c753108220fa9664b@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6cdc63a2ff8ddc7c753108220fa9664b@free.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1687361525;
 bh=MHVXDHs326sUztbo4vrJ5dzbvxBz9tGaCUm6ekds3sQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=MpPD1R9ZoJz6nYTRF4PyuERxim7DkPBZNDGskPOJdC6xxvT03tpa7q5H+kp+dw5Jf
 CoW0L1gY74NFEqpW84Qjz+9R0jdCYy1k/wcThorOyvHGmCE6Zvyt74HaZcz8Q8WUW5
 apCYcJgdL0PUnkOqsj5FeEtZpaMcdbt9fTCThAW8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=MpPD1R9Z
Subject: Re: [Buildroot] [PATCH v8 07/10] board/ti/am62x_sk|am64x_sk: switch
 to HS-FS device variants
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Mon, Jun 19, 2023 at 07:39:58PM +0200, Julien Olivain wrote:
> Hi Andreas,
> 
> Thanks for the update!
> 
> I successfully booted this am64x_sk_defconfig on SK-AM64B board, with
> this patch series on top of branch master at commit b91524f.

Thanks for spending the time doing this. Added your Tested-by: tag to my
PATCH v9 currently work-in-progress. Will re-post soon with a few
additional improvements discussed here in this series. Especially the
integration of the secure signing/key package will make things really
"Buildroot-easy".

--
Andreas Dannenberg
Texas Instruments Inc


> 
> 
> On 16/06/2023 02:23, Andreas Dannenberg via buildroot wrote:
> > Current starter kits for AM62x (called SK-AM62B, see [1]) and AM64x
> > (called SK-AM64B, see [2]) both contain High Security - Field Securable
> > (HS-FS) device variants, and those are really the recommended production
> > device variants and boards TI will provide moving forward. Hence, switch
> > the defconfigs for those boards over to accommodate those now-shipping
> > device variants and boards.
> > 
> > [1] https://www.ti.com/tool/SK-AM62B
> > [2] https://www.ti.com/tool/SK-AM64B
> > 
> 
> Tested-by: Julien Olivain <ju.o@free.fr>
> 
> > Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> > ---
> >  board/ti/am62x_sk/readme.txt | 16 ++++++++++++++++
> >  board/ti/am64x_sk/readme.txt | 16 ++++++++++++++++
> >  configs/am62x_sk_defconfig   |  2 +-
> >  configs/am64x_sk_defconfig   |  4 ++--
> >  4 files changed, 35 insertions(+), 3 deletions(-)
> > 
> > diff --git a/board/ti/am62x_sk/readme.txt b/board/ti/am62x_sk/readme.txt
> > index ccbb24896b..9c7c8818af 100644
> > --- a/board/ti/am62x_sk/readme.txt
> > +++ b/board/ti/am62x_sk/readme.txt
> > @@ -12,6 +12,22 @@ $ make am62x_sk_defconfig
> >  Optional: modify the configuration:
> >  $ make menuconfig
> > 
> > +Required setup step for High Security HS-FS and HS-SE SoC variants:
> > +
> > +To allow the image signing process for various firmware artifacts to
> > +work the build process for HS-FS and HS-SE device variants is using
> > +an external 'core-secdev-k3' package which can be obtained from
> > +https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
> > +To prepare building for those device variants create a local copy of
> > +the 'core-secdev-k3' and export its location through the
> > +TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
> > +HS-FS device variants such as populated on the SK-AM64B board, or
> > +customize this package with your private signing keys when using a
> > +HS-SE device variant.
> > +
> > +$ git clone
> > https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> > +$ export TI_SECURE_DEV_PKG=$PWD/core-secdev-k3
> > +
> >  Build:
> >  $ make
> > 
> > diff --git a/board/ti/am64x_sk/readme.txt b/board/ti/am64x_sk/readme.txt
> > index fe83c675f5..51d0312726 100644
> > --- a/board/ti/am64x_sk/readme.txt
> > +++ b/board/ti/am64x_sk/readme.txt
> > @@ -12,6 +12,22 @@ $ make am64x_sk_defconfig
> >  Optional: modify the configuration:
> >  $ make menuconfig
> > 
> > +Required setup step for High Security HS-FS and HS-SE SoC variants:
> > +
> > +To allow the image signing process for various firmware artifacts to
> > +work the build process for HS-FS and HS-SE device variants is using
> > +an external 'core-secdev-k3' package which can be obtained from
> > +https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
> > +To prepare building for those device variants create a local copy of
> > +the 'core-secdev-k3' and export its location through the
> > +TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
> > +HS-FS device variants such as populated on the SK-AM64B board, or
> > +customize this package with your private signing keys when using a
> > +HS-SE device variant.
> > +
> > +$ git clone
> > https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> > +$ export TI_SECURE_DEV_PKG=$PWD/core-secdev-k3
> > +
> >  Build:
> >  $ make
> > 
> > diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig
> > index 2d05ddd96b..033101b735 100644
> > --- a/configs/am62x_sk_defconfig
> > +++ b/configs/am62x_sk_defconfig
> > @@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
> >  BR2_TARGET_OPTEE_OS_PLATFORM="k3"
> >  BR2_TARGET_TI_K3_IMAGE_GEN=y
> >  BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am62x"
> > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="gp"
> > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="hs-fs"
> >  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG="evm"
> >  BR2_TARGET_TI_K3_R5_LOADER=y
> >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=y
> > diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
> > index a26e38a043..096dd77f6a 100644
> > --- a/configs/am64x_sk_defconfig
> > +++ b/configs/am64x_sk_defconfig
> > @@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
> >  BR2_TARGET_OPTEE_OS_PLATFORM="k3"
> >  BR2_TARGET_TI_K3_IMAGE_GEN=y
> >  BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=y
> > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am64x"
> > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="gp"
> > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am64x_sr2"
> > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="hs-fs"
> >  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG="evm"
> >  BR2_TARGET_TI_K3_R5_LOADER=y
> >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=y
> 
> Please note that this patch series introduce 18 check-package warnings.
> I understand from the current review comments that a v9 series will
> be needed. Please run a "utils/docker-run make check-package" and
> include the appropriate changes.
> 
> See:
> https://nightly.buildroot.org/manual.html#_preparing_a_patch_series
> 
> Best regards,
> 
> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
