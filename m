Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6681AC001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86BA64159D;
	Sun, 23 Jul 2023 10:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86BA64159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PU5OmZkiBqRn; Sun, 23 Jul 2023 10:28:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69CD4410D5;
	Sun, 23 Jul 2023 10:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69CD4410D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFCB61BF5EA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AEE541512
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AEE541512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id StxrjTP9TB26 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:28:46 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4956141369
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4956141369
Received: by mail.gandi.net (Postfix) with ESMTPSA id B496B60002;
 Sun, 23 Jul 2023 10:28:42 +0000 (UTC)
Date: Sun, 23 Jul 2023 12:28:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230723122840.2470921d@windsurf>
In-Reply-To: <20230715063639.1508174-1-bernd@kuhls.net>
References: <20230715063639.1508174-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690108124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3l2HL5kEw3gYyCx04DXs/EAclKZ7XGADH8/VrthcMkc=;
 b=M02pdJHwwMaeLPGoxOBew9kh79eo8xggTCDTyzfsJcKRiqFwTrCtg9ZSddN7R8QVFSIR1N
 +YEpZvbxDclfSCah0EVB7W8xgX78Il/rEnZz5nBEl0h8URpOkjq4iCnZAau+qQ1XEw6mVx
 wGhzr7utYyAxK3M4D6Cfcryp/uM7Bx/YVmxCFeY6dq9m+8MMhjCtVXHyx5i6dRNRKu/C44
 A+EBEbkDmuK0xx7m/C64RMvLaeO/vHwDC0NX86LajwsL1/6BUlSi0VgHlTtJnDyQjhbauG
 /4M6N5L4J9B9mOUNBJfSYqqrJnxfJ711368CUqZoeFCihhliVkmAtG+QLlVIbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M02pdJHw
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5{webview,
 x11extras}: fix hashes
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 15 Jul 2023 08:36:39 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 6b23dff9e71786191797d3b41ce80afe659f0396 forgot to
> update the hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/qt5/qt5webview/qt5webview.hash     | 2 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash | 2 +-
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
