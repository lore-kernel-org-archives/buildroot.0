Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C8FC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1A87612B4;
	Mon,  6 Nov 2023 19:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1A87612B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2rO6POJSG3u; Mon,  6 Nov 2023 19:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0197A612B2;
	Mon,  6 Nov 2023 19:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0197A612B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 571C61BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2321D60E2F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2321D60E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OXEG0jxG8udn for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:40:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06E426125C
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06E426125C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E77240002;
 Mon,  6 Nov 2023 19:40:37 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:40:36 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106204036.3b7c492a@windsurf>
In-Reply-To: <20231105212453.49399-1-fontaine.fabrice@gmail.com>
References: <20231105212453.49399-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRcMK+bZEWMGicBleCxbIBfiYdx4ZtL0h/IEcf0K1+E=;
 b=oQY5OT49rUYUP2a+rmgqnTPmq+uzLBqvGjrBc+rsWxYngB14MkcjVje6g08riKSU81oA2Q
 3RAmcM/8QIAg+VhhdM4U8TVk/6v47LwoPjHLKjyvhR5QY7pHW4VuCgxWKZ1TJRROyfO3gL
 Vm0C4uBLhvBUFJ1PY9aeWdah26l025ucZnSZRmRj2mudcdairsNtQ/DhzIK/6ngTJeASPy
 zw35A9mwxySmpfDI7Hy92/BhEUqo1mr2d8LHDHOurWahw2aw0dpERW4R31idU67jaOBD0v
 N3vntl7kEE0J7ZkDzBalVUCQUNTgAzd0vC19lUnKuVRJlP7Qjz6X0eA5C1OpQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oQY5OT49
Subject: Re: [Buildroot] [PATCH 1/1] package/wavemon: bump to version 0.9.5
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

On Sun,  5 Nov 2023 22:24:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/uoaerg/wavemon/releases/tag/v0.9.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...001-iw_if.h-don-t-include-linux-if.h.patch | 41 -------------------
>  package/wavemon/wavemon.hash                  |  2 +-
>  package/wavemon/wavemon.mk                    |  2 +-
>  4 files changed, 2 insertions(+), 44 deletions(-)
>  delete mode 100644 package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch

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
