Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1862C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 811944098D;
	Sun, 12 Mar 2023 22:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 811944098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsJpHnIJNPjR; Sun, 12 Mar 2023 22:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 680A141C8E;
	Sun, 12 Mar 2023 22:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 680A141C8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8F601BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE49B4097F
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE49B4097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FmHxk2fMfX_r for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:11:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC4D417AD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FC4D417AD
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:11:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5C7F9E0002;
 Sun, 12 Mar 2023 22:11:24 +0000 (UTC)
Date: Sun, 12 Mar 2023 23:11:23 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312231123.3750b9ad@windsurf>
In-Reply-To: <20230305111410.237442-1-ju.o@free.fr>
References: <20230305111410.237442-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678659084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmsKpC3SLWzE3Uu9tYysO/jXoNuBCCwI4uCEL8iEnbY=;
 b=Fl/eGXI93tBiaJZ7aQsRF2oLDbIY7HK48vKbgfr0Kzge/haHu8lA0mctzXLegaxtCQHNqm
 k0HymxmtKLxBaJKFrOndyMm/ncH3YqQFQNWyUXsD0flLotIzd2+o2Lzy7+7wzdfRvMLydx
 zxy05dt2LTTwubJ5Oma4UbDWwfXSmLhDZOZ+Kk/dKstjg0rHFFhAjGmCe4s/0gDxJLLnT/
 16tS+/35kElQuDfZAtU/jKm3ZwUoDJDRrax2t0cRtnitPs2oD63YkIiLLwg9oDUleQaDNn
 j0M6E8RAcukx3ucXL01DXIWUtty+IvhujmBh6xfcp6Kesb5MhjPvAG4YSjbDcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fl/eGXI9
Subject: Re: [Buildroot] [PATCH next 1/1] package/ddrescue: bump to version
 1.27
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

On Sun,  5 Mar 2023 12:14:10 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see the release announce:
> https://lists.gnu.org/archive/html/info-gnu/2023-01/msg00011.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit b793f3a with commands:

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
