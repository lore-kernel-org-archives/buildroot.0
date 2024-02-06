Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EDAC4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E03D41EE6;
	Tue,  6 Feb 2024 10:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E03D41EE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P47A8eRHttC6; Tue,  6 Feb 2024 10:39:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 823C641C6A;
	Tue,  6 Feb 2024 10:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 823C641C6A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1ABE1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB07B41EA3
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB07B41EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkVXqf1qsoJ5 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:35:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8B3141E86
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8B3141E86
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01BF01C0002;
 Tue,  6 Feb 2024 10:35:36 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:35:36 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113536.11f06c7e@windsurf>
In-Reply-To: <20240109075836.4057394-1-james.hilliard1@gmail.com>
References: <20240109075836.4057394-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ROp6Eqd0BZ3q9glSkGYMRicse2HtAp5K8ZSgkVqT8xg=;
 b=Ucizj60orJe9TNW3QJ7nWBbequFBlxxQYkg5Ljym2wGXvhmBFDMa3ROQ8I+dhID5izfK/s
 4FrsRQZqJE0BgWM3/W3jKvcsDnkRL4A/o/aKRm/2OL+XWHwEFGXNUH9GjB7yhwXyqncwKE
 GNmmdMgSJadEsMSSfNoNx/ASd+vcZQh32+SFkDjPY175vrzUJixV5yE5kfpsEfRxYhrpqe
 O8BUIpeil7b2b+wAg5ZN1AUKnpGYHacWjTZ6DabOaOp7QqC3PMfUIlUaX1ddqInd1ZqLdj
 NdXsRO1wImykejC5oOQ1cg5Ruk9M9Xu4xhmuWgbQyHaChSlC8dg7bpcf/d0NLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ucizj60o
Subject: Re: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to
 version 3.0.3
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

On Tue,  9 Jan 2024 00:58:36 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-greenlet/python-greenlet.hash | 4 ++--
>  package/python-greenlet/python-greenlet.mk   | 4 ++--
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
