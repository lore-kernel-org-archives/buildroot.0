Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002D7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92B6F4004D;
	Sat, 31 Dec 2022 16:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92B6F4004D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8AetKYK-LFa; Sat, 31 Dec 2022 16:13:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74899400A3;
	Sat, 31 Dec 2022 16:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74899400A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21FD51BF47D
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F19EB402A8
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F19EB402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOJzjqlhRV7p for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:13:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CB894019E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CB894019E
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:13:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:37e6:2c2e:a294:8f1b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 70F4B13F87E;
 Sat, 31 Dec 2022 17:13:32 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Dec 2022 17:13:32 +0100
Date: Sat, 31 Dec 2022 17:13:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221231161332.GL2498764@scaer>
References: <20221231094935.245194-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231094935.245194-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672503215;
 bh=cXVsf+8qOobG/lMs/zphNSeaOUPWDZwhi26k7NIL7xk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jMs4Spccg4I1oGNtCsmAOpT8gO38L/bm5DoSD0WkPkJrKx9QWHWh99aoJOqb8/S3o
 /d4QVzbpTxvUa2ZjWdOlCcQz59uTW5FOBM9dAC53C9PUIhBawe9UlvplTwplOyxBSo
 wb8BwGCojTwll4flCfZI8Ow49vPazp/PWxsDWlIP3vXEI7Hhlv/EPayp07MIVUv4S9
 iSZYYYEqRdHcVynq2gWNw76whFN21lzaGLx260aVKAhXBt+wCoN1Kclry6zlKFX+5M
 KTP/HWNZelPa5a2YYQKYqqO6Hdu5kp89v7WeU7OXFR4mh3KWrYWE8pSv8Xz34zdDtg
 TMGRiNXGdZFGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jMs4Spcc
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/modem-manager: qrtr needs qmi
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
Cc: Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-31 10:49 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 1.20.2 in
> commit b95334b71fbdde0f7621b58ed35fa98df9e0966d:
> 
> ../output-1/build/modem-manager-1.20.2/meson.build:262:2: ERROR: Assert failed: QRTR support requires QMI enabled
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/04b9a41c5edbc492ef640b27d4d3d896d230cf34
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Select BR2_PACKAGE_MODEM_MANAGER_LIBQMI instead of BR2_PACKAGE_LIBQMI
> 
>  package/modem-manager/Config.in        | 12 ++++++++++++
>  package/modem-manager/modem-manager.mk |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index d211d68ee1..8489e6fc86 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -25,6 +25,18 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
>  	select BR2_PACKAGE_LIBQMI
>  	help
>  	  This option enables support for QMI protocol
> +
> +config BR2_PACKAGE_MODEM_MANAGER_LIBQRTR
> +	bool "QRTR support"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # libqrtr-glib
> +	select BR2_PACKAGE_LIBQRTR_GLIB
> +	select BR2_PACKAGE_MODEM_MANAGER_LIBQMI
> +	help
> +	  This option enables support for QRTR protocol
> +
> +comment "QRTR support needs a toolchain w/ headers >= 4.15"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
> +
>  endif
>  
>  comment "modemmanager needs a toolchain w/ wchar, threads"
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 8a0dbba3a4..8ef85b9b1d 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -37,7 +37,7 @@ else
>  MODEM_MANAGER_CONF_OPTS += -Dmbim=false
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
> +ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQRTR),y)
>  MODEM_MANAGER_DEPENDENCIES += libqrtr-glib
>  MODEM_MANAGER_CONF_OPTS += -Dqrtr=true
>  else
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
