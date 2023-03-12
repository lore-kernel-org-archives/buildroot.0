Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C729DC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 18:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B4B60A82;
	Sun, 12 Mar 2023 18:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B4B60A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2yhiTyohI23p; Sun, 12 Mar 2023 18:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 848F360B26;
	Sun, 12 Mar 2023 18:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 848F360B26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA5151BF20D
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 941C040453
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 941C040453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULYh0rsGLV58 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 18:03:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEC4D400A4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEC4D400A4
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 18:03:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B2EE220002;
 Sun, 12 Mar 2023 18:03:35 +0000 (UTC)
Date: Sun, 12 Mar 2023 19:03:34 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230312190334.03a06df7@windsurf>
In-Reply-To: <20230312160909.921651-1-giulio.benetti@benettiengineering.com>
References: <20230312160909.921651-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678644216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CG9VhjC5pP22cutR19btGAu2uqnT+3QpRIU74qyigaE=;
 b=FXByzOlKUiwhwqOIR2iXRLQqpSA/sjFBe2wU7v7l7Ah5d6TQanMAU3vRAHb9eB5qmJisXu
 jBZfuDygeqecLw7E7qIcxFq2z+0FhBjSp+pksHNc+Ckz+d6xdMBlwvDoIuL9pGTCBOZA0l
 wBBIdvHFCwTu849FL0iofQEQj/l15W3P8rCjikvdOgxbMd4XxlSzrr68sNrNc2z7jK3kim
 yImh8PKSN3XwOYOTjBSW8hUPJizGrYSfWbdYTIt/TTHSK73q5qSxQ4RNGmMBzYLY8hFQct
 9b1XgRgwVIZcOAMuzjh2eHSw5KYvORwvkZBi1c+ON3AhG70pt7gzGlOpp0xZIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FXByzOlK
Subject: Re: [Buildroot] [PATH for-next] package/rtl8192eu: bump to version
 2023-03-12 on branch 5.11.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 12 Mar 2023 17:09:09 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Drop local patch that has been upstreamed.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...02-Fix-conflicting-get_ra-on-PowerPC.patch | 124 ------------------
>  package/rtl8192eu/rtl8192eu.hash              |   2 +-
>  package/rtl8192eu/rtl8192eu.mk                |   2 +-
>  3 files changed, 2 insertions(+), 126 deletions(-)
>  delete mode 100644 package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch

In fact, I will not apply. I will wait for next to be merged back into
master for this, as there is a conflict.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
