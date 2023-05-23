Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B864CC7EE23
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 21:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4841741DB7;
	Tue, 23 May 2023 21:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4841741DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIrEAFXnD9Ta; Tue, 23 May 2023 21:19:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1A2841DA4;
	Tue, 23 May 2023 21:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1A2841DA4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 316C51BF36C
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 21:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AD9560AF2
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 21:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD9560AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92cbtIRkpzOf for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 21:18:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F403760A65
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F403760A65
 for <buildroot@buildroot.org>; Tue, 23 May 2023 21:18:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:1b02:4e3:83be:ab2e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id EF75519F54D;
 Tue, 23 May 2023 23:18:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 May 2023 23:18:51 +0200
Date: Tue, 23 May 2023 23:18:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Colin Foster <colin.foster@in-advantage.com>
Message-ID: <20230523211851.GL621937@scaer>
References: <20230523172120.1948573-1-colin.foster@in-advantage.com>
 <20230523172120.1948573-3-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523172120.1948573-3-colin.foster@in-advantage.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684876735;
 bh=rpROgt2XsqzWySDMLjD0OVufctE5XwJUrt35mKBcdVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T5Cku1qJCEYGb0dq1/4YBTicaJkPWztLMMbZb0is4oWauRXh1xNzMiKM7p5A4b9I7
 5J4fW1qAZvX22QwBbzSQVuy1ycb5jNQCJJ7pL/tWyN1Tc1R4BPI4EPME4toiRkUcec
 OYW+d4VkGs1oBf7aphz+/V9rvUsOWFq0OmuPul/vZbaIAva0x1b1ul/FuygjZS8thu
 frK1P//qYK5uohkTK6aSNYMFlDU3SwT2/0t8zkXTF8wgOtFmCEN6mifuHMjmuN3aVk
 dlj9kiC36oLUcMBvioLDhcR6WSbIg25CJg0Kd7bVhxJUIzt7HyC7WShhPYeocPzJ4B
 NTmNn7x3zUrbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T5Cku1qJ
Subject: Re: [Buildroot] [v1 2/2] bootpc: add dhcp-like configuration ability
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Colin, All,

On 2023-05-23 10:21 -0700, Colin Foster spake thusly:
> bootpc only works on interfaces that are up. If BOOTP is desired to get
> an IP address to a running kernel, bootpc won't work.
> 
> This scenario was brought up as a bug in Debian forums [1] in 2007. The
> response was to run the attached script to bring up the network without
> an IP address. Sure enough, it still works!
> 
> Implement this bootpc script to allow IP configuration by way of
> "iface eth0 inet bootp" in /etc/network/interfaces.

Can't one just use a pre-up command ?

    iface eth0 inet bootp
        pre-up ip l set dev eth0 up
        pre-up ip r add default dev eth0
        post-up ip r del default dev eth0

Not sure that would work, but maybe worth a try?

> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=436443
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Ditto as for patch 1/2: run check-package.

[--SNIP--]
> diff --git a/package/bootpc/bootpc.mk b/package/bootpc/bootpc.mk
> index d3c5ce5198..ebd7490ea1 100644
> --- a/package/bootpc/bootpc.mk
> +++ b/package/bootpc/bootpc.mk
> @@ -8,12 +8,28 @@ BOOTPC_VERSION = 80c0811dc69f9f3923661be4f9f9c09a44313f62
>  BOOTPC_SITE_METHOD = git
>  BOOTPC_SITE = https://salsa.debian.org/debian/bootpc.git
>  
> +ifeq ($(BR2_PACKAGE_BOOTPC_FULL_CONFIG),y)
> +BOOTPC_TARGET_BIN_NAME = bootpc-bin
> +else
> +BOOTPC_TARGET_BIN_NAME = bootpc
> +endif
> +
>  define BOOTPC_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) PROG=$(BOOTPC_TARGET_BIN_NAME) -C $(@D) all

Please keep lines below the ~80 char limit, e.g.:

        $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
            -C $(@D) \
            PROG=$(BOOTPC_TARGET_BIN_NAME) \
            all

(I like to see '-C $(@D)' to be the first thing right after the call to
make).

> +endef
> +
> +ifeq ($(BR2_PACKAGE_BOOTPC_FULL_CONFIG),y)
> +define BOOTPC_INSTALL_CONFIG_SCRIPT
> +	$(INSTALL) -m 0755 $(BR2_EXTERNAL_BR2INADVANTAGE_PATH)/package/bootpc/bootpc_dhcp_script $(TARGET_DIR)/sbin/bootpc
> +endef
> +else
> +define BOOTPC_INSTALL_CONFIG_SCRIPT ""
>  endef

No need to define an empty macro.

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
