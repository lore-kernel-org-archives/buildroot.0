Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01BDC04A68
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA4782B08;
	Fri, 29 Jul 2022 20:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA4782B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8z2oJ3O1jrWf; Fri, 29 Jul 2022 20:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B086823C6;
	Fri, 29 Jul 2022 20:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B086823C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 108EB1BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E04F460601
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E04F460601
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGx5Nxj1WNPe for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:51:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3AA7605C9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3AA7605C9
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 20:51:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d054:eb09:eac4:da7e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0376213F88A;
 Fri, 29 Jul 2022 22:51:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Jul 2022 22:51:18 +0200
Date: Fri, 29 Jul 2022 22:51:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220729205118.GD1554632@scaer>
References: <20220727221217.1072588-1-arnout@mind.be>
 <20220727221217.1072588-2-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727221217.1072588-2-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659127882;
 bh=ind9QNI/XD/GZ8a8FD3H+kGJ5ohanB9iTgduL9TAgq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f/puMJkoDFyLx9BDT7ua57v51u+PSXSmcKg9VYAImowkbt9Cz7mR3XD4Wx2pjr0Uk
 wyOVZQOKNjB+B42C/Fw9LNDc50j+13n5l+7GI6mY87Z550nV7RWcyWB5EE2l8semv8
 wqBAYRdFoKU5nZ7mHWTXyb/CGinLCXOWR9cxF01DBPbFb2PiGDT8zG26UBOU++WvjS
 HKKprcLzwvk0mcD8OFlRFNzeCFh/N9/bic758Fng0yTdOW//FaGZxyxskAOoaABAFU
 ug7DOekNEO6VLWrugX/swzasOtSFfoRWWTm4TvjkF5hFKHAa6gZyRCQMYrplNXR6Sx
 qhXJcU1SfIDlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f/puMJko
Subject: Re: [Buildroot] [PATCH 2/2] docs/manual: add integration section
 for systemd with dbus
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

On 2022-07-28 00:12 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Add a section to the "Integration topics" chapter about how we integrate
> systemd. Add a first subsection about how dbus and dbus-broker work with
> systemd.
> 
> This is just the start of the integration information about systemd.

Thanks!

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/integration-systemd.txt | 27 +++++++++++++++++++++++++++
>  docs/manual/integration.txt         |  2 ++
>  2 files changed, 29 insertions(+)
>  create mode 100644 docs/manual/integration-systemd.txt
> 
> diff --git a/docs/manual/integration-systemd.txt b/docs/manual/integration-systemd.txt
> new file mode 100644
> index 0000000000..44248b43ff
> --- /dev/null
> +++ b/docs/manual/integration-systemd.txt
> @@ -0,0 +1,27 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +[[integration-systemd]]
> +=== Systemd
> +
> +This chapter describes the decisions taken in Buildroot's integration of
> +systemd, and how various use cases can be implemented.
> +
> +==== DBus daemon
> +
> +Systemd requires a DBus daemon. There are two options for it: traditional dbus
> +(+BR2_PACKAGE_DBUS+) and bus1 dbus-broker (+BR2_PACKAGE_DBUS_BROKER+). At
> +least one of them must be chosen. If both are included in the configuration,
> +dbus-broker will be used as system bus, but the traditional dbus-daemon is
> +still installed as well and can be used as session bus. Also its tools (e.g.
> ++dbus-send+) can be used (systemd itself has +busctl+ as an alternative). In
> +addition, the traditional dbus package is the only one that provides +libdbus+,
> +which is used by many packages as dbus integration library.
> +
> +Both in the dbus and in the dbus-broker case, the daemon runs as user +dbus+.
> +The DBus configuration files are also identical for both.
> +
> +To make sure that only one of the two daemons is started as system bus, the
> +systemd activation files of the dbus package (+dbus.socket+ and the
> ++dbus.service+ symlink in +multi-user.target.wants+) are removed when
> +dbus-broker is selected.
> diff --git a/docs/manual/integration.txt b/docs/manual/integration.txt
> index bdfbfa59de..be56bf6567 100644
> --- a/docs/manual/integration.txt
> +++ b/docs/manual/integration.txt
> @@ -9,4 +9,6 @@ level. Buildroot is highly configurable, almost everything discussed
>  here can be changed or overridden by xref:rootfs-custom[rootfs overlay
>  or custom skeleton] configuration.
>  
> +include::integration-systemd.txt[]
> +
>  include::integration-selinux-support.txt[]
> -- 
> 2.35.3
> 

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
