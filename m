Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E44C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 505AB83E6B;
	Thu, 16 Dec 2021 19:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivl8YU4t9kPD; Thu, 16 Dec 2021 19:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8468083E22;
	Thu, 16 Dec 2021 19:42:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 765BC1BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D32A40399
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5g8X90AodmBJ for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:42:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D580040017
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:42:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z7so29072028edc.11
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5Hg54ssVvb582s0AubhltFw22BnPk0qX/3e+exM5FTg=;
 b=FFT/Ft1RPO/TPGX35gX6S8h/CG+OObrNsxq7NBNjoXHQshC4l5KMIKKyrfZYbn0rDX
 3I0psndW9pSTeTQ8dDcB1GJBvhGNR76l/KXgOD9smGHhZx8AAKQC7vGrXOwgHaRmjd1L
 m82yTIeS9trOKK/9IHJlUlKNilN0y6NBnh0KWLHo9IS+mqHrNX8KhKt8oPzUzNRn+7F6
 MSG0O8vicw9x/h4vLl959AixUOmHdFfzTwmraVdkAzdiOxyZP0yzKekokUdVTWSyRQRI
 PC1rQghk3hPAhSmaeNrXR8xii7DC/pjfsm8K+XRkGZvxZtRk0/D6CuZzFVmvuJCoXfDn
 252w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5Hg54ssVvb582s0AubhltFw22BnPk0qX/3e+exM5FTg=;
 b=tKJ3k3u6Q0wa+wBXtdOf/dRgSqyljcXqSkR5aBwOxv3dhIju1rvU6GAsQORNJM9hDf
 00X3sq6E6+ZwW1hvhl8hDZ1RTT9l5Sr8wWUQphgdOn1yn3jIWPhFxB+76rvbUxQHCUK1
 RVBHXyRp3i/FUbOLKIJkSSo8owfX+Hr620Kn37x/LDtmVTru/krYTQiO8R+FXaxeBudJ
 757+cJ6dS2DERPdWienzFozGnLVrVQRhpLPxKdeDmOngc+FfsBVj9dJ3ifmHyBMXlA4P
 MlNj/4h5s0MjqDNot5ccQbr3NsraIpLudXW52v1Jhxs41kHVViE8/3mxj6tQiwf+kAu2
 Qw3Q==
X-Gm-Message-State: AOAM531G48wdeuFjOo1jS/dyRHXE1o3TD/cAw89FJ2UjQDXumojJ0LiT
 TFHlGCQ/eQ1fDRMbBiMNjMoJMw==
X-Google-Smtp-Source: ABdhPJyLdKXpl6LkdTQpJYINCKLx1sKIhuU92KplKvWc+rduZ7zIj6LEGEnyK2LFeJtDIdjqNZi64w==
X-Received: by 2002:a17:906:dc8d:: with SMTP id
 cs13mr16877440ejc.323.1639683750889; 
 Thu, 16 Dec 2021 11:42:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id kx3sm2140625ejc.112.2021.12.16.11.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:42:30 -0800 (PST)
Message-ID: <0038a1c7-2fdf-eeb1-981a-160aaf9590fb@mind.be>
Date: Thu, 16 Dec 2021 20:42:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20211215221153.6799-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215221153.6799-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/iputils: bump version to
 20211215
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 23:11, Petr Vorel wrote:
> tftp and traceroute6 has been removed in this release [1][2].
> Due that LICENSE file has been changed.
> 
> Also remove patch from this release.
> 
> [1] https://github.com/iputils/iputils/pull/369
> [2] https://github.com/iputils/iputils/pull/362
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * move options to Config.in.legacy (Fabrice)
> 
>   Config.in.legacy                              |  12 +
>   .../0001-meson-Make-tests-optional.patch      | 218 ------------------
>   package/iputils/Config.in                     |  13 +-
>   package/iputils/iputils.hash                  |   6 +-
>   package/iputils/iputils.mk                    |  22 +-
>   5 files changed, 18 insertions(+), 253 deletions(-)
>   delete mode 100644 package/iputils/0001-meson-Make-tests-optional.patch
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 5c62ffc182..3f5ad9132e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -4395,6 +4395,18 @@ config BR2_TARGET_UBOOT_NETWORK
>   	help
>   	  U-Boot's custom network settings options have been removed.
>   
> +config BR2_PACKAGE_IPUTILS_TFTPD
> +	bool "tftpd"
> +	select BR2_LEGACY
> +	help
> +	  tftpd has been removed from upstream.
> +
> +config BR2_PACKAGE_IPUTILS_TRACEROUTE6
> +	bool "traceroute6"
> +	select BR2_LEGACY
> +	help
> +	  traceroute6 has been removed from upstream.

  These should be in the beginning of the file, under the heading "Legacy 
