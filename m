Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67144C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 21:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A1761071;
	Tue,  5 Apr 2022 21:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9e_CyP6DDnbU; Tue,  5 Apr 2022 21:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F7960FAE;
	Tue,  5 Apr 2022 21:06:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36C331BF3A3
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 330AB60AEA
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tzWAHD6PEsc for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 21:06:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C25E60FAE
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 21:06:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44e:a19f:2a4d:fe1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 359DD19F4F3;
 Tue,  5 Apr 2022 23:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649192767;
 bh=D1IDh10VU4CwNyC/tpgaxLcsrrczlUH99oPEj8txbDo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d0Vc3wlcjtNHAVXEm/ksxxlshYoA9geaQdz/CKtTZdcj0d1m7p7IAz21n6h4WRGI0
 vXlv0YN3QgCMrPtHjQoKlCrRIHqqS47SlhZ15UsMZr4soy1KukOW8ieGP++8R3B5w1
 qRQSutHhudqxMHH8/bFMNqN91d0HCkJfKq7ZUeHlTkqpV3VrAMo/oYf6w0yz2uWtaS
 vnWGmX265Vols3PaAJJfwbZD1f+GX/E5gTRbgzaJasmljyOinl9JebwEy/VcdLaeAW
 E28P7QhvT2cVrY7c5MN4eaw0iDuE+bsV444N5q2jzyaCviIGiaaBbhAETp+bi7lMbN
 /OL6c3wt/w/Zg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 05 Apr 2022 23:06:04 +0200
Date: Tue, 5 Apr 2022 23:06:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220405210604.GI2354230@scaer>
References: <20220405185426.1250850-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405185426.1250850-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: drop
 UTIL_LINUX_FIX_DISK_UTILS_COMPILE
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

On 2022-04-05 20:54 +0200, Fabrice Fontaine spake thusly:
> Drop UTIL_LINUX_FIX_DISK_UTILS_COMPILE which is not needed since bump to
> version 2.37.4 in commit a586f0a283cd69f436bc6d0cff484460b412a1ce
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/util-linux/util-linux.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 7c153a6804..243e7dac8d 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -37,13 +37,6 @@ UTIL_LINUX_CONF_OPTS += \
>  
>  UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
>  
> -# workaround missing disk-utils/raw.8 file in util-linux-2.37.3
> -# release download package
> -define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> -	touch $(@D)/disk-utils/raw.8
> -endef
> -UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> -
>  HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>  
>  # We also don't want the host-python dependency
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
