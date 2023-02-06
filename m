Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC19C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 08:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF9860A65;
	Mon,  6 Feb 2023 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF9860A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LT1anNlRP-lV; Mon,  6 Feb 2023 08:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF20660A68;
	Mon,  6 Feb 2023 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF20660A68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4451B1BF329
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D716818DC
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D716818DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_U_GLqWQtH7 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 08:55:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA4B4818C9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA4B4818C9
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 08:55:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B60D6240007;
 Mon,  6 Feb 2023 08:55:01 +0000 (UTC)
Date: Mon, 6 Feb 2023 09:55:01 +0100
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230206095501.5519ddd1@windsurf>
In-Reply-To: <20230131132327.636417-1-marcus.folkesson@gmail.com>
References: <20230131132327.636417-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675673706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KviIexavhCH9YCDH92X4Xb7kZ0zIuRHQY8WYTGUPpKw=;
 b=lcsG2BZq8YEJyVyjrxT9xymAFBXyyQ/YXx5En4/wLKyEfnb0WeooG7pe2PizGbQgsR1RiG
 I2ERZXpHt3/xzYjhiSJmSBtQyjxVpgo1q0RDXLsK7w5tA/+6EEgJLWW3i+HGj87K3/JYfD
 Uc9/qbJ88lxgg4bjJD57ty5GXfytmHcPQ68B6DTucz714dwu6jQ+pl+wwqg9jMGQPTYQqE
 unV5ywHXk+oJjCigi/15/MNngnqwq3USkFwoDpmip0ArrWeYELCdhjQXDE1oDuQUhiNf9n
 SPgDUmCJgRmi1IfKM4evs52mRVWnF8ffWthSYsx3P0iMfzvpjE8ksW/pUsq6Pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lcsG2BZq
Subject: Re: [Buildroot] [PATCH] package/libcamera-apps: bump to version
 1.1.1
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

On Tue, 31 Jan 2023 14:23:27 +0100
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libcamera-apps/libcamera-apps.hash | 2 +-
>  package/libcamera-apps/libcamera-apps.mk   | 2 +-
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
