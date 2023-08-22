Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54155EE49AE
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D06160BD3;
	Tue, 22 Aug 2023 18:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D06160BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRkhNwKfUC7d; Tue, 22 Aug 2023 18:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F543611B3;
	Tue, 22 Aug 2023 18:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F543611B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 793811BF2BD
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45B4440BBF
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45B4440BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EtFAM-DKPLwG for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:30:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 462FA400D2
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 462FA400D2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43E23E0002;
 Tue, 22 Aug 2023 18:30:57 +0000 (UTC)
Date: Tue, 22 Aug 2023 20:30:56 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230822203056.423a5e5b@windsurf>
In-Reply-To: <ZNjaP1+VWZznRgtI@waldemar-brodkorb.de>
References: <ZNjaP1+VWZznRgtI@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692729057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Nn4KcAblS/0L1MgVcB82llq08Jl7HDGPA40Xond3v8=;
 b=iB5rIfrmAdSUZ0dqywlsJ7nYXk6HJl1/9SJqdIfYQHZ2PaIfdXn4xJXORPQ42RK0vC26rO
 PzM/JiyGuJijH2p1w7pF/llXvavSleSUntVZk7SSHOmR2HZqsKRrNW2ZUDGbtAQnBmf1+P
 e3iKmWM+wHsS/uH2NTA7r2anh+TL1LHtdn65WxwXdAiwipBtbcvFQlkM3/pV+I2mt+FSoU
 SHsxvI2BWwjUwTeUMG1K4eaN+5UcoxLQZkvOJsV8MKiqCVmfw6rld5b4h3IYs+2k46it/R
 L6PT/vwx1N8Mkpsox1m3T6mm3B/UFFGz6IFmTyiebeqIuVrxvd12WkZzK6r2jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iB5rIfrm
Subject: Re: [Buildroot] [PATCH/next] package/libxcrypt: bump version to
 4.4.36
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

On Sun, 13 Aug 2023 15:27:27 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See the NEWS here:
> https://github.com/besser82/libxcrypt/blob/develop/NEWS
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libxcrypt/libxcrypt.hash | 2 +-
>  package/libxcrypt/libxcrypt.mk   | 2 +-
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
