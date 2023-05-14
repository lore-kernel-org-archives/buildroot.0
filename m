Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3D2C7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 09:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A615A60F0E;
	Sun, 14 May 2023 09:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A615A60F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEaUxC5pRQD7; Sun, 14 May 2023 09:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEEBF60E44;
	Sun, 14 May 2023 09:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEEBF60E44
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B84E1BF5DB
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 09:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2365460E44
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 09:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2365460E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzx1KN3Ad85X for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 09:55:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A517660E0A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A517660E0A
 for <buildroot@buildroot.org>; Sun, 14 May 2023 09:55:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F37EBB0054E;
 Sun, 14 May 2023 11:55:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 11:55:21 +0200
Date: Sun, 14 May 2023 11:55:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20230514095521.GS2582048@scaer>
References: <20230514053519.DFFD840B98@smtp2.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230514053519.DFFD840B98@smtp2.osuosl.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684058125;
 bh=4HrRH7+1tKWq8m56peWW7ialR4WINShBRb5GTinr444=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R+D2Lmux30yykNHHVmIqCPLPhd2SXveZs1ZWJ9ZNlyE0Pot/h8pzqvUf93LE4lLlD
 FvRvLtgh4JlrtAUh/+z52il1wTTfCfg3GtPDtGdKWLS2NjLXZgghXrkHIVjFGg4+UQ
 is0ROD4nIrI0Qq8b8yB731rxrET0OhIoqNp5d0QJUjpw7aBIlDYq3Bmu3TnJ7uJavm
 sXxUSU2a5oLtcjqlOD6WPtU3bX2ED7zx3vRWyVZ62h6a9EwvPaesYaoZuJ3ToDt8Uo
 26oClZgCbrTIXC/+Ep7L51COcCz7r55vT4UsNh0LKJxvxjQUM0E5AdQ/yavcWxT57T
 IAOkSfrMsiycQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R+D2Lmux
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2023-05-13
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

Hello James, Eric, All,

On 2023-05-14 05:35 -0000, Thomas Petazzoni via buildroot spake thusly:
>    s390x     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/4f6f3455f4d10d0643b1d33b5d708cf1d82f4239 |     
>   aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/500db917497caa8cf57bb1e1e9b1a437e7c35062 |     
>   sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/fba51e375bff1ed4a17b6a970ae699837d9edcbb |     
>    mipsel    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/aacf81b5defa8964496b6fe38d3a492e29ac6e89 |     
>    mipsel    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/3ead1a02eb29d25e6676d7452e7f75c40a15f85a |     

We've been having those build failures for a while now: rust does not
build if libz is not installed system-wide:

       = note: /usr/bin/ld: cannot find -lz
               collect2: error: ld returned 1 exit status

         Building [=======================> ] 297/300: rustc_driver
    error: could not compile `rustc_driver` due to previous error

However, we do build host-libz:

    $ ls -l outut/host/lib/libz.*
    -rw-r--r-- 1 ymorin ymorin 128406 May 14 10:37 outut/host/lib/libz.a
    lrwxrwxrwx 1 ymorin ymorin     14 May 14 10:37 outut/host/lib/libz.so -> libz.so.1.2.13
    lrwxrwxrwx 1 ymorin ymorin     14 May 14 10:37 outut/host/lib/libz.so.1 -> libz.so.1.2.13
    -rwxr-xr-x 1 ymorin ymorin 109784 May 14 10:37 outut/host/lib/libz.so.1.2.13

This is because our HOST_LDFLAGS are somehow not passed down to the
host-rust build, even though they do contain the proper -L and -rpath
flags:

    $ jq .HOST_LDFLAGS <output/vars.json
    {
      "expanded": "-L/home/ymorin/dev/buildroot/buildroot/master/output/host/lib -Wl,-rpath,/home/ymorin/dev/buildroot/buildroot/master/foo/host/lib",
      "raw": "-L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib"
    }

I could not find an obvious way to pass those flags down, so it would be
great if you could have a look...

The failure is easy to rperoduce:

    $ wget -O .config http://autobuild.buildroot.org/results/fba51e375bff1ed4a17b6a970ae699837d9edcbb/config
    $ ./utils/docker-run make olddefconfig
    $ ./utils/docker-run make host-rust

Regards,
Yann E. MORIN.

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
