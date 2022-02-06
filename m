Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9F8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 19:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B12D40210;
	Sun,  6 Feb 2022 19:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMLtbEAAIVkl; Sun,  6 Feb 2022 19:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 958FE40204;
	Sun,  6 Feb 2022 19:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F21A1BF384
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4830B8001C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86UZiT7v7K3w for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 19:23:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2ADC0817A7
 for <buildroot@busybox.net>; Sun,  6 Feb 2022 19:23:27 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id h7so36050683ejf.1
 for <buildroot@busybox.net>; Sun, 06 Feb 2022 11:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=9m7VE306UQ9BPwboXu2rGW7k9n04HuWJUFIybD4rK90=;
 b=cKIEQ9VUEWBGw2VwILdf2m9jV8DZuB2pRAKr7oWVIXpuq/ZKwj9swFHyVm2FzOV/6w
 PJYDIlzark9YC3t4X3uiGKHTB1Icahc2AwprlDi3JclvKjoOam2BIjUKjnYCz1b1Op1z
 z9+PxAVH2xu6uELZe4EjBApMJQu68Ql52YsgEFVgfehmQjhxwoovwMhVcOioHsH+gJaR
 CI52gNv6gOxTDfUDus3a6WNQ/uWFxCZmrehYCvVIfebb4vZ9u2CKQtEPFSas2lp2M4wu
 X293yZ1ZXnxY8Fqrusfrkk+XPPbwiu6MlSg0DWmQD9SSAqOCC71kt1joskRpXNmE8892
 4Q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9m7VE306UQ9BPwboXu2rGW7k9n04HuWJUFIybD4rK90=;
 b=qM20VZ44UL07tzXcABYrQ3OTBaogj4+Uhv8FpQMrKEuyPT06l3YUpxfWdi/F+YCAH/
 pGocd1z5Dync/F+FN/htHLm/W0uYllMu/r4AIHaJpXf8PWrlN0ua1ETLyBidRlXkrVBp
 ZaXIBgwsfvLj7swHQaNz19wc9qo3BPIcArgnYaVE62MaDmZuk8bgfPv3epx9290Rb859
 NiFA0fPNf0ZrX9HJlnKgZ7vHx6AgEncFh5r8a+3N+Nm5vfexvqW5nFAF6yoTkj4mNSFU
 i4i8+URMDGLkTr0wJhM6SR51C0kt1F+LTC//K32tpdZdOvCJus8/9hiDqsg+TKUV+ww8
 7RDQ==
X-Gm-Message-State: AOAM5305rYbFPlrq98ZRh6udkWzhUddvVPqBOAP/6ObYjI7tKoyxmfaV
 SKZTqzsJWfNqLXiNzamjr7O8vg==
X-Google-Smtp-Source: ABdhPJxWotC3Te/CaZeDe33P6em31PQ7QzRoNTLG5RhmfToyX4QOtdnquVXJ+xWtmwhSxmyWadOhuw==
X-Received: by 2002:a17:907:91c1:: with SMTP id
 h1mr6564145ejz.232.1644175405190; 
 Sun, 06 Feb 2022 11:23:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j12sm2108365edp.56.2022.02.06.11.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 11:23:24 -0800 (PST)
Message-ID: <0a0771a9-43f2-0f10-5706-5beddf124a06@mind.be>
Date: Sun, 6 Feb 2022 20:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210321154903.1950636-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210321154903.1950636-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/lua-cffi: new package
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



On 21/03/2021 16:49, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/Config.in                              |  1 +
>   package/lua-cffi/Config.in                     | 18 ++++++++++++++++++
>   package/lua-cffi/lua-cffi.hash                 |  3 +++
>   package/lua-cffi/lua-cffi.mk                   | 14 ++++++++++++++
>   support/testing/tests/package/test_lua_cffi.py | 14 ++++++++++++++
>   5 files changed, 50 insertions(+)
>   create mode 100644 package/lua-cffi/Config.in
>   create mode 100644 package/lua-cffi/lua-cffi.hash
>   create mode 100644 package/lua-cffi/lua-cffi.mk
>   create mode 100644 support/testing/tests/package/test_lua_cffi.py
> 
> diff --git a/package/Config.in b/package/Config.in
> index 8fb173540..5b854f898 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -652,6 +652,7 @@ menu "Lua libraries/modules"
>   	source "package/lua-basexx/Config.in"
>   	source "package/lua-binaryheap/Config.in"
>   	source "package/lua-bit32/Config.in"
> +	source "package/lua-cffi/Config.in"
>   	source "package/lua-cjson/Config.in"
>   	source "package/lua-coat/Config.in"
>   	source "package/lua-coatpersistent/Config.in"
> diff --git a/package/lua-cffi/Config.in b/package/lua-cffi/Config.in
> new file mode 100644
> index 000000000..fcf3d25e2
> --- /dev/null
> +++ b/package/lua-cffi/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_LUA_CFFI
> +	bool "lua-cffi"
> +	depends on !BR2_PACKAGE_LUAJIT
> +	depends on BR2_TOOLCHAIN_HAS_THREADS  # libffi
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_LIBFFI
> +	help
> +	  This is a portable C FFI for Lua, based on libffi and aiming
> +	  to be mostly compatible with LuaJIT FFI, but written from
> +	  scratch.
> +
> +	  https://github.com/q66/cffi-lua
> +
> +comment "lua-cffi needs a toolchain w/ C++, gcc >= 4.8, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || \

  You should have copied the dependency on !luajit here, otherwise the comment 
appears when it can't be selected anyway.


  Applied to master with that fixed, thanks.

  Regards,
  Arnout

> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/lua-cffi/lua-cffi.hash b/package/lua-cffi/lua-cffi.hash
> new file mode 100644
> index 000000000..a532c6c7b
> --- /dev/null
> +++ b/package/lua-cffi/lua-cffi.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  c30080d6309167f86d1a96d3ee33f33ef52e884052b7feac140b8c52db10ad7a  lua-cffi-0.2.1.tar.gz
> +sha256  f5653a4d5864a3920ea1e07dacfd646067314be647598f0acaaf685beaa2e396  COPYING.md
> diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
> new file mode 100644
> index 000000000..07d84ad5f
> --- /dev/null
> +++ b/package/lua-cffi/lua-cffi.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# lua-cffi
> +#
> +################################################################################
> +
> +LUA_CFFI_VERSION=0.2.1
> +LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
> +LUA_CFFI_LICENSE = MIT
> +LUA_CFFI_LICENSE_FILES = COPYING.md
> +
> +LUA_CFFI_DEPENDENCIES = libffi lua
> +
> +$(eval $(meson-package))
> diff --git a/support/testing/tests/package/test_lua_cffi.py b/support/testing/tests/package/test_lua_cffi.py
> new file mode 100644
> index 000000000..7f56eef56
> --- /dev/null
> +++ b/support/testing/tests/package/test_lua_cffi.py
> @@ -0,0 +1,14 @@
> +from tests.package.test_lua import TestLuaBase
> +
> +
> +class TestLuaLuaCffi(TestLuaBase):
> +    config = TestLuaBase.config + \
> +        """
> +        BR2_PACKAGE_LUA=y
> +        BR2_PACKAGE_LUA_CFFI=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("cffi")
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
