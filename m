Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D397DC001DE
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03FC241DFD;
	Thu, 10 Aug 2023 19:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03FC241DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOgOqZaD52EO; Thu, 10 Aug 2023 19:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B4DB41DEE;
	Thu, 10 Aug 2023 19:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B4DB41DEE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2331A1BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFFEF611B5
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFFEF611B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrQz0HU6nsse for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:47:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B481561037
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B481561037
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BA65E0005;
 Thu, 10 Aug 2023 19:47:53 +0000 (UTC)
Date: Thu, 10 Aug 2023 21:47:52 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230810214752.0f359bdc@windsurf>
In-Reply-To: <ZNS03+WM80eE76Q3@waldemar-brodkorb.de>
References: <ZNS03+WM80eE76Q3@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691696874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wyTIqVxjJXdmsqB93TBVZZ9kySOxB8U29zKePhNmU4s=;
 b=esukki1RyLMqJQ2wc2EyfxT800+1Xt+j1ln5n/0mmz0X9MgzR1V56AJgf3j7Dg5DvhRV8p
 nSZ7/r8kRXL0dXzRI5V9rthGDQz6POLXAMkZbGVTLr933LskTx9C6lc5QmqoKjigF2Iwxc
 dMMO8+ez2YgsaEN8lMLZyjaoUlFrwoTG1RhPWiAd+tVNdwGcgavawwEUbQuYKvmN/JIjrU
 czR2rgq/+y8AZXzli8QTKl51ShrMtQ9CI1EE/tPJ8+Ti+bKDjQaTGi6zzq1/jnkFoaNdLo
 gaQS2oex1zJXCkA6HSwYit13QEvEaPJ0Bfll5OceM1+DGMfMPiXMPG5S/cvu0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=esukki1R
Subject: Re: [Buildroot] [PATCH/next] package/squid: update to 6.2
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

On Thu, 10 Aug 2023 11:58:55 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See the release notes for Squid 6 for any news:
> http://www.squid-cache.org/Versions/v6/RELEASENOTES.html
> 
> Tested with qemu_aarch64_virt_defconfig.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/squid/squid.hash | 8 ++++----
>  package/squid/squid.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
