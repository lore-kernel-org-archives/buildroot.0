Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DD6C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE6440920;
	Mon,  6 Nov 2023 22:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE6440920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLH50Ye9GsLy; Mon,  6 Nov 2023 22:01:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1A040015;
	Mon,  6 Nov 2023 22:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1A040015
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4F31BF947
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 559D440015
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 559D440015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uliwH4ixG06t for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:01:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B28540010
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B28540010
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7063A20008;
 Mon,  6 Nov 2023 22:01:46 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:01:45 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106230145.650bbe2b@windsurf>
In-Reply-To: <20231105024758.2763409-1-james.hilliard1@gmail.com>
References: <20231105024758.2763409-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699308106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1vei4bmRGO54jdB68W8eFHWCzhbCxpNcyD+nb53yplg=;
 b=RvkoJAIDL8ZUcFCAbQ1/ma5vWlOvm1fQFLOUrbvZ4SErdz4TKAzL2kJsbmfhXvkY2Hc3L9
 yCR0sdcS9ctGw1Z0VLQNRs8egHOzjiNozWSpJ8a4A8b/ALJgUFMic+AGMNk+23ksD9nkir
 tsEoCgJZjcebsOw0fwKFhxIYw98YtMVQHpqOCXz1QJyEyLpdjBTr6HsYWk0jJBvXqBTQG4
 3rOccNUjQDv8vZPdQ0xA6vQRC8mTL2kgiXGBE/5R2H3g+DEwsaRgKdEbTkq6kzV5dlDDM5
 RDccDYJbUxfp93zdnkAqoFtX2ggtlFl4ZVz0+cJ3MjITE0LocelgXyvS+nsf+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RvkoJAID
Subject: Re: [Buildroot] [PATCH 1/1] package/python-channels-redis: bump to
 version 4.1.0
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

On Sat,  4 Nov 2023 20:47:58 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Replace python-aioredis runtime dependency with python-redis.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-channels-redis/Config.in                  | 2 +-
>  package/python-channels-redis/python-channels-redis.hash | 4 ++--
>  package/python-channels-redis/python-channels-redis.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
