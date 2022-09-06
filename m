Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DE9ECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 15:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 253D660C13;
	Tue,  6 Sep 2022 15:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 253D660C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvXEuK2UxTLN; Tue,  6 Sep 2022 15:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B446072A;
	Tue,  6 Sep 2022 15:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B446072A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7C21BF990
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 15:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80C876072A
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 15:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80C876072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LvZrCExJrY3t for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 15:01:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84999605AF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84999605AF
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 15:01:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AF8B2B00596;
 Tue,  6 Sep 2022 17:01:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 17:01:30 +0200
Date: Tue, 6 Sep 2022 17:01:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20220906150130.GD1585594@scaer>
References: <20220901120301.58714-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901120301.58714-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662476492;
 bh=K3vANxODVaP2RtmhdN6oPVpkL1wzhOBdDHW+8efNmSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=arTovd+74NWmHu56Lt2xXGz1ltWo3yySVMWAZVF7xu3qHNxkAmxC1GPKCV6VNhJOA
 j/mvRgBX5VcqS/RnWqYc4644I9d5CE1p/cwI3/jgqohEJvHW0cKBhq/CDeJBOLCQub
 6rkXn1MH4h5Gbmvf4t/DGu7XekUjfRHVofJFjUAU0hJQI84BxcIca/nW92m8/vC4H1
 1NF9JIBHqWGc+Fdiy6uSunslDOCGoQ7dFfxNXm1adQhcfCtsoLhqcXujczwMEyaSJM
 iJH6US7iQoJK4+qptfHF4saIybr+Sg63m7t7grmvlw/3WyIS55qSMq3AqXCJxEJPt2
 q635ESZEX0QbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=arTovd+7
Subject: Re: [Buildroot] [PATCH] package/networkd-dispatcher: bump to
 version 2.2.3
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

Michael, All,

On 2022-09-01 14:02 +0200, Michael Nosthoff via buildroot spake thusly:
> lots of fixes but most importantly:
>  - don't allow unknown operational/admin states (CVE-2022-29799, CVE-2022-29800)
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to next, and since I noticed afterwards that it was a security
fix, I also applied it to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/networkd-dispatcher/networkd-dispatcher.hash | 2 +-
>  package/networkd-dispatcher/networkd-dispatcher.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/networkd-dispatcher/networkd-dispatcher.hash b/package/networkd-dispatcher/networkd-dispatcher.hash
> index ca7c300783..ffb4fa846a 100644
> --- a/package/networkd-dispatcher/networkd-dispatcher.hash
> +++ b/package/networkd-dispatcher/networkd-dispatcher.hash
> @@ -1,3 +1,3 @@
>  # locally computed
> -sha256  1682c0106d9d2879087612e76aebb87672ebf339c43f229a3ee27dadb428575b  networkd-dispatcher-2.1.tar.bz2
> +sha256  61270b4c2f39c36da4b0a62724a3cc01f6732493fed0f166ee675bafedff11df  networkd-dispatcher-2.2.3.tar.bz2
>  sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/networkd-dispatcher/networkd-dispatcher.mk b/package/networkd-dispatcher/networkd-dispatcher.mk
> index 4f609db73a..2b1aa257ce 100644
> --- a/package/networkd-dispatcher/networkd-dispatcher.mk
> +++ b/package/networkd-dispatcher/networkd-dispatcher.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NETWORKD_DISPATCHER_VERSION = 2.1
> +NETWORKD_DISPATCHER_VERSION = 2.2.3
>  NETWORKD_DISPATCHER_SOURCE = networkd-dispatcher-$(NETWORKD_DISPATCHER_VERSION).tar.bz2
>  NETWORKD_DISPATCHER_SITE = https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/$(NETWORKD_DISPATCHER_VERSION)
>  NETWORKD_DISPATCHER_LICENSE = GPL-3.0
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
