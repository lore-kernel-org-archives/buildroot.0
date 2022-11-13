Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EB6C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F43860BF3;
	Sun, 13 Nov 2022 21:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F43860BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFMtMZtMoAtC; Sun, 13 Nov 2022 21:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A063760BF6;
	Sun, 13 Nov 2022 21:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A063760BF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA3151BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A881960BDD
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A881960BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-P7qzE3uEIG for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:51:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F14360BEF
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F14360BEF
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:51:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 827CA100002;
 Sun, 13 Nov 2022 21:51:55 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:51:54 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221113225154.67c891b1@windsurf>
In-Reply-To: <20221108214826.3564056-1-james.hilliard1@gmail.com>
References: <20221108214826.3564056-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668376315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9bA+ZPNLx1HBIibdxgMdyaU+1N7wvy9pQLSpuAXOEA=;
 b=KN32MEbBJxIaTQTF5jKULVlWgVYtv6AswUCHi3po8UeUUSxtNa85jra4/kLIG1zXbZKfbL
 0Ef+vInjci/llPgZYelVJ3yaDU3nEALybMDpBNC6IKsNQrVegEA5w+RWqV+5o2i3AZdCdM
 K9kIxI7TC0LeWvjQjAdAMGbpx65yLTS0dLo1kyqRtmlhR/dK0Ing4k0pagdy1u9aKPaHjp
 PLZ/hT0XO5OEiBt3OrOnPbt12yOi4m/8EWe9/MNTiye7gLxauNaGpdqiJk07Y5SOiw5s7r
 vW0ZHNQeR+LVd+1FWXO9/2mz6inpPs9IsIw7m0r67R3cQcDGi2twv3Vlo+yTHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KN32MEbB
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-twisted: bump to
 version 22.10.0
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

On Tue,  8 Nov 2022 14:48:26 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Remove inaccurate comment that claims twisted and treq version/site
> variables are shared. They are not shared and the packages aren't
> always updated at the same time.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - remove bogus comment about twisted/treq versions/site variables being shared
> ---
>  package/python-treq/python-treq.mk         | 3 ---
>  package/python-twisted/python-twisted.hash | 4 ++--
>  package/python-twisted/python-twisted.mk   | 7 ++-----
>  3 files changed, 4 insertions(+), 10 deletions(-)

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
