Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096BBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 10:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A241642A17;
	Sat, 28 May 2022 10:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zb0jF12H4m_i; Sat, 28 May 2022 10:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F1B42904;
	Sat, 28 May 2022 10:00:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7658A1BF5DA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 10:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6529A610B6
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 10:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsKSPDV6hCL8 for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 10:00:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE46D61088
 for <buildroot@buildroot.org>; Sat, 28 May 2022 10:00:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5173:a555:38b0:75bd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2D71C7802D7;
 Sat, 28 May 2022 12:00:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653732026;
 bh=wOSbTwukulp3lt+R0f15yH2UVvEfIR/XO/5nROnEhpo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oRu/EY7e5/clWF4ZuEsrJy5BuV7jHvA0D+k4mgPlphH7yTLMSw30nqxbF5SXKg0Gl
 N3N7LG09o4YarAgVI2a3APhk/kGVERIWkR5sGEkVtHglElZFObMAW5WxKCkMOMvv0e
 xOir35vtRIkkpiPsJUyMgjJqakYsGbswl1UkSyyMiZJBwo+oVh7bk+3woc58n7t3lM
 oI58TWEGqA1Zp1mRCtwLWokhnQLWLGCQaw+c8IEKLyC9lWwJ4qVv0/zAsenilUC2T4
 OhdqWaySF+M+VOzsB7Mg99EUaELZcYUeyvG/eWvWiRnc8LPoq+0sGACOhwyVRCuvbN
 wLqYEm+Mee0HA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 12:00:23 +0200
Date: Sat, 28 May 2022 12:00:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <20220528100023.GD301044@scaer>
References: <20220527184501.1992852-1-mmayer@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527184501.1992852-1-mmayer@broadcom.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/strace: download from Github
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mrkus, All,

On 2022-05-27 11:45 -0700, Markus Mayer via buildroot spake thusly:
> Some corporate networks may be blocking access to Russian servers.
> The server "strace.io" is in Russia, which will make it inaccessible
> from some networks.
> 
> Use Github instead to download the sources.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Applied to master, thanks.

> ---
> 
> Not sure if there is a precedence for such a change or if it'll be deemed
> acceptable. I am putting this out there in case it is considered helpful.

Yes, there's already been such switch in the past. We jsut have to
ensure one of the folowing:

  - if the archive filename did not change, it must be the exact same
    content as what we already use (i.e. the same hash), or it would
    conflict eith the cached archive we have on s.b.o.

  - if the archive content changed, we must ensure its filename changed,
    like we bump the version or something, to avoid aforementioned hash
    mismatch.

In this case, the hash did match, so it's (very probably!) the same file,
so that's OK.

Regards,
Yann E. MORIN.

> Thanks,
> -Markus
> 
>  package/strace/strace.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
> index c35e0c84da22..67924d4b660a 100644
> --- a/package/strace/strace.mk
> +++ b/package/strace/strace.mk
> @@ -6,7 +6,7 @@
>  
>  STRACE_VERSION = 5.17
>  STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
> -STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
> +STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
>  STRACE_LICENSE = LGPL-2.1+
>  STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
>  STRACE_CPE_ID_VENDOR = strace_project
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
