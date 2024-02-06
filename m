Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11462C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEBC441EE5;
	Tue,  6 Feb 2024 10:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEBC441EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rcuE0iiiwFO; Tue,  6 Feb 2024 10:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 237F141EEC;
	Tue,  6 Feb 2024 10:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 237F141EEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DCB61BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9046610EA
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9046610EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QXXjcGMZZw6 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:34:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF0446110A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF0446110A
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9AED1BF214;
 Tue,  6 Feb 2024 10:34:55 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:34:55 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113455.797a6d25@windsurf>
In-Reply-To: <20240109072423.4031745-1-james.hilliard1@gmail.com>
References: <20240109072423.4031745-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57My0ncf1fJEVivKtDQ1mGDp39BAio0W3+UsQHwcLr4=;
 b=aYLzb+tO1RdyrFwFwb6rCYbLubxjt5gl/z2rq0RWyA58+CmQovUFh5okz9aR6SfRBqvQo9
 Px8Azc935jBsL0dDNeg5B1wC8Hbz2KGxvgDD2t4iL3VeY/Ye9vBBFEOOtzYPy5IxjdBhg2
 IOCudvtrVoRl/KUhMZhmouLTxBixPnIcj5fyoba8w8No1Bvd47Dm1HBotumD4TE/m13pxg
 VxLXZvEQrGUmbFBexrUqQEi4rcp4zZNzZphvnwAarbou5zeI2xAkyF0ZGRoPyIl03zzeWl
 R+agCuc2cEZTmm2wnk+8VabYNdovpk3zd1hLbxRx5X4KJ8X1tb57MgHsZGV+HQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aYLzb+tO
Subject: Re: [Buildroot] [PATCH 1/1] package/python-esptool: bump to version
 4.7.0
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 00:24:23 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new python-intelhex runtime dependency.
> 
> Add new python-pyyaml runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-esptool/Config.in           | 2 ++
>  package/python-esptool/python-esptool.hash | 4 ++--
>  package/python-esptool/python-esptool.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 4 deletions(-)

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
