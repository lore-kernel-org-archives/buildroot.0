Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A85C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E528F60EF7;
	Mon,  5 Feb 2024 09:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E528F60EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCWfLqVuQXMy; Mon,  5 Feb 2024 09:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FEC460EED;
	Mon,  5 Feb 2024 09:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FEC460EED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD24C1BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D4F960EED
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D4F960EED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ri0omxY_l-Ou for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:13:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FC6260EE5
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FC6260EE5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DA681C000C;
 Mon,  5 Feb 2024 09:13:45 +0000 (UTC)
Date: Mon, 5 Feb 2024 10:13:44 +0100
To: WiseLord <wiselord1983@gmail.com>
Message-ID: <20240205101344.7725e2ea@windsurf>
In-Reply-To: <20240204085128.5059-1-wiselord1983@gmail.com>
References: <20240204085128.5059-1-wiselord1983@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707124426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5IG8lIon+05o3es/vOD60JJXMUykrMHyZTGo3lkNV8=;
 b=j3QQSsnK8nRWFlUJFWTje/wAui+3hoZKzMLfBxBd9FXhyzQhhBn4JBdDlWksnS5txSO0wr
 ZOySm0MB1QtpzhW8m6lQTKxmAiFnuMuJNuZTG45lV3KGJ5SMfwKgKlTa2hykOE4iyyZo4S
 4Q9LpXZR/9hgoqICtwi5NRVGjyVLeXHa+B6hxZXwR3dqTu7rYqJQkIPBnbRekYGylNunvw
 Fvk2BkEzLqBKePw3k9GoHXQp3oFZT2gVs5DlefxM7n/Ra6CLgEAyXKpx16+iPWZQauKQUR
 MelUDADKiRTUbPfM3xza+39oYxKpZnUkK1+AlzFycYXzCDiULzSDb9+6Dr6mKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j3QQSsnK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-mpd2: bump to version
 3.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun,  4 Feb 2024 11:51:28 +0300
WiseLord <wiselord1983@gmail.com> wrote:

> Signed-off-by: WiseLord <wiselord1983@gmail.com>

Thanks a lot for your contribution! Could you clarify whether
"WiseLord" is your real name? Indeed, we unfortunately cannot accept
contributions submitted under pseudonyms.

Thanks a lot in advance for your clarification,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
