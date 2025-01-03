Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818BEE77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 10:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEA5D6058B;
	Fri,  3 Jan 2025 10:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6UIBvU8yduk; Fri,  3 Jan 2025 10:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE116071C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE116071C;
	Fri,  3 Jan 2025 10:30:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 629AFAF0
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 10:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48A9240481
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 10:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBSckQFwGsBO for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 10:30:29 +0000 (UTC)
X-Greylist: delayed 525 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 03 Jan 2025 10:30:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0977402E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0977402E0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0977402E0
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 10:30:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA67B316;
 Fri,  3 Jan 2025 11:20:50 +0100 (CET)
MIME-Version: 1.0
In-Reply-To: <20241226121314.661260-1-ju.o@free.fr>
References: <20241226121314.661260-1-ju.o@free.fr>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Julien Olivain <ju.o@free.fr>
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Date: Fri, 03 Jan 2025 10:21:37 +0000
Message-ID: <173589969721.3979975.16309412332382719634@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1735899651;
 bh=N7HG55wI2BigIdSe+3a44WJjVLKaSvHrPnDsyGGI6Yg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BoXu+SD5nOsSqTeFZUBJQF+/2TK4JFVPNpxO+HVLZ+IQc3qROrqMGlZ/uj3sjBrZZ
 8cwEdz8YeoYFZPNp2FJJafvf2IUjI1mWh4puY4bLjS7krtTMeNIvguLIgP+SfERPI+
 xnMCouQmjzt41F7jRAufJQAurSL8Ar3Dr9/S7Llk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=BoXu+SD5
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: bump to version 0.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Julien Olivain (2024-12-26 12:13:14)
> For change log since 0.3.2, see:
> https://git.libcamera.org/libcamera/libcamera.git/tag/?h=v0.4.0
> 
> libcamera dropped the gcc 8 support in [1] and increased the minimal
> version to 9. This commit updates that requirement in the package
> Config.in and in reverse dependency (in libcamera-apps).
> 
> This commit also updates the libcamera runtime test to the new format
> of the "cam --list-properties" output.
> 
> [1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=9f513439b6896d1a33c91a400bd02b7b8829feb6
> 
> Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> compilation: https://gitlab.com/jolivain/buildroot/-/pipelines/1603076681
> runtime: https://gitlab.com/jolivain/buildroot/-/jobs/8725706819
> 
> Compilation also tested with pipewire and libcamera-apps.
> ---
>  package/libcamera-apps/Config.in                | 2 +-
>  package/libcamera/Config.in                     | 2 +-
>  package/libcamera/libcamera.hash                | 2 +-
>  package/libcamera/libcamera.mk                  | 2 +-
>  support/testing/tests/package/test_libcamera.py | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
> index f169d8c52e..fa41d1be2d 100644
> --- a/package/libcamera-apps/Config.in
> +++ b/package/libcamera-apps/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
>         depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
>         depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
> -       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libcamera
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # libcamera
>         depends on !BR2_STATIC_LIBS # gnutls/libcamera
>         depends on BR2_USE_WCHAR # gnutls/libcamera/boost
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 4699e382c7..1df97edc41 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -9,7 +9,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
>         depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_HAS_THREADS
> -       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
>         depends on !BR2_STATIC_LIBS # gnutls
>         depends on BR2_USE_WCHAR # gnutls
>         select BR2_PACKAGE_GNUTLS
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index d4554af190..8c845d0e21 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  d396bebe49aa7f605403594be3a9e970173d4c98061033c75f816946ff907eb8  libcamera-v0.3.2-git4.tar.gz
> +sha256  0b45861dc0430074bf10aaa78a69439b319e9df4ed041496fd5f95e546c8f575  libcamera-v0.4.0-git4.tar.gz
>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 3367eb60b2..dcfa54e5dd 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = v0.3.2
> +LIBCAMERA_VERSION = v0.4.0
>  LIBCAMERA_SITE_METHOD = git

As buildroot is only creating a tar.gz from this anyway, we do have
server generated tar balls on freedesktop now if that's useful.

https://gitlab.freedesktop.org/camera/libcamera/-/archive/v0.4.0/libcamera-v0.4.0.tar.gz

But the above is still fine of course...

>  LIBCAMERA_DEPENDENCIES = \
>         host-openssl \
> diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
> index 8953021b82..91df427b6f 100644
> --- a/support/testing/tests/package/test_libcamera.py
> +++ b/support/testing/tests/package/test_libcamera.py
> @@ -64,7 +64,7 @@ class TestLibCamera(infra.basetest.BRTest):
>          cmd = f"cam --camera {cam_idx} --list-controls"
>          out, ret = self.emulator.run(cmd)
>          self.assertEqual(ret, 0)
> -        self.assertIn("Control: Brightness:", "\n".join(out))
> +        self.assertIn("Control: [inout] libcamera::Brightness:", "\n".join(out))

Oh - I didn't know about these tests in here. Thanks for the highlight.

But for the patch, indeed:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>  
>          # List the camera properties and check we have a camera
>          # "Model" property.
> -- 
> 2.47.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
