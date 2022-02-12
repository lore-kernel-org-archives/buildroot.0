Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81303C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 14:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32BF361B8E;
	Sat, 12 Feb 2022 14:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enuHGF3CSdui; Sat, 12 Feb 2022 14:44:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47D8D60BBF;
	Sat, 12 Feb 2022 14:44:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFA191BF5A1
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDDAD81464
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvOmnDwcj8jL for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 14:44:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A65178148B
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:44:30 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id fy20so28322538ejc.0
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 06:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=9ashOtdynvqi+Vujx2CJ03HtLMcfLgeEU1OQT/avkDo=;
 b=KRFw8Wqzf9JuY5JY+ggB2+YXyCIDXCeL/Y8s3lMxFtZ6BfSj7tBJk0u0FhO1KPq90C
 gDAsKNLaS8FJeFGe8twouVAaFyUbQjCXrpnwL4uxYReSV3MrMgCjTc4/nnH4iDqfYtlG
 FBuhOWJAjbnhhQlU5b1uYOehidDzINhDhVGCnGAXxtCqwBzEkzAdCnsiXLHO5Y+HyYZe
 vWOJTMcwkXuuadX/5hNcprDFqWNvFPolsLovaqKP9FWxXEYpzM6eZzBW8OxTo2hzOkaH
 3X/wPI0d4JxdNzltO3F2UpMVmNkAxVgXBSRf7X/4XrE4yi7sJ5MKbCXEYyDqzNJMfpQV
 Z2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9ashOtdynvqi+Vujx2CJ03HtLMcfLgeEU1OQT/avkDo=;
 b=Zzq9a7J0co3janQejduWPR257Y2kjFuQWVduoR9CYxBT77AFaoMePm2ZfwPyv6BRLI
 qB3yXf6Zg7v535gnV87TPn+n1h9Fw/C3FGgDM2xGrEySjoel0uZp+wY/voTBPwf8hCAs
 4ZqS2sYCN5YueiGZ8Z/QWhk/5mznoWD9c5UbssQ1IUj99BzziK2GodAdHh08lNyEm6VD
 tH0NrBeB4f3/3lU6XHYxJz8BDRw9bcEXmUF2jehHHqtGS1O0FP0zNV0BH3ExtQiI8PYL
 NR+6Yx/nrbMUvu9e8IUlvUx5XjtaE3hcyj6XAoUfylElQFgDGnfGhiKh3dH7qp4zojqK
 L2nQ==
X-Gm-Message-State: AOAM531F+Y+3DiMqGq13+MHWvHE5/62ffwNJnLL2hEei4eDc24GQ2Kzh
 d8QBjWBFocVF6N/S+SnRb7irMHeizs5JQw==
X-Google-Smtp-Source: ABdhPJx56qiH8OsKrd6L6ItbVoVMVWEvpFROW+BKvnNcEW0Sc4IKYakeItbsCbR8Fm39K4SZQOzuYg==
X-Received: by 2002:a17:907:c26:: with SMTP id
 ga38mr5030417ejc.626.1644677068909; 
 Sat, 12 Feb 2022 06:44:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s1sm12546682edt.49.2022.02.12.06.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 06:44:28 -0800 (PST)
Message-ID: <aaa52707-547b-e8fa-4178-6f1419244f50@mind.be>
Date: Sat, 12 Feb 2022 15:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB0493DF9BFD49D3072CFE03A19F229@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <VI1P190MB0493DF9BFD49D3072CFE03A19F229@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] [PATCH] package/dbus-cxx: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/01/2022 12:12, Lang Daniel via buildroot wrote:
> DBus-cxx provides an object-oriented interface to DBus
> 
> Signed-off-by: Lang Daniel <d.lang@abatec.at>

  Applied to master, thanks. I made some changes though.

