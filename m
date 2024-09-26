Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D670FCCFA15
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 04:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72CCE60785;
	Thu, 26 Sep 2024 04:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJhhIHbV770Z; Thu, 26 Sep 2024 04:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87A0860796
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87A0860796;
	Thu, 26 Sep 2024 04:48:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C9981BF381
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 04:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3830360796
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 04:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0n8tqenv-XQ for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 04:48:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73BBF607B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73BBF607B4
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73BBF607B4
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 04:48:28 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 1612D440FB8;
 Thu, 26 Sep 2024 07:45:55 +0300 (IDT)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240925205558.1176626-1-andriy.shevchenko@linux.intel.com>
 (Andy Shevchenko's message of "Wed, 25 Sep 2024 23:55:43 +0300")
References: <20240925205558.1176626-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 26 Sep 2024 07:48:23 +0300
Message-ID: <87h6a310mg.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1727325955;
 bh=OxHFLGMbgsWNpsbFn0vTmjYqshnfG3OqggTbH9NwwOM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HEaIWgrmYEVqPBjtgmfCedLxvc3vg27PFLIN32qoaHQ28tGP9IFPDJBBaP7pGglB3
 0bByzsyG3qIXjft1wo52t4Zmj1R8oHPVTeGnHdd4f6SYFs0m5L/gXcpFs2DlAx1Qlr
 JjbNJxHPFxYLowTtBt6ldtUI3bIIOESNZ070+jX5AEpuZmvuOXuk6KYdQnH7OEluZ8
 b8v7wYUH4WwC0DaJissNZR5yYKw1xMxcUWTB18PU6Sou1CC1TOfkQaNyDiHXMpUJ00
 HlGWGIdNgc6PgIKlXyCz52obz2T4ruECmcgr1qGfRVd3gw+kWmZM+Pb1FWmNdKAP4g
 681UPBRL6YE7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=HEaIWgrm
Subject: Re: [Buildroot] [PATCH v1 1/1] package: Add iotools package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Andy Yan <andyshrk@gmail.com>, Andy Yan <andyshrk@163.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy,

On Wed, Sep 25 2024, Andy Shevchenko wrote:
> +define IOTOOLS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/bin -D $(@D)/iotools
> +	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/iotools

Buildroot target-finalize strips all target binaries (lookup $(STRIPCMD)
in top Makefile). Doesn't that work for you?

baruch

> +endef
> +
> +$(eval $(generic-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
