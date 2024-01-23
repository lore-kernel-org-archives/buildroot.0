Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E58C47DDB
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 15:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED80840878;
	Tue, 23 Jan 2024 15:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED80840878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGhpsBCQbI0y; Tue, 23 Jan 2024 15:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 459C6404CC;
	Tue, 23 Jan 2024 15:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 459C6404CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 782811BF360
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 15:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F92340472
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 15:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F92340472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTiM2HdwaWwz for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 15:39:08 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE7DC4011A
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 15:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE7DC4011A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6612413FA37;
 Tue, 23 Jan 2024 16:39:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Jan 2024 16:39:01 +0100
Date: Tue, 23 Jan 2024 16:39:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maximilian Senftleben <maximilian.senftleben@frogblue-tec.com>
Message-ID: <Za_dleqTzTAK8k48@landeda>
References: <20240123140211.105695-1-maximilian.senftleben@frogblue-tec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123140211.105695-1-maximilian.senftleben@frogblue-tec.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706024344;
 bh=IED+EyExgkOL8J9+rnGgv9mtFnG1NlR4fQYogGJKvpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BD1l0kkgUWZ8dJI5Y/JR92bYkiW7RC7Iu9YcAOkz4RVVINQI7cAlGlUwiRPivUak8
 P8lM9HWyrkh4U+0SmMs9OqUmvDWn99qNyqtQI1B/fJpTIsLNQho+zVLyCZDU4CG0ez
 UDgudPWiFPEiKjhv72gPI3U8HZuskwWWqgVThkpYwPBlHDMGEq3HID9nxKTQD/7xpw
 RrzUZri81ZFKptD1t/uzxCMO9EXfPv8KHx8748Y6raFJmUM+q20SmLnthYo/Rbl1JU
 yU7IOV9oEFXbTLAG08yMQS3/jJHwLelgchGvZ9KsOdsW0qBG7WohMABiJGXrO3U8S1
 nC+GJ5FJvx+mA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BD1l0kkg
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4-contrib: fix
 INSTALL_TARGET value
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maximilain, All,

On 2024-01-23 15:02 +0100, Maximilian Senftleben spake thusly:
> The variable should be a YES/NO value, FALSE is not a valid value.
> E.g. the yesno-to-bool cmd does not translate a FALSE value and therefore returns invalid JSON.

Good catch, thanks!

> Signed-off-by: Maximilian Senftleben <maximilian.senftleben@frogblue-tec.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/opencv4-contrib/opencv4-contrib.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
> index 52d2682b26..f8c8cfd94c 100644
> --- a/package/opencv4-contrib/opencv4-contrib.mk
> +++ b/package/opencv4-contrib/opencv4-contrib.mk
> @@ -6,7 +6,7 @@
>  
>  OPENCV4_CONTRIB_VERSION = 4.8.1
>  OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
> -OPENCV4_CONTRIB_INSTALL_TARGET = FALSE
> +OPENCV4_CONTRIB_INSTALL_TARGET = NO
>  OPENCV4_CONTRIB_LICENSE = Apache-2.0
>  OPENCV4_CONTRIB_LICENSE_FILES = LICENSE
>  
> -- 
> 2.43.0
> 
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
