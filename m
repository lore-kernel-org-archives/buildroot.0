Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FA6EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D09660BE8;
	Sun, 10 Sep 2023 16:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D09660BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urEpPxCLaquV; Sun, 10 Sep 2023 16:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98CEE60E89;
	Sun, 10 Sep 2023 16:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98CEE60E89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5DCB71BF263
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37A1860EE5
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37A1860EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkEl9AqVVATX for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:36:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 110DD60BF0
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 110DD60BF0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CBBF40004;
 Sun, 10 Sep 2023 16:36:24 +0000 (UTC)
Date: Sun, 10 Sep 2023 18:36:23 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230910183623.2c258ec7@windsurf>
In-Reply-To: <20230908205538.8026-1-ju.o@free.fr>
References: <20230908205538.8026-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694363784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EzZLYcdb7wqkswqg22aFmkPpbzVMVgG2Oo7evVdijo=;
 b=FptBj9FIm4Iyx+R3DSe8UJOngD4X+Zmaz0eaDieXxJ3HJSByHsaCHoUWXDwmsTlZliVpde
 kVjwP12W8WQa4Bv9o2uzbKAQiQGaYQtHSkUvy9yW4iZJQak1jQLg2z3JWTqtLFmUJbz3RT
 PQ6bNlACaN1+b6BagWQ/qrbXWff/jMvhiF16pL6cytDJ9qg/mj6uHzDauoZ2KX8j+aUxZg
 k2kkvhsdJ1q8xyBP05vZvZenwrFDUd1aWQFsghpilDv0d4askOfcCNffgciBcL1TqPOweA
 93CgGAZEySA+tUQxXcd5Tae7pSF7veuofPk4qtK23gZICEM+gR4ZlE0gnwekKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FptBj9FI
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_screen.py: new runtime test
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

On Fri,  8 Sep 2023 22:55:38 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                   |  1 +
>  support/testing/tests/package/test_screen.py | 61 ++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 support/testing/tests/package/test_screen.py

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
