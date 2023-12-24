Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8DCC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 17:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 265C981E29;
	Sun, 24 Dec 2023 17:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 265C981E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ho1YN-zIEZUQ; Sun, 24 Dec 2023 17:55:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 807D281B52;
	Sun, 24 Dec 2023 17:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 807D281B52
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A21181BF398
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DCC04155B
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DCC04155B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BphYNTNTEUF3 for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 17:54:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7589441559
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 17:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7589441559
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0394E0003;
 Sun, 24 Dec 2023 17:54:43 +0000 (UTC)
Date: Sun, 24 Dec 2023 18:54:43 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231224185443.34f0d371@windsurf>
In-Reply-To: <20231214070135.2198313-1-james.hilliard1@gmail.com>
References: <20231214070135.2198313-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703440484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QV3kdjSkpVgcHlXA2ppFS4f17MJhxA548R2ayNZx2Y0=;
 b=KlmjWHvyTG9+tEJ2qviqsqd8Se3/A7UMAf4Td6Hj+3cQkJzOL98cPTGHvyJwoa2mXakCsG
 yTit3h0N1PPX7C1q3MdDERX8gKnI4vxVE0a5tkbSwWytyjxg4i6gySctub/nqX1GtXhqw9
 6R3AeLZKgNYaokPwslfDKFqlCD58y/4s4JtVTCtzLyHli5qgfNouWurKN+gqb+bQnJCu4S
 ZpqV2cRWSl7UdLsYAxkq1eVKOIrgX5MxPcNuPt/P1R6zHfZAmBj3COwFDK5IUbPr7KORNi
 iVMquy+kk2y8zbofh76to5BZSyA0hmDPxHZYsIJVJd0Bhn+a6VmiGljrf3eOSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KlmjWHvy
Subject: Re: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2023.11.17
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

On Thu, 14 Dec 2023 00:01:35 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to inaccurate date cleanup:
> https://github.com/certifi/python-certifi/commit/2103453dd43dbfb859f257b193d9087b3997959a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-certifi/python-certifi.hash | 6 +++---
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
