Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6B4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 08:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F2614090C;
	Mon, 10 Jan 2022 08:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfuAkC4Ievyr; Mon, 10 Jan 2022 08:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FECE40908;
	Mon, 10 Jan 2022 08:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0D881BF29A
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF6AF60C11
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Etr1cOY1Fh7d for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 08:14:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DA0760C10
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 08:14:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A3FF65FFAA;
 Mon, 10 Jan 2022 09:14:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641802460;
 bh=obWByw2NEQVn3JMhUPWiaGYq5fKLURSJ+Fm2ZWlJrg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nkd8OdPNX+WpN7SYbzXNcqo3cvM8/3NtLFRsIESMW9asFE1PKPkaznuCCQDdT92wk
 o7AuMB52QD3CvDc9H2Zlz6kyyHrP4P4P3iwVPb6ZcAy1n6Zo3Sa0HbIU5/TfwPN7Yy
 rJSqLKtB+SO7zF8BHXKOY8Wy+4ABBpE52++nzm/oPN9GyZ5Nx+rvgXrqasdbA4bckg
 VubBwwSCa4gaoEnSef3KBGQNeM42RfsY4pfwL2Mz8nBDAVeZOb8sLrfNrIKeWQyxQK
 pNFXLZtXFO3YU7BXVRe36OB4rbFXnqeJQNIhNm4fZC0CfzBPY1p+/RF1VfFk/0BkYc
 iEPu/aE66xHuQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 09:14:17 +0100
Date: Mon, 10 Jan 2022 09:14:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220110081417.GN1477939@scaer>
References: <20210802123300.564709-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802123300.564709-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH for-next] package/gtest: remove partial host
 package
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2021-08-02 14:33 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> gmock (which is part of the gtest package) has a host variant that is
> not actually the full host package, but instead just installs a single
> python script.
> 
> This script, however, is no longer maintained and is not needed for most
> practical uses of gmock. Even if it is used, its output is meant to be
> hand-edited, so it shouldn't be used as part of the build flow.
> 
> Therefore, remove the host-gtest package. A proper, full host package
> may make sense (for building other host packages that use gtest), but
> this single script really doesn't.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Norbert Lange <nolange79@gmail.com>
> Reviewed-by: Norbert Lange <nolange79@gmail.com>

In fact, we applied a different patch that makes host-gtests a proper
host package;

    https://git.buildroot.org/buildroot/commit/?id=c0f9e2447d57194f0b02edb93cd16a677ebb326c

I marked your patch as rejected, then. Thanks! ;-)

Regards,
Yann E. MORIN.

> ---
> Since we're so close to the 2021.08 release, this should probably be
> delayed a little.
> ---
>  package/gtest/gtest.mk | 27 ---------------------------
>  1 file changed, 27 deletions(-)
> 
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index 6447954e36..a9ac49957b 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -13,23 +13,6 @@ GTEST_LICENSE_FILES = LICENSE
>  GTEST_CPE_ID_VENDOR = google
>  GTEST_CPE_ID_PRODUCT = google_test
>  
> -ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> -GTEST_DEPENDENCIES += host-gtest
> -endif
> -
> -HOST_GTEST_LICENSE = Apache-2.0
> -HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
> -HOST_GTEST_DEPENDENCIES += host-python3
> -else
> -HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> -HOST_GTEST_DEPENDENCIES += host-python
> -endif
> -
> -HOST_GTEST_GMOCK_PYTHONPATH = \
> -	$(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
> -
>  # While it is possible to build gtest as shared library, using this gtest shared
>  # library requires to set some special configure option in the project using
>  # gtest.
> @@ -52,14 +35,4 @@ else
>  GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
>  endif
>  
> -define HOST_GTEST_INSTALL_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
> -		$(HOST_DIR)/bin/gmock_gen
> -	cp -rp $(@D)/googlemock/scripts/generator/cpp \
> -		$(HOST_GTEST_GMOCK_PYTHONPATH)
> -endef
> -
>  $(eval $(cmake-package))
> -# The host package does not build anything, just installs gmock_gen stuff, so
> -# it does not need to be a host-cmake-package.
> -$(eval $(host-generic-package))

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
