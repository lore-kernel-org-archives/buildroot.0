Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE7EC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57D64416E3;
	Sun, 14 Aug 2022 10:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D64416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JkrBR06vxs17; Sun, 14 Aug 2022 10:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E4841528;
	Sun, 14 Aug 2022 10:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E4841528
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 688D91BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43E354024B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E354024B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMPy1JNWnw_S for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:08:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3669D400D8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3669D400D8
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:08:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1271A60004;
 Sun, 14 Aug 2022 10:08:14 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:08:14 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220814120814.78251918@windsurf>
In-Reply-To: <20220812230643.95772-1-giulio.benetti@benettiengineering.com>
References: <20220812230643.95772-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660471695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hlbjc3OiUtz35xT7oLRaYW2n6QJEEYxL0pwoLwC7rek=;
 b=LDFn3zPd6LvPkDTwRtK8aa49P1JaFXapkSUhJxbx6iZPqnCH2J0gGAGHYIZFrwpbviJWLJ
 3D1METUn8wI8+2C/wGa11uXnXJWo1hFgn9macr3S2lsmPUvnODG+gpAjcwfkLUQXvz8+DB
 qoL55k/KYX8EfISJHAem7xQVLETmQAzvqgOxSknhiz31VkqDlisC7TkBjU2jdl0gD7EZM8
 p2Gah2rjVAsih9VuM+iwVx4v6T5/aCwahJF5bkWDcGkdAdCPJ5CqnESV+dVZdWh4ey5Sue
 Pex0ZxR7YbGZxXX0owYukSywPu3H8ZpjBK9u5g3dLfGonhaHh3lydZ6Paqxn3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LDFn3zPd
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump version
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
Cc: =?UTF-8?B?TWlxdcOobA==?= Raynal <miquel.raynal@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Aug 2022 01:06:43 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version fixes build failure with Linux version >= 5.15.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/mali-driver/mali-driver.hash | 2 +-
>  package/mali-driver/mali-driver.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master as it fixes a build issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
