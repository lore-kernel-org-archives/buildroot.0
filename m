Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A919FEE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 19:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43AC460B3C;
	Sun, 20 Aug 2023 19:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43AC460B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0NOF9zi0jKo6; Sun, 20 Aug 2023 19:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AF1660A8B;
	Sun, 20 Aug 2023 19:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AF1660A8B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 363971BF403
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 19:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FB8D60A8B
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 19:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB8D60A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qc06qY7g1bKQ for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 19:42:44 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F34B60838
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 19:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F34B60838
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 7E753A0395;
 Sun, 20 Aug 2023 21:42:42 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id 6353BA00E2;
 Sun, 20 Aug 2023 21:42:42 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 31F12241240;
 Sun, 20 Aug 2023 21:42:42 +0200 (CEST)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 20 Aug 2023 21:42:41 +0200
Message-ID: <10326829.nUPlyArG6x@kilian-aisec>
In-Reply-To: <20230820192912.GR1778688@scaer>
References: <20230820190438.101920-1-kilian.zinnecker@mail.de>
 <20230820190438.101920-2-kilian.zinnecker@mail.de>
 <20230820192912.GR1778688@scaer>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1056
X-purgate-ID: 154282::1692560562-157F9660-AA7A1F11/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692560562;
 bh=k06Ijyi0u3oWUmc0l9AwUWhwF+8WMOnpzCZLcBnlm6U=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=vWq+bdVHBIVagymkjdtS2J1Ifu+Ds5h6XFt/4PMF1hnPRZh8aEULwf5URsAO+NXBj
 Iz/ql1xWr+G9bBaoVJCvM5+oQgasCDGK3+mAaIcTKboCdWey1AfNkzkeol+LTlYd+j
 Y8fLZyD6lo1baz6wqGQEUoKdgl9Swekpjc4aUFRhz4Sx63XWY/41nbQkJpvmglKZZU
 Vqaps+UBUSrFBNYtJJZ/Paudf2fmIhJHbMEoSMhODucPNwhOszjcvOXx4s5hILqatE
 ZDWy3byyPG7wg3allbJV1Ja2hUjEp9/AHdhXrFrNaUQlNASTY87kJ0YTNb/x9E0GsZ
 ptpETNnECj/uA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=vWq+bdVH
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/rock5b: Add patches to fix
 gcc12 warnings
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

> On 2023-08-20 21:04 +0200, Kilian Zinnecker via buildroot spake thusly:
> > This patch introduces patches for the custom kernel, as it is
> > currently used for the Radxa Rock 5B. The patches fix two gcc
> > compiler warnings, which result in a build error, if the kernel
> > is used with gcc version 12.
> > Since also the code of custom board drivers for WiFi support is
> > affected, and no fixes are provided by the vendor, the custom WiFi
> > support is disabled.
> > 
> > Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> 
> Applied to master, thanks.

Thanks as well. I don't yet fully understand how the git branches in open 
source projects work, i.e., what exactly gets into the "next" branch (i.e., 
how the next branch is actually defined) and what gets a release candidate "rc" 
tag. However, I just wanted to add that imho this patch then should also get 
into the next rc for 2023.08, because else the freshly introduced Rock 5B 
support in 2023.08 will be broken.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
