Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563CDC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEB4284C49;
	Sun, 24 Jul 2022 12:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB4284C49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2woI-0V8R2L; Sun, 24 Jul 2022 12:18:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B9384C44;
	Sun, 24 Jul 2022 12:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08B9384C44
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1531BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 214A484C44
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 214A484C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTBNjw6zIwLC for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:18:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F3684BD2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8F3684BD2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:18:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6D9ED20007;
 Sun, 24 Jul 2022 12:18:06 +0000 (UTC)
Date: Sun, 24 Jul 2022 14:18:04 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220724141804.139206ab@windsurf>
In-Reply-To: <20220724082928.196217-1-james.hilliard1@gmail.com>
References: <20220724082928.196217-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658665086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TdYPO9NyNhwnsKJou4Eb7dOol2DoKBwhWkZzk+YmWtc=;
 b=IId7kQOroviMmTs92PGCVeZW9j43ZeIWD8uq59/cDFWiCSPgQtZLPQlhCZ9DSipw8gofdL
 fhw0oczdeKeoPj2v6hiXu61NRXxgi9+tyrDRUh+95uzLlFja2AhAjnDMW0EvNsSrfuZ/1N
 ogldzo0Fq2iNBICO7Pis0TNIVLxP2v7pkATMc7vhRcrGgf/Jit54L0H6USae3jaTwD2vwm
 Z7ow6h3r57O/Z77/QpiFdYL+5ZqMzK2Y1bt7Lne06YiyPxYH1i7NXy56YPKytpFWjAKUBs
 pUsWS6QpvfdX7FS5hW1E3sUhdf54GauNr97kd0qrLIVOSC3Nmavg5kRWeiF4ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IId7kQOr
Subject: Re: [Buildroot] [PATCH v5 1/1] package/python-orjson: bump to
 version 3.7.7
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sun, 24 Jul 2022 02:29:28 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Convert package to use python infrastructure instead of cargo
> infrastructure.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ----

The separator to use is "---" not "----". If you use "---", git am
preserves what's after the "----" in the commit, which is not what we
want.

> Changes v4 -> v5:
>   - rebase
> Changes v3 -> v4:
>   - update to 3.7.7
> ---
>  package/python-orjson/python-orjson.hash |  5 +++--
>  package/python-orjson/python-orjson.mk   | 24 ++++++++++++------------
>  2 files changed, 15 insertions(+), 14 deletions(-)

I've applied the patch after splitting it: first the conversion to
python-package, then the version bump.

Thanks for the help on IRC to iron out the issues!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
