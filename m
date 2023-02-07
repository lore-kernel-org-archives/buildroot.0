Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13257C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 08:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 884934057C;
	Tue,  7 Feb 2023 08:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 884934057C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oetq6XYnp8P5; Tue,  7 Feb 2023 08:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4B4D4059B;
	Tue,  7 Feb 2023 08:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4B4D4059B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 639BD1BF30B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 08:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3036360BCE
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 08:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3036360BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mk1udpdb8gtI for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 08:39:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F28260B0F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F28260B0F
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 08:39:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E82EAC000C;
 Tue,  7 Feb 2023 08:39:32 +0000 (UTC)
Date: Tue, 7 Feb 2023 09:39:32 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230207093932.5f0ace73@windsurf>
In-Reply-To: <9b491a410b4067fb2107567b79329ec541f8b241.1671873478.git.yann.morin.1998@free.fr>
References: <cover.1671873478.git.yann.morin.1998@free.fr>
 <9b491a410b4067fb2107567b79329ec541f8b241.1671873478.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675759173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eKQ7MppWaH+bUCjivdiHhSu0SwHhMd9lJkM6DvakHWg=;
 b=RzoglH6dRH0PLMPj366EIsb9FV2NjfQeqkPqljZXeHquXeU8ZFISu3ivMrxmXKcQNpFsVI
 VaS1aP7/V9EIovu39nDUMc7HVoTLK7gbMDR9dB7v0moG7Z664UtabFm8jcgfNOkcS8IUD8
 X7UeC/jxknPRWhzsD+VbDxkNWxziweTuTDgp49e71BalT5L54DXyQnUUZipwhgvlDBCRUa
 0J6M1GipuAmMrFdITJe6RWpIe4gQ/qQT7+XuzqiL4Q7qtIapgxgEwyP4y54Fgz/tSKj6Rq
 RhrBmbWcxqKTwxKPcqeiT4BR4G+rHr47SMYi5ZLohzEGq9qDan62YypoBeWf8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RzoglH6d
Subject: Re: [Buildroot] [PATCH 3/3] support/tests: enable PPD, and thus TLPB,
 for systemd tests
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 24 Dec 2022 10:18:13 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/testing/tests/init/test_systemd.py | 1 +
>  1 file changed, 1 insertion(+)

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
