Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E298C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF1A841CD;
	Sun,  5 Jun 2022 21:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJ6Qt6L-GXlJ; Sun,  5 Jun 2022 21:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 576FA841C2;
	Sun,  5 Jun 2022 21:11:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BDB41BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4E2141754
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LSJ0RDo08Pl for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:11:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56E9B41796
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:11:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3A326C0003;
 Sun,  5 Jun 2022 21:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654463479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XheAczkgxG4YpM1MnKQndj5X/qxKmYD4LftOZZg/uSM=;
 b=k8FvJUrK3p9jthZ5aLgX0lmC+3W/7iwgD8tc9agMJLgU3hFrSi+1qTRZY6SEei/DIwxjUa
 ky0tktS090GTpmsvohJSeORd6+hPS5BGYm81seGn9Bfxujw2VL/WmzGX+gZlcQA+BBa4kQ
 kahkLjQ4vuGLs0zk2RUQlPyxU7xIQKIgBo2WAd4f+DActt76Mr0SMHOws2lXeQW55j5pHf
 AJGlakf5rk6r44Wjwy8OvkJcmYL7R3yaRxhsnaWed90fNX0pA3xA0866JnF5FXEuX17Phh
 mnFo2vjsMfTodUAXICulHYrGsd56somz0mm8nJtdA3Z+FqQSTWZGNAxbxfBTeA==
Date: Sun, 5 Jun 2022 23:11:18 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20220605231118.1a0a0f5a@windsurf>
In-Reply-To: <20220529223248.51556-4-grzegorz@blach.pl>
References: <20220529223248.51556-1-grzegorz@blach.pl>
 <20220529223248.51556-4-grzegorz@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/python-aioblescan: Bump to
 version 0.2.13
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 May 2022 00:32:46 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/python-aioblescan/python-aioblescan.hash | 4 ++--
>  package/python-aioblescan/python-aioblescan.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