> ---
>   DEVELOPERS                                    |  1 +
>   package/Config.in                             |  1 +
>   .../0001-gcc11-include-typeinfo.patch         | 29 ++++++
>   .../0002-cmake-improve-include-paths.patch    | 91 +++++++++++++++++++
>   package/dbus-cxx/0003-sasl-use-uid_t.patch    | 41 +++++++++
>   package/dbus-cxx/Config.in                    | 40 ++++++++
>   package/dbus-cxx/dbus-cxx.hash                |  5 +
>   package/dbus-cxx/dbus-cxx.mk                  | 28 ++++++
>   8 files changed, 236 insertions(+)
>   create mode 100644 package/dbus-cxx/0001-gcc11-include-typeinfo.patch
>   create mode 100644 package/dbus-cxx/0002-cmake-improve-include-paths.patch
>   create mode 100644 package/dbus-cxx/0003-sasl-use-uid_t.patch
>   create mode 100644 package/dbus-cxx/Config.in
>   create mode 100644 package/dbus-cxx/dbus-cxx.hash
>   create mode 100644 package/dbus-cxx/dbus-cxx.mk
> 
[snip]
> diff --git a/package/dbus-cxx/Config.in b/package/dbus-cxx/Config.in
> new file mode 100644
> index 0000000000..49f0f2237e
> --- /dev/null
> +++ b/package/dbus-cxx/Config.in
> @@ -0,0 +1,40 @@
> +config BR2_PACKAGE_DBUS_CXX
> +	bool "dbus-cxx"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_PACKAGE_DBUS # runtime dependency

  I converted this into a "select". Normally you'd say that obviously this 
package is only relevant if you have dbus, but it's very well possible that some 
other package has a non-optional dependency on dbus-cxx and you want to use that 
in a context where you don't actually need dbus for anything else. So select is 
more appropriate.

> +	select BR2_PACKAGE_LIBSIGC
> +	help
> +	  DBus-cxx is a C++ implementation for DBus. DBus is a
> +	  Linux-specific RPC (remote procedure call) and
> +	  IPC (inter-process communications) mechanism.
> +	  DBus-cxx provides an object-oriented view of all programs
> +	  on the DBus, and allows an object-oriented way of
> +	  exporting methods onto the DBus.
> +
> +	  https://dbus-cxx.github.io/
> +
> +if BR2_PACKAGE_DBUS_CXX
> +
> +config BR2_PACKAGE_DBUS_CXX_QT
> +	bool "Qt support"
> +	depends on BR2_PACKAGE_QT5

  I've made these automatic dependencies instead of explicit options. I assume 
that the overhead of them is fairly small.

> +
> +comment "Qt support needs Qt5"
> +	depends on !BR2_PACKAGE_QT5
> +
> +config BR2_PACKAGE_DBUS_CXX_GLIB
> +	bool "Glib support"
> +	depends on BR2_PACKAGE_LIBGLIB2
> +
> +comment "Glib support needs libglib2"
> +	depends on !BR2_PACKAGE_LIBGLIB2
> +
> +endif
> +
> +comment "dbus-cxx needs a toolchain w/ C++, threads, gcc >= 7 and dynamic library support"
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
> diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
> new file mode 100644
> index 0000000000..907de1866f
> --- /dev/null
> +++ b/package/dbus-cxx/dbus-cxx.hash
> @@ -0,0 +1,5 @@
> +# Locally computed:
> +sha256  05c4f4750261f09819564bb8ee93b5d7f56fd05bbcd755858860fa6697d09c2a  dbus-cxx-2.1.0.tar.gz
> +sha256  e85e018c8ee7d4f439b097289bf4371f6fcfec24e89f3e77c422944501bc383d  COPYING
> +sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
> +sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
> diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
> new file mode 100644
> index 0000000000..e184ef48ef
> --- /dev/null
> +++ b/package/dbus-cxx/dbus-cxx.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# dbus-cxx
> +#
> +################################################################################
> +
> +DBUS_CXX_VERSION = 2.1.0
> +DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
> +DBUS_CXX_LICENSE = Boost license (cmake-modules), Apache 2.0 (libcppgenerate), GPL-3.0

  I put GPL-3.0 at the beginning. It's not a very strict convention, but it 
seems obvious that the "main" license should be first.

  Regards,
  Arnout

> +DBUS_CXX_LICENSE_FILES = cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE COPYING
> +DBUS_CXX_INSTALL_STAGING = YES
> +DBUS_CXX_DEPENDENCIES = libsigc
> +
> +ifeq ($(BR2_PACKAGE_DBUS_CXX_QT),y)
> +DBUS_CXX_CONF_OPTS += -DENABLE_QT_SUPPORT=ON
> +DBUS_CXX_DEPENDENCIES += qt5base
> +else
> +DBUS_CXX_CONF_OPTS += -DENABLE_QT_SUPPORT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DBUS_CXX_GLIB),y)
> +DBUS_CXX_CONF_OPTS += -DENABLE_GLIB_SUPPORT=ON
> +DBUS_CXX_DEPENDENCIES += libglib2
> +else
> +DBUS_CXX_CONF_OPTS += -DENABLE_GLIB_SUPPORT=OFF
> +endif
> +
> +$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
