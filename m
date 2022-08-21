Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC460C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 21:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60DBB60B25;
	Sun, 21 Aug 2022 21:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60DBB60B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULSrDcR6yQCB; Sun, 21 Aug 2022 21:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6642760AAE;
	Sun, 21 Aug 2022 21:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6642760AAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 633611BF5B3
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 21:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A6D660AAE
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 21:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A6D660AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILi4lKyAjxWS for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 21:10:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95F5760A6A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95F5760A6A
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 21:10:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 174361C0002;
 Sun, 21 Aug 2022 21:10:16 +0000 (UTC)
Date: Sun, 21 Aug 2022 23:10:16 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220821231016.197b4422@windsurf>
In-Reply-To: <20220815163456.31474-1-fontaine.fabrice@gmail.com>
References: <20220815163456.31474-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661116217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ibTOlikZMFMSRm4Yl+urwftLh2+w1uqlLky4HLBc7Rc=;
 b=TAo72esgX7Sst6sSl0Y6MpXfr8zmtOhXEGabTBRmGF22qyjQpXFld7ZZuVg7Vmg913zGlh
 hHGm7tLgVonQH1D5pi2/3Qdo2uhHm2P+UmTWwHbyQBF9gQs4VHOiB4WHWJ8gEGhyNXJjqu
 6EAlKo1eLSdLWGalD4d8wVPyB1l+Vs2IVBSfNCnOkcfXVr94TsB69+qFl2Ak77kC2g3FKS
 ZTksRzsrdxOESlnUWODt8FMvkRWDBgQ8CSsGTh4j/9wPYyN8MjhrN7vTpU4V7T7IFakhuv
 4aAwdFpDHHS08EgR7XlvGzaDuGAPSpSZDYhMD8+Z31XpT/Oj6ZkoJYiqgMdYwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TAo72esg
Subject: Re: [Buildroot] [PATCH 1/1] package/lshw: fix NLS build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@smile.fr>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

+Romain, Yann and Alexey

On Mon, 15 Aug 2022 18:34:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following NLS build failure:
> 
> In file included from hw.cc:5:
> config.h:10:10: fatal error: libintl.h: No such file or directory
>    10 | #include <libintl.h>
>       |          ^~~~~~~~~~~
> 
> Strangely enough this build failure is only raised by the autobuilders
> since bump to latest head in commit
> 72a009fa98a37825624f70dc2a1cf825a5999a0a. However,libintl.h is
> unconditionally used since version B.02.15 and
> https://github.com/lyonel/lshw/commit/792eba3da1c38a164ddde999d188b11bc0e5abb0
> so the build failure can be reproduced even when
> 72a009fa98a37825624f70dc2a1cf825a5999a0a is reverted
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/09fbc4948650f8f756cb5a9ca4b5c687cd2edc6c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

So, I had a look at what's happening here. You're right, there is
something "special".

What is "special" is that this build failure happens with the
pre-compiled ARC toolchain provided by Synopsys, and this uClibc-based
toolchain is built without the libintl stub (UCLIBC_HAS_LIBINTL is
disabled). However, in Buildroot, we assume that uClibc toolchains have
the libintl stub enabled (UCLIBC_HAS_LIBINTL is enabled).

This explains a lot of build failures caused by this toolchain:

  http://autobuild.buildroot.net/index.php?status=NOK&symbols%5BBR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC%5D=y

My suggestion would be to drop support for this pre-built toolchain,
and replace it with the glibc-based toolchain provided by Synopsys:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2021.09-release

Of course, if Synopsys adjusts the uClibc toolchains to enable the
libintl stub, we will be able to again use those toolchains in the
future. That is why I have added Alexey in Cc.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
