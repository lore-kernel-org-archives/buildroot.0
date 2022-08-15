Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9847C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4A2414A1;
	Mon, 15 Aug 2022 12:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D4A2414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvLJkKLdDvku; Mon, 15 Aug 2022 12:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1DEB410AB;
	Mon, 15 Aug 2022 12:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1DEB410AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE3591BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8307940875
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8307940875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-lUUvUM7fzX for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:35:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09996410B2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09996410B2
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:35:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9D96F1BF203;
 Mon, 15 Aug 2022 12:35:05 +0000 (UTC)
Date: Mon, 15 Aug 2022 14:35:04 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220815143504.7a91abd4@windsurf>
In-Reply-To: <20220807222529.1501004-2-giulio.benetti@benettiengineering.com>
References: <20220807222529.1501004-1-giulio.benetti@benettiengineering.com>
 <20220807222529.1501004-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660566906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNOHgq1y1w0SalrBTSVfSRHIoDMwqFxhvn73dVD5uBQ=;
 b=OEcF8syc3Y/jOCl/BGEo8kMsObYyygn6tx1XEX/qoFs3IMTUV5SeG3TJQCy2G3u6pGbtMy
 v3lymiM2mecJx2ZZdAo3TFCoF2fKgr1KNiI50nKnRptmeErJFdvVhZWTXTp2T2mFppo+Ig
 vJgaFAjSPZJWcIzjO293e77w/TtezIbXeal4Cv/eNRFj/QBKy7+LC1woHGm2K5kVphanTx
 ooQ0BZk4B2PJEujygAwlgAPZ5QjDTxky8LVde6th2a8XOVRctlbiukWTar0zpkkFeoNrPT
 b/S/Nbh9xIIy1x7FMQ4d5L4yqQFUNoHuwz8KxTZk8uHo/PcGpDO9ePhiG4W/Aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OEcF8syc
Subject: Re: [Buildroot] [PATCH 1/2] package/opencv4:
 BR2_PACKAGE_OPENCV4_LIB_DNN requires protobuf
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
Cc: Stefano Cottafavi <stefano.cottafavi@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Aug 2022 00:25:28 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Opencv4 requires protobuf library otherwise it disables DNN:
> ```
> if(NOT HAVE_PROTOBUF)
>   ocv_module_disable(opencv_dnn)
> endif()
> ```
> https://github.com/opencv/opencv/blob/4.x/modules/dnn/CMakeLists.txt#L5-L7
> So let's "select BR2_PACKAGE_OPENCV4_WITH_PROTOBUF" if
> BR2_PACKAGE_OPENCV4_LIB_DNN is enabled.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/opencv4/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
> index a61a106952..bdeddcc089 100644
> --- a/package/opencv4/Config.in
> +++ b/package/opencv4/Config.in
> @@ -34,6 +34,7 @@ config BR2_PACKAGE_OPENCV4_LIB_DNN
>  	bool "dnn"
>  	# dnn needs fenv.h which is not provided by uclibc
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +	select BR2_PACKAGE_OPENCV4_WITH_PROTOBUF

This was missing the propagation of the "depends on" of
BR2_PACKAGE_OPENCV4_WITH_PROTOBUF, which also affected the Config.in
comment.

The final patch is at:

  https://git.buildroot.org/buildroot/commit/?id=b0d3c25cc8017e92dbdedf1a1dde6f4dc4408332

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
