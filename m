Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979C7EEB56D
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49991417E5;
	Fri,  8 Sep 2023 20:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49991417E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PeJPOy9EGnwX; Fri,  8 Sep 2023 20:20:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF0D40336;
	Fri,  8 Sep 2023 20:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF0D40336
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF1B51BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAFB060ED8
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAFB060ED8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhuwDcV8LDJ5 for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:19:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B8E660ED0
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B8E660ED0
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE975C0002;
 Fri,  8 Sep 2023 20:19:48 +0000 (UTC)
Date: Fri, 8 Sep 2023 22:19:48 +0200
To: Frank Hunleth via buildroot <buildroot@buildroot.org>
Message-ID: <20230908221948.573c2fb0@windsurf>
In-Reply-To: <20230907001121.3620891-1-fhunleth@troodon-software.com>
References: <20230907001121.3620891-1-fhunleth@troodon-software.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694204389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BozTkguqtFtjqE4Cs/K0F0/ZkWx+ZXfHsbl7TsFXUz4=;
 b=AjXthbEwSnN0YzU3xslQ82QC5jid1qW3Wm0wB5wlNKL4+V5cg0tOJDkO3RPGT45nZeBQ43
 VUMyJrd5YD979+YmcKmPhg4IT876P/YUsC2wd6F5pJ9P+JMdWr0S3iEmAf/OZjM/Z5l0+5
 dMOi8VjkVPRWDeNCq6qm9AYbpzWEKS3bcixd50DVbvXJ6/ct7A/4f3o0SGdHNjY4nFDqEO
 eDMVUbbNIaHcI76SpULkUpxQxK79mU8OZJVhAyyIBASqIFiY1cozOc3HVIByks7XcSeph0
 my5RRxww5bZud0YFlmjML51ad7rzm3IC67INwAFlYXC5LN+EMoVSkXEmbtUlXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AjXthbEw
Subject: Re: [Buildroot] [PATCH] package/erlang: support building on aarch64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 07 Sep 2023 00:12:00 +0000
Frank Hunleth via buildroot <buildroot@buildroot.org> wrote:

> Erlang has good support for aarch64 hosts, and this allows it to be
> built without a warning.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/erlang/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
