Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBAFC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4A9420E7;
	Mon,  6 Nov 2023 22:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A4A9420E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qma7ey2sEk2x; Mon,  6 Nov 2023 22:33:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8335C42127;
	Mon,  6 Nov 2023 22:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8335C42127
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E72851BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEF12612C6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEF12612C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MpsYe9-9RD7W for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B76AA61286
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B76AA61286
Received: by mail.gandi.net (Postfix) with ESMTPSA id 162C960003;
 Mon,  6 Nov 2023 22:26:01 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232329.52bbd863@windsurf>
In-Reply-To: <20231105075709.2892493-1-james.hilliard1@gmail.com>
References: <20231105075709.2892493-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=st4E3Mqy4w+NlV6XEgPomgUQnpyJaETzF1AKXYzufPw=;
 b=WSDFK1pRtu6q61/25kyEDXMxCS5azT6dUU3XUQtcwbq6fP05wbtwdX8Ic1zYFYw12kabM4
 LUYt8uoSHlKScTsmE1kOR5UUQ/rqjvrpTuTrdP+YhNtO/U61vFQVha/C3g69x/uYdobXAu
 A/s5KGUMNCe/0Jid6A6go/0SzT+I1ud9GDWBybsrzl1/Fdve9qSVOyK605Zi6h9bkQcg3U
 4tdWIu5/Wu9wRvysVtsEGfneXiI7UCOy2udnultsO+O7n6VBH9te5pGPRgaZitpnbssNcK
 Q7+Hk+n11GV7HcKdOmG5QQNlJXnlvOEDj+c3HQ8XgrIuuOLC0ndlkx1eXkhsKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WSDFK1pR
Subject: Re: [Buildroot] [PATCH 1/1] package/python-iso8601: bump to version
 2.1.0
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

On Sun,  5 Nov 2023 01:57:09 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-iso8601/python-iso8601.hash | 4 ++--
>  package/python-iso8601/python-iso8601.mk   | 4 ++--
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
