Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EB7C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 886778176E;
	Sun, 29 Jan 2023 16:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 886778176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0yXqMXGf5vn; Sun, 29 Jan 2023 16:30:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15A8381771;
	Sun, 29 Jan 2023 16:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15A8381771
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD0961BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3B6B60B79
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B6B60B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INehp4QiCUie for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:30:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B938A6009C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B938A6009C
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:30:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6E12C5FFA3;
 Sun, 29 Jan 2023 17:30:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 17:30:29 +0100
Date: Sun, 29 Jan 2023 17:30:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230129163029.GK2632@scaer>
References: <20230129021756.2845959-1-vfazio@xes-inc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129021756.2845959-1-vfazio@xes-inc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675009835;
 bh=nJeoCRSh8kIvg9An5jLKlSd2CO3FJthj5xPaWIgv/Mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=il1XjoFJVg9sqfXHM7vDDOIqntTkDAbwiLJzFEgFX6iuIfDvliiRq9q++akn5YCF/
 5H6awEvuUluyy7IedCcAfM3v8/Mkcf8kLbFfAyvVYfqUEVWBJWuvM1GKLzn5yIpaz6
 YwMfo84XSt7C6rEB+WOnm8OCGmPkmAXEiNTY5ULHIcafgUlc4No2FnjxhHAOo712PN
 fO9fG1bZd2h7pSS+R7Y/jUETMryHjvaI0IEgzFo+a7f2oqh0D7u7wu68x8lTgrIA5x
 HDUBER8rslNxdr+H6ZekDpu3Kt0OCC5DOmdpJtW8TbvweHcFcDPISpJ4hEvWFn3M0F
 NaftJ1poKUdLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=il1XjoFJ
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: fix musl-libc builds
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2023-01-28 20:17 -0600, Vincent Fazio spake thusly:
> Upstream commit 1fa60003a8b8 made a change to headers that broke
> compiles for musl-libc based builds.
> 
> Apply the patch slated to address the issue.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/eafd07dddfe7e8b714fc3fcaf77a2d7150694ee2/
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...2-marvell.c-Fix-build-with-musl-libc.patch | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch
> 
> diff --git a/package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch b/package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch
> new file mode 100644
> index 0000000000..f13edbbe50
> --- /dev/null
> +++ b/package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch
> @@ -0,0 +1,71 @@
> +From a26296eea68aa6c16b253f34825c9b9007269672 Mon Sep 17 00:00:00 2001
> +From: Florian Fainelli <f.fainelli@gmail.com>
> +Date: Sat, 14 Jan 2023 08:34:11 -0800
> +Subject: [PATCH] marvell.c: Fix build with musl-libc
> +
> +After commit 1fa60003a8b8 ("misc: header includes cleanup") we stopped
> +including net/if.h which resolved the proper defines to pull in
> +sys/types.h and provide a definition for u_int32_t. With musl-libc we
> +would need to define _GNU_SOURCE to ensure that sys/types.h does provide a
> +definition for u_int32_t.
> +
> +Rather, just replace u_uint{16,32}_t with the more standard
> +uint{16,32}_t types from stdint.h
> +
> +Fixes: 1fa60003a8b8 ("misc: header includes cleanup")
> +Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> +
> +[Upstream: https://patchwork.kernel.org/project/netdevbpf/patch/20230114163411.3290201-4-f.fainelli@gmail.com/]
> +Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> +---
> + marvell.c | 34 +++++++++++++++++-----------------
> + 1 file changed, 17 insertions(+), 17 deletions(-)
> +
> +diff --git a/marvell.c b/marvell.c
> +index d3d570e..3f3aed8 100644
> +--- a/marvell.c
> ++++ b/marvell.c
> +@@ -31,23 +31,23 @@ static void dump_timer(const char *name, const void *p)
> + static void dump_queue(const char *name, const void *a, int rx)
> + {
> + 	struct desc {
> +-		u_int32_t		ctl;
> +-		u_int32_t		next;
> +-		u_int32_t		data_lo;
> +-		u_int32_t		data_hi;
> +-		u_int32_t		status;
> +-		u_int32_t		timestamp;
> +-		u_int16_t		csum2;
> +-		u_int16_t		csum1;
> +-		u_int16_t		csum2_start;
> +-		u_int16_t		csum1_start;
> +-		u_int32_t		addr_lo;
> +-		u_int32_t		addr_hi;
> +-		u_int32_t		count_lo;
> +-		u_int32_t		count_hi;
> +-		u_int32_t               byte_count;
> +-		u_int32_t               csr;
> +-		u_int32_t               flag;
> ++		uint32_t		ctl;
> ++		uint32_t		next;
> ++		uint32_t		data_lo;
> ++		uint32_t		data_hi;
> ++		uint32_t		status;
> ++		uint32_t		timestamp;
> ++		uint16_t		csum2;
> ++		uint16_t		csum1;
> ++		uint16_t		csum2_start;
> ++		uint16_t		csum1_start;
> ++		uint32_t		addr_lo;
> ++		uint32_t		addr_hi;
> ++		uint32_t		count_lo;
> ++		uint32_t		count_hi;
> ++		uint32_t		byte_count;
> ++		uint32_t		csr;
> ++		uint32_t		flag;
> + 	};
> + 	const struct desc *d = a;
> + 
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
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
