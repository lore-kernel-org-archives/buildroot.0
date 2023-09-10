Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8E8EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8801A60F46;
	Sun, 10 Sep 2023 16:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8801A60F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrvtpF_mzFjL; Sun, 10 Sep 2023 16:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D628660FBA;
	Sun, 10 Sep 2023 16:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D628660FBA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5007B1BF263
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CAA681761
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CAA681761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNmDYzuvU275 for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:36:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FDB881760
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FDB881760
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BF9440004;
 Sun, 10 Sep 2023 16:36:28 +0000 (UTC)
Date: Sun, 10 Sep 2023 18:36:27 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230910183627.338698f5@windsurf>
In-Reply-To: <20230908210253.9480-1-ju.o@free.fr>
References: <20230908210253.9480-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694363788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bB+alJ462GP7V7bm5tMNkD/Y6fBwvkHdMZ2GL0dJCBw=;
 b=elYUCR23h2jC6kYU3Cd9YugoKwjfnvXQke0bxkvCD5/KPvw6pAPj4fYG6XBBprxrFf2RQo
 Larh9l8xfHXugG5fNV9GVbJ7ZOx4uABYr+J1UBoP/mcwhhdV/LUE0mIYe1gFmyqjraebTc
 ni0HaTISkeRbb4zbrfHcrkVoOL/jQN/cPiqvoRBjGlbkmAHR1QzHqLx4XW/prCtlGfLJdf
 SeMl1RNxOG/sBJMu1LiI2nExnJy78ZhTMSUgq5JUDlc2vS7z6hhJ8Uj6KF4v9Mt7xhlwuq
 oWK5I11WyQ0mffxUyPeKIeDfv4pkYzmWoDT+4/OMHrU603i22kLnknK7duAwuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=elYUCR23
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_libgpgme.py: new runtime test
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

On Fri,  8 Sep 2023 23:02:53 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  1 +
>  .../testing/tests/package/test_libgpgme.py    | 88 +++++++++++++++++++
>  2 files changed, 89 insertions(+)
>  create mode 100644 support/testing/tests/package/test_libgpgme.py

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
