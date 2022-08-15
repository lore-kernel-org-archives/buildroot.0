Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C93C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB26415F5;
	Mon, 15 Aug 2022 10:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB26415F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0-u3V3a-CKF; Mon, 15 Aug 2022 10:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4530541581;
	Mon, 15 Aug 2022 10:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4530541581
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38FDB1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05D1160625
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05D1160625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGBjF-4xKRn8 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:01:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A395D605A7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A395D605A7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:01:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E281024000A;
 Mon, 15 Aug 2022 10:01:41 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:01:39 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815120139.027f1c2b@windsurf>
In-Reply-To: <20220815094934.296837-1-fontaine.fabrice@gmail.com>
References: <20220815094934.296837-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660557702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=umjZOcnOvD9GCzdkRqNPi0MHpZW2teeVJnw1vUtrCkk=;
 b=aeepXF53j5v7wdnNYE2IznHItKIfHmQrt6SybJAtEaU73x5xdQBDQ7coflJtgv1XrZ7vkr
 d+EJDIAARzKUIrGxaNLVZ99gAG2zJiju/ZcQUoqRmt3VAjxxfT+qyjro8uqNJcSNMSg3/F
 svRoWyNyCt07JwPnK7utXWtjUEqCHRdYHvYOSCzQ25AazCUg0ajclILeoVtDyMMw3f7Zag
 AowBaLh5sbnyCtn1RdU7aZi99ndW+NE6dh9+QSGcbJO+zSOr+P1AhBl227btp0Pbq4AFXN
 bIsaQDlrYVnOLdadYDgzAHIOBDdtb48VTwEnmGzj11gqA94YH8K8UpdE0ZlKzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aeepXF53
Subject: Re: [Buildroot] [PATCH 1/1] package/makedumpfile: add zstd optional
 dependency
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Aug 2022 11:49:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> zstd is an optional dependency since bump to version 1.7.0 in commit
> bbc52f3ff382e4c50baea2e1876a3f6ebf77a851 and
> https://github.com/makedumpfile/makedumpfile/commit/afd0a6db2a0543217f8e46955a1b44b71f7e7ef3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/makedumpfile/makedumpfile.mk | 5 +++++
>  1 file changed, 5 insertions(+)

We sometimes apply optional dependency handling patches to master, when
they have a "disable" logic that potentially avoids spurious detection.
But that's not the case here, so I have applied this patch to next. Let
me know if you disagree.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
