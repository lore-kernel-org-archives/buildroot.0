Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08499C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91FBD84791;
	Wed,  1 Nov 2023 16:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91FBD84791
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adrzksrB4bxP; Wed,  1 Nov 2023 16:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 834F283C9E;
	Wed,  1 Nov 2023 16:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834F283C9E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 737E11BF35B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C5BB813C3
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C5BB813C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sEnu0mYVymqt for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:00:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0531980BA4
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0531980BA4
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFC2360007;
 Wed,  1 Nov 2023 16:00:17 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:00:17 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101170017.24a22690@windsurf>
In-Reply-To: <20231029195337.755864-1-fontaine.fabrice@gmail.com>
References: <20231029195337.755864-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698854418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqNvf2tJgvAk9wYWJTeb+4FStrul/utGmhMAAf2V72g=;
 b=f0JVTfITOoZYF6UDfRviZI2NMyhkCvU3dOq8hH2yJIGtDz3/33j9k4jGsmAFrVucR+Cmm0
 4YNgxo/HLXu6h8UmdCZNVjRKSv1QnMXoPhdqQcLR0aP2Y9LqGfyQTJV0wZlnuTBu0EPHZ2
 LgRrsCPsFtv4DURpn5Uyhtdu2X2nZO+GxeurbS00eun/h1bKGUrst+L80AIIbGwXMZSAaW
 ZY9zMtrPdHMAH8q91VyRsUmoOL9HWsnx4RedhSmzeJNWtgGR8jHdvEngHfcfWh/JEDojzH
 DsrR9B7as+FYpjO1NgXkFUH7KZ/A3NlrZ0O+ZTFWfPk2ozczkbwdrvvSMI5HIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f0JVTfIT
Subject: Re: [Buildroot] [PATCH 1/1] package/c-periphery: bump to version
 2.4.2
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

On Sun, 29 Oct 2023 20:53:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of LICENSE file (year updated with
> https://github.com/vsergeev/c-periphery/commit/415b0cf5e826b26a35f7ddf752d092c1adbf11ee)
> 
> https://github.com/vsergeev/c-periphery/blob/v2.4.2/CHANGELOG.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/c-periphery/c-periphery.hash | 4 ++--
>  package/c-periphery/c-periphery.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
