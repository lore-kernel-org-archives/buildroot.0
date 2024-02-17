Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864C3C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 08:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 306454159A;
	Sat, 17 Feb 2024 08:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0PuCUwWDE3V; Sat, 17 Feb 2024 08:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50BD341706
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50BD341706;
	Sat, 17 Feb 2024 08:37:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6091BF3D4
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 08:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A8F6608C0
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 08:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjffvSMOyvpp for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 08:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CFCB605EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CFCB605EC
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CFCB605EC
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:37:30 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id F05462411BE;
 Sat, 17 Feb 2024 09:37:27 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id D5DEE801EC;
 Sat, 17 Feb 2024 09:37:27 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 90BB42419D1;
 Sat, 17 Feb 2024 09:37:27 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 09:37:27 +0100
Message-ID: <2718217.mvXUDI8C0e@laptop>
In-Reply-To: <05ae161a-0e1c-4cd5-92d1-4fd5b7d8c798@benettiengineering.com>
References: <20240216221738.693818-1-kilian.zinnecker@mail.de>
 <05ae161a-0e1c-4cd5-92d1-4fd5b7d8c798@benettiengineering.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 184
X-purgate-ID: 154282::1708159047-BD52E878-E93B96D9/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1708159047;
 bh=sepZy+B+rcXSyOOPHdU9f0ZSl7NYpE7ZF0EQ6RkSouI=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=R0RJkzZZ3eCieF3MMTY37yzFBnlznOEjSV85PKtFIeS3xhnCI9X8epLSSl2LVOC15
 +hizrUW5L/RO+E3i/xBUTOr5TcuJzPAIs9PaYz8IgMckMqOQu8g23x/4SRmJhi7B09
 W+PVcWEm0EOk8fq+56vwxscZa3IVUJi+Z4iHI6kXjnmkjkJ6jO6vNmttMWpVHigOvH
 z/ssSocvDj3uOScy1V27aPP0RdHSJQD1n5ECLc337Ped20xyQ7ah8ALcYPb0VDctkr
 zG6fajt6+emX2u2MYDChYyldvW66BOcaFu8JmWJvX294PNYFzkupOFF1StSyuc3Fq4
 4iGn9PBr6cwxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=R0RJkzZZ
Subject: Re: [Buildroot] [PATCH v2] configs/rock5b_defconfig: switch to
 mainline linux
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio, all,

> Hi Kilian,
> 
> almost there, 2 comments below,

[--SNIP --]

I addressed the 2 issues and send a v3. Thanks for reviewing!

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
