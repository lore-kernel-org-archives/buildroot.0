Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA737C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 15:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B79940AA5;
	Sat,  4 Nov 2023 15:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B79940AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCDTx6lrn5g6; Sat,  4 Nov 2023 15:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6165540A94;
	Sat,  4 Nov 2023 15:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6165540A94
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16A731BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0DE241DC0
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0DE241DC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Ip1LSWDNns2 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 15:14:36 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EB0F41DBA
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 15:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EB0F41DBA
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7A9660003;
 Sat,  4 Nov 2023 15:14:32 +0000 (UTC)
Date: Sat, 4 Nov 2023 16:14:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231104161431.65285b91@windsurf>
In-Reply-To: <20231009155018.1310642-1-james.hilliard1@gmail.com>
References: <20231009155018.1310642-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699110873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j40nguTuszb05ezDYjJL7RAiotkRUrKTau+3MF7K12s=;
 b=D9yOzhhnrXjIhaPbbchS/K7yqSkMnUaRAo71PV2zyhjDDmbLhR+x6BkrlhWdGAjlZN9rcj
 0cIKBuIo1YhBnYCQ9wdFd4qOKmjpxS2Xgiy71LYJ2qgwyO9AprB5+XEginm2B3QKu2aZom
 BKLgdEn+19yx4aNwNfSvFgVaPCa/zVnJBJbVVrzI52phXc1XLQ8ulDgnrMzpUOkty9cf40
 aCZNnVKlhIuMjO8NcLdbFYPU4pilTC66QVDbHee63VQJdo7B/nda+CkD3zA/kTe+Q0crDY
 hznzYbL8p7s7vQJYQy0iq9DxarzpfOgNZZDkB7uE0hppMUxDy2CVNImRpdRd2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D9yOzhhn
Subject: Re: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version
 0.3.5
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  9 Oct 2023 09:50:18 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...-fix-bug-when-SPI-flash-write-size-s.patch | 71 -------------------
>  package/libubootenv/libubootenv.hash          |  2 +-
>  package/libubootenv/libubootenv.mk            |  2 +-
>  3 files changed, 2 insertions(+), 73 deletions(-)
>  delete mode 100644 package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch

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
