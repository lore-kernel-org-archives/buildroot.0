Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF84BC87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 06:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59E98615BE;
	Tue,  5 Aug 2025 06:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UC2cz22pCY8l; Tue,  5 Aug 2025 06:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 830E2615F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 830E2615F0;
	Tue,  5 Aug 2025 06:36:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71874233
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F7B4615F5
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIwcGFNuT6Zx for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 06:36:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33A3661536
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A3661536
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33A3661536
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:36:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.178]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGr8-1v95Br0AHu-00Ujlm; Tue, 05
 Aug 2025 08:36:21 +0200
Date: Tue, 5 Aug 2025 08:36:20 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250805083620.377ca220@pc-1.fritz.box>
In-Reply-To: <20250805063158.94884-2-ps.report@gmx.net>
References: <20250805063158.94884-1-ps.report@gmx.net>
 <20250805063158.94884-2-ps.report@gmx.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:NzF6RhCZ+BSECZD4LXpvijjpp3psoIioFzr5ZYX7kuAUkITOoZv
 PZN++P0xAn6V5gg8LOW3YJc1pXbH33SlD2M16gpSPO98hy2c+vz4LTO5tKv+5oEmOoZKdsr
 C0Jh/YgesLBGCtcGddYdDNXnkMemaKZACgcAhM5sRizgLUpKJE2mnGYD151ALrvkdnsnrdB
 Net1hTMm11eLWtG8yPZlw==
UI-OutboundReport: notjunk:1;M01:P0:eTYGmugZzZk=;BROtnGyhiAQpl6wh+4hPD7vHXNQ
 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
 t2P7ZuWRzFVTlg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754375781; x=1754980581; i=ps.report@gmx.net;
 bh=3bLhkaJk8254ONJdLl/jidM2tMfafqB6K6vjC1ZFUg4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HJ4b0dUpc6Qdo6C8SDZy3TrG+ToCgV8lzWHNEOXq2rShBypRLQHSBF35ebJNW062
 Y4siaDtpRkovec2823p3qM3H+/a1ZO11pZdalTZn7b1Sm7ke15XxrLo+VlcGpvc63
 HtmHXOVRS0g9D1ZxrOaRl5xMw/2WGmsPVfKreNPI3i/t8swln4iA2wCfvNG5294lM
 bTL/Xhyq8ia2naXRGLO0GUBiJ0WtCLjRdi9y7lXQhEm6NqIqxOEd5tx5xwrcpeN9x
 gwBhTYZkIeiJezcbOzOwW4iyDaDegwL2zA2sfS21B4fvO4hiAwfD3tpik8d/ymjX+
 igZbPoRf/n7N4LUxBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=HJ4b0dUp
Subject: Re: [Buildroot] [PATCH v1 2/2] package/iwd: suppress S40iwd
 shellcheck warnings
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  5 Aug 2025 08:31:58 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> - suppress S40iwd shellcheck warnings:
> 
>   In package/iwd/S40iwd line 8:
>   [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
>                                      ^--------------------^ SC1090 (warning): ShellCheck can't follow non-constant source. Use a directive to specify location.
> 
>   In package/iwd/S40iwd line 15:
>   		-- $IWD_ARGS
>                      ^-------^ SC2086 (info): Double quote to prevent globbing and word splitting.
> 
> - remove package/iwd/S40iwd from .checkpackageignore
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Fix .checkpackageignore

Sorry, one line leftover from squashing..., will send v2 with this fixed...

Regards,
Peter

> ---
>  .checkpackageignore | 1 -
>  package/iwd/S40iwd  | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 7697fd2ea1..7a5260b1b1 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -584,7 +584,6 @@ package/irqbalance/S13irqbalance Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch lib_patch.Upstream
>  package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch lib_patch.Upstream
>  package/iucode-tool/S00iucode-tool lib_sysv.Variables
> -package/iwd/S40iwd Shellcheck
>  package/janus-gateway/0001-disable-ssp.patch lib_patch.Upstream
>  package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
>  package/keyutils/0001-fix-install-rule.patch lib_patch.Upstream
> diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
> index de5a1efb6f..33e7fb7f4e 100644
> --- a/package/iwd/S40iwd
> +++ b/package/iwd/S40iwd
> @@ -5,8 +5,10 @@ PIDFILE="/var/run/$DAEMON.pid"
>  
>  IWD_ARGS=""
>  
> +# shellcheck source=/dev/null
>  [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
>  
> +# shellcheck disable=SC2086
>  start() {
>  	printf 'Starting %s: ' "$DAEMON"
>  	mkdir -p /tmp/iwd/hotspot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
