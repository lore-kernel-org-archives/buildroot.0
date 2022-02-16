Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A699AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ADE640157;
	Wed, 16 Feb 2022 21:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-TFCu1IKWSN; Wed, 16 Feb 2022 21:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 346F7403C4;
	Wed, 16 Feb 2022 21:13:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F8131BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AD2F416ED
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1HL0nk4thgJd for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:13:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 490A3416DC
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:13:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9933:bb4:98b5:c594])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9AC38B00565;
 Wed, 16 Feb 2022 22:13:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645046027;
 bh=WOPDX5owoLlpD4Lv0XN48yKE6FEznJH4S1/718evt2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I8eEH2QsYlPc6IznMqLwQz2qQjBGcnqnrvQY0e0B/ArnGZEWfuJnLDYXoph4x6YZ1
 FcGYHTrFvlvz4VNsnd2mMDaXd8SWdMyCES5FZ3ojzKtqUEZAHYqXlFLndOccAc7r2q
 Xz7hEU9CxkIDJhP0CXb/lbcLhcWpaTYdyHU0B6iKqTlSRiThsiPShlGXszBaTugzAf
 +wdkMthfOA4EbXIBlK+Bmf7sr81ozADeFUK51PeNSo1vJ/zXGWOuNz17GIiCIzkbs7
 L1Zxng+W5QUEhLgMtEV5WZlY4DGFlqUT4CLxMtTbd9ySdJzAqyhn9b72tqUX2CgiEK
 OCBJWSA79v7lA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 22:13:44 +0100
Date: Wed, 16 Feb 2022 22:13:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220216211344.GD522310@scaer>
References: <20220214132944.2471362-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214132944.2471362-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: fix build with ubus
 and without dnssec
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-02-14 14:29 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 2.86 in
> commit 5b29096f8fcb0acd8890073a56ba9d620b1f911c:
> 
> rfc1035.c: In function 'report_addresses':
> rfc1035.c:978:49: error: 'struct dnsmasq_daemon' has no member named 'workspacename'
>   978 |        if (!extract_name(header, len, &p, daemon->workspacename, 1, 0))
>       |                                                 ^~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/51242d4f532373544e3c7ea45036b8d41390b29b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-not-DNSSEC-compile-options-selected.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
> 
> diff --git a/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch b/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
> new file mode 100644
> index 0000000000..9c98af2be5
> --- /dev/null
> +++ b/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
> @@ -0,0 +1,34 @@
> +From 2c60441239e1c10c4987cb586653b1ea08f703c0 Mon Sep 17 00:00:00 2001
> +From: Simon Kelley <simon@thekelleys.org.uk>
> +Date: Tue, 28 Sep 2021 23:42:15 +0100
> +Subject: [PATCH] Fix FTBFS when CONNTRACK and UBUS but not DNSSEC compile
> + options selected.
> +
> +[Retrieved from:
> +https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=2c60441239e1c10c4987cb586653b1ea08f703c0]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/dnsmasq.h | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/dnsmasq.h b/src/dnsmasq.h
> +index c8a918a..3fdc1b0 100644
> +--- a/src/dnsmasq.h
> ++++ b/src/dnsmasq.h
> +@@ -1173,9 +1173,12 @@ extern struct daemon {
> +   char *packet; /* packet buffer */
> +   int packet_buff_sz; /* size of above */
> +   char *namebuff; /* MAXDNAME size buffer */
> ++#if (defined(HAVE_CONNTRACK) && defined(HAVE_UBUS)) || defined(HAVE_DNSSEC)
> ++  /* CONNTRACK UBUS code uses this buffer, as well as DNSSEC code. */
> ++  char *workspacename;
> ++#endif
> + #ifdef HAVE_DNSSEC
> +   char *keyname; /* MAXDNAME size buffer */
> +-  char *workspacename; /* ditto */
> +   unsigned long *rr_status; /* ceiling in TTL from DNSSEC or zero for insecure */
> +   int rr_status_sz;
> +   int dnssec_no_time_check;
> +-- 
> +2.20.1
> +
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
