Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D795C83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B84684700;
	Sat, 19 Jul 2025 11:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHAAUJ-Rli5P; Sat, 19 Jul 2025 11:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9295984604
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9295984604;
	Sat, 19 Jul 2025 11:23:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 101BD117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAA2984572
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3ey4_sH-Hia for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C94A283490
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C94A283490
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C94A283490
 for <buildroot@busybox.net>; Sat, 19 Jul 2025 11:23:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B1844B977B28; Sat, 19 Jul 2025 13:23:29 +0200 (CEST)
Message-ID: <b4952d3b-1b26-4112-9fb7-388775036c8d@rnout.be>
Date: Thu, 17 Jul 2025 22:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20250716061514.1425011-1-francois.perrad@gadz.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250716061514.1425011-1-francois.perrad@gadz.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752924209; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=XeRL01Dt/KoesqAbqVclGL0oWcJju8MSeVzbEcfXXzI=;
 b=PmxrUmlTS0W5UVFlvllM1vYJgFJRzR3KCvUCbRSK3JmjzjaM9EFNI3VnbfF5qyE6GG/0/N
 7i77jcfrExZ33d3lDREUQW1sGy9u/F+9KsGF5sEejdAi8813qxpW6ojTPjxgNUfMiiH/mW
 HyXhzyCu+BJKJa5Rig8kww1++qfJctb1if77FdpIT0PHk32a2X6w4UCj1UbpIjsY5fzb54
 3eePw8Sct0sXagEEqDBUfJkKu2L0fhgn2isYfaUN02N1wm73A4qZPZ2w7kigTKCjbZ3ISO
 vws2v5m6jwUEuXoWgGOALKUSbnYZpV+kwuFrMrXcTVR15buBW2UqirZN7jUdYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=PmxrUmlT
Subject: Re: [Buildroot] [PATCH] package/lua-lrexlib-pcre2: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/07/2025 08:15, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Great that you included a runtime test!

  Regards,
  Arnout

> ---
>   package/Config.in                             |  1 +
>   package/lua-lrexlib-pcre2/Config.in           |  7 ++++++
>   .../lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash  |  3 +++
>   .../lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk    | 14 +++++++++++
>   .../tests/package/test_lua_lrexlib_pcre2.py   | 25 +++++++++++++++++++
>   5 files changed, 50 insertions(+)
>   create mode 100644 package/lua-lrexlib-pcre2/Config.in
>   create mode 100644 package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
>   create mode 100644 package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
>   create mode 100644 support/testing/tests/package/test_lua_lrexlib_pcre2.py
> 
> diff --git a/package/Config.in b/package/Config.in
> index 579b5ffc8..1ec830050 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -761,6 +761,7 @@ menu "Lua libraries/modules"
>   	source "package/lua-livr/Config.in"
>   	source "package/lua-livr-extra/Config.in"
>   	source "package/lua-lpeg-patterns/Config.in"
> +	source "package/lua-lrexlib-pcre2/Config.in"
>   	source "package/lua-lsdbus/Config.in"
>   	source "package/lua-lunitx/Config.in"
>   	source "package/lua-lunix/Config.in"
> diff --git a/package/lua-lrexlib-pcre2/Config.in b/package/lua-lrexlib-pcre2/Config.in
> new file mode 100644
> index 000000000..0d73ee8d6
> --- /dev/null
> +++ b/package/lua-lrexlib-pcre2/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LUA_LREXLIB_PCRE2
> +	bool "lua-lrexlib-pcre2"
> +	select BR2_PACKAGE_PCRE2
> +	help
> +	  Regular expression library binding (PCRE2 flavour).
> +
> +	  https://github.com/rrthomas/lrexlib
> diff --git a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
> new file mode 100644
> index 000000000..090b83d48
> --- /dev/null
> +++ b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
> @@ -0,0 +1,3 @@
> +# computed by luarocks/buildroot
> +sha256  9bb1cb2f307eb70d66fdab499864de732c891aace0ceb6a338194e2e6631b9c3  lrexlib-pcre2-2.9.2-1.src.rock
> +sha256  067992fa7c5866e01d6c8fe93dfa1e1456a6ac81fa59ccdc72f5adcd6e5b3690  lrexlib/LICENSE
> diff --git a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
> new file mode 100644
> index 000000000..3d0c3c57f
> --- /dev/null
> +++ b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# lua-lrexlib-pcre2
> +#
> +################################################################################
> +
> +LUA_LREXLIB_PCRE2_VERSION = 2.9.2-1
> +LUA_LREXLIB_PCRE2_NAME_UPSTREAM = Lrexlib-PCRE2
> +LUA_LREXLIB_PCRE2_SUBDIR = lrexlib
> +LUA_LREXLIB_PCRE2_LICENSE = MIT
> +LUA_LREXLIB_PCRE2_LICENSE_FILES = $(LUA_LREXLIB_PCRE2_SUBDIR)/LICENSE
> +LUA_LREXLIB_PCRE2_DEPENDENCIES = pcre2
> +
> +$(eval $(luarocks-package))
> diff --git a/support/testing/tests/package/test_lua_lrexlib_pcre2.py b/support/testing/tests/package/test_lua_lrexlib_pcre2.py
> new file mode 100644
> index 000000000..07a1a3e03
> --- /dev/null
> +++ b/support/testing/tests/package/test_lua_lrexlib_pcre2.py
> @@ -0,0 +1,25 @@
> +from tests.package.test_lua import TestLuaBase
> +
> +
> +class TestLuaLrexlibPCRE2(TestLuaBase):
> +    config = TestLuaBase.config + \
> +        """
> +        BR2_PACKAGE_LUA=y
> +        BR2_PACKAGE_LUA_LREXLIB_PCRE2=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("rex_pcre2")
> +
> +
> +class TestLuajitLrexlibPCRE2(TestLuaBase):
> +    config = TestLuaBase.config + \
> +        """
> +        BR2_PACKAGE_LUAJIT=y
> +        BR2_PACKAGE_LUA_LREXLIB_PCRE2=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("rex_pcre2")

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
