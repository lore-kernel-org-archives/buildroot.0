Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E03CEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C5941D77;
	Wed, 12 Jul 2023 21:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C5941D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRkaGgHf-JmM; Wed, 12 Jul 2023 21:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C5141F0E;
	Wed, 12 Jul 2023 21:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C5141F0E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0602E1BF400
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD58582C91
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD58582C91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vT4mTNQUubct for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E075A80A72
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E075A80A72
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:00:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96B9F1C0009;
 Wed, 12 Jul 2023 21:00:40 +0000 (UTC)
Date: Wed, 12 Jul 2023 23:00:38 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20230712230038.0719f012@windsurf>
In-Reply-To: <20230611233619.128038-4-grzegorz@blach.pl>
References: <20230611233619.128038-1-grzegorz@blach.pl>
 <20230611233619.128038-4-grzegorz@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689195641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQ1G8/9+tSVZwETE4XrTcYD+A6iCRMndR0zmrdXaXpQ=;
 b=D1vECiyVQj9sDa23Bv+JzdvchNodKtQsxcxG+fRwpKFzZgji/huTaLjYEVItReMFeOVbna
 aXFkZtWGCjNAb4h3antxTQfewsLm4JudOVmtMu1WTW3KFGGEEvPiFxNZa4uYSvqZL44qF/
 8vnzk1lUNfPIUuMH7Uvw9n35IQAWZFJe9vpdebpSrcTWeVTt+pYVygeoL7grL4Jy1jq3oV
 cTL0QhnD/iNfCg9S1XKvWAfPIAO9IBQdbP5FSPzH+ygiN3qTM366Ru7Fd5/fE/HTOdMIz6
 6mC8nLxmoEPBzwr1WI4qs4SrEtwvBt9BasyLOu2uOvuJLmsLTddUy2Lm/Wxz/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D1vECiyV
Subject: Re: [Buildroot] [PATCH 4/6] package/python-pyjwt: bump to version
 2.7.0
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

On Mon, 12 Jun 2023 01:36:17 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/python-pyjwt/python-pyjwt.hash | 4 ++--
>  package/python-pyjwt/python-pyjwt.mk   | 4 ++--
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
