Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E27C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0808E4020C;
	Wed, 16 Feb 2022 21:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3U3AxQu8o7ja; Wed, 16 Feb 2022 21:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F767401BA;
	Wed, 16 Feb 2022 21:08:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BA6B1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A6F680D8A
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGyCHb0eoT9p for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:07:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5987080CEA
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:07:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9933:bb4:98b5:c594])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6F86BB00533;
 Wed, 16 Feb 2022 22:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645045658;
 bh=7xGiDF8mn/e0xZtMUlczYY7tzhcYSYN93rQcAc18rYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I7kgakZQIUo6E8R+wmKGFKEmdMWaLoapB2jX2IQzK+iHlG4HmepYP+NEaJ3WvRxlE
 5PaxxgM+37O3H+P94PQgKaRdk388iuaCgdF9sl8CikG+QdoClaAJXS9t3PbDhHANKi
 huYMVrvx9tpleIb9tDRCGzmwNIZS3CI+LUp/ZluSrZOe5D2CYxxHurvmGwHwitf0gI
 n5hYF7Nn5q9Y/RqZ68qyWRw/RXSn320o6Z8HDYR0ccR82I3JqSoa5ywz2JdcsmBJlF
 lCLlvjSIZ7SxZdo0ezTbakgER/tLOYKqCNbOSS6xp8ZpHKod60eR12UYxDH9ZJrXO1
 EO93xFJNxMtaA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 22:07:32 +0100
Date: Wed, 16 Feb 2022 22:07:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220216210732.GC522310@scaer>
References: <20220214213226.4143188-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214213226.4143188-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: needs execinfo.h
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 =?utf-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-02-14 22:32 +0100, Fabrice Fontaine spake thusly:
> qt5webkit needs execinfo.h since bump to version 5.212.0-alpha4 in
> commit df0b0fe6919c0d0f3750f439a3cfa765232bd569:
> 
> /tmp/instance-1/output-1/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/inspector/JSGlobalObjectInspectorController.cpp:54:10: fatal error: execinfo.h: No such file or directory
>    54 | #include <execinfo.h>
>       |          ^~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/351529f7d928e28fa2db22c6297dc70d21db562b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt5/qt5webkit/Config.in    | 1 +
>  package/qt5/qt5webkit/qt5webkit.mk | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
> index 68b679dfcd..ed87efca95 100644
> --- a/package/qt5/qt5webkit/Config.in
> +++ b/package/qt5/qt5webkit/Config.in
> @@ -21,6 +21,7 @@ config BR2_PACKAGE_QT5WEBKIT
>  	select BR2_PACKAGE_QT5LOCATION
>  	select BR2_PACKAGE_QT5SENSORS
>  	select BR2_PACKAGE_QT5WEBCHANNEL
> +	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_LIBXML2
>  	select BR2_PACKAGE_LIBXSLT
>  	select BR2_PACKAGE_SQLITE
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> index 565c57e813..2084f3af52 100644
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -10,7 +10,8 @@ QT5WEBKIT_SOURCE = qtwebkit-$(QT5WEBKIT_VERSION).tar.xz
>  QT5WEBKIT_DEPENDENCIES = \
>  	host-bison host-flex host-gperf host-python3 host-ruby gstreamer1 \
>  	gst1-plugins-base icu leveldb jpeg libpng libxml2 libxslt qt5location \
> -	qt5sensors qt5webchannel sqlite webp woff2
> +	qt5sensors qt5webchannel sqlite webp woff2 \
> +	$(if $(BR2_PACKAGE_LIBEXECINFO),libexecinfo)

There already are optional dependencies that are handled as a
conditional block, further down the file, so I changed this new
dependency to match the existing style.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  QT5WEBKIT_INSTALL_STAGING = YES
>  
>  QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
> -- 
> 2.34.1
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
