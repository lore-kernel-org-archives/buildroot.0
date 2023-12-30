Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21064C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C226B60E4F;
	Sat, 30 Dec 2023 17:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C226B60E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JlXWWw-xYPTy; Sat, 30 Dec 2023 17:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A6E660ABA;
	Sat, 30 Dec 2023 17:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A6E660ABA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85BFC1BF40B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A72B60A87
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A72B60A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8EXsk8fTc1oQ for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:51:06 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C93360A67
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C93360A67
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D11A40006;
 Sat, 30 Dec 2023 17:51:02 +0000 (UTC)
Date: Sat, 30 Dec 2023 18:51:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231230185101.1ee60c1b@windsurf>
In-Reply-To: <20231230173404.920326-1-fontaine.fabrice@gmail.com>
References: <20231230173404.920326-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703958662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjP1zJSIWO75OOmpW3TeDAqBKHneDgDZRrPJDSvFQkc=;
 b=KALRg/6Qr80vpHE9PyVmKfuhtZDuEda1orlWgQoH8Z9pSYzb3GYE+qgrrLYoZj+0uriOZy
 WrQHUPfHjqwpTxHgYB0IZiYqb+JryKAJ1oPof4nsZJmjq9gXMtf97FwVYL4/3Fqf0CyES3
 jTHfC4HcDnPs+/Btoef3sUx1XR6gCVdMmloUdnzbWsSXxr6frO37gPRoq/R8Jq1IOXFXqb
 fatEtnOFTrj3xI1k7//ZZuuQFisNPEuJz7iLh/n9UB2PHuuJOok7Jj8p/3HNCb1VaPabbd
 7DcoTGvDuDmAwOWNuB1f22cs48Y6kD9mmEcKKVcFJ+z6VSmqyJaQshu1mV7RNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KALRg/6Q
Subject: Re: [Buildroot] [PATCH 1/1] package/ipcalc: bump to version 1.0.3
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

On Sat, 30 Dec 2023 18:34:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://gitlab.com/ipcalc/ipcalc/-/blob/1.0.3/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ipcalc/ipcalc.hash | 2 +-
>  package/ipcalc/ipcalc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
