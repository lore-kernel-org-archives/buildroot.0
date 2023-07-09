Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C96EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 17:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A313060750;
	Sun,  9 Jul 2023 17:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A313060750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PK_NRIM21CJ; Sun,  9 Jul 2023 17:39:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0369E60746;
	Sun,  9 Jul 2023 17:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0369E60746
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 944871BF289
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 17:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 787D240960
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 17:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 787D240960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwFWjBmpWgrA for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 17:39:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A19C940953
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A19C940953
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 17:39:28 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 0E451A0647;
 Sun,  9 Jul 2023 19:39:27 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id DB723A00E2;
 Sun,  9 Jul 2023 19:39:26 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 9AB3D10012D;
 Sun,  9 Jul 2023 19:39:26 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 09 Jul 2023 19:39:26 +0200
Message-ID: <8241193.T7Z3S40VBb@kilian-aisec>
In-Reply-To: <20230707075339.7207-1-robertoxmed@gmail.com>
References: <20230707075339.7207-1-robertoxmed@gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 190
X-purgate-ID: 154282::1688924366-5F7FA7B6-C71C10BA/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688924366;
 bh=EQy8CSbx0En2zBFtjmL+HjxQe3WVFGlg78o7iyUQmho=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=VdNP9IHhDmeoV9Qv34DfBRs3XlSxD3Q5+cFKYOjj1yXG5EE8f4IWtrWnHdvndLNC/
 w7+H0UU7Sby4ZgOQf1ULBur5VwZ6KzJhYbtaiFWHpXxvfTIhpP9LYXpjkixOl9qQik
 X1CsYjvu75sjvoe8XDcghAlwS+HIVcQnH/XV6/G0cyKe8hmma6TqSX55oF9TkPDq8W
 2PftGzgCliySgK/BlNri7g8DneCV1o7mDSF5Jw8Ps9jO3jmp2KHUX3n63E5Q8lcf1E
 kV2StntCROyXQV5gtrq2e21DbAN6Erd88Z5psf3ij9TvU2koPS7FuI2etOyHUUuHe1
 hdx3aocCUzs/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=VdNP9IHh
Subject: Re: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Bring back the
 configuration for the rockchip rk3399 built by firefly.
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
Cc: Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Roberto, all,

...
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
...
Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
	build test only

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
