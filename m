Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF19C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC0981F5F;
	Sun, 20 Nov 2022 09:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFC0981F5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HOdPyPZBd-u; Sun, 20 Nov 2022 09:09:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2529A81F4D;
	Sun, 20 Nov 2022 09:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2529A81F4D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 517351BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D3ED40125
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D3ED40125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-6V0gfDxgXM for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:09:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA021400E7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA021400E7
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:09:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0a9:eda8:8a8b:60c8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F123FB00535;
 Sun, 20 Nov 2022 10:09:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 10:09:45 +0100
Date: Sun, 20 Nov 2022 10:09:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221120090945.GQ2123054@scaer>
References: <20221119233706.52949-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221119233706.52949-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668935388;
 bh=fJlJvq7Yncwxp5DYAPdyEu/T6os7otbG645g7mAm9SY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p242qfdoyrrCUU4lMPogBJ6hnta/UHizudTLbxcNZuZDq+K+SYTN8kM72r/ACHY6B
 g3u5H9IE03YGw5lIYzKkwWByqj+xzCtdVj9M5shebxxRjsyfgicsQfgujuTHPzzTaS
 0RAC/vt69HMtvhX8lahyXiXLZ2HTLtxBrdg8Cu8+hYp0ZUKnucrfB3XelkPfXtJi0S
 Bj5nQDd/Dxp5ORGbmw8fAgvkxXbTAAywU5ka3YDAOZIRSkPnD0bITvtr2gIHQubzPE
 6wwywHSfQGW7k0ErZwdPBvSnc9VJcvEodTFHrKtVjRhVWrbx9TvdGXEEZwdVupDzd1
 KK+FG1hXG1Yag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p242qfdo
Subject: Re: [Buildroot] [PATCH 1/1] package/sysstat: security bump to
 version 12.6.1
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

Fabrice, All,

On 2022-11-20 00:37 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2022-39377: sysstat is a set of system performance tools for the
> Linux operating system. On 32 bit systems, in versions 9.1.16 and newer
> but prior to 12.7.1, allocate_structures contains a size_t overflow in

As you quote the NVD description, it states that versions lower than
12.7.1 are impacted, yet you only bump to 12.6.1.

Also, the pointer you provided to the changelog does not mention
CVE-2022-39377. Besides, github warns that it is not part of the
sysstat repository (/!\ This commit does not belong to any branch on
this repository, and may belong to a fork outside of the repository).

Can you double-check, please: if 12.6.1 indeed fixes the issue, then
extend the commit log with the appropriate references; if not then we
should bump to 12.7.1.

Regards,
Yann E. MORIN.

> sa_common.c. The allocate_structures function insufficiently checks
> bounds before arithmetic multiplication, allowing for an overflow in the
> size allocated for the buffer representing system activities. This issue
> may lead to Remote Code Execution (RCE).
> 
> https://github.com/sysstat/sysstat/security/advisories/GHSA-q8r6-g56f-9w7x
> https://github.com/sysstat/sysstat/blob/v12.6.1/CHANGES
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sysstat/sysstat.hash | 4 ++--
>  package/sysstat/sysstat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
> index b573f312c6..b47f000e57 100644
> --- a/package/sysstat/sysstat.hash
> +++ b/package/sysstat/sysstat.hash
> @@ -1,5 +1,5 @@
>  # From: http://sebastien.godard.pagesperso-orange.fr/download.html
> -sha1  1e38bc029979def730ae1fb1e39f631bd1a3bc73  sysstat-12.4.2.tar.xz
> +sha1  a730982e0c2d4964a0022c1509f3ea0a345402bc  sysstat-12.6.1.tar.xz
>  # Locally calculated
> -sha256  3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1bcffa018f  sysstat-12.4.2.tar.xz
> +sha256  18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342  sysstat-12.6.1.tar.xz
>  sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
> diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
> index 6948f6b390..377396d986 100644
> --- a/package/sysstat/sysstat.mk
> +++ b/package/sysstat/sysstat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSSTAT_VERSION = 12.4.2
> +SYSSTAT_VERSION = 12.6.1
>  SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
>  SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
>  SYSSTAT_CONF_OPTS = --disable-file-attr
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
