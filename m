Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDB2ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 505D9401FE;
	Sun, 30 Oct 2022 14:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 505D9401FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZzCJzhg2JLB; Sun, 30 Oct 2022 14:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E30401AF;
	Sun, 30 Oct 2022 14:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54E30401AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBFAE1BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C515781257
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C515781257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbRj-lu2btyI for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:06:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F33B80F2C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F33B80F2C
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:06:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D325100007;
 Sun, 30 Oct 2022 14:06:28 +0000 (UTC)
Date: Sun, 30 Oct 2022 15:06:27 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030150627.6336eb1e@windsurf>
In-Reply-To: <20221029010612.1391444-1-james.hilliard1@gmail.com>
References: <20221029010612.1391444-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667138788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2U2uC5I4xTDX91hH6NVFB6qimpw7ZRFmdlrdcyUeGk4=;
 b=p7lAvbj/6r5ys7y771uTsT3xbya4xJ0U5HPseFueiz/G00GClZowzYuKb9o4Kap3kZfuEi
 IK8JXKwhSpWg8dmon525VLfxLoYPeOYNREJ5usDH06c6taSiAXQuaa5YsTrmdWkDQMGRKb
 DKuKx9Zha18yuebrbtOLn7iEn17AXqkv5oquD9RjLIbYzVkb73jr+nspP59Tj2MLV1ZNlz
 45o28FDNriK8Mb54ByxKMvy1ynhBER0qizqD3EGsTK7NqNDG/zB8Ry3csP4+BZO+W4VOxn
 rfOr7uLAso08S/ysrT6svqgLgOLRTAOwo6F6eVVbuYyWyxpqOFqHYKqR1EqOjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p7lAvbj/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to
 version 57.0
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

On Fri, 28 Oct 2022 19:06:12 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-weasyprint/python-weasyprint.hash | 4 ++--
>  package/python-weasyprint/python-weasyprint.mk   | 4 ++--
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
