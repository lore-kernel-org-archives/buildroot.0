Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5E2C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45189813EC;
	Fri, 29 Jul 2022 19:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45189813EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgmdBgTeuGbw; Fri, 29 Jul 2022 19:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39820812B2;
	Fri, 29 Jul 2022 19:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39820812B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8EF71BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79182812B2
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79182812B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8p6tYb1PN8L6 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:53:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E649880C80
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E649880C80
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:53:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 94BF2240002;
 Fri, 29 Jul 2022 19:53:50 +0000 (UTC)
Date: Fri, 29 Jul 2022 21:53:47 +0200
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20220729215347.00d0a47e@windsurf>
In-Reply-To: <20220729184542.213544-1-pevik@seznam.cz>
References: <20220729184542.213544-1-pevik@seznam.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659124431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kC0R7QiGO1ZXICZxSsxfdJhfbxUj0oICO9SVv1+CuVs=;
 b=DC06R6fK3K+NisjxA2HWxneUGbTJdKpD1glb4QmcOIsbYj2HGak7qJHV9SUeUNA37tsHNJ
 gRBzcjk2RIDLSXa3qvzKtIabwr8XesFK4QRRVKkAkpyQ3pipx6GB2gdS/nuq/Bb13Z4CQO
 IvABaUfepCJOsl5gup7Qs2zJci6ef4EXWX2C8CQnb4M4OOyLL+Dqdc6/SIt1CE21LBj/z2
 haspN5is6HOkqsSvTPDDsRSDd46NHL6x6ax63BGbzGw6sjhBpY4HfIzmPJSmJOmXuc2uA8
 LNKiTEEanukHis87rIss6zhGOTud+HuxqnIAQEFWwqA9+U8l+v0VhkW0Ia3mVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DC06R6fK
Subject: Re: [Buildroot] [PATCH 0/3] modem-manager,
 libqmi and libmbim updates
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 20:45:39 +0200
Petr Vorel <pevik@seznam.cz> wrote:

> Petr Vorel (3):
>   package/libmbim: bump version to 1.26.4
>   package/libqmi: bump version to 1.30.8
>   package/modem-manager: bind version to 1.18.10

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
