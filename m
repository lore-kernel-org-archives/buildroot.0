Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD708C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 21:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A5A883A4F;
	Wed, 27 Dec 2023 21:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A5A883A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LEwrzVefPhxi; Wed, 27 Dec 2023 21:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98F3383A42;
	Wed, 27 Dec 2023 21:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98F3383A42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 748FA1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B32E419E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B32E419E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWFlUE5M_SrW for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 21:52:51 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B0B141741
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 21:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B0B141741
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.240]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE6F-1rYtev0KSp-00Khx3; Wed, 27
 Dec 2023 22:52:46 +0100
Date: Wed, 27 Dec 2023 22:52:45 +0100
To: Sebastian Bauer <mail@sebastianbauer.info>
Message-ID: <20231227225245.3110388e@gmx.net>
In-Reply-To: <20231227182429.1215185-2-mail@sebastianbauer.info>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
 <20231227182429.1215185-2-mail@sebastianbauer.info>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:UQe6pVMU3z4JtzFQF7kmmIdOeXXb4LWOEQkJf3qnvQVND9Rmb4o
 8rEplF+ezdaDrpNnkMuI9QmwpSPEXe45nqYsJlKpj/HpMkyHRnJwHC42v5fw5IoQWNswAQw
 zF00P5qfqcgqOwLrN82zJ9hU8yzpLSP/eL5GxBTPcoWiiU4jD2qD+WSuZQ06i9Ui9Q2s1iP
 RYRtXhLwLVceMgyn6g4Ww==
UI-OutboundReport: notjunk:1;M01:P0:4WjWrCjFmno=;H1/oiVM7WVowun6BjSiSAzViAp1
 cTXZGiuIg4JsmmXbrtaywwTq45W7o/pCT9ilUuSnv+cICb8WV4s+WyhPWbMNKJETsJ4XdCIoX
 4PY/ROT8gcGDUbIA2E0BYmioG6cBMP53r2jkDpEqKLyig6n8AU0qoWgcJp2scocjwfZrktLiL
 qBtZ0XrKR6EQrjEFSwm30wjmxQw+pFGDZFucFB59m+bXWsUd8YnbXqmqNwLRJvyoZZAvNqzU5
 wJarsthsuOrA98YMna0zlHRgwlQC4W9UQdASmwNcD55xWofRdzpkaog11N9jZt+QBOG2Ejb98
 WE37EgyUeOyF8ZwbgaD6y/mqc8Q2gGSbOKQgsdK008R2VoanZJGe6FMtvigSdWSUobHptakHI
 BJeUhJYkubooCuBvFll64A6yfct7BmFjd/+KoryZBiYrKRCe1uelmdPpe480LufDr0/9yrSd+
 n8YDS1JHwTiGaoBw3Fkd2fe+Akcel2jbuSRGNxfENMCe9qoFkPWrJn6nFTX/iiGi8ULTHpu62
 JWzhtmGlM30B8T6jTbyARYC9UxQkIgDsxyfQkzGKAdnDdtylPKxep2/lpjhscNOX6n39i+rpH
 DEgnTJhfMDDm9JKgtK3pg9ekTrzbj+/PpmAf3uJ08+GqlK0yCJHaY+OOGNkRAMaLMyyntXvhm
 5HTzQYvZoEVn7bXDI4uouiGsiIhzlRTp/iV1BTg6rxL0Bm5nh15XmMNx17USy2fA2PA5lEnyc
 Or0HYXSwV0G/ALNU3pbP+MQqgXDmXGz24SsMifgBH5/8uOq/es4MuCoAEk8EMMqDJG/kyvqTf
 KiyWoEDlsYlljzGBUbzjU64wxNSl9lrzIQqHeb84bPPGoBGA099Nuq61xQcYzAcaq6GzxuAcO
 q/rd3YPsmnTGnSPTYVkF1uK5f7dveBWu2HihZ46GCR9sCUMr6cVf0QRxtE8PU8Q5OVZBLlxlS
 Q1b0m10MdrnunPqjQynE5LNbjsQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1703713966; x=1704318766; i=ps.report@gmx.net;
 bh=LaPQ3aibNonamdWI1RVjousKjpg6SVJ3IjZozfjlC1s=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
 References;
 b=janORtBU0/VBqcei5xO+K2QD1vXqUhXTuDaXZy1oB+chLEVCl66LVZQ6t1qMy7vO
 nmb4JvVgIjVa0ncg7Vmg2K5zVHD5/hJ+oRb6LAqWncH/0Hqn0bXWQgpcqA6ZBAqbI
 obcAd7URHhL7HZxb2Bw9hV2uYAK1WTDjL6cX3MQJWao5f1f0jJKZlhapWaBQz3MmT
 hDoY3YKfmVMiPpIZJSviu1OwT7xN/OeJGHsIyz8bWo/ZkgAXkYQ+brYCkXMCIkpHU
 93kfI9pOJJS27r/3nLTA+gq2d9YaVFkc+CTW+sq8MGVsBf3sCTQn89C2cBlmFObq9
 j0ZrxQckcxtW4pOtuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=janORtBU
Subject: Re: [Buildroot] [PATCH 2/3] packages/libcamera: Fix libcamera build
 with rpi pipeline
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sebastian,

thanks for the patch..., but submitted already a prior (and I think more
complete?) one fixing the same issue, see:

	http://lists.busybox.net/pipermail/buildroot/2023-November/679414.html

Regards,
Peter


On Wed, 27 Dec 2023 19:24:28 +0100, Sebastian Bauer <mail@sebastianbauer.info> wrote:

> The name of the pipeline was renamed from raspberrypi to rpi/vc4 in
> version 0.1.0 of libcamera, which is why, without this fix, the build is
> broken.
>
> Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>
> ---
>  package/libcamera/libcamera.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 8dce67f60f..c0c5a02368 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -52,7 +52,7 @@ endif
>
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
>  ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
> -LIBCAMERA_PIPELINES-y += raspberrypi
> +LIBCAMERA_PIPELINES-y += rpi/vc4
>  LIBCAMERA_DEPENDENCIES += boost
>  endif
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
