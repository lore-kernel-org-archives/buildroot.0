Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A7DC05021
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 20:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E539183C2E;
	Wed, 20 Sep 2023 20:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E539183C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aq5bNaI2C0vi; Wed, 20 Sep 2023 20:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B3E83C32;
	Wed, 20 Sep 2023 20:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37B3E83C32
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 897D91BF392
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 552E941B98
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 552E941B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9drCOTHBHcn3 for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 20:34:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB2E441755
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 20:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB2E441755
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55523240004;
 Wed, 20 Sep 2023 20:34:06 +0000 (UTC)
Date: Wed, 20 Sep 2023 22:34:05 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230920223405.4080df36@windsurf>
In-Reply-To: <20230919201024.357601-1-fontaine.fabrice@gmail.com>
References: <20230919201024.357601-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695242046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKbaqanLiPxYmSjGwomsSnNN001mWnymogw/iwoK604=;
 b=mf1UV0Gos/15RPsdytGNBlcDuQU4NktMpDADf3H8pBbFRXDUXDEG7nHxwnCs4CcvQ+3g5u
 gxdn/muNBSC9Jf376/JYuAMavkjUzh59uOgYFg0mIlCq+yG1h8eCYoOIPpQKnM1ucHzuQs
 zyO6RZNhPgX9xMEVRAyw7Jn+rjd7V90Z81aNu9NzVwCfrAyBR3HZiTXzhX8SbzPPYsJnIC
 YQ0SbwW0s5o2jqI0dxAzT7huD3ecJq0aEXQKLCE071918HCayEFjwS34mSetAVKf+Nwof3
 xq003jVgZ+ZLj7tuAX1BR/gMCjzbgsNrXVcPwzLZwtJ6AOEJaUG25eu+p1OA4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mf1UV0Go
Subject: Re: [Buildroot] [PATCH 1/1] package/domoticz: bump to version 2023.2
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

On Tue, 19 Sep 2023 22:10:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/domoticz/domoticz/blob/2023.2/History.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/domoticz/domoticz.hash | 2 +-
>  package/domoticz/domoticz.mk   | 2 +-
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
