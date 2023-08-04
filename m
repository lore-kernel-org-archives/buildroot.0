Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB697C001DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 17:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42738400B9;
	Fri,  4 Aug 2023 17:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42738400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ohPYyGoVGp9u; Fri,  4 Aug 2023 17:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FB514029F;
	Fri,  4 Aug 2023 17:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FB514029F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 732561BF33A
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 17:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3432983A7C
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 17:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3432983A7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0W3jkp93YAc0 for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 17:21:21 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AE1980BE7
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 17:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AE1980BE7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:1259:ded8:9ad6:1294])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0E3002003D0;
 Fri,  4 Aug 2023 19:21:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 04 Aug 2023 19:21:13 +0200
Date: Fri, 4 Aug 2023 19:21:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230804172113.GQ421096@scaer>
References: <20230804160258.3918831-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804160258.3918831-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691169678;
 bh=AZ7p4aLnM2Fsb+cict1I/NGV09/3MfTrM7HYAQ588Ec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vCOk2ERrNbZjyyypsd9aScd/mL6DU0GvA1CjL7jmmj8HOx1lGgXY3YSCENI5aFtEj
 MraLLHiTcKzqfnQwcOdGcN2+ZWaFSHNJgrfs5hNhL29iU37l04Sq3SkzpUwAy3tWI5
 uQLZp3KCxMQPLnGHwwgsut67ZBqh/XigxIn4w7EOwcJq//NSeDTY0SPZtnFSJlcM8E
 eWZLkw7X4o89NXjJqho+nesHfjH+pnhQmc7j3Esm2/7KMeYccsEh6lyZahhexy/W3U
 rTq0ixBoUFeHJ8w1O0MXmqLyaYDOCA80X2WsuMm+UndJp99mrduDYMSC9QIpdtT4Cf
 XmGQM626I8BDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vCOk2ERr
Subject: Re: [Buildroot] [PATCH 1/1] package/arp-scan: don't install package
 data
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-08-04 18:02 +0200, Dario Binacchi spake thusly:
> The patch only installs the executables (less than 100kb) saving 1.4Mb
> of rootfs data.
> 
> The list of what is no longer being installed:
> - arp-fingerprint.1 -> /usr/share/man/man1
> - arp-scan.1        -> /usr/share/man/man1
> - get-oui.1         -> /usr/share/man/man1
> - ieee-oui.txt      -> /usr/share/arp-scan
> - mac-vendor.txt    -> /etc/arp-scan
> - mac-vendor.5      -> /usr/share/man/man5

The man stuff will get removed automatically by Buildroot in the
target-finalize step, so that's not a concern that they get installed.

Plus see below...

> 
> Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/arp-scan/arp-scan.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
> index 89644be9d3ef..1c1bd34882ea 100644
> --- a/package/arp-scan/arp-scan.mk
> +++ b/package/arp-scan/arp-scan.mk
> @@ -23,4 +23,6 @@ else
>  ARP_SCAN_CONF_OPTS += --without-libcap
>  endif
>  
> +ARP_SCAN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec

I think we want an option that makes the installation of that data
optional. Since that was installed so far, the option should default to
'y' for legacy purposes:

    config BR2_PACKAGE_ARP_SCAN_DATA
        bool "install data (OUI)"
        default y  # legacy

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
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
