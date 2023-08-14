Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5761C04A6A
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 14:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 031BE60A6D;
	Mon, 14 Aug 2023 14:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 031BE60A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8vfE9flgoZE; Mon, 14 Aug 2023 14:37:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D39161076;
	Mon, 14 Aug 2023 14:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D39161076
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C60181BF385
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7023C40B5C
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7023C40B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfdItMcPlSbF for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 14:37:16 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57157402F3
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 14:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57157402F3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 027EA40009;
 Mon, 14 Aug 2023 14:37:12 +0000 (UTC)
Date: Mon, 14 Aug 2023 16:37:10 +0200
To: Ismael Luceno <ismael@iodev.co.uk>
Message-ID: <20230814163710.784dd6bf@windsurf>
In-Reply-To: <20230814113416.27631-1-ismael@iodev.co.uk>
References: <20230814113416.27631-1-ismael@iodev.co.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692023833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TLWogAu6HRXfpZB4TwSgZqIy187YhfnadvNEO94IcCE=;
 b=T27icz4AiALBMIyl3C8W823Co4qEyFuz0sDge9H5qOwr13eZodf7F78iEVplR/ywnJdluu
 T/JoHiE6RFMoxlQmJ1fMVFL0uDsG9uK7DdYkbmOc7bmnlvFp98JcBgSjuLVHwWAGV419pI
 AKnRtiq7P+QAK220u+wY9RgAfvpl5HHxQh0JilDWFdU7E58p7bQlHvLhHe/p5X8u01UCf4
 3aXC7fWsFOJZY2vIHOVJDAdVkXPydwdAfGi61+wj9plmG2jVEkxZvt2UB6aSkdcHW/1KCI
 WpydaNl9OuRcBTUAnPowpX0qYcOyll0kpM/9qXJ9WkfYAxl9in9lWa3EUm/YwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T27icz4A
Subject: Re: [Buildroot] [PATCH] mawk 1.3.4-20230808
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

Hello,

On Mon, 14 Aug 2023 13:34:16 +0200
Ismael Luceno <ismael@iodev.co.uk> wrote:

> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

Minor nit: the commit title should be "package/mawk: bump version to 1.3.4-20230808"

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
