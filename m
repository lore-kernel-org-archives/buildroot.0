Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14501C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99AB840360;
	Sat,  4 Nov 2023 20:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99AB840360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNIz9iCYfl76; Sat,  4 Nov 2023 20:13:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FA984033F;
	Sat,  4 Nov 2023 20:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA984033F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4495C1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A6FC60BD6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A6FC60BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VobBOOwizaH9 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:13:35 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C7DE60BC7
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C7DE60BC7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FB6FFF803;
 Sat,  4 Nov 2023 20:13:31 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:13:30 +0100
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20231104211330.6ef7d718@windsurf>
In-Reply-To: <20231001220841.2586827-1-kazemi.ms@gmail.com>
References: <20231001220841.2586827-1-kazemi.ms@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699128811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=evO841ygDJLmAgKBCXYCEQQo9+6eG9EVxjBXsZYOEXo=;
 b=jvzgwgSEPBk5hNWwBP4jOx3BBBbJ3TLEfbroKsS/4ZutA+T9SkG3OsBdLFcoDlw2XF07HY
 ZIRd1x1odZP4+on7njao9njnkktjnIR7mfFKvkyiMDOrmI24DAKUAqYLPyLIf4FPg3KMiv
 oNvspEuUQuHLH7olWrrdhWADYkQ46ok/H5hpteBE+flBTuOpzFRE1wy8wncgQgccwsk5Ec
 EYoj8RvfijxFHFxGOZsNlYig7i2IkRDMqvP7xIzvSerb7E1PKoT+6QkrK4fMtoWeYmExhD
 7zGBo3TAvBjIflzj5w/XoGRxC9YHioI286wFTujzu0zYakO4NW36nV5RTr0Bsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jvzgwgSE
Subject: Re: [Buildroot] [PATCH 1/1] package/procs: new package
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

On Mon,  2 Oct 2023 00:08:41 +0200
Saeed Kazemi <kazemi.ms@gmail.com> wrote:

> procs is a modern replacement for ps written in Rust
> 
> https://github.com/dalance/procs.git
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
> ---
>  DEVELOPERS               |  3 +++
>  package/Config.in        |  1 +
>  package/procs/Config.in  |  8 ++++++++
>  package/procs/procs.hash |  3 +++
>  package/procs/procs.mk   | 12 ++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/procs/Config.in
>  create mode 100644 package/procs/procs.hash
>  create mode 100644 package/procs/procs.mk

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
