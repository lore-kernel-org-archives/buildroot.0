Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AABFC4167B
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36DDA60BBD;
	Sun, 11 Dec 2022 13:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36DDA60BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOwPWTJ0Kzdv; Sun, 11 Dec 2022 13:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C3C260BBC;
	Sun, 11 Dec 2022 13:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C3C260BBC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CCC11BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27E8840529
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27E8840529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ieO6gg9Jtbd for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:23:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC66C40520
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC66C40520
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:23:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8CC001C0007;
 Sun, 11 Dec 2022 13:23:03 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:23:02 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211142302.71de89e6@windsurf>
In-Reply-To: <20221208205807.18594-1-fontaine.fabrice@gmail.com>
References: <20221208205807.18594-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670764983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7AOO9GMssJnmkSkvkKhqUvRgjekAmISgK51GPLbieM=;
 b=Fp+cMQCNqdDgdCYE4RyXFxVbuYcYPXNkkX7O5b/2roLdAfIpvtcV16/y2hG2U5ia4A+Hjq
 4XKSXEw5zxf4HWIVYEvdblTPfTIsKkEXdOLPtlvRzT8oZ5fQQNxrf+Y9dZEEmq0azMcg/X
 0DPxKpCJvhh15BqZ/yCEnOUq2tehILYyajn/ujDOD31Ea46N5/RaCVkYAfQUlA9jemzL6u
 bk1fbgB7jU4sq37gHj31tLKIt5w6J43JIGyT21Yeg/r42GAoamalTOhldi+Goey7tNIeaH
 CPGRA0xgUhmoJm1z1yF1GHia3o/y14nde3FKt+Kv0cWBj+AqKVV9ueo7FqWVJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fp+cMQCN
Subject: Re: [Buildroot] [PATCH 1/1] package/dehydrated: bump to version
 0.7.1
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

On Thu,  8 Dec 2022 21:58:07 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of LICENSE (update in year:
> https://github.com/dehydrated-io/dehydrated/commit/dd0bbd2405ecea4820ad2442120d8dc4a37137b6)
> 
> https://github.com/dehydrated-io/dehydrated/releases/tag/v0.7.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dehydrated/dehydrated.hash | 6 +++---
>  package/dehydrated/dehydrated.mk   | 2 +-
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
