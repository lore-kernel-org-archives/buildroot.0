Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF47BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7693860B8F;
	Tue,  4 Jan 2022 18:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xRjDDU7m8X_f; Tue,  4 Jan 2022 18:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D9C360D6B;
	Tue,  4 Jan 2022 18:30:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34B1C1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30BD3827C5
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TW3QvHO3A7dJ for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:30:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1476D8268F
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:30:44 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id m21so153088489edc.0
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bdHsKzju61ySZH5PGgQo98YId0UHOJCGlmLgb1pJ9Dk=;
 b=g/CHmccafn49aljq/ooq2wOm6xBUyPafw0ArrPnPGKnkc4bc3r+KMW1l1sHlouB5kv
 6gZX7E+52idToLkMh9SUa3N0uL60b/C7+oK8pZ4qnm0M89tH8CZl04seSUyfa40Z6JHC
 0vU//6CsneywymcLoSYxxdEtNbO8TlBj9mhkUTHYJNXrzVAA7mSOnc+LUuETR8oJzvzG
 lAt0zt/JQxtsKF0dhDz81WhrQwu5vB0LEFMrcKvk7BI+dbtn9zMeX3iHGmxuNO2zPgtn
 9z3+xIH064dH7yRps3sg8YMRjw+Vp77v6pT+O7XodgYJ9MHjZbm+iO9QE8onh0Mw/ulS
 WtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bdHsKzju61ySZH5PGgQo98YId0UHOJCGlmLgb1pJ9Dk=;
 b=GPlXIT0mETDQpgq5ZLHisoc8fRqZE47txp3vxbAlM/ekY9dW2GvDw5b/hh1TpbITZF
 D7z37hEBsYWrJpLxihl2onKD7phHQT/Rsuzrzu7WkiVNj6WEqPMe0xyzUIYKcnNJAjCb
 HK9QYtK3zKtMguCC5Anqb5w+a8AzLz5tIg4SuNkG750hkpSgoHgofWeZKuyIS2gLLms5
 V3t/qcI6AEGUHKkn6mJo8sxljcRPAb99sI1Fg/YCFaXeOy2gYgXtwaHTkTnyRVZR7jkD
 9dZievE4qvAls2f70QC5TVZocCYLJSHblNaMARCzcPRAdU4WftLbF/67+Ig5VPqWKjfy
 4DqA==
X-Gm-Message-State: AOAM531qoPdKg2wfq+6qjiWt1pMd3d49J1skq0Mm4RWZ0sF0xhGkiJgk
 lXDaR0KbAwvPI9bRkiqejHo+5g==
X-Google-Smtp-Source: ABdhPJzoD2XZBTIsXrCc16ML7FEse6y3VgWugSiMmW4fex7qHJEEHTCWbLsPsp7QkcolGYwhGB8nxg==
X-Received: by 2002:a17:907:629a:: with SMTP id
 nd26mr41787157ejc.680.1641321042237; 
 Tue, 04 Jan 2022 10:30:42 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b10sm14941620ede.52.2022.01.04.10.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:30:41 -0800 (PST)
