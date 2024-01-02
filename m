Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE21C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E945340A62;
	Tue,  2 Jan 2024 20:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E945340A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALYKTWSe8Y1z; Tue,  2 Jan 2024 20:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBE9740AF5;
	Tue,  2 Jan 2024 20:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBE9740AF5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 492681BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC0560F93
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC0560F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uph5KyHXv4l for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:23:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0346C60F0B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0346C60F0B
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE82020003;
 Tue,  2 Jan 2024 20:23:02 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:23:02 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240102212302.11e40d25@windsurf>
In-Reply-To: <20240102124543.69572-1-buildroot@heine.tech>
References: <20240102124543.69572-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C48PXEGIusSQYDrfuTyvvZWdR0sq3Mkon30hdAadNEc=;
 b=Rx/rlyp/9uLPuMMC8Kp4Z0QJy8s3etz+GzM9qXuXnni5ZlHAWLpexZ5nNY5YMFv0lXFtce
 Ho/F3jH9brfx20TbFcT5cgZSlsSMc91pjzprwR2jThBpeVUiQKM7yp4qlZYs5f2ZRk3WvQ
 ocJA7yuBcKN7TjRZV9mtQoDmrMBbYOL2xclekxkDD7OBpzy35BtviQ8fohYgsHJLA/GLnN
 Dr7DwI5nmTNbBgpQ5vTi8FS+0NFybN1VUhLP+46Q1WQsETEubhoxdV8VlALVmjQU46n3b/
 33LYrBEsI+HnqQwNw/zjjBoRo2SmhG2ZspLKba2cX2mTYmK8A3xCSCy7CI41tQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rx/rlyp/
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 1.2.0
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
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 13:45:41 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> - LICENSE file dropped the .rst suffix
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/fmt/fmt.hash | 4 ++--
>  package/fmt/fmt.mk   | 4 ++--
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
