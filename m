Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB3DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D93D41846;
	Sat, 16 Jul 2022 22:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D93D41846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cw_EUdlFgszt; Sat, 16 Jul 2022 22:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B494183B;
	Sat, 16 Jul 2022 22:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1B494183B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C3291BF3D0
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06B33847B1
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B33847B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yv56o5qT6Gkt for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:06:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1600984794
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1600984794
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:06:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1BC59780513;
 Sun, 17 Jul 2022 00:06:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 00:06:10 +0200
Date: Sun, 17 Jul 2022 00:06:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220716220610.GO2543@scaer>
References: <20220714093615.632188-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220714093615.632188-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658009174;
 bh=D95IalyDS6c6AL8nzUW5KrkWHcGQSFWrZbDZHxbyCCM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NVhuxeaM9FJIEGtFGNYZVN/8fjK9kTlddCqt+q+0AR6mkqDm+uIiT7Fe4ANMJQydw
 qcrHoKDQZ+IsupocerownHuauaDoFd52od3SMmJgPj0u6ySrRYAXzw40/JQFux3Omf
 YdiXYlknI8RUvPcxF1hKQdz5XDV7M57AhwCoYs54Q4XwPbiltP/ECaoK/bPpxnSR9I
 rMz6DICjpYglwUSCtMhVSGyg5bTdK+hagcbZ7LDwhN9UJlhhn8OnLmzTg4PfLjNdx8
 oicWEm8huSK6x2/jOw56woyGyAVDx3219SnPQHqifneG6zubwM1OKnLpgfD7nvMMwE
 Jbo3b/unVTQ6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NVhuxeaM
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: fix build with musl 1.2.3
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-07-14 11:36 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with musl 1.2.3:
> 
> ola/AutoStart.cpp: In function 'ola::network::TCPSocket* ola::client::ConnectToServer(short unsigned int)':
> ola/AutoStart.cpp:116:12: error: invalid cast from type 'std::nullptr_t' to type 'char*'
>   116 |            reinterpret_cast<char*>(NULL));
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/88be323e64f66433cabc962e719307b5fb6a6177
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-ola-fix-compilation-with-musl-1-2-3.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch
> 
> diff --git a/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch b/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch
> new file mode 100644
> index 0000000000..f236ef0957
> --- /dev/null
> +++ b/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch
> @@ -0,0 +1,35 @@
> +From eb31017284f9a1c95602a9c06d606df6b558a691 Mon Sep 17 00:00:00 2001
> +From: Rosen Penev <rosenp@gmail.com>
> +Date: Thu, 14 Apr 2022 17:39:32 -0700
> +Subject: [PATCH] ola: fix compilation with musl 1.2.3
> +
> +musl 1.2.3 defines NULL as nullptr. cannot use reinterpret_cast with
> +nullptr.
> +
> +Signed-off-by: Rosen Penev <rosenp@gmail.com>
> +[Retrieved from:
> +https://github.com/OpenLightingProject/ola/pull/1773/commits/eb31017284f9a1c95602a9c06d606df6b558a691]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + ola/AutoStart.cpp | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/ola/AutoStart.cpp b/ola/AutoStart.cpp
> +index 89fa51f115..4dbe20d317 100644
> +--- a/ola/AutoStart.cpp
> ++++ b/ola/AutoStart.cpp
> +@@ -110,11 +110,11 @@ TCPSocket *ConnectToServer(unsigned short port) {
> +     // Try to start the server, we pass --daemon (fork into background) and
> +     // --syslog (log to syslog).
> +     execlp("olad", "olad", "--daemon", "--syslog",
> +-#ifdef __FreeBSD__
> +-           reinterpret_cast<char*>(0));
> ++#if __cplusplus >= 201103L
> ++           nullptr);
> + #else
> +            reinterpret_cast<char*>(NULL));
> +-#endif  // __FreeBSD__
> ++#endif  // __cplusplus >= 201103L
> +     OLA_WARN << "Failed to exec: " << strerror(errno);
> +     _exit(1);
> +   }
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
