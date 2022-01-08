Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D66C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C4A813EB;
	Sat,  8 Jan 2022 17:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZsrOxeLOJvq; Sat,  8 Jan 2022 17:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC2458151E;
	Sat,  8 Jan 2022 17:04:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D8021BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85E4B813EB
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GOWkFk5UMrw for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:04:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54D8F812AC
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 17:04:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r9so15862905wrg.0
 for <buildroot@busybox.net>; Sat, 08 Jan 2022 09:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=tUmuA0KaXTP6VjzMlRO/zf0YulULkBHqP9AvrZsMaA0=;
 b=H9uK8RxZ5q50RfmC4/wqm4FsDRDqGJZ4fO+MZczybAe9U2n1O71qfDn2kwE5zWtb5W
 sIuZ0VFyNeCsRllQPNBh7+CUYMn7kWB//rUDEwTdpVrDbM0gWkVfLfu7GEXYViNpBDhr
 Z73ezZT/g0xp0XRDD789Feis5nPqlX5+Lfo1mS6YIJP3fjQKde5M+MIFNNJ66zuEzM0M
 N2CpC3+T5oZ3AO7EDvgDj6BIruX6JIXOQ/4XIDzHoo2MsK4FyIppPwYFHzD8ZEj8khW8
 xb3/ZYjvqxwIDA9mPy5pKjy2G4vjAaGzRBcrJmBD4uVeBa56vO2WgWw2W4oYokbWVar8
 CsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tUmuA0KaXTP6VjzMlRO/zf0YulULkBHqP9AvrZsMaA0=;
 b=C6RqX3SaxsMzonUkV5mJUo12NfBigwXgtOGU9ibBj86MKv1mou7jqiksqqFSJJ9nRi
 VS2Bjjy1gDxivJI6sSNTJaXFGYF9UGZQ3BqvOdPbfusfS5r+ZTPxTYr37iVjrNX6ao0r
 6pynhIvt2W+lACbgb5bZ0tjwjhcnRGNJtZcal3ftrVzwbuNkebwXjJVnbbZPCC5nt3Y4
 nyDChiGk+2pBFq9Zk+5gtpWFXN7eiJJ/NCatbI3BuaN4L8WA/wVLCOOgtysaqU4rI708
 RqL8zfyFJUS6XfWNzyBSSwkCtKTM89QP5anarcUlKxhUZDyT/m++Fd9AGdpd7Ahh4ztz
 Bl5Q==
X-Gm-Message-State: AOAM532eJ+OO+bTnu4/fwa4IWnOSw5n/D0+ZQ0xHywbIxXhm2PDiJ/wr
 /np49TizMB8809nbCfNk6EpjBzWLZ1QAa3mk
X-Google-Smtp-Source: ABdhPJwRjnizWXZMtOpZzU5CERgI/csc0lGtfSkxZiePcN+K+r7pt2KdLXuG01V4ra4j5EGVxGFK8w==
X-Received: by 2002:adf:dc12:: with SMTP id t18mr60193682wri.566.1641661481563; 
 Sat, 08 Jan 2022 09:04:41 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id p13sm2420938wrs.54.2022.01.08.09.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 09:04:41 -0800 (PST)
Message-ID: <b2912933-3558-05f8-e800-3ca01d4b79a7@mind.be>
Date: Sat, 8 Jan 2022 18:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20200518052345.1721724-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200518052345.1721724-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/lua-inotify: new package
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



On 18/05/2020 07:23, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks. Sorry it took so long.

  I also added you to DEVELOPERS for this package.

  Regards,
  Arnout

