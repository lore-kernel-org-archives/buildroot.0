Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44470C433EF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 21:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7B0D4032A;
	Thu, 20 Jan 2022 21:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZCwPwpkGn4v; Thu, 20 Jan 2022 21:29:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED634032B;
	Thu, 20 Jan 2022 21:29:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AEEC1BF2B5
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C34B83133
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zr5knP6edu58 for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 21:29:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21E2182EAD
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 21:29:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9c35:7598:9514:be6a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0F9C4B00539;
 Thu, 20 Jan 2022 22:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642714159;
 bh=mJ13elaJh1DnrEcW7ukRkNZQG3laU5CD+Qo+RRR49hw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KjU39BL6HG6QFVwe3d3HBYdLF97p4p21EHjYxS4PfcV4fKqnZcqUUsrb2wxdpPLrY
 5hd2qMsdrn9pjE65b4bN7Bxy0qinKbbkNImwO2YF+3SnkniUhlNCp73cfVS+3lvV9i
 YXX0GqerJRe7RYtYvmnolMe756LeAf+QdzIxNPaR6bvJFYsPmSdrsEBJ+B3YI0A6I9
 sqNkltFiiD0iLq8SJgCAtRRbflp1WkJHatwIhskUCCN5Vkzo1d1fnhUvta41FVDz4g
 n6PnuYQG1sI9AajdTwGQUJ4XchAOIYXT4lr8RadjaN+UE6dZSPi7YezsaC56YQPfHf
 eGab3LN6pf7DQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 20 Jan 2022 22:29:16 +0100
Date: Thu, 20 Jan 2022 22:29:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220120212916.GD3252931@scaer>
References: <20220120172139.25705-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120172139.25705-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/hwdata: bump version to 355
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

Peter, All,

On 2022-01-20 18:21 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/hwdata/hwdata.hash | 2 +-
>  package/hwdata/hwdata.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
> index 43cca03b06..7861106859 100644
> --- a/package/hwdata/hwdata.hash
> +++ b/package/hwdata/hwdata.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  ed9a2c8b90371ccf4f0ff88972d87770c1c644e63ca44d2ac72c33200642cdde  hwdata-0.354.tar.gz
> +sha256  0d3d21af57822f35141b524808fd9e4823dbb413df338606195010dc0aa1c935  hwdata-0.355.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
> diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
> index 71b59b95ed..4dd9c9e28e 100644
> --- a/package/hwdata/hwdata.mk
> +++ b/package/hwdata/hwdata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HWDATA_VERSION = 0.354
> +HWDATA_VERSION = 0.355
>  HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
>  HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
>  HWDATA_LICENSE_FILES = COPYING LICENSE
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