Message-ID: <6812e29d-ecb5-fd13-53fc-828ec21bde82@mind.be>
Date: Tue, 4 Jan 2022 19:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220104181757.3207568-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220104181757.3207568-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-rgb-led-matrix: bump to
 version a56338db0f003d5236f2ce98c73a591d64a70852
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
Cc: Grzegorz Blach <grzegorz@blach.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/01/2022 19:17, Fabrice Fontaine wrote:
> - Drop patch (already in version)
> - This bump will also fix the following build failure on musl raised
>    since the addition of the package in commit
>    e821078031e14df69e5142f23e9cb7b5a1ea0e77:
> 
> text-scroller.cc: In function 'int main(int, char**)':
> text-scroller.cc:220:3: error: 'uint' was not declared in this scope; did you mean 'rint'?
>    220 |   uint frame_counter = 0;
>        |   ^~~~
>        |   rint
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1a230bd46eac35081bdb6fe9aaacbb7b62ea6b73
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch  | 46 -------------------
>   .../rpi-rgb-led-matrix.hash                   |  2 +-
>   .../rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk  |  2 +-
>   3 files changed, 2 insertions(+), 48 deletions(-)
>   delete mode 100644 package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch
> 
> diff --git a/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch b/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch
> deleted file mode 100644
> index f7a92f5fb2..0000000000
> --- a/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 056a189836a82b832cd8e6f886cb2090344bfa08 Mon Sep 17 00:00:00 2001
> -From: Grzegorz Blach <grzegorz@blach.pl>
> -Date: Sat, 29 Aug 2020 20:48:57 +0200
> -Subject: [PATCH] Rename LDFLAGS to RGB_LDFLAGS.
> -
> -This change allows additional flags to be added to the linker
> -from the command line.
> -
> -Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ----
> - utils/Makefile | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/utils/Makefile b/utils/Makefile
> -index e751adc..e704442 100644
> ---- a/utils/Makefile
> -+++ b/utils/Makefile
> -@@ -12,7 +12,7 @@ RGB_INCDIR=$(RGB_LIB_DISTRIBUTION)/include
> - RGB_LIBDIR=$(RGB_LIB_DISTRIBUTION)/lib
> - RGB_LIBRARY_NAME=rgbmatrix
> - RGB_LIBRARY=$(RGB_LIBDIR)/lib$(RGB_LIBRARY_NAME).a
> --LDFLAGS+=-L$(RGB_LIBDIR) -l$(RGB_LIBRARY_NAME) -lrt -lm -lpthread
> -+RGB_LDFLAGS+=-L$(RGB_LIBDIR) -l$(RGB_LIBRARY_NAME) -lrt -lm -lpthread
> -
> - # Imagemagic flags, only needed if actually compiled.
> - MAGICK_CXXFLAGS?=$(shell GraphicsMagick++-config --cppflags --cxxflags)
> -@@ -28,13 +28,13 @@ $(RGB_LIBRARY): FORCE
> - 	$(MAKE) -C $(RGB_LIBDIR)
> -
> - text-scroller: text-scroller.o $(RGB_LIBRARY)
> --	$(CXX) $(CXXFLAGS) text-scroller.o -o $@ $(LDFLAGS)
> -+	$(CXX) $(CXXFLAGS) text-scroller.o -o $@ $(LDFLAGS) $(RGB_LDFLAGS)
> -
> - led-image-viewer: led-image-viewer.o $(RGB_LIBRARY)
> --	$(CXX) $(CXXFLAGS) led-image-viewer.o -o $@ $(LDFLAGS) $(MAGICK_LDFLAGS)
> -+	$(CXX) $(CXXFLAGS) led-image-viewer.o -o $@ $(LDFLAGS) $(RGB_LDFLAGS) $(MAGICK_LDFLAGS)
> -
> - video-viewer: video-viewer.o $(RGB_LIBRARY)
> --	$(CXX) $(CXXFLAGS) video-viewer.o -o $@ $(LDFLAGS) $(AV_LDFLAGS)
> -+	$(CXX) $(CXXFLAGS) video-viewer.o -o $@ $(LDFLAGS) $(RGB_LDFLAGS) $(AV_LDFLAGS)
> -
> - %.o : %.cc
> - 	$(CXX) -I$(RGB_INCDIR) $(CXXFLAGS) -c -o $@ $<
> ---
> -2.24.3 (Apple Git-128)
> -
> diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
> index 3b1cb5fd76..265e4c4249 100644
> --- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
> +++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  5efc0293bb180b958079910e968721ff2dac291c435d065ecec9ceba8589567d  rpi-rgb-led-matrix-63e3e7ffdbe88223cc80e1faa508bc4f3cf2bea4.tar.gz
> +sha256  490ca6fa0c81451f2472b4aa85796a876790f2e212bf0882e3bb7caf5c47e2c3  rpi-rgb-led-matrix-a56338db0f003d5236f2ce98c73a591d64a70852.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> index e436755121..499fb408c2 100644
> --- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> +++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RPI_RGB_LED_MATRIX_VERSION = 63e3e7ffdbe88223cc80e1faa508bc4f3cf2bea4
> +RPI_RGB_LED_MATRIX_VERSION = a56338db0f003d5236f2ce98c73a591d64a70852
>   RPI_RGB_LED_MATRIX_SITE = $(call github,hzeller,rpi-rgb-led-matrix,$(RPI_RGB_LED_MATRIX_VERSION))
>   RPI_RGB_LED_MATRIX_LICENSE = GPL-2.0
>   RPI_RGB_LED_MATRIX_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
