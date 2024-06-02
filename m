Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BB0C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 07:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFA8E845B9;
	Sun,  2 Jun 2024 07:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZEpIb72KtQa; Sun,  2 Jun 2024 07:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0EF8845BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0EF8845BA;
	Sun,  2 Jun 2024 07:43:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B83C1BF3DB
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 07:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03CCE402EF
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 07:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEoigaJvhGN0 for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 07:43:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::190a;
 helo=smtp-190a.mail.infomaniak.ch;
 envelope-from=slaveze@smartandconnective.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE11C402EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE11C402EC
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::190a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE11C402EC
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 07:43:40 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VsTPN0vbWzYmt;
 Sun,  2 Jun 2024 09:43:36 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4VsTPM4ptkzK0F; Sun,  2 Jun 2024 09:43:35 +0200 (CEST)
Message-ID: <46067329e600ca0214c6fb703b04a7892bc2f4a9.camel@smartandconnective.com>
From: Sebastien Laveze <slaveze@smartandconnective.com>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jun 2024 09:43:35 +0200
In-Reply-To: <87ed9gl6n6.fsf@dell.be.48ers.dk>
References: <20240529072911.288748-1-slaveze@smartandconnective.com>
 <87ed9gl6n6.fsf@dell.be.48ers.dk>
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartandconnective.com; s=20191114; t=1717314216;
 bh=bBRTcLlL6tVnYL0cKck09qwkPRv15QlFeYU5OMNJm7A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=dTqqzjqlmS3AruD4cyzWGz72ynQB0S7LZK5GolWdba2d6bQElaEpSUkqiFYDNQO1N
 MV+D70wgRH4yT11SMjvlYe8XoaYQhVC91YHtyIHJX6UHpy5IDwOOHBvE0RrZ76E0CS
 w/628Z1yVy2fsuW+RH4eKPFhfKhzwhtUbFwJBpKE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=smartandconnective.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com
 header.a=rsa-sha256 header.s=20191114 header.b=dTqqzjql
Subject: Re: [Buildroot] [PATCH] package/mosquitto: add target
 mosquitto_passwd
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> And committed to next, thanks.

Great, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
