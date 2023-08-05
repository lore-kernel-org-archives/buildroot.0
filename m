Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BA1C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 22:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28233409DB;
	Sat,  5 Aug 2023 22:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28233409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWyAiUCq41Oj; Sat,  5 Aug 2023 22:45:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 043CB40673;
	Sat,  5 Aug 2023 22:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 043CB40673
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 048701BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BA7260B8B
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BA7260B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kmuYFlDDTFQc for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 22:44:04 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1539E60B09
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 22:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1539E60B09
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A8C4E0003;
 Sat,  5 Aug 2023 22:44:01 +0000 (UTC)
Date: Sun, 6 Aug 2023 00:44:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806004401.776305f2@windsurf>
In-Reply-To: <20230805213652.3588314-1-bernd@kuhls.net>
References: <20230805213652.3588314-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691275442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJUpTMmunx14t1oBspZyhTSaZ00m/XuhFvL3ZNZCfDg=;
 b=gFXV6rZ3ai1goLzD9Dp/WQSpOufcQjhtvBPgYOfw/Yigw6LSoTGcuRFMh8m75tUxzqLP6/
 6GZ9LoHDTzWuiDgh5SYINqHANb+v1hKeDVaZVPs8acGMo2KV/O1JtdSQHIewOmUcmJSm4u
 ev0C/ziPUrxfDbFQXvyHaWOys35fDCR47d18CvKp5g+HDKZ9FFd4yHFyArVY9a15mDgLLL
 y9aX8xh4+gtDLGotF6Gg3J59zIiIsMlH0ZED9wTz9kR8piL0fDE6hJhvQ/SsEPQr4gM1rx
 eYaeWmtXclAMsJ02OuiRl9Ca+eRj5n/gd6h2k1/3PSKJjjE454cqEGubPfPjEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gFXV6rZ3
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.373
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

On Sat,  5 Aug 2023 23:36:52 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/hwdata/hwdata.hash | 2 +-
>  package/hwdata/hwdata.mk   | 2 +-
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
