Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A853C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 14:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6362B41D47;
	Sat,  4 Jun 2022 14:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IaFFr56rEWHt; Sat,  4 Jun 2022 14:49:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA69941D2B;
	Sat,  4 Jun 2022 14:49:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC7061BF322
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 14:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A89F400A8
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 14:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OK6O9aaUFyk9 for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 14:49:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9313F4002B
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 14:49:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BEAF85FF9E;
 Sat,  4 Jun 2022 16:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654354175;
 bh=xXF23+PL5vhGcVvGXDbMuB25Uqvsy4UDZNu9Jry3FwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FVuZynKBjUofveG7Bo+AAZQPvaStRqYXVHc8ayrLEuylqgfx3787NKJDh0wMUh49y
 YwNd2yB9T9AkeaySo0u6trk/faFf5eDasHZ+2Na68q6SmrW4Mx419k7NR9LV7Tt35/
 gKG3hYe2BYIZK85XlpXBkXQVjpV5lu0R5xJfmU+qityhiOkI+XhC/lXEpXs8yqD9+l
 FoY/sTiK9ckTAQubmTEceaTuAJjOF4pN5vpKmGVtAjbN2kiqib8rAvOD7Q+wAe5Uel
 VksIaxbB6hrVOvcjYm6Ckroh49/QBUaO0jeJGYNSflUA6kposC0quVNFhBy+DQIYmu
 q011qC4gPbBgg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 16:49:31 +0200
Date: Sat, 4 Jun 2022 16:49:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220604144931.GL427639@scaer>
References: <20220521204348.1023965-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220521204348.1023965-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/qpid-proton: needs C++ and
 threads
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-21 22:43 +0200, Fabrice Fontaine spake thusly:
> qpid-proton needs C++ (and so threads due to proactor) to avoid the
> following build failure:
> 
> CMake Error at /nvmedata/autobuild/instance-3/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
>   The C++ compiler
> 
>     "/usr/bin/c++"
> 
>   is not able to compile a simple test program.
> 
> C++ check can't easily be removed:
> https://github.com/apache/qpid-proton/pull/366
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/76f8deccc9c4eee29eddf42586cc28e96eec0827
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qpid-proton/Config.in      |  7 +++++--
>  package/qpid-proton/qpid-proton.mk | 15 +--------------
>  2 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
> index b49a2afa7e..adddc6eca0 100644
> --- a/package/qpid-proton/Config.in
> +++ b/package/qpid-proton/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_PACKAGE_QPID_PROTON
>  	bool "qpid-proton"
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS # build a shared library
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	help
> @@ -13,5 +15,6 @@ config BR2_PACKAGE_QPID_PROTON
>  
>  	  https://qpid.apache.org/proton/
>  
> -comment "qpid-proton needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +comment "qpid-proton needs a toolchain w/ C++, dynamic library, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
> index 103cf9fd31..fae6ecc413 100644
> --- a/package/qpid-proton/qpid-proton.mk
> +++ b/package/qpid-proton/qpid-proton.mk
> @@ -23,6 +23,7 @@ QPID_PROTON_DEPENDENCIES = \
>  # go language binding is enabled when host-go is present
>  # For now, disable all of them.
>  QPID_PROTON_CONF_OPTS = \
> +	-DBUILD_CPP=ON \
>  	-DBUILD_GO=OFF \
>  	-DBUILD_PYTHON=OFF \
>  	-DBUILD_RUBY=OFF \
> @@ -31,20 +32,6 @@ QPID_PROTON_CONF_OPTS = \
>  	-DENABLE_WARNING_ERROR=OFF \
>  	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
>  
> -# epoll proactor unconditionally uses pthread and cpp (C++) bindings
> -# unconditionally use proactor
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> -QPID_PROTON_CONF_OPTS += -DBUILD_CPP=ON
> -else
> -QPID_PROTON_CONF_OPTS += -DBUILD_CPP=OFF
> -endif
> -else
> -QPID_PROTON_CONF_OPTS += \
> -	-DBUILD_CPP=OFF \
> -	-DPROACTOR=none
> -endif
> -
>  ifeq ($(BR2_PACKAGE_JSONCPP),y)
>  QPID_PROTON_DEPENDENCIES += jsoncpp
>  QPID_PROTON_CONF_OPTS += -DENABLE_JSONCPP=ON
> -- 
> 2.35.1
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
