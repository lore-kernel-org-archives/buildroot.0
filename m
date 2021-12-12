Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EBBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88CAC859BE;
	Sun, 12 Dec 2021 12:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8oovvVU-KIT; Sun, 12 Dec 2021 12:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9C32859BA;
	Sun, 12 Dec 2021 12:18:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CB2F1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B8E061B6A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7t0YGHcPgdFB for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:18:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 412D161B3A
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:18:15 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x10so26324439edd.5
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5qUXHdo1b/Qi2DrL3aQHciaaluQ7+Gif2mKMmLZV37c=;
 b=gjlVlRf3EwmR6yCvCjh5RTte053RYAa7YKy/GQefE48bEgX72FrPz7LD+4ApzwPHg5
 ZAKhbyISRpiMvO0IyvPxi5bsoUc5reW6iMPiYwyZn4x5IOkSEAHkDp7dHHXNGFDFj6tj
 5j9Ph0iZQvy6/YSIgjs+FbFoxeE26myhJX5EktJ0eM1ndPSEg8WJTAYNLlVOaqPPNEUY
 Wb7r4L4e4JCbkwTbFCwQlAikP3UW8s1mWJm/Qv44odbI0/C6ykwujA0rk+TwJ+E3cMko
 EkzFw0RCwxbw/odKj6ba1WQvsvevJXqphpd7m7ET6hYEkVYvBXGGNBjoAfpn81Sm6A+J
 AcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5qUXHdo1b/Qi2DrL3aQHciaaluQ7+Gif2mKMmLZV37c=;
 b=SL+6ESfSc/g1gnyisGWCi4vYWRbuKbQoHYMtr41WaEUkxV2E3Y4YttgvqC6Czc9z+R
 cRcqRPYeCRCxK/T/hcEKRozjnMWFBb2SZygNL3Pr0S3m9SM7C8etCQygwYI0NySxlogg
 34jop8stPxe3tr08Wmd2jZvHrSKxN9S2eW4kIZgPhDARRGuP1+BN2RbMZHKniXoCSoWr
 MlO6x2xgXCSZBM5tBEzxWqS9rpqXyOnE6qIhgtaMsgfJe4ubreWW+vh+C+gNXlNPqrT9
 OXO0T2jF9oAvSbAItJ3aFOeolHLa+WwKEg1ybM9RsjFKJHmunOnxUmDtokzCow3z7h24
 Nedg==
X-Gm-Message-State: AOAM531EzobuW/1HOljVgczAl/Lna2nhjskz6A3BhmkpdcVOAoAeY03e
 RDgtj7uDhxSot9vx7199TOYwOw==
X-Google-Smtp-Source: ABdhPJxH7r4h02nIaTQksjWFSY1OFpfgXXhoJtREJwV6Z7zhw4Vf0cuD/ZnNm8fj9gU1vamO72xUkw==
X-Received: by 2002:a05:6402:254f:: with SMTP id
 l15mr52504137edb.12.1639311493603; 
 Sun, 12 Dec 2021 04:18:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h7sm4964079ede.40.2021.12.12.04.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:18:13 -0800 (PST)
Message-ID: <8d437749-9f02-919d-517f-ff331f8d2494@mind.be>
Date: Sun, 12 Dec 2021 13:18:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211207214122.3307980-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211207214122.3307980-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-video-trident: fix build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/12/2021 22:41, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of xserver_xorg-server
> to version 21.1.1 in commit d9185c6ba38430a017ed996c4180e141881ba570:
> 
> In file included from trident_bank.c:37:
> trident.h:41:10: fatal error: xf86RamDac.h: No such file or directory
>     41 | #include "xf86RamDac.h"
>        |          ^~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c81ac8075af257e8626d9d097270be7a7b4a1496
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Remove-ramdac.patch                  | 56 +++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch
> 
> diff --git a/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch b/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch
> new file mode 100644
> index 0000000000..38ca9afebf
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch
> @@ -0,0 +1,56 @@
> +From 07a5c4732f1c28ffcb873ee04500e3cb813c50b4 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 7 Dec 2021 22:28:04 +0100
> +Subject: [PATCH] Remove ramdac
> +
> +ramdac drivers have been removed from xserver since version 21.0.99.1
> +and
> +https://gitlab.freedesktop.org/xorg/xserver/-/commit/f0385fb420158ac3bc1c4c325431ffc5c62344bb
> +resulting in the following build failure:
> +
> +In file included from trident_bank.c:37:
> +trident.h:41:10: fatal error: xf86RamDac.h: No such file or directory
> +   41 | #include "xf86RamDac.h"
> +      |          ^~~~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/c81ac8075af257e8626d9d097270be7a7b4a1496
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/xorg/driver/xf86-video-trident/-/merge_requests/1]
> +---
> + src/trident.h | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/src/trident.h b/src/trident.h
> +index 5cadf52..c82de4c 100644
> +--- a/src/trident.h
> ++++ b/src/trident.h
> +@@ -38,7 +38,6 @@
> + #include "xaa.h"
> + #endif
> + #include "xf86fbman.h"
> +-#include "xf86RamDac.h"
> + #include "compiler.h"
> + #include "vgaHW.h"
> + #include "xf86i2c.h"
> +@@ -103,7 +102,6 @@ typedef struct {
> +     int			useEXA;
> +     int			Chipset;
> +     int			DACtype;
> +-    int			RamDac;
> +     int                 ChipRev;
> +     int			HwBpp;
> +     int			BppShift;
> +@@ -169,7 +167,6 @@ typedef struct {
> +     CARD32		BltScanDirection;
> +     CARD32		DrawFlag;
> +     CARD16		LinePattern;
> +-    RamDacRecPtr	RamDacRec;
> +     int			CursorOffset;
> +     xf86CursorInfoPtr	CursorInfoRec;
> +     xf86Int10InfoPtr	Int10;
> +--
> +2.33.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
