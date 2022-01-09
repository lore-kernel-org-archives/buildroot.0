Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F1BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D389F404D4;
	Sun,  9 Jan 2022 22:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixfwDZpO38jv; Sun,  9 Jan 2022 22:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA8114045E;
	Sun,  9 Jan 2022 22:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D901C1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D554C60B74
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VI7RoLEwG7e7 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:35:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 033AF60B6A
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:35:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 85D6E5FF7A;
 Sun,  9 Jan 2022 23:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641767752;
 bh=CjmiPEGNF/hCBtwqAjsTnxrn+jEJyGLhfi1CNDu9+UE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DkpRT5J6/XdJiAMus98dMIKA6Vj5+aRzHWGBdx9+6+pUPGUXSG5GVK/ss+ffyPK96
 R/VZ52y5nuti+ZfbKSQ+6PCp/GIpjS0Dcgfi6NBzkWJ3+HDk2HkoRDvh7orCovd9w+
 Zs1PYihd9rJ6r0PCeeKJ8ShuNs787PZnRnY1A21pkQ6nHKkhYwsAtO8Tzhca0wixua
 bpbTamz6gik6TRi3jyweHh+JZP66BwchI8t/3F1/yjR6DgzT7TEB4RWpBnuTj7VDDU
 yD1haxroi0VqNWN7A3JspxccESVmiUN6LX7eEsuYoV9nK8wolaUcGyVs8MO+3uDz0Q
 myj/oSEvY8j2Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 23:35:48 +0100
Date: Sun, 9 Jan 2022 23:35:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220109223548.GL1477939@scaer>
References: <20220109221830.1343278-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109221830.1343278-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libvirt: drop C++ comment
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-09 23:18 +0100, Fabrice Fontaine spake thusly:
> Commit f81242ae4fb64ab85af5d38e70246222276552ae forgot to drop C++
> comment

Yeah, thanks for fixing my mess! :-)

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libvirt/Config.in | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index aeb560a498..5a6b067a0d 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -50,9 +50,6 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
>  	  Build the libvirt daemon (libvirtd) otherwise build only the
>  	  utility programs.
>  
> -comment "libvirtd needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP && !BR2_PACKAGE_NETCAT_OPENBSD
> -
>  # Stateful drivers are useful only when building the daemon.
>  if BR2_PACKAGE_LIBVIRT_DAEMON
>  
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
