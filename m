Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3240CC001DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 20:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D032D41EC6;
	Fri,  4 Aug 2023 20:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D032D41EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRS0cKmgwOZB; Fri,  4 Aug 2023 20:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B894641EA4;
	Fri,  4 Aug 2023 20:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B894641EA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1371BF328
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5647240B84
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5647240B84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGz_PY-NRIK0 for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 20:18:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55A734064A
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A734064A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3351920005;
 Fri,  4 Aug 2023 20:18:16 +0000 (UTC)
Date: Fri, 4 Aug 2023 22:18:15 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230804221815.6fbf8bc5@windsurf>
In-Reply-To: <48bef18e-b43b-cc91-6ce4-e214ddf300f0@benettiengineering.com>
References: <20230802141636.528011-1-giulio.benetti@benettiengineering.com>
 <48bef18e-b43b-cc91-6ce4-e214ddf300f0@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691180296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssVhiWIvbO+PIYxqz6DSkaAMJPu9Jb7jvLuCh+3MBeQ=;
 b=oRNUAGAFQ6A3pLqoj4EbULbT9HEDvnTYyqt/JPJ3Ws1yt8CJKvCvqMgFWfHSZWrZYcyWJ/
 8ytu5VuPbgbtLsH9QipNblMdieHt5Ptf3yBQBnp2GkcKdBhiD8DANYbPW4FORTBSjTMXN0
 5DnZJUzuc9otU849L4m7H0uxvhrewr3KrkyyvOfKCq9rRBLRTnbbO5AU/m3qw8InERr9kb
 pA0YLTx+U47JMKlJD7UadJ5hyGIz5t66H9//xAv5DCfNa8WcQHSsX1zl+//Yi9t4UwuXhH
 j7We3SMqK5ASa0AooomFjV4H7LuQeRyK2+GWLLdwBjm1LObeS5FdeO1PBaTG+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oRNUAGAF
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.1.0
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

On Fri, 4 Aug 2023 21:40:45 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This patch is superseded in favor of:
> https://patchwork.ozlabs.org/project/buildroot/patch/20230804193801.93049-1-giulio.benetti@benettiengineering.com/
> 
> So please ignore it.

You can mark your own patches as Superseded in patchwork :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
