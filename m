Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818DCC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D8C60AF0;
	Sun,  7 Aug 2022 12:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D8C60AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mJi5Y1h1x4Q; Sun,  7 Aug 2022 12:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F84E60ADF;
	Sun,  7 Aug 2022 12:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F84E60ADF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C37F11BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D1874162C
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D1874162C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZTfId8wEsIn for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:55:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3403841626
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3403841626
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:55:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 174B91C0002;
 Sun,  7 Aug 2022 12:55:53 +0000 (UTC)
Date: Sun, 7 Aug 2022 14:55:53 +0200
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20220807145553.023c66ce@windsurf>
In-Reply-To: <20220804052332.19537-1-yegorslists@googlemail.com>
References: <20220804052332.19537-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659876954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhZZvaAO3HkfFwkfAq8NoyhHRhgdu6gNt+tYRyoqZ00=;
 b=phomfiXcvr3kjkkm1XFgo/Yq2Ss4T86ImbrVwjuMY1Hs5qBmfeb+g7IKh6WuHxc3oJ1hNb
 jN0nFT4MLvz6BDfrb+HdwFCdIenrEvdXyKx1LlOfIviTQSKOY3zeyAXHqqAz/Tmy4lcBDz
 Zp0zq95mmI02ETthPtAWJ7qRs+B7lpxXLgJTBNw9ZVsiT1Q9hjjFYIqBtBB9PkszuGCosq
 MRjCEhJjslLjInodkuLd1zeg+m3HaZB+r1rCidIfbIg8Nbqb7UjuNvv0Mxc5sdtsHoX60P
 vULE3TfJ6JEtIVDHI9YHdXZerHLhkFYYl2zZtzCL8XOcgxgq+ZdcoUWY74wCxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=phomfiXc
Subject: Re: [Buildroot] [PATCH 1/2] package/python-dtschema: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  4 Aug 2022 07:23:31 +0200
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                            |  1 +
>  package/python-dtschema/Config.in            | 10 ++++++++++
>  package/python-dtschema/python-dtschema.hash |  5 +++++
>  package/python-dtschema/python-dtschema.mk   | 15 +++++++++++++++
>  4 files changed, 31 insertions(+)
>  create mode 100644 package/python-dtschema/Config.in
>  create mode 100644 package/python-dtschema/python-dtschema.hash
>  create mode 100644 package/python-dtschema/python-dtschema.mk

Thanks, both applied. On the second patch, adding the sample test
script in DEVELOPERS file was missing (the test itself was added, but
not the sample script), so I fixed that up when applying.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
