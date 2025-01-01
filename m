Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2CCE7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 21:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A135E6069E;
	Wed,  1 Jan 2025 21:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEvaBDSxfw7q; Wed,  1 Jan 2025 21:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA6D3606A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6D3606A3;
	Wed,  1 Jan 2025 21:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6EB2F24
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 21:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A84708183D
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 21:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8STkl15T0_N for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 21:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBE1681836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBE1681836
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBE1681836
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 21:03:34 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 4082D240D73;
 Wed,  1 Jan 2025 22:03:33 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id 16E0E26003B;
 Wed,  1 Jan 2025 22:03:33 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 098DA241824;
 Wed,  1 Jan 2025 22:03:31 +0100 (CET)
To: buildroot@buildroot.org
Cc: Drew Fustini <dfustini@tenstorrent.com>,
 Drew Fustini <drew@beagleboard.org>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org, Han Gao <rabenda.cn@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 kilian.zinnecker@mail.de
Date: Wed, 01 Jan 2025 22:02:35 +0100
Message-ID: <3258931.5fSG56mABF@kilian-laptop>
In-Reply-To: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
References: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 402
X-purgate-ID: 154282::1735765412-8353989E-B696E9FF/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735765413;
 bh=GoZq67wKwp5o7OAOdW+IXtviVtqjvEB03pS56biDOk4=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=L3qR4XTiLdvWwfj6QxlwpAQtnnxxBwMJ6EPMDddpRhytqeEIQWA5Siy8ybrny8CfJ
 I2PbUvsyK3bnm35T4KFkvKFStK6H3pOSBSzihAp7nkX5doPrGvwHiItPaSJYaQVEsH
 gfjqnJnWegp/sgZjI8w9aWKnYw5A50rVIdCzI6ZKw0p1Hf3gxYuoApUc6NoA1MoaF4
 q2c2LSljPbc1s2+tMAqJLtHBnY/9NrlXCgMphEyly/yBdw+fQ7KfRyXU40C0mK/4Nz
 6UWt0tXEbHb9e9v+zd1Dr6uaF0yQlAyp4B9XW400S1/E8mLF3YJVtMa3rIqotI9pda
 Ag8ujEa94ogUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=L3qR4XTi
Subject: Re: [Buildroot] [PATCH v6 0/2] Add board support for the
 BeagleV-Ahead
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,

this v6 of the board support is unfortunately also not yet ready to get 
accepted. However, we are one step furthcer. Again all feedback highly 
appreciated!

I was able to change to another custom uboot, which seems capable of 
activating all 4 cores of the SoC. However, still the two needed binary blobs 
are in a repository without a LICENSE file.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
