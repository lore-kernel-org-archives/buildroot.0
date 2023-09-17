Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFC1CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 13:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C8CA40111;
	Sun, 17 Sep 2023 13:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C8CA40111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s300RY8ShZcN; Sun, 17 Sep 2023 13:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A83D40449;
	Sun, 17 Sep 2023 13:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A83D40449
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B72BB1BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 13:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E63881980
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 13:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E63881980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xshWPTlwSNd5 for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 13:00:28 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6257980E8F
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 13:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6257980E8F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6D8A9B0055E;
 Sun, 17 Sep 2023 15:00:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 15:00:23 +0200
Date: Sun, 17 Sep 2023 15:00:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230917130023.GX415981@scaer>
References: <ZQWdfMVaJjzX9Vfr@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQWdfMVaJjzX9Vfr@waldemar-brodkorb.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694955625;
 bh=/Qg/gFZq2DrohYlpmDnyJx7GGL0pF+1nWDtYYbgEdrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=usx6qFWKQaLa+ijqxzvwQ433LxE+r1ByzYT6pWMImfKL0AnojlTzQM57gthNY32rI
 kl6PcbmKM3OZ5jEBjenJzErOd51fnN0euQwPxaOCSLofk13LNdu7vK7tMIFytDh+Jc
 xGjWV5kd8ipi/vAkcFmqHD5gegc4y8k/Ze2CFse3/eTB3a2tXTjPkWVEfjU0w8v9Iy
 bpt/fGCi8jQReTI2QAiBoW8xpTPR1Mc00/GEEv7CAkUqlSkI19vghC1GQIub6llF8S
 plHpIi+xFMSYP5473ebYSAqxAlu2p50CFAkxvWGa7PGCnIs0ST1A3q3orx3b/qIYX8
 5SyH8yLtDgn9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=usx6qFWK
Subject: Re: [Buildroot] [PATCH v2] ruby: bump version to 3.2.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-09-16 14:20 +0200, Waldemar Brodkorb spake thusly:
> Patch is included upstream, remove it and the reference in .checkpackageignore.
> 
> Host build fails with following error:
> <internal:/buildroot/output/build/host-ruby-3.2.2/lib/rubygems/core_ext/kernel_require.rb>:85:in `require': cannot load such file -- psych (LoadError)
>         from <internal:/buildroot/output/build/host-ruby-3.2.2/lib/rubygems/core_ext/kernel_require.rb>:85:in `require'
>         from /buildroot/output/build/host-ruby-3.2.2/lib/rubygems.rb:608:in `load_yaml'
> 
> Fix it by adding host-libyaml to the dependencies.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  v1->v2:
>   - add failure for host build requested by Thomas Petazzoni

You provided the error message of the build failure for the host
variant, that explains why host-ruby needs host-libyaml. That's good.

But I think that what Thomas requested, was to explain why the target
variant does not need libyaml.

Indeed, it looks like host-ruby is trying to load libyaml at runtime,
so it would kinda make sense that it would also need it at runtime on
the target...

A runtime test would be great, and would resolve the issue. ;-)

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |  1 -
>  .../0001-Fix-build-with-LibreSSL-3-5.patch    | 25 -------------------
>  package/ruby/ruby.hash                        |  4 +--
>  package/ruby/ruby.mk                          |  8 +++---
>  4 files changed, 6 insertions(+), 32 deletions(-)
>  delete mode 100644 package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 73a00d610c..7b89234827 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1277,7 +1277,6 @@ package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch Upstream
>  package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch Upstream
>  package/rubix/0001-dont-use-legacy-functions.patch Upstream
>  package/rubix/0002-misc-fixes.patch Sob Upstream
> -package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch Upstream
>  package/rygel/0001-build-Add-man_pages-build-options.patch Upstream
>  package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch Upstream
>  package/rygel/S99rygel Indent Shellcheck Variables
> diff --git a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
> deleted file mode 100644
> index 805dfd2f89..0000000000
> --- a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d Mon Sep 17 00:00:00 2001
> -From: Jeremy Evans <code@jeremyevans.net>
> -Date: Fri, 25 Mar 2022 13:11:31 -0700
> -Subject: [PATCH] Fix build with LibreSSL 3.5
> -
> -[Retrieved from:
> -https://github.com/ruby/openssl/commit/e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - ext/openssl/ossl_pkey.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/ext/openssl/ossl_pkey.c b/ext/openssl/ossl_pkey.c
> -index 2a4835a2..24d0da46 100644
> ---- a/ext/openssl/ossl_pkey.c
> -+++ b/ext/openssl/ossl_pkey.c
> -@@ -710,7 +710,7 @@ ossl_pkey_export_traditional(int argc, VALUE *argv, VALUE self, int to_der)
> - 	}
> -     }
> -     else {
> --#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
> -+#if OSSL_OPENSSL_PREREQ(1, 1, 0) || OSSL_LIBRESSL_PREREQ(3, 5, 0)
> - 	if (!PEM_write_bio_PrivateKey_traditional(bio, pkey, enc, NULL, 0,
> - 						  ossl_pem_passwd_cb,
> - 						  (void *)pass)) {
> diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> index 42d8a2497f..bbe77ce1c1 100644
> --- a/package/ruby/ruby.hash
> +++ b/package/ruby/ruby.hash
> @@ -1,5 +1,5 @@
> -# https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/
> -sha512  4b0fd334ae56132ba98b8a69adad54bdcf7f7aeabd5eba5b0f0399a3868e2054f9026ca1b1cb2dbb197a9e9b0610b263481949c0623a62071546bc5adff8ca69  ruby-3.1.3.tar.xz
> +# https://www.ruby-lang.org/en/news/2023/03/30/ruby-3-2-2-released/
> +sha512  a29f24cd80f563f6368952d06d6273f7241a409fa9ab2f60e03dde2ac58ca06bee1750715b6134caebf4c061d3503446dc37a6059e19860bb0010eef34951935  ruby-3.2.2.tar.xz
>  
>  # License files, Locally calculated
>  sha256  794c384f94396ab07e3e6f53a9f8be093facb7eb4193266024302b93b29e12dc  LEGAL
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index 28b1ec13ef..4278e6584d 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -RUBY_VERSION_MAJOR = 3.1
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
> -RUBY_VERSION_EXT = 3.1.0
> +RUBY_VERSION_MAJOR = 3.2
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
> +RUBY_VERSION_EXT = 3.2.0
>  RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
>  RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
>  
> @@ -20,7 +20,7 @@ RUBY_LICENSE_FILES = LEGAL COPYING BSDL
>  RUBY_CPE_ID_VENDOR = ruby-lang
>  
>  RUBY_DEPENDENCIES = host-pkgconf host-ruby
> -HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl
> +HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl host-libyaml
>  RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
>  RUBY_CONF_OPTS = --disable-install-doc --disable-rpath --disable-rubygems
>  HOST_RUBY_CONF_OPTS = \
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
