Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A769BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DE2C41C06;
	Thu, 28 Apr 2022 21:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6TX0Ergv0MZH; Thu, 28 Apr 2022 21:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3554541C00;
	Thu, 28 Apr 2022 21:39:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CA141BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A08183F25
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7hNnaq9abes for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:38:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88B0F83F3D
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:38:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1C3FEC0002;
 Thu, 28 Apr 2022 21:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651181910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TS1x5kEZ1VdRlGAIUDKbBGdXJbpsma7Op96wGSCCdmM=;
 b=nxAoX9JIzhNeF11IfU+JvN/H/GB/jk5rOAdnvZSk681/+2Wk9Y+P6vZfcPIWCEECdS/4re
 sBL1ghc2CKg7iQLXRJkoGfAxoHh+bmU3Vb7PTbTlakOlzhnTeh76UzRlT0NNhOABFfa802
 L5WEg7iJcnMI985f2dlIDT7mnuOxodi7WpXHqOdavRTTP9W2axZB5ucBnPGHQ6VIiZc2CJ
 QWJY5K/quN0EhBZ6NIHY4GBheaeK/U7Z10nONRGAnDb4M/3H3XE3CpByy6HKWkCxc1hOpZ
 3xECdGI74XBDW+u8a9A/JF2LNrLh9ejjawT33NOKQ6MuinsteUcnbBhcNyJFrw==
Date: Thu, 28 Apr 2022 23:38:28 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220428233828.52ccf8c8@windsurf>
In-Reply-To: <20220428201619.792756-1-james.hilliard1@gmail.com>
References: <20220428201619.792756-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to
 version 22.3.2
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Apr 2022 14:16:19 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-autobahn/python-autobahn.hash | 4 ++--
>  package/python-autobahn/python-autobahn.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
