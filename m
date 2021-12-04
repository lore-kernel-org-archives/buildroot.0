Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A1AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 10:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9685B40533;
	Sat,  4 Dec 2021 10:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aO7GbatDJMGm; Sat,  4 Dec 2021 10:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C74644045B;
	Sat,  4 Dec 2021 10:44:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB00B1BF5DA
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B74A14045B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31AzzmfqAh_L for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 10:44:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89556403CB
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 10:44:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A39235FFAE;
 Sat,  4 Dec 2021 11:44:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638614681;
 bh=axy3Zje7XZs/Q4TpmkMsJCbnbNllCWp8rT2a4uhGzLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FCu+4uWprh833tCb+41Ehi6XQM5nwxN3eS2QilFCsXCy+1zFIkFzHfsD5IVfpee1C
 3lz9sLBdi5E3/PglV44v5WoXf3k2f1LNLwtKLdUa+cKQsdtF+gNpYXGNkNOE3XHNKt
 l8grIq+wgJiLCvHXoN3N/eTuZ4oQwmGLrspFMrNS+HRJtcqPkhhT0Qvh1R7XThP44H
 CFGKTpzNU1fiZFc70+4a5uBHvZyacSZbU9X/8WsRH2yrfu7M176yJXVz2cHfyar+UN
 O5ARHIZH376cJdAJLLfS/A5wotq8S3r/j5BjFv11l6v9jLT9y3H4a2EXQQkGsZVFN5
 EMGyq7kZKFDhA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 11:44:37 +0100
Date: Sat, 4 Dec 2021 11:44:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211204104437.GF50662@scaer>
References: <20211013210117.1929839-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013210117.1929839-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/coreutils: ignore
 CVE-2013-0221, CVE-2013-0222, CVE-2013-0223"
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

On 2021-10-13 23:01 +0200, Fabrice Fontaine spake thusly:
> This reverts commit 8ae9156d8b730689484927fba2ec2fa6c1dc0433 as those
> CVEs are not tagged as affecting gnu:coreutils in NVD NIST database but
> opensuse:opensuse and redhat:entreprise_linux:
> - https://nvd.nist.gov/vuln/detail/CVE-2013-0221
> - https://nvd.nist.gov/vuln/detail/CVE-2013-0222
> - https://nvd.nist.gov/vuln/detail/CVE-2013-0223

Indeed, pkg-stats does not list those CVEs.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/coreutils/coreutils.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index 6822c58a32..9c0f46cb29 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -10,10 +10,6 @@ COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
>  COREUTILS_LICENSE = GPL-3.0+
>  COREUTILS_LICENSE_FILES = COPYING
>  COREUTILS_CPE_ID_VENDOR = gnu
> -# Only when including SUSE coreutils-i18n.patch
> -COREUTILS_IGNORE_CVES = CVE-2013-0221
> -COREUTILS_IGNORE_CVES += CVE-2013-0222
> -COREUTILS_IGNORE_CVES += CVE-2013-0223
>  
>  COREUTILS_CONF_OPTS = --disable-rpath \
>  	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
> -- 
> 2.33.0
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
