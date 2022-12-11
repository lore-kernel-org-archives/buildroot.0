Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D244C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93A0140545;
	Sun, 11 Dec 2022 17:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93A0140545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36Pp0Npsglas; Sun, 11 Dec 2022 17:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E403E4052F;
	Sun, 11 Dec 2022 17:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E403E4052F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77C4B1BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DB8D81432
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DB8D81432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWiQTjLErNbi for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:03:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 523EE8134F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 523EE8134F
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:03:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6FA8C100002;
 Sun, 11 Dec 2022 17:03:37 +0000 (UTC)
Date: Sun, 11 Dec 2022 18:03:36 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221211180336.79ea5b05@windsurf>
In-Reply-To: <20221207124855.1831-1-neal.frager@amd.com>
References: <20221207124855.1831-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670778217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVduS492/PtN2ASK/S5IOiqfdjZ88AaMV+ggK+aizWE=;
 b=QeV3tsZd7/8guKjT9uoO3IojyikWyqVE/fELAROG41SOIahxrprCrcv4kZQcOaG9PaOxLo
 oiTEwskmvPAx7+TH5RDwAHCQc6DqhCHXvSC1YF13cY+bS67K/N8CwnHvrGJrfKc/IjA2v8
 tiOn4KnmKDG6X6XgWwcd858M2HcqsanKueJOdLKAReSOCdUpy5gHRgseUcVNQl3CSID2o8
 885c0vLnJxuchw/ZX+04jJn8vPo+esLsi2B1fBCd4gLMxGg88ArUNNJq8SVuVHGrOROY39
 rQUonCYjpLBRrr4Wo4OMNLPQjZtXA4pGhf/FG1gcJ7RpkUXXAjBX5PJ2qrL+pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QeV3tsZd
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix linux dts name
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 7 Dec 2022 05:48:55 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> The Linux DTS name has changed for the zynqmp_kria_kv260 with Xilinx 2022.2.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/zynqmp_kria_kv260_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
> index df01ad30b8..aef67b3cb4 100644
> --- a/configs/zynqmp_kria_kv260_defconfig
> +++ b/configs/zynqmp_kria_kv260_defconfig
> @@ -8,7 +8,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/smk-k26-revA-sck-kv-g-revB"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"

Do you test your patches before sending them? Because it's quite
worrying to have some many fixes.

And in fact, it seems this patch is also broken: there is no Device
Tree named zynqmp-smk-k26-revA-sck-kv-g-revB.dts:

$ make zynqmp_kria_kv260_defconfig
$ make linux-patch
$ find output/build/linux-custom/ -name 'zynqmp-smk-k26-revA-sck-kv-g-revB.dts'
$

So unless I'm wrong, this patch doesn't look correct.

Please make sure to do a full build of your defconfigs (make clean;
make foobar_defconfig; make) before sending an update to your defconfig.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
