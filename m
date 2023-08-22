Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF45BEE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 21:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A29F408C1;
	Tue, 22 Aug 2023 21:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A29F408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUSiGiXz5Klo; Tue, 22 Aug 2023 21:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C07714052A;
	Tue, 22 Aug 2023 21:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C07714052A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE45F1BF31A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 21:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4D8581A5F
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 21:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4D8581A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQcSWQXlgt89 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 21:41:17 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83C9681A58
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 21:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83C9681A58
Received: by mail.gandi.net (Postfix) with ESMTPSA id 650BA20005;
 Tue, 22 Aug 2023 21:41:14 +0000 (UTC)
Date: Tue, 22 Aug 2023 23:41:13 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230822234113.12dd618b@windsurf>
In-Reply-To: <20230822194922.71368-1-ju.o@free.fr>
References: <20230822194922.71368-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692740474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxhusukcSwohFmWkCk5jHOq1zg4WSg+hEzQqOmDbTds=;
 b=aBtXpsXAtxTPeUe+Tt3QvTo+inzoUbmQNBypMSVPYsTgrAX+MYcg+oYk9s3zUNcjbtwsdC
 oZnJY1IsnVK2EWNAtpmBcEzFX9f+dMgXdHGfh5fWBUdHktePedO4YeSiqfRa8tHA2ilixF
 pOGsII8gYOGVWKVGp7XJqHI2OiBvqZBxmZfB4Pd7d9MfR4fV75NX4JxjIfymTtE+51Ft9t
 1MeGG5P/BYoaHRZGbjFvhv0NXYeTcY8zt2YvLJ0SDAwZvTf9/+TmldbK1Yu14vTwx6CkZO
 FqBZEtWc/U8NEIVs3XUWJmkd/QQISI9kjwHkP4YMzOBAqIch9WHUbqvhR6QAcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aBtXpsXA
Subject: Re: [Buildroot] [PATCH 1/2] package/screen: security bump to
 version 4.9.1
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

On Tue, 22 Aug 2023 21:49:21 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://lists.gnu.org/archive/html/screen-users/2023-08/msg00000.html
> 
> Fixes:
> CVE-2023-24626: https://www.cve.org/CVERecord?id=CVE-2023-24626
> 
> Note: Buildroot installs screen as setuid, so the described scenario
> in CVE applies.
> 
> This commit also rebases all patches on this release. Patch were
> regenerated with 'git format-patch -N', so patch file name changed in
> this process. The file .checkpackageignore is also updated accordingly.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

You posted this as PATCH 1/2, but I don't see any PATCH 2/2. Is this
just a mistake?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
