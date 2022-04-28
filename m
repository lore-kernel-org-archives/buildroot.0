Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125E0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 15:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A35AC6101C;
	Thu, 28 Apr 2022 15:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mEd9WLhVRnc; Thu, 28 Apr 2022 15:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5CCC60AFF;
	Thu, 28 Apr 2022 15:45:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABA9A1BF39D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A973C83403
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SV8L_p_Qswp8 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 15:45:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C834F8333E
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:45:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8d9a:c8d:7cf:ba48])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9A7AD7802E5;
 Thu, 28 Apr 2022 17:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651160751;
 bh=Zlrzejj3n6C+W9g7QVCzX781ZCU4HBAaRQzBaYjTeAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f1Qx0OupcZMXyI/C8CSc34rdR/xL2nVlZlFMTjMBlXXJ31d5yKsvplM1QJAl/ffUU
 xUkzOnmfLqm2u5dw8vaNCoy2WwWDYqtQaceOyOMNCIv17LohJbLpiIo3WJ5Ua9xMkW
 w51VH07KX3IpgHGZGZwKJ5KAJBI66iG8HnJbjdKaGR2pojQiut8+7t024Vs37zL4Hk
 /zCQSECZxUpRNJ0RguDnSrDAA5e/h3Bi4mHUGtt1GhDVP6jy6voMuFmAwuB7GOo5ac
 LV4R25J9SrNoIz3F0II53m/k6I2S7RJjbuPlKRXryCGKvWAocgQPgJkG1P0Cg4n8fY
 jCm6FBfiQlVOw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Apr 2022 17:45:49 +0200
Date: Thu, 28 Apr 2022 17:45:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Ehmanns <universeiii@gmx.de>
Message-ID: <20220428154549.GE3624965@scaer>
References: <20220428134207.16521-1-universeiii@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428134207.16521-1-universeiii@gmx.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/tftpd: add include of config
 file to init script
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

Andreas, All,

On 2022-04-28 15:42 +0200, Andreas Ehmanns spake thusly:
> HPA's tftp server init script does not support include of a
> configuration file. So changing daemon parameters would cause
> a modification of the init script.
> Similar to NFS, dropbear, DHCP, SNMP and other network services
> in buildroot, this patch adds an include of /etc/default/tftpd
> to the init script. So any user can change the default behaviour
> by adding its own configuration file instead of changing the init
> script.
> 
> Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tftpd/S80tftpd-hpa | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/tftpd/S80tftpd-hpa b/package/tftpd/S80tftpd-hpa
> index 4e8361faa7..8ae15150a1 100644
> --- a/package/tftpd/S80tftpd-hpa
> +++ b/package/tftpd/S80tftpd-hpa
> @@ -11,6 +11,8 @@ DAEMON=/usr/sbin/$NAME
>  PIDFILE=/var/run/$NAME.pid
>  SCRIPTNAME=/etc/init.d/S80tftpd-hpa
> 
> +[ -r "/etc/default/$NAME" ] && . "/etc/default/$NAME"
> +
>  #
>  #	Function that starts the daemon/service.
>  #
> --
> 2.26.2
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
