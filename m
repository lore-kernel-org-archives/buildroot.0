Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AEFC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 05:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05BDB40914;
	Wed,  9 Feb 2022 05:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pamg76D3zV2I; Wed,  9 Feb 2022 05:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE5314090D;
	Wed,  9 Feb 2022 05:45:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16B9E1BF8B4
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 05:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04D1860F57
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 05:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCiH7VW16-CY for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 05:45:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40B1B60F54
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 05:45:24 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 79006440283;
 Wed,  9 Feb 2022 07:44:56 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1644385496;
 bh=DnTkQEZYp6rlecMb8L0H5i9H5fUPp9fjXAVcff674YU=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=lCQtvw3KkH/FMEZy7vg9UiaYjknY29WrVU7iYseFWn6M2BmN1L9MRvnDqu8EudwAw
 4erH3Fm8ck8qGQm7azrgNrETZgqyoYnp62IiPZyhW7m2nmAfBEZjA8zYPvLBwbiEy2
 tvZpp1mMhE2jJiychdvGt1lij/qR79hTcYjtxEPyrJUcY/+3AhL43CDliZxGMbGKJJ
 GAuCF3+OCkD9l/rhf/bg9DeKe8oTY85Iq9HHbiOT/Tr58MU3vz5f2sat4ULYJn4G3T
 p6Z+G3dMCqywvYmjHA34OnncWcEmlcqsEHdKn5MPMHnDGGE5tKMUbONit1PqrHyjuD
 1votcmOJ0wGbQ==
References: <20220208212405.19243-1-ps.report@gmx.net>
 <20220208212405.19243-5-ps.report@gmx.net>
User-agent: mu4e 1.6.10; emacs 27.1
To: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 09 Feb 2022 07:43:33 +0200
In-reply-to: <20220208212405.19243-5-ps.report@gmx.net>
Message-ID: <875ypod24w.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 04/13] package/gst1-plugins-bad: bump
 version to 1.20.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Tue, Feb 08 2022, Peter Seiderer wrote:
> - removed 0001-neon-Allow-building-against-neon-0-32-x.patch
>   (from upstream [1])
>
> - add codecalpha option (VP8/VP9 alpha support)
>
> - add qroverlay option (overlay data on top of video in the form of a QR code)
>   with json-glib and libqrencode dependencies (omit json-glib explicit
>   dependencies as they are the same as for gstreamer1, glib2 BR2_USE_WCHAR,
>   BR2_TOOLCHAIN_HAS_THREADS and BR2_USE_MMU), place instead to 'plugins without
>   external deps' section into 'plugins that need external deps' section as it
>   clearly has dependencies (prelimary to upstream commit [2])
>
> - add aes option (AES encryption/decryption plugin)
>
> - disable new option asio (Steinberg Audio Streaming, windows only)
>
> - disable new option gs (Google Cloud Storage, needs storage_client library)
>
> - disable new option ldac (LDAC bluetooth audio codec, needs ldacBT-enc library)
>
> - remove legacy option ofa (disabled)
>
> - disable new option onnx (ONNX neural network, needs libonnxruntime library)
>
> - disable new option isac (iSAC plugin, needs webrtc-audio-coding-1 library)
>
> - removed libmms ('Microsoft Multi Media Server streaming protocol' option,
>   add Config.in.legacy entry
>
> - enable new gpl option ('Allow build plugins that have (A)GPL-licensed
>   dependencies') in case gpl plugin enabled
>
> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b83e85ab677c79b46f520abebd1ee031e3a139c0.patch
> [2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/5d70c168b356691073a0d22f7ce3ea7efb20641c.patch
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  Config.in.legacy                              | 22 ++++++++----
>  ...n-Allow-building-against-neon-0-32-x.patch | 29 ---------------
>  package/gstreamer1/gst1-plugins-bad/Config.in | 31 ++++++++++------
>  .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +--
>  .../gst1-plugins-bad/gst1-plugins-bad.mk      | 36 ++++++++++++++-----
>  5 files changed, 64 insertions(+), 58 deletions(-)
>  delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 34d8c71cc8..2d7f14f097 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,16 @@ endif
>  
>  comment "Legacy options removed in 2022.02"
>  
> +config BR2_PACKAGE_RPI_BT_FIRMWARE
> +	bool "rpi-bt-firmware package was renamed"
> +	depends on BR2_arm || BR2_aarch64
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI
> +	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT
> +	help
> +	  Package rpi-bt-firmware was moved as option to
> +	  package brcmfmac_sdio-firmware-rpi.
> +

This is already in master (and it's unrelated).

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