options removed in 2022.02".

  Applied to master with that fixed, thanks.

  Regards,
  Arnout


> +
>   endmenu
>   
>   endif # !SKIP_LEGACY
> diff --git a/package/iputils/0001-meson-Make-tests-optional.patch b/package/iputils/0001-meson-Make-tests-optional.patch
> deleted file mode 100644
> index e9ed1d77e8..0000000000
> --- a/package/iputils/0001-meson-Make-tests-optional.patch
> +++ /dev/null
> @@ -1,218 +0,0 @@
> -From 3163c49f9f4ad473a00d8a345ee334a028376011 Mon Sep 17 00:00:00 2001
> -From: Heiko Becker <heirecka@exherbo.org>
> -Date: Fri, 23 Jul 2021 16:32:46 +0200
> -Subject: [PATCH] meson: Make tests optional
> -
> -Now can be disabled with -DSKIP_TESTS=true.
> -
> -It allows to avoid meson error during build when ip isn't installed.
> -
> -Closes: #359
> -
> -Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> -Signed-off-by: Heiko Becker <heirecka@exherbo.org>
> -[ pvorel: Rename variable TEST => SKIP_TESTS, default false, adjust
> -the description ]
> -Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> -
> -[Retrieved from:
> -https://github.com/iputils/iputils/commit/3163c49f9f4ad473a00d8a345ee334a028376011]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - meson_options.txt     |  3 ++
> - ping/meson.build      | 84 ++-----------------------------------------
> - ping/test/meson.build | 81 +++++++++++++++++++++++++++++++++++++++++
> - 3 files changed, 86 insertions(+), 82 deletions(-)
> - create mode 100644 ping/test/meson.build
> -
> -diff --git a/meson_options.txt b/meson_options.txt
> -index ac5f5d98..517667f4 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -72,3 +72,6 @@ option('INSTALL_SYSTEMD_UNITS', type: 'boolean', value: false,
> -
> - option('USE_GETTEXT', type: 'boolean', value: true,
> - 	description: 'Enable I18N')
> -+
> -+option('SKIP_TESTS', type: 'boolean', value: false,
> -+	description: 'Skip tests during build')
> -diff --git a/ping/meson.build b/ping/meson.build
> -index 1e678ec8..83ea353c 100644
> ---- a/ping/meson.build
> -+++ b/ping/meson.build
> -@@ -27,86 +27,6 @@ if (setcap_ping)
> - 	)
> - endif
> -
> --##### TESTS #####
> --
> --# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
> --
> --# GitHub CI does not have working IPv6
> --# https://github.com/actions/virtual-environments/issues/668
> --ipv6_dst = []
> --ipv6_switch = []
> --r = run_command('ip', '-6', 'a')
> --if r.stdout().strip().contains('::1')
> --  message('IPv6 enabled')
> --  ipv6_dst = [ '::1' ]
> --  ipv6_switch = [ '-6' ]
> --else
> --  message('WARNING: IPv6 disabled')
> -+if not get_option('SKIP_TESTS')
> -+	subdir('test')
> - endif
> --
> --run_as_root = false
> --r = run_command('id', '-u')
> --if r.stdout().strip().to_int() == 0
> --  message('running as root')
> --  run_as_root = true
> --else
> --  message('running as normal user')
> --endif
> --
> --foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
> --  foreach switch : [ '', '-4' ] + ipv6_switch
> --	args = [ '-c1', dst ]
> --	should_fail = false
> --
> --	if switch != ''
> --	  args = [switch] + args
> --	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
> --		 should_fail = true
> --	  endif
> --	endif
> --
> --	name = 'ping ' + ' '.join(args)
> --	test(name, ping, args : args, should_fail : should_fail)
> --  endforeach
> --endforeach
> --
> --ping_tests_opt = [
> --  [ '-c1' ],
> --  [ '-c5', '-i0.1' ],
> --  [ '-c1', '-I', 'lo' ],
> --  [ '-c1', '-w1' ],
> --  [ '-c1', '-W1' ],
> --  [ '-c1', '-W1.1' ],
> --]
> --foreach dst : [ '127.0.0.1' ] + ipv6_dst
> --  foreach args : ping_tests_opt
> --	args += [ dst ]
> --	name = 'ping ' + ' '.join(args)
> --	test(name, ping, args : args)
> --  endforeach
> --endforeach
> --
> --ping_tests_opt_fail = [
> --  [ '-c1.1' ],
> --  [ '-I', 'nonexisting' ],
> --  [ '-w0.1' ],
> --  [ '-w0,1' ],
> --]
> --foreach dst : [ '127.0.0.1' ] + ipv6_dst
> --  foreach args : ping_tests_opt_fail
> --	args += [ dst ]
> --	name = 'ping ' + ' '.join(args)
> --	test(name, ping, args : args, should_fail : true)
> --  endforeach
> --endforeach
> --
> --ping_tests_user_fail = [
> --  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
> --]
> --foreach dst : [ '127.0.0.1' ] + ipv6_dst
> --  foreach args : ping_tests_user_fail
> --	args += [ dst ]
> --	name = 'ping ' + ' '.join(args)
> --	test(name, ping, args : args, should_fail : not run_as_root)
> --  endforeach
> --endforeach
> -diff --git a/ping/test/meson.build b/ping/test/meson.build
> -new file mode 100644
> -index 00000000..43aed758
> ---- /dev/null
> -+++ b/ping/test/meson.build
> -@@ -0,0 +1,81 @@
> -+# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
> -+
> -+# GitHub CI does not have working IPv6
> -+# https://github.com/actions/virtual-environments/issues/668
> -+ipv6_dst = []
> -+ipv6_switch = []
> -+r = run_command('ip', '-6', 'a')
> -+if r.stdout().strip().contains('::1')
> -+  message('IPv6 enabled')
> -+  ipv6_dst = [ '::1' ]
> -+  ipv6_switch = [ '-6' ]
> -+else
> -+  message('WARNING: IPv6 disabled')
> -+endif
> -+
> -+run_as_root = false
> -+r = run_command('id', '-u')
> -+if r.stdout().strip().to_int() == 0
> -+  message('running as root')
> -+  run_as_root = true
> -+else
> -+  message('running as normal user')
> -+endif
> -+
> -+foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
> -+  foreach switch : [ '', '-4' ] + ipv6_switch
> -+	args = [ '-c1', dst ]
> -+	should_fail = false
> -+
> -+	if switch != ''
> -+	  args = [switch] + args
> -+	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
> -+		 should_fail = true
> -+	  endif
> -+	endif
> -+
> -+	name = 'ping ' + ' '.join(args)
> -+	test(name, ping, args : args, should_fail : should_fail)
> -+  endforeach
> -+endforeach
> -+
> -+ping_tests_opt = [
> -+  [ '-c1' ],
> -+  [ '-c5', '-i0.1' ],
> -+  [ '-c1', '-I', 'lo' ],
> -+  [ '-c1', '-w1' ],
> -+  [ '-c1', '-W1' ],
> -+  [ '-c1', '-W1.1' ],
> -+]
> -+foreach dst : [ '127.0.0.1' ] + ipv6_dst
> -+  foreach args : ping_tests_opt
> -+	args += [ dst ]
> -+	name = 'ping ' + ' '.join(args)
> -+	test(name, ping, args : args)
> -+  endforeach
> -+endforeach
> -+
> -+ping_tests_opt_fail = [
> -+  [ '-c1.1' ],
> -+  [ '-I', 'nonexisting' ],
> -+  [ '-w0.1' ],
> -+  [ '-w0,1' ],
> -+]
> -+foreach dst : [ '127.0.0.1' ] + ipv6_dst
> -+  foreach args : ping_tests_opt_fail
> -+	args += [ dst ]
> -+	name = 'ping ' + ' '.join(args)
> -+	test(name, ping, args : args, should_fail : true)
> -+  endforeach
> -+endforeach
> -+
> -+ping_tests_user_fail = [
> -+  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
> -+]
> -+foreach dst : [ '127.0.0.1' ] + ipv6_dst
> -+  foreach args : ping_tests_user_fail
> -+	args += [ dst ]
> -+	name = 'ping ' + ' '.join(args)
> -+	test(name, ping, args : args, should_fail : not run_as_root)
> -+  endforeach
> -+endforeach
> diff --git a/package/iputils/Config.in b/package/iputils/Config.in
> index 0d4a4ba3f8..1a8b555570 100644
> --- a/package/iputils/Config.in
> +++ b/package/iputils/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_IPUTILS
>   	depends on BR2_USE_MMU # fork()
>   	help
>   	  This package is set of small useful utilities for Linux
> -	  networking. It includes complete versions of ping, traceroute,
> +	  networking. It includes complete versions of ping, arping,
>   	  etc.
>   
>   	  https://github.com/iputils/iputils
> @@ -46,23 +46,12 @@ config BR2_PACKAGE_IPUTILS_RDISC_SERVER
>   	help
>   	  Builds rdisc with server code.
>   
> -config BR2_PACKAGE_IPUTILS_TFTPD
> -	bool "tftpd"
> -	help
> -	  Installs tftpd.
> -
>   config BR2_PACKAGE_IPUTILS_TRACEPATH
>   	bool "tracepath"
>   	default y
>   	help
>   	  Installs tracepath.
>   
> -config BR2_PACKAGE_IPUTILS_TRACEROUTE6
> -	bool "traceroute6"
> -	default y
> -	help
> -	  Installs traceroute6.
> -
>   config BR2_PACKAGE_IPUTILS_NINFOD
>   	bool "ninfod"
>   	default y
> diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
> index 3eafc7ab4e..edfa384d43 100644
> --- a/package/iputils/iputils.hash
> +++ b/package/iputils/iputils.hash
> @@ -1,6 +1,6 @@
> -# https://github.com/iputils/iputils/releases/download/20210722/sha256sum.asc
> -sha256 6d1a44b0682d3d4b64586dbaebe61dd61ae16d6e2f4dc0c43336d0e47a9db323  iputils-20210722.tar.gz
> +# https://github.com/iputils/iputils/releases/download/20211215/sha256sum.asc
> +sha256 b6f67fc705490673ff4471d006221b4a2f1b1180b929d9fefd771352621ccedf  iputils-20211215.tar.gz
>   # Locally computed
> -sha256 b8ea785d12fa6a44916601104dd746216957e93f13a26d3eb858b3b5a4ad66ab  LICENSE
> +sha256 973281334c2da6364fa6bdc44c1f0f8d60d80d73c782982ffc5d53b0a31aa042  LICENSE
>   sha256 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
>   sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/LICENSE.GPL2
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 5721436221..84059de330 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -11,7 +11,7 @@
>   # and IPv6 updates.
>   # http://www.spinics.net/lists/netdev/msg279881.html
>   
> -IPUTILS_VERSION = 20210722
> +IPUTILS_VERSION = 20211215
>   IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
>   IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
>   IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
> @@ -25,7 +25,6 @@ IPUTILS_CONF_OPTS += \
>   	-DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
>   	-DENABLE_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
>   	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
> -	-DBUILD_TRACEROUTE6=$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),true,false) \
>   	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
>   	-DSKIP_TESTS=true
>   
> @@ -34,9 +33,7 @@ IPUTILS_SELINUX_MODULES = \
>   	$(if $(BR2_PACKAGE_IPUTILS_ARPING),netutils) \
>   	$(if $(BR2_PACKAGE_IPUTILS_PING),netutils) \
>   	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils) \
> -	$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),netutils) \
> -	$(if $(BR2_PACKAGE_IPUTILS_RDISC),rdisc) \
> -	$(if $(BR2_PACKAGE_IPUTILS_TFTPD),tftp)
> +	$(if $(BR2_PACKAGE_IPUTILS_RDISC),rdisc)
>   
>   #
>   # arping
> @@ -80,16 +77,6 @@ else
>   IPUTILS_CONF_OPTS += -DBUILD_PING=false
>   endif
>   
> -#
> -# tftpd
> -#
> -ifeq ($(BR2_PACKAGE_IPUTILS_TFTPD),y)
> -IPUTILS_CONF_OPTS += -DBUILD_TFTPD=true
> -
> -else
> -IPUTILS_CONF_OPTS += -DBUILD_TFTPD=false
> -endif
> -
>   # Handle libraries
>   ifeq ($(BR2_PACKAGE_LIBCAP),y)
>   IPUTILS_CONF_OPTS += -DUSE_CAP=true
> @@ -130,9 +117,6 @@ define IPUTILS_PERMISSIONS
>   	$(if $(BR2_PACKAGE_IPUTILS_PING),\
>   		/bin/ping             f 755 0 0 - - - - -
>   		|xattr cap_net_raw+p,)
> -	$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),\
> -		/usr/bin/traceroute6  f 755 0 0 - - - - -
> -		|xattr cap_net_raw+p,)
>   endef
>   else
>   define IPUTILS_PERMISSIONS
> @@ -142,8 +126,6 @@ define IPUTILS_PERMISSIONS
>   		/usr/bin/clockdiff    f 4755 0 0 - - - - -,)
>   	$(if $(BR2_PACKAGE_IPUTILS_PING),\
>   		/bin/ping             f 4755 0 0 - - - - -,)
> -	$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),\
> -		/usr/bin/traceroute6  f 4755 0 0 - - - - -,)
>   endef
>   endif
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
