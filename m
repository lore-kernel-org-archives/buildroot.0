Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CD0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3599F4170D;
	Sun, 17 Jul 2022 13:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3599F4170D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WcYPNrZycm-0; Sun, 17 Jul 2022 13:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EFDC41716;
	Sun, 17 Jul 2022 13:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EFDC41716
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D1F11BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67B2460776
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B2460776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JA8zSgvrjAWf for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:57:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB1260687
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EB1260687
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:57:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B6EBE780502;
 Sun, 17 Jul 2022 15:57:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:57:20 +0200
Date: Sun, 17 Jul 2022 15:57:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717135720.GQ2249625@scaer>
References: <20220712203151.1891202-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220712203151.1891202-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658066244;
 bh=QgS582MWkEualxgXHp4p4jBdzfvlvEmoc/qLQNHvStA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uGZ/26WUTZA+YqFphiaFEq1vpUqxvTgWoHPyMUUEfXlGxENY+LiP5SwT3kw/kDTUC
 W2OZ/tB5ttk8j3khOlmrjLo9e5F5oTQqxSvwGzDXcwfvqGBbuIsTn+KEBATXqLcoNu
 8Z1d8R3TPn78vQfD+RDx8Bi1GNX7xJ2wVuvwuXCV+C1grKZrS8k+6jmtVrEkNezeAA
 HK8Vrw049LReN+WgjK0Okd9rwJVwQBSeB3cUyup+t5NEq4E+ygBJhwEZ/MDa6Ki4jJ
 GAO/wKyW9nwxMf0U5xA94IQEh2v4Qg0NbBoT4f9g42lolJZIW9OxVlSGEyi/nBhCJL
 Z6fmcS8nTTjBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uGZ/26WU
Subject: Re: [Buildroot] [PATCH 1/1] package/gtest: drop host-gtest
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
Cc: Stephan Hoffmann <sho@relinux.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-07-12 22:31 +0200, Fabrice Fontaine spake thusly:
> Drop host-gtest to avoid the following build failure raised since bump
> to version 1.12.0 in commit a336b731af5979a25213b33c5840de6d1ed88bdc and
> https://github.com/google/googletest/commit/6202251f0963187a7781f181365cf8c19bf343d5:
> 
> /usr/bin/install -D -m 0755 /home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-gtest-1.12.0/googlemock/scripts/generator/gmock_gen.py /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/gmock_gen
> /usr/bin/install: cannot stat '/home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-gtest-1.12.0/googlemock/scripts/generator/gmock_gen.py': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6a8fb259760f84c67a3482cc5964c6610f9b70a4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gtest/Config.in |  9 ---------
>  package/gtest/gtest.mk  | 15 ---------------
>  2 files changed, 24 deletions(-)
> 
> diff --git a/package/gtest/Config.in b/package/gtest/Config.in
> index 4355e9c9c5..4591cb5e48 100644
> --- a/package/gtest/Config.in
> +++ b/package/gtest/Config.in
> @@ -26,7 +26,6 @@ if BR2_PACKAGE_GTEST
>  
>  config BR2_PACKAGE_GTEST_GMOCK
>  	bool "gmock"
> -	depends on BR2_HOST_GCC_AT_LEAST_5 # host-gtest
>  	help
>  	  Inspired by jMock, EasyMock, and Hamcrest, and designed with
>  	  C++'s specifics in mind, Google C++ Mocking Framework (or
> @@ -43,14 +42,6 @@ config BR2_PACKAGE_GTEST_GMOCK
>  	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW,
>  	      and Symbian.
>  
> -	  There are both host and target packages. The target one has
> -	  include files required to compile the tests and the static
> -	  libraries required to link/run them. The host package installs
> -	  gmock_gen, a Python script used to generate code mocks.
> -
> -comment "gmock needs host gcc >= 5"
> -	depends on !BR2_HOST_GCC_AT_LEAST_5
> -
>  endif # BR2_PACKAGE_GTEST
>  
>  comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 5"
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index 8ec5e9c535..a9ac49957b 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -13,10 +13,6 @@ GTEST_LICENSE_FILES = LICENSE
>  GTEST_CPE_ID_VENDOR = google
>  GTEST_CPE_ID_PRODUCT = google_test
>  
> -HOST_GTEST_LICENSE = Apache-2.0
> -HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
> -HOST_GTEST_DEPENDENCIES = host-python3
> -
>  # While it is possible to build gtest as shared library, using this gtest shared
>  # library requires to set some special configure option in the project using
>  # gtest.
> @@ -34,20 +30,9 @@ GTEST_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
>  endif
>  
>  ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> -GTEST_DEPENDENCIES += host-gtest
>  GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
>  else
>  GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
>  endif
>  
> -define HOST_GTEST_POST_INSTALL_PYTHON
> -	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
> -		$(HOST_DIR)/bin/gmock_gen
> -	cp -rp $(@D)/googlemock/scripts/generator/cpp \
> -		$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> -endef
> -
> -HOST_GTEST_POST_INSTALL_HOOKS += HOST_GTEST_POST_INSTALL_PYTHON
> -
>  $(eval $(cmake-package))
> -$(eval $(host-cmake-package))
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
