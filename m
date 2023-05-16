Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C41C7EE2D
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 19:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10A5440BE1;
	Tue, 16 May 2023 19:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10A5440BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKhKOCcPEmuz; Tue, 16 May 2023 19:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6C0240BCD;
	Tue, 16 May 2023 19:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6C0240BCD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58BF31BF295
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 19:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 318D760FC9
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 19:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 318D760FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Ys2kyhUvYFS for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 19:04:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E5A760FAF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E5A760FAF
 for <buildroot@buildroot.org>; Tue, 16 May 2023 19:04:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a7a1:441c:4e0f:17e6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C1A3F78050A;
 Tue, 16 May 2023 21:03:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 16 May 2023 21:03:56 +0200
Date: Tue, 16 May 2023 21:03:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230516190356.GP2582048@scaer>
References: <20230516173411.823978-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230516173411.823978-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684263838;
 bh=gI8fMH8G4vqMp4PhVh5qLceYPI5BQMBf8ki3146VRF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c5W3m+iffVbjFytebJKKkTek4dR7LqFdumVnfA9J203J9LTrc41YmgDW9Nwo6RZYl
 hVbDkVvjaVnbwuGiOXmhZEofM9G2g6uCwNLJELZG8UQGQpJu9zDhhbPw0klzDzJW3T
 ShFwkS+j1pnCZDmP4O2E7LVgz3XFiqNsEB+ZaJjmIwAMkKNMacpZQXbKpEbFXqKyc+
 LXa/BkHGcmqkLMaqG+GWgmFRxg6gyFjIMcE9gcFUCeqeEpMwm/0zyq/8OsNs9/EemK
 5+8AH/J1m34Qj3v/IJy9njRY9udfvNAoSOX6eieTTaX4bre5KKG4iJxvg9cYlBxuXQ
 GG4tb+go91/AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c5W3m+if
Subject: Re: [Buildroot] [PATCH 1/1] package/icu: disable icu-config for
 host package
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

Bernd, All,

On 2023-05-16 19:34 +0200, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/6a2/6a2a4ed90c1a829e7b9442aaaaa1cd6e5efd9aab/
> 
> python-pyicu picks up ldflags from host version of icu-config
> ---
> Building PyICU 2.10.2 for ICU 70.1 (max ICU major version supported: 72)
> 
> (running 'icu-config --cxxflags --cppflags')
> Adding CFLAGS="-std=c++11 -I/home/buildroot/autobuild/instance-1/output-1/host/include" from /home/buildroot/autobuild/instance-1/output-1/host/bin/icu-config
> (running 'icu-config --ldflags')
> Adding LFLAGS="-L/home/buildroot/autobuild/instance-1/output-1/host/lib -licui18n -licuuc -licudata" from /home/buildroot/autobuild/instance-1/output-1/host/bin/icu-config
> running build
> ---
> leading to linking errors:
> /home/buildroot/autobuild/instance-1/output-1/host/lib/libicui18n.so: file not recognized: file format not recognized
> 
> The icu-config script was deprecated upstream:
> https://unicode-org.github.io/icu/userguide/icu/howtouseicu.html#notes-on-icu-config
> 
> To fix the build error we do not install the host version anymore:
> ---
> Building PyICU 2.10.2 for ICU 70.1 (max ICU major version supported: 72)
> 
> (running 'icu-config --cxxflags --cppflags')
> Could not configure CFLAGS with icu-config
> (running 'pkg-config --cflags icu-i18n')
> (running 'icu-config --ldflags')
> Could not configure LFLAGS with icu-config
> (running 'pkg-config --libs icu-i18n')
> Adding LFLAGS="-licui18n -L/home/bernd/buildroot/output/per-package/python-pyicu/host/bin/../sh4-buildroot-linux-gnu/sysroot/usr/lib -licuuc -licudata" from /home/bernd/buildroot/output/per-package/python-pyicu/host/bin/pkg-config
> running build
> ---

But that would not fix the build of the host system itself has
icu-config in the PATH (for whatever reason).

I think the proper solution would be to make pyicu fully transition to
using pkg-config, e.g. with a patch like:

    diff --git a/setup.py b/setup.py
    index 176c9ab..961a7e9 100644
    --- a/setup.py
    +++ b/setup.py
    @@ -68,7 +68,7 @@ elif platform.startswith('freebsd'):
     
     CONFIGURE_WITH_ICU_CONFIG = {
         'darwin': False,
    -    'linux': True,
    +    'linux': False,
         'freebsd': False, # not tested
         'win32': False,   # no icu-config
         'sunos5': False,  # not tested

(which is just a cheap way to completely render the icu-config case
totally dead-code, as linux is the only platform where icu-config is
still used in pyicu).

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/icu/icu.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/icu/icu.mk b/package/icu/icu.mk
> index 8107796ae9..1f1dfea5bf 100644
> --- a/package/icu/icu.mk
> +++ b/package/icu/icu.mk
> @@ -48,6 +48,7 @@ ICU_CONF_ENV += ac_cv_func_strtod_l=no
>  endif
>  
>  HOST_ICU_CONF_OPTS = \
> +	--disable-icu-config \
>  	--disable-samples \
>  	--disable-tests \
>  	--disable-extras \
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
