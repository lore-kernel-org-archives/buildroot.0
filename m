Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6C4C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4570980F59;
	Sun, 30 Oct 2022 14:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4570980F59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcWlGg1VHhXO; Sun, 30 Oct 2022 14:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D04A80BB2;
	Sun, 30 Oct 2022 14:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D04A80BB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 360D01BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1199F403A2
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1199F403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMmDzq1QNsa3 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:06:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1406040399
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1406040399
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:06:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32926E0004;
 Sun, 30 Oct 2022 14:06:33 +0000 (UTC)
Date: Sun, 30 Oct 2022 15:06:32 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030150632.1241e9ea@windsurf>
In-Reply-To: <20221029011039.1393998-1-james.hilliard1@gmail.com>
References: <20221029011039.1393998-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667138793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkKSsnDNJe1TQU2Z0woAqzt4vG3AWfhTsEPJxUy2ojg=;
 b=ExeIDGcmo3gLRfYkO5WCvkRz4GrwXf6f5NFNZE4tPRfmokwcpezIkpCRGvRkVqvQU0nCDt
 wWWDS+fzM5dYyJwFHrAm+SySMu/s3nNwo24N6/c0wheZ3t3Oz3SyX4gHuAsbPA8CEBFPQi
 AbX2EIqhYRn23NeI5ic0RnUZmj9dX8Zb0ZGANFvW018vu35S6AtZMRunhyNtxArXYkNqih
 SeBXnrJfvcFcaqeQADTjdjKxWZpQvHRgGkj5qDb5BEmRsuVAQoRAFx2/6FRwDm/at7wm4M
 swLT+l5RW3gbT1SnlYFzqWLSJTJfs4a4q4ZVK4piBnwkGvEAzFdH6AR22Si82w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ExeIDGcm
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydyf: bump to version
 0.5.0
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

On Fri, 28 Oct 2022 19:10:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pydyf/python-pydyf.hash | 4 ++--
>  package/python-pydyf/python-pydyf.mk   | 4 ++--
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
