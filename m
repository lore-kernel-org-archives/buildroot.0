Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F761C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 17:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F389D60B44;
	Sun, 12 Mar 2023 17:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F389D60B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_3CiV94ad4Y; Sun, 12 Mar 2023 17:59:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B15A60B3F;
	Sun, 12 Mar 2023 17:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B15A60B3F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1B181BF20D
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 17:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98675414C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 17:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98675414C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLqinIr5JBHu for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 17:59:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60A6C410EA
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60A6C410EA
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 17:59:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 957C7100003;
 Sun, 12 Mar 2023 17:59:51 +0000 (UTC)
Date: Sun, 12 Mar 2023 18:59:50 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312185950.32b4a8c5@windsurf>
In-Reply-To: <20230304185341.127963-1-ju.o@free.fr>
References: <20230304185341.127963-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678643991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kui9H8JoR3w0u0q//JNy9cGpgFxQmGDQaCr6KRkDgRw=;
 b=W6y2DGGlMBsSG/NhLpzaY7COksm/Wj74mcIXVjGjezuErpyHZY7WjRDedUWxodNYAX7lW1
 SmkwUptAMTPJ64MMv9Ht8pE892xTv68gCObNmGY/78P221MiwMK3Db3nOZLOqrq4zlWI2/
 BWifZJbj1dWBSqw39Txtom8Gg/MP8MCC/3k+tTe4XxRReXBjIO6vH3wFzIs4U1JW6o78zJ
 xSsUXwkhoJtQGqbmHvc0Yb8m+NE/53MCZRuikrg6hwBJKvQmYvKTTrnamUB4MoAezPywoP
 E20LGvkR8FBrdZh38YXy6B9KUByS/632iCXE2BlG1blLnJ/0swUJGxANQExh8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W6y2DGGl
Subject: Re: [Buildroot] [PATCH next 1/1] package/mtools: bump to version
 4.0.42
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

On Sat,  4 Mar 2023 19:53:41 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Release announce:
> https://lists.gnu.org/archive/html/info-mtools/2022-10/msg00000.html
> 
> For change log since 4.0.38, see:
> https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.42/NEWS?view=markup
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit b793f3a with commands:

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
