Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAC6C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87C18815CD;
	Sun,  6 Aug 2023 12:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C18815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWFPZKU9oBMT; Sun,  6 Aug 2023 12:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D531E81E9B;
	Sun,  6 Aug 2023 12:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D531E81E9B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE38C1BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57A3E4011C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57A3E4011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAyk21E-XE8f for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:06:00 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D359D40106
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D359D40106
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F10040002;
 Sun,  6 Aug 2023 12:05:56 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:05:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806140555.5d371dd0@windsurf>
In-Reply-To: <20230805160536.1517856-1-bernd@kuhls.net>
References: <20230805160536.1517856-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691323557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7/vvF+lLsnLvZoOQ5RNvdNhQzggmMIkZZijyPht6m4=;
 b=DvygFC2irggTpYe5mZk/TSzSOGk/5wdGGCzK4WQ3ybzAevjmFHSF6VHW3gNk5KUtolPPq6
 43WeG0TXKKNi+0MMrKT9We1fG1lYgFoF3uY2p6ckNIr11ZO/GDuWU+mDLh+4xBBscpxBUI
 OOsPoS8nOeiuSa76oAGHCqN5W/6QBNbj9txIGc8J8BRDyzNH+xQn1RFzmp2f15bEVEksVX
 gKXUVoEpr3ctXN4rnGXdz5gRsGjT+64LVvZp420pqcrNWycdJCmBWNFtV6uGXdGTyV8S/V
 czGpgAVdsyUCQA5nA0AbbMunV7pt1KjcRyy8GSWdm0tnntN9bSZpsgiXKbk64g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DvygFC2i
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dominate: bump version
 to 2.8.0
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

On Sat,  5 Aug 2023 18:05:36 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://github.com/Knio/dominate/releases/tag/2.8.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-dominate/python-dominate.hash | 4 ++--
>  package/python-dominate/python-dominate.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
