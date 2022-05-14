Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D00EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 13:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27740400C1;
	Sat, 14 May 2022 13:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03oM5X2nJHah; Sat, 14 May 2022 13:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3537D404D1;
	Sat, 14 May 2022 13:14:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E34B01BF48C
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 13:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E030B60A99
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 13:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cYWl0CKrM9Ou for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 13:14:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC81460A7D
 for <buildroot@buildroot.org>; Sat, 14 May 2022 13:14:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 69CEF13F7F0;
 Sat, 14 May 2022 15:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652534084;
 bh=ra2+TfyY+Q1tNKieopPmi7OwxLfyopC888G5O5bw+yY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VVmM9hgxWSuWDoSpbTXTLO9hqQlbixEFa5InMCR8GZ13A/TkBGfol7/1awR/Kov+M
 EVzBNQclXQ1QgYLreKb1a/RtlnhdBIAcYPY4EdGPslx3oiMHAcob2inLyzsUCIaSgJ
 Ie6Owet85NB8d8FtNF35fGKmtMd8prGFSfkhBinSzpo7jsT4oktegC5BHNxTEbsUX6
 YEXZ/EkpX/a7GdT1qSy0DI+Q+4X1B7Mt8Iaitv9w1MhEsDkHwGR3AW4YIRvwGF0NPg
 W2foe3xLwyQAKy8+XrxUSZn+XbYeXIGVjPc/LHSMQUQ+EYHlnssPUZbnASAHUNMzqg
 MJICgN5FlW/gA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 May 2022 15:14:42 +0200
Date: Sat, 14 May 2022 15:14:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: s-ol <s+removethis@s-ol.nu>
Message-ID: <20220514131442.GY1597494@scaer>
References: <20220514124208.44912-1-s+removethis@s-ol.nu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220514124208.44912-1-s+removethis@s-ol.nu>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/usb_modeswitch: fix
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

s-ol, All,

On 2022-05-14 14:42 +0200, s-ol via buildroot spake thusly:
> The upstream Makefile failed to detect systemd being present in some (maybe all)
> builds, resulting in the unit file not being installed. Without the unit file,
> the udev rules in usb_modeswitch-data don't work as expected (no modeswitch is
> performed).
> 
> This commit adds a patch that modifies the Makefile to include
> '$(PREFIX)/bin/systemctl' in the list of paths checked, which makes the
> installation phase work as intended. I will also submit this patch upstream.
> 
> Signed-off-by: s-ol <s+removethis@s-ol.nu>

We'll need that you use you real name to sign-off your changes.

> ---
>  .../usb_modeswitch/0001-fix-systemd-detection.patch | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/usb_modeswitch/0001-fix-systemd-detection.patch
> 
> diff --git a/package/usb_modeswitch/0001-fix-systemd-detection.patch b/package/usb_modeswitch/0001-fix-systemd-detection.patch
> new file mode 100644
> index 0000000000..6d02c648eb
> --- /dev/null
> +++ b/package/usb_modeswitch/0001-fix-systemd-detection.patch

The patch itself should contain a commit log of its own, and must be
signed off too.

> @@ -0,0 +1,13 @@
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

This is not very clean, but this is in line with how the rest of the
Makefile is written, so this is OK for me.

Can you please resubmit using your your real name, please?

Regards,
Yann E. MORIN.

> + 
> + install: install-script
> + 
> -- 
> 2.36.1
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