> ---
>   .gitlab-ci.yml                                |  2 ++
>   package/Config.in                             |  1 +
>   package/lua-inotify/Config.in                 |  6 +++++
>   package/lua-inotify/lua-inotify.hash          |  3 +++
>   package/lua-inotify/lua-inotify.mk            | 14 +++++++++++
>   .../testing/tests/package/test_lua_inotify.py | 25 +++++++++++++++++++
>   6 files changed, 51 insertions(+)
>   create mode 100644 package/lua-inotify/Config.in
>   create mode 100644 package/lua-inotify/lua-inotify.hash
>   create mode 100644 package/lua-inotify/lua-inotify.mk
>   create mode 100644 support/testing/tests/package/test_lua_inotify.py
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index fa8e077a0..85dadd00d 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -421,6 +421,8 @@ tests.package.test_lua_gd.TestLuaLuaGD: { extends: .runtime_test }
>   tests.package.test_lua_gd.TestLuajitLuaGD: { extends: .runtime_test }
>   tests.package.test_lua_http.TestLuaHttp: { extends: .runtime_test }
>   tests.package.test_lua_http.TestLuajitHttp: { extends: .runtime_test }
> +tests.package.test_lua_inotify.TestLuaInotify: { extends: .runtime_test }
> +tests.package.test_lua_inotify.TestLuajitInotify: { extends: .runtime_test }
>   tests.package.test_lua_lyaml.TestLuaLuaLyaml: { extends: .runtime_test }
>   tests.package.test_lua_lyaml.TestLuajitLuaLyaml: { extends: .runtime_test }
>   tests.package.test_lua_sdl2.TestLuaLuaSDL2: { extends: .runtime_test }
> diff --git a/package/Config.in b/package/Config.in
> index c12676d85..191eea859 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -653,6 +653,7 @@ menu "Lua libraries/modules"
>   	source "package/lua-gd/Config.in"
>   	source "package/lua-http/Config.in"
>   	source "package/lua-iconv/Config.in"
> +	source "package/lua-inotify/Config.in"
>   	source "package/lua-livr/Config.in"
>   	source "package/lua-livr-extra/Config.in"
>   	source "package/lua-lpeg-patterns/Config.in"
> diff --git a/package/lua-inotify/Config.in b/package/lua-inotify/Config.in
> new file mode 100644
> index 000000000..2b0c943c6
> --- /dev/null
> +++ b/package/lua-inotify/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LUA_INOTIFY
> +	bool "lua-inotify"
> +	help
> +	  Inotify bindings for Lua.
> +
> +	  http://hoelz.ro/projects/linotify
> diff --git a/package/lua-inotify/lua-inotify.hash b/package/lua-inotify/lua-inotify.hash
> new file mode 100644
> index 000000000..183638954
> --- /dev/null
> +++ b/package/lua-inotify/lua-inotify.hash
> @@ -0,0 +1,3 @@
> +# computed by luarocks/buildroot
> +sha256 9164b5777b132d7e1e073478d8837a526262991c57e32d75d517100f533eb436  inotify-0.5-1.src.rock
> +sha256 b02158adb3c7763e1183a9386672f4f037bfeaab0cb0c73d684f34f3ea1993d8  linotify-0.5/COPYRIGHT
> diff --git a/package/lua-inotify/lua-inotify.mk b/package/lua-inotify/lua-inotify.mk
> new file mode 100644
> index 000000000..dde7fc0fa
> --- /dev/null
> +++ b/package/lua-inotify/lua-inotify.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# lua-inotify
> +#
> +################################################################################
> +
> +LUA_INOTIFY_VERSION_UPSTREAM = 0.5
> +LUA_INOTIFY_VERSION = $(LUA_INOTIFY_VERSION_UPSTREAM)-1
> +LUA_INOTIFY_NAME_UPSTREAM = inotify
> +LUA_INOTIFY_SUBDIR = linotify-$(LUA_INOTIFY_VERSION_UPSTREAM)
> +LUA_INOTIFY_LICENSE = MIT
> +LUA_INOTIFY_LICENSE_FILES = $(LUA_INOTIFY_SUBDIR)/COPYRIGHT
> +
> +$(eval $(luarocks-package))
> diff --git a/support/testing/tests/package/test_lua_inotify.py b/support/testing/tests/package/test_lua_inotify.py
> new file mode 100644
> index 000000000..c951a9c5d
> --- /dev/null
> +++ b/support/testing/tests/package/test_lua_inotify.py
> @@ -0,0 +1,25 @@
> +from tests.package.test_lua import TestLuaBase
> +
> +
> +class TestLuaInotify(TestLuaBase):
> +    config = TestLuaBase.config + \
> +        """
> +        BR2_PACKAGE_LUA=y
> +        BR2_PACKAGE_LUA_INOTIFY=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("inotify")
> +
> +
> +class TestLuajitInotify(TestLuaBase):
> +    config = TestLuaBase.config + \
> +        """
> +        BR2_PACKAGE_LUAJIT=y
> +        BR2_PACKAGE_LUA_INOTIFY=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("inotify")
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
