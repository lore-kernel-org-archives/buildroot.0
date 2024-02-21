Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0448CC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 20:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A81554189D;
	Wed, 21 Feb 2024 20:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrM0LYWkl7SH; Wed, 21 Feb 2024 20:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDD5B4189F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD5B4189F;
	Wed, 21 Feb 2024 20:27:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A90931BF41B
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A32F8605D9
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNdzvH95_xbd for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 20:27:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA34B605D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA34B605D5
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA34B605D5
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 20:27:36 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 8533C240F38;
 Wed, 21 Feb 2024 21:27:34 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 6846680209;
 Wed, 21 Feb 2024 21:27:34 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id CAC012417DA;
 Wed, 21 Feb 2024 21:27:33 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 21:27:33 +0100
Message-ID: <5755205.DvuYhMxLoT@laptop>
In-Reply-To: <20240220225025.781466-2-romain.naour@smile.fr>
References: <20240220225025.781466-1-romain.naour@smile.fr>
 <20240220225025.781466-2-romain.naour@smile.fr>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 412
X-purgate-ID: 154282::1708547254-06DB8670-084EFDBF/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1708547254;
 bh=8zRV1iMZwT45Xxf10znvNHZXH+yRy3L3k78qIcaalGQ=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=tyre+oEOgHRLI1G9qZcGC30n4Ir3fpj+8FTp1CgoboqGUEIoc01UtCypRnMQBRF7R
 qd68UJZTeN171miJnVqO/z2L039fk3JPA981wljaYgnvQHdNAMhVp25r+oLQTH35WJ
 d4CH/vidvqdq+2erzo2BZuK/mqJYS95frz842vWPTumKwiAhJDfkd34NHfABIViaWX
 B4DSlTflxWvH5xAQndxhUkFt5NWTgzIXAp6EAMy8qU3B42HKNdKc8mpIbGH4lin5mH
 HRIWqoYavJR5Lp8OT2EXT3pc871ALYsDnry/WJ/uq/f/ENjUW7/RPSCUPSoxDgFFiH
 NvTJPZzMTyjKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=tyre+oEO
Subject: Re: [Buildroot] [PATCH] configs/lepotato_defconfig: new defconfig
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain,

Am Dienstag, 20. Februar 2024, 23:50:25 CET schrieb Romain Naour:
> Add basic support for the Libre Computer "Le Potato" SBC.
> 
> https://libre.computer/products/aml-s905x-cc
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Build test only (as I don't have the board), with ./utils/docker-run

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
