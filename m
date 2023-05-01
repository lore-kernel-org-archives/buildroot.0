Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE05C77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 19:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59086410D4;
	Mon,  1 May 2023 19:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59086410D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHz3u-UVSvCH; Mon,  1 May 2023 19:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40DBB409CF;
	Mon,  1 May 2023 19:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40DBB409CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 573421BF4E7
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 19:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 375F260A89
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 19:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 375F260A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwOi-lZSvORH for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 19:50:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25F8B607B4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25F8B607B4
 for <buildroot@buildroot.org>; Mon,  1 May 2023 19:50:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:8906:ae70:691:1fda])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 323CE19F5A7;
 Mon,  1 May 2023 21:50:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 May 2023 21:50:08 +0200
Date: Mon, 1 May 2023 21:50:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20230501195008.GC2696@scaer>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682970612;
 bh=5ihVkdjMreyqID4zfZ9juvr1Fg6mIKooyrFjbHzRo+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q2cxiwZpAshEyoATvRK0oo1MCU+xYUgXxDx0yWoGO+IIpuDAvecEmd8aZoy818En+
 AiEw0RzeDz/WYkXtKjVpbPmqMAPNxkjG+lbaAVkvfdE+r6/0pmjuWzIrJ2a6tLkfGB
 9sYdtTT4kFMYj6FTnvj92Ch0rlzbGaVwmjCjFj9DDNUmX56kTN31JXtnSq9yZPyk8n
 iEs7/O7jQsU8mSJ4WoHyORpP1ltemFWtiY2fCRud0Gnm/VeIbVuWNoWZWwF4AlNpP2
 UY9VwR1VbFZ76TJblXqqkDwy5muVdadNRt8NGAgjnvbIMrLIEsGRuUEuyzEkKEFZkF
 Dnnlu8wnJXLRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q2cxiwZp
Subject: Re: [Buildroot] [PATCH v2 00/14] Preventing style regressions using
 check-package v2
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ricardo, All,

(I'm not sure which series introduced the ignore list for
check-package, so I'm hjijacking this one.)

When there is a file listed in .checkpackageignore, and that file is no
longer present, that does not trigger an error.

This hapens for example when a patch is removed, or when it is renamed.

For example 60d8e5257608 (package/lua: bump to version 5.4.5) renamed
the three lua 5.4.4 patches, but their entries in the ignore list were
not updated.

Would it be possible/easy to have check-package verify that all files in
the ignore list do exist?

Regards,
Yann E. MORIN.

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
