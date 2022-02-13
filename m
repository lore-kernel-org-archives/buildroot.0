Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19197C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8A08403A4;
	Sun, 13 Feb 2022 15:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ew7Nsg5uazg1; Sun, 13 Feb 2022 15:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF8814049D;
	Sun, 13 Feb 2022 15:25:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 772B61BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66AE94018B
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vf7m0G1R4Mj1 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:24:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B840400F5
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:24:23 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z21so2363868edb.13
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QcZ5wDH7KUF8eybLCM1dsK035Qd0qbZG0aZYyJcpb2M=;
 b=Kb7jHZAUqULGYUPhTKAFIbVqHRVmInc8/Cqlah0kkn9aebs9GwHPFr01H12csTE9q+
 wXNmUjARSojXdMUyUQpMSffTxH0em5stLk3Tg0lXFyYMUXDfFcbLJooTpZvVjprJjHYB
 cfLXMZ8222c5eWETFR8py7xRLafa9aa2tSENcPcCcTAB+KD8Gv8IoNPoqkm7sS6tdbQc
 chLRfKPVMAO/xwe3qtsJyzvX46xjfKSFR54uEp32A6DCNx2XLtZPE2Topx2Xw5YkR5j4
 nthEEShXfwi9kImSZg6qd+ZCzy8JctyxuLOJYzd45YLD4Bb1ziR2oIuQnayjlrbOd8wq
 VwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QcZ5wDH7KUF8eybLCM1dsK035Qd0qbZG0aZYyJcpb2M=;
 b=Ircix7OrWRD6fGk0KBpAPk/3Yd1AUTfNx6tyQmlITbjzrbLCFbc9ta6iptD09QlvGG
 9JROi+Z7uu2TWHYrvmUgn3R/0VZSIy30d0EQb3z6pxlB4tZQemk59INyESh/NPOtYPAr
 aPUxixJoxQc+BClspGP24pVbg8P3c03lREQrfX5/Lue02Qd6O4Bm/sSQVrkrTZG0eUFQ
 PGIAs913xsqGSIZLz9+HC1K0bhEc+NJ8+k2CTOBnF4ULqlHTQUXMmlKEmY0TSB7cUzsC
 +LTxnuN1C2UyCr4QqCvmyzpu3+BNV2U4cXbPsTTP91ETQdalCACm2FI5YPwzss+RENgE
 K+lA==
X-Gm-Message-State: AOAM533YRcz4xsAVsWZx4Nfxu2QQeDlcSdgSutNFFjwa3F17gHV4ZpMm
 jkCN19HB3UShpsYaVVcSE7EcvA==
X-Google-Smtp-Source: ABdhPJyCfFUK9AQltG7MvwtaYb+OVa0cPFmblMpS/2jBLrXUm68MKEeFH9+5QinEZAq1bOaARYddFQ==
X-Received: by 2002:a05:6402:5c9:: with SMTP id
 n9mr11465995edx.419.1644765861594; 
 Sun, 13 Feb 2022 07:24:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bh3sm9154753ejb.102.2022.02.13.07.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:24:21 -0800 (PST)
Message-ID: <468a9439-90fd-76bf-1dbe-ad64d0771603@mind.be>
Date: Sun, 13 Feb 2022 16:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220205230302.3837382-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220205230302.3837382-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/wayland-protocols: bump to
 version 1.25
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 00:03, James Hilliard wrote:
> Drop patch that is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   ...and-scanner-is-only-needed-for-tests.patch | 42 -------------------
>   .../wayland-protocols/wayland-protocols.hash  |  8 ++--
>   .../wayland-protocols/wayland-protocols.mk    |  2 +-
>   3 files changed, 5 insertions(+), 47 deletions(-)
>   delete mode 100644 package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
> 
> diff --git a/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch b/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
> deleted file mode 100644
> index ff3ec5719c..0000000000
> --- a/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 80e97bd00bf6263845aa98b411507baba28be67e Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 19 Sep 2021 11:01:00 +0200
> -Subject: [PATCH] meson.build: wayland-scanner is only needed for tests
> -
> -wayland-scanner is only needed for tests so don't require it if tests
> -are disabled
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://gitlab.freedesktop.org/wayland/wayland-protocols/-/commit/80e97bd00bf6263845aa98b411507baba28be67e]
> ----
> - meson.build       | 2 --
> - tests/meson.build | 1 +
> - 2 files changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 94b49e7..15dbc37 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -8,8 +8,6 @@ wayland_protocols_version = meson.project_version()
> -
> - fs = import('fs')
> -
> --dep_scanner = dependency('wayland-scanner', native: true)
> --
> - stable_protocols = [
> - 	'presentation-time',
> - 	'viewporter',
> -diff --git a/tests/meson.build b/tests/meson.build
> -index 66337e7..74824ae 100644
> ---- a/tests/meson.build
> -+++ b/tests/meson.build
> -@@ -1,4 +1,5 @@
> - prog_scan_sh = find_program('scan.sh')
> -+dep_scanner = dependency('wayland-scanner', native: true)
> - prog_scanner = find_program(dep_scanner.get_pkgconfig_variable('wayland_scanner'))
> -
> - libwayland = [
> ---
> -GitLab
> -
> diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
> index b76bafb437..1262f0f9d7 100644
> --- a/package/wayland-protocols/wayland-protocols.hash
> +++ b/package/wayland-protocols/wayland-protocols.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html
> -md5  31a6c469718db37d2688109e548506e4  wayland-protocols-1.23.tar.xz
> -sha1  8c4ebdce35953b1e2af458c139a432a308af6f50  wayland-protocols-1.23.tar.xz
> -sha256  6c0af1915f96f615927a6270d025bd973ff1c58e521e4ca1fc9abfc914633f76  wayland-protocols-1.23.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2022-January/042102.html
> +md5  0c192bf32de09ec30de4a82d1c65329c  wayland-protocols-1.25.tar.xz
> +sha1  275298332d124e40e345aa82bc8f48ef8cad3480  wayland-protocols-1.25.tar.xz
> +sha256  f1ff0f7199d0a0da337217dd8c99979967808dc37731a1e759e822b75b571460  wayland-protocols-1.25.tar.xz
>   sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
> diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
> index 41ab1e1c99..746d82e308 100644
> --- a/package/wayland-protocols/wayland-protocols.mk
> +++ b/package/wayland-protocols/wayland-protocols.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WAYLAND_PROTOCOLS_VERSION = 1.23
> +WAYLAND_PROTOCOLS_VERSION = 1.25
>   WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
>   WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
>   WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
