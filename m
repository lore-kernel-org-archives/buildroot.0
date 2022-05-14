Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22698C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C5D60E0F;
	Sat, 14 May 2022 21:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6m5JeOl3FdPp; Sat, 14 May 2022 21:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C740D60D5C;
	Sat, 14 May 2022 21:54:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 280381BF616
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2521F81D0C
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cK34b-ZZdhxG for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:54:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9968281B52
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:54:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1949:2e37:e3d5:26d2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D16A15FF27;
 Sat, 14 May 2022 23:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652565238;
 bh=hNJqywMi17TVATdoVWFp+XcUx2F+vAZL0O7qXGfoOKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CYyJEtktTCxTpWTJLr5IwBr084XAt3vhHkX1Heu1gKS3VWjRXf1PmP9x3nNyDLdqL
 qT3+I3TyHv1aLtrtgDVYLEjxz/hLMa+9ZlzTy6kyIrgGuV7h68wtPGZPSo1csN7Tcq
 E1azvs/70aNFt8yClbVL7ouqNC0DSFFqL1FQdyi3W7eyVI6GecKoIaNBLdtpm/AiqD
 YAbS7eC7s0UsunEP//aDIay47fdfGKQVsP6H+BSbPGN3T2qU+lKnZ36plvN9Ha19J5
 29F7I4Urj+WL5HhgGKxR8Og3PT+B7INRK0Z+E8TfhrZAtA/Tk3Btx2iA2pdQ2XH3FR
 DitVO0TpCJJKw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 May 2022 23:53:55 +0200
Date: Sat, 14 May 2022 23:53:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sol Bekic <s+removethis@s-ol.nu>
Message-ID: <20220514215355.GE1597494@scaer>
References: <20220514131442.GY1597494@scaer>
 <20220514142659.70948-1-s+removethis@s-ol.nu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220514142659.70948-1-s+removethis@s-ol.nu>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/usb_modeswitch: fix
 installation of systemd unit file
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

On 2022-05-14 16:26 +0200, Sol Bekic spake thusly:
> From: s-ol <s+removethis@s-ol.nu>
> 
> The upstream Makefile failed to detect systemd being present in some (maybe all)
> builds, resulting in the unit file not being installed. Without the unit file,
> the udev rules in usb_modeswitch-data don't work as expected (no modeswitch is
> performed).
> 
> This commit adds a patch that modifies the Makefile to include
> '$(PREFIX)/bin/systemctl' in the list of paths checked, which makes the
> installation phase work as intended. I will also submit this patch upstream.
> 
> Signed-off-by: Sol Bekic <s+removethis@s-ol.nu>
> ---
> As requested by Yann E. Morin, both this patch and the patch-file it adds
> are commented and signed off with my full name.

Thanks. I also amended the authorship to use your full name too.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  .../0001-fix-systemd-detection.patch           | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/usb_modeswitch/0001-fix-systemd-detection.patch
> 
> diff --git a/package/usb_modeswitch/0001-fix-systemd-detection.patch b/package/usb_modeswitch/0001-fix-systemd-detection.patch
> new file mode 100644
> index 0000000000..d0b3e80aeb
> --- /dev/null
> +++ b/package/usb_modeswitch/0001-fix-systemd-detection.patch
> @@ -0,0 +1,18 @@
> +Modify the Makefile to include '$(PREFIX)/bin/systemctl' in the list of paths.
> +This makes the udev intgeration work as intended when using systemd.
> +
> +Signed-off-by: Sol Bekic <s+removethis@s-ol.nu>
> +
> +diff --git a/Makefile b/Makefile
> +index 22bd0e0..72321a4 100755
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -62,7 +62,7 @@
> +	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
> +	install -d $(DESTDIR)/var/lib/usb_modeswitch
> +	test -d $(UPSDIR) -a -e /sbin/initctl && install --mode=644 usb-modeswitch-upstart.conf $(UPSDIR) || test 1
> +-	test -d $(SYSDIR) -a \( -e /usr/bin/systemctl -o -e /bin/systemctl \) && install --mode=644 usb_modeswitch@.service $(SYSDIR) || test 1
> ++	test -d $(SYSDIR) -a \( -e /usr/bin/systemctl -o -e /bin/systemctl -o -e $(PREFIX)/bin/systemctl \) && install --mode=644 usb_modeswitch@.service $(SYSDIR) || test 1
> + 
> + install: install-script
> + 
> -- 
> 2.36.1
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
