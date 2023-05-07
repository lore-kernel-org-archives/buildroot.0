Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D6BC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 10:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13CFB81699;
	Sun,  7 May 2023 10:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13CFB81699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0_tAuDWzyzN; Sun,  7 May 2023 10:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 392668151E;
	Sun,  7 May 2023 10:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 392668151E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91B4B1BF307
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64D4460BA4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D4460BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5F8IT-SBm8H for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 10:44:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 561E260B8E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 561E260B8E
 for <buildroot@buildroot.org>; Sun,  7 May 2023 10:44:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9EFF219F5AF;
 Sun,  7 May 2023 12:44:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 12:44:15 +0200
Date: Sun, 7 May 2023 12:44:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507104415.GG252090@scaer>
References: <20230503164458.747478-1-bernd.kuhls@t-online.de>
 <20230503164458.747478-5-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503164458.747478-5-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683456257;
 bh=lXnAMmpIva0cM+RcXNaMQoBNCxoNJGTDqazUCWYlUmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ce+d/F4HRy1mUwsmNSn5rUD9RuWPD963Y9T4nTyjZG4SG/ZQuEFvdlePSsbnQ02qO
 xVcG378Oz65TTgGZ9vbELp05QUEbNE2avV1INrt/FteDF+YAQB7gCJ+xQ7++vOUBgG
 DaafpUdUUDmx2q8p1gqCf7BhVNzDq34fhxn6l6ktD8jDLnfXieJMrp+50F9/TbhxGv
 SBtwMf5CSmUtckTW/cqHpPrgHlU903Ylx+2eGd1Qp2LxnOelw5Rv/F5KMnnSDj81fL
 jFI4lKRz0r7DnesnzIE4p3ShTjMNdWlDeMOwyInO7Yd5W7aTfOeTxwAsMxIBvZ1QAj
 SJENcTsmEOjug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ce+d/F4H
Subject: Re: [Buildroot] [PATCH 05/11] package/kodi-inputstream-adaptive:
 bump version to Nexus
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

Bernd, All,

On 2023-05-03 18:44 +0200, Bernd Kuhls spake thusly:
> Added dependency to bento4 needed after upstream commit
> https://github.com/xbmc/inputstream.adaptive/commit/70625e76702186c73ddb43440f44262c48e14755
> 
> License file renamed
> https://github.com/xbmc/inputstream.adaptive/commit/b555973d98e15bb40022dd1ab704d8d42efd7686
> and updated upstream
> https://github.com/xbmc/inputstream.adaptive/commit/4b62e9e3257526e0359e0b797902ba9119633c16
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
[--SNIP--]
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> index 9da87e0e38..1f3e86bb27 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.7-Matrix
> +KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.6-Nexus
>  KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
>  KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+

It turns ot that this update also uncovered that the licensing is more
complex than just "GPL-2.0-or-later".

Indeed, in https://github.com/xbmc/inputstream.adaptive/blob/Nexus/LICENSES/README.md:

InputStream Adaptive currently contains files and code licensed under:

    BSD-2-Clause-Views: BSD 2-Clause with views sentence License
    BSD-3-Clause: BSD 3-clause "New" or "Revised" License
    google-patent-license-webm: Google Patent License for WebM
    GPL-2.0-or-later: GNU General Public License v2.0 or later
    RSA-MD5: RSA Message-Digest License

So those licenses should also be added to the list.

Normally, I would have done that (or requested a respin of the patch),
but the issue was already present before the version bump, so it is not
a regression.

Applied to master, thanks.

Can you please send a followup patch that fixes the licensing for
kodi-inputstream-adaptive?

Also, could you assess the situation for the other kodi related
packages, please?

Regards,
Yann E. MORIN.

> -KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
> -KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = expat kodi
> +KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.md
> +KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = bento4 expat kodi
>  
>  $(eval $(cmake-package))
> -- 
> 2.39.2
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
