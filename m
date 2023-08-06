Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C88C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B0B28196A;
	Sun,  6 Aug 2023 12:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B0B28196A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QynJKV3lPH42; Sun,  6 Aug 2023 12:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB619818AC;
	Sun,  6 Aug 2023 12:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB619818AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 651541BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E217260B92
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E217260B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4oBy-pUTXVg3 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:08:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC78260B01
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC78260B01
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C631C0002;
 Sun,  6 Aug 2023 12:08:11 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:08:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806140811.11e875ac@windsurf>
In-Reply-To: <20230803175936.3061678-1-bernd@kuhls.net>
References: <20230803175936.3061678-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691323692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q67sUvJ+i+adRGHZ/6Y1lmgxE19MVn4XNqjGrmwXZEg=;
 b=CUqC220CK6SxitRditqIKaghIHVFT7fqlZZOBQ+mJ/j1DwSk5gtan4os9uNOhDu5R2Djt+
 aMtmiFAOM4Exbadu9QTTfq4oy5f35g3cnkD+JigmLp596kaP+Pax8KuJZG3fn1qzM0C2uX
 nhYbZhtPndpFWNcx5b1DCVf0G5aSFj0DRe/8VXt9vLdIe9QuFkYR/0r+ysy5pfq5Ci89PQ
 d2qvCB0IwSD4011inXHhO3Bo9Ar/xm0Ry4aI/RffuMRIeng1I3ECAgK6QrbiWKWEV4a+a+
 HdEp/p8tuynv0nNIT773LdRlnKcYbrNu+7n8QmFpfSpWSXNSHzVSaRPc+Nv0ZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CUqC220C
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-iptvsimple: bump
 version to 20.11.0-Nexus
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

On Thu,  3 Aug 2023 19:59:36 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/kodi-pvr/pvr.iptvsimple/releases/tag/20.11.0-Nexus
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
