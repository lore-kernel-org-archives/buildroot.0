Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F73C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C995E80EC9;
	Sun, 18 May 2025 14:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQ7yRPqy6Hme; Sun, 18 May 2025 14:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA2AE811AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA2AE811AC;
	Sun, 18 May 2025 14:44:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A20DDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C54841056
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zMNQt8TZc3b for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F0B440FE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F0B440FE3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F0B440FE3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:44:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 255371C1001; Sun, 18 May 2025 16:44:03 +0200 (CEST)
Message-ID: <84c1d91a-a1be-4d8f-ad58-92c85a8e19e9@rnout.be>
Date: Sun, 18 May 2025 16:44:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
References: <20250515060244.1890635-1-roykollensvendsen@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515060244.1890635-1-roykollensvendsen@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579443; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SH6GixTbxOMG77PsjdvyIr6DtLY0a6iHSDvFnIWgb6U=;
 b=MgcznzQzgRBCoknFwX3EN1w3l5EWwPE4W9UBGfN81KNs7WEFGYRK+Ugr0TsaBbN8MO7hU0
 n3EOBUOoaAYn1OzTnNLx/sjqWNgPXT2LW6ha05hWkGHNpXrEOUo9UHpQ0ko19xhNRWdAnI
 21nsBZPdQRK4h1A482fGoHp4+LNa8W3qP9ZwZLzwCRMhf5T3sHS8tgo2Gl53piWBx42hgl
 Cz7WdJ429d5gXHKpQ5i+YVEg9S1XiKh03Y1mT5arj8ZY1GJou6/RuFFKo4s+rNB5Kh9+jd
 Zqbnryvp7JkqmMdid2xGOz8x2MR/vL1bQhF57r7aJKg07EOnUHnrTXywqC63kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MgcznzQz
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mariadb: bump version to
 10.11.11
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



On 15/05/2025 08:02, Roy Kollen Svendsen wrote:
> Fixes:
> Build with gcc-15 was fixed upstream in 10.11.11:
> 
> https://github.com/MariaDB/server/commit/1d6f857
> 
> Remove patch, since the problem was fixed upstream:
> 
> https://github.com/MariaDB/server/commit/4375245
> 
> After bumping the version to 10.11.11 the configuration step failed for target:
> 
> CMake Error: try_run() invoked in cross-compiling mode, please set the following cache variables appropriately:
>     HAVE_SYSTEM_LIBFMT_EXITCODE (advanced)
> 
> To fx this problem we set HAVE_SYSTEM_LIBFMT_EXITCODE=0.
> 
> Fix legal-info after changes to README.md.
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - fix target build by setting HAVE_SYSTEM_LIBFMT_EXITCODE=0
>    - fix legal-info after changes to README.md
>    - improve commit message
>    - link to v1: https://patchwork.ozlabs.org/project/buildroot/patch/20250514220736.1380151-1-roykollensvendsen@gmail.com/
> 
>   ...le-failure-fmt-use-incompatible-with.patch | 35 -------------------
>   package/mariadb/mariadb.hash                  |  6 ++--
>   package/mariadb/mariadb.mk                    |  5 +--
>   3 files changed, 6 insertions(+), 40 deletions(-)
>   delete mode 100644 package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
> 
> diff --git a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch b/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
> deleted file mode 100644
> index b6c8807f44..0000000000
> --- a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 69935c10b95fc7f7a2e1c3ed02831958e1a9b6a4 Mon Sep 17 00:00:00 2001
> -From: Daniel Black <daniel@mariadb.org>
> -Date: Wed, 22 May 2024 17:43:17 +1000
> -Subject: [PATCH] MDEV-34206 compile failure: fmt use incompatible with
> - libfmt-10.2.[2]+
> -
> -Upstream libfmt commit https://github.com/fmtlib/fmt/commit/d70729215fba1d54862e407b626abf86ddf409bf
> -now requires the format function to be const.
> -
> -Adjust the function prototype so it is const and can compile.a
> -
> -Signed-off-by: Daniel Black <daniel@mariadb.org>
> -[Julien: add SoB line with the original patch author name]
> -Upstream: https://github.com/MariaDB/server/commit/4375245d5d9f01cabb6e3fd6c637535e724eae38
> -Signed-off-by: Julien Olivain <ju.o@free.fr>
> ----
> - sql/item_strfunc.cc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/sql/item_strfunc.cc b/sql/item_strfunc.cc
> -index 4bbf36ec1cf..2ad8a9b3ce5 100644
> ---- a/sql/item_strfunc.cc
> -+++ b/sql/item_strfunc.cc
> -@@ -1392,7 +1392,7 @@ bool Item_func_sformat::fix_length_and_dec(THD *thd)
> - namespace fmt {
> -   template <> struct formatter<String>: formatter<string_view> {
> -     template <typename FormatContext>
> --    auto format(String c, FormatContext& ctx) -> decltype(ctx.out()) {
> -+    auto format(String c, FormatContext& ctx) const -> decltype(ctx.out()) {
> -       string_view name = { c.ptr(), c.length() };
> -       return formatter<string_view>::format(name, ctx);
> -     };
> ---
> -2.46.0
> -
> diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
> index fd73cca4f3..05340c1faa 100644
> --- a/package/mariadb/mariadb.hash
> +++ b/package/mariadb/mariadb.hash
> @@ -1,6 +1,6 @@
> -# From https://downloads.mariadb.org/mariadb/10.11.6
> -sha512  3d77f7be4a26d5a36af56150a5f8ed5e21adeed9bc8ea1bd694e47a25a571bd73468eada7c96e0dfe5a6c81bef625abf71a56d228cf43a738e555e3c0d824a6a  mariadb-10.11.6.tar.gz
> +# From https://downloads.mariadb.org/mariadb/10.11.11
> +sha512  d9c154207a9f435ce08d5fbfe31814a739e577c656ef9996cf7e60c2cad8b4c07e2de8d94b6191fefa2b5cbde56437b586f85f144d3b4fcec8533449ed8411ac  mariadb-10.11.11.tar.gz
>   
>   # Hash for license files
> -sha256  2b278a3a2f20696113a7c57c4f3e6a5cdb9a25f2a827e72e0c089a2f805ff91a  README.md
> +sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
>   sha256  240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index 1dcf6568da..0d872442f2 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MARIADB_VERSION = 10.11.6
> +MARIADB_VERSION = 10.11.11
>   MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
>   MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
>   # Tarball no longer contains LGPL license text
> @@ -27,7 +27,8 @@ MARIADB_DEPENDENCIES = \
>   
>   MARIADB_CONF_OPTS += \
>   	-DWITH_LIBFMT=system \
> -	-DWITH_PCRE=system
> +	-DWITH_PCRE=system \
> +	-DHAVE_SYSTEM_LIBFMT_EXITCODE=0
>   
>   # use bundled GPL-2.0+ licensed readline as package/readline is GPL-3.0+
>   MARIADB_CONF_OPTS += -DWITH_READLINE=ON

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
