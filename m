Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0D3C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 282E8410D7;
	Wed, 22 Feb 2023 15:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 282E8410D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhnBEBQZdGWV; Wed, 22 Feb 2023 15:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 583464107F;
	Wed, 22 Feb 2023 15:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 583464107F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 004731BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE80860888
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE80860888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfRaVeRNiPoZ for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:06:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B23CB607C7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B23CB607C7
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:06:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A8A21BF20A;
 Wed, 22 Feb 2023 15:06:18 +0000 (UTC)
Date: Wed, 22 Feb 2023 16:06:17 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230222160617.4728e771@windsurf>
In-Reply-To: <20221230025221.1051537-1-christian@paral.in>
References: <20221230025221.1051537-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677078379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=782HxvUXdm2RavQeN7EHyatc8orHI86zbRaKS1U+P7I=;
 b=AYzJONwx+lh9XOgP+LDxoND8qQiYqJRMRFUw4BgtaupNMBj/czjSwcNxSN6ozvPvY7kgyO
 Ohkd51VUU+zjfJwAk/5d2PW0X/54d3MCcrxXS4/D4t/OAo+IwMJV0pa2pxLvCyQJIhPGtp
 1h/b6UkeuTn9ccTt/fpWZYRU+nf8PMSe1wN73/PIUFfmKmkyY67q0ujn/Eq/gwYzc5YB/P
 CFcsAb1tpQVwAaazxx6YEMZODXYtC18i9ArDCstTQfcMfaJQfBwHRzAh1rXw3wgAktvOiU
 QL/7oafeYM1HvAnUEQoE+J0qS41kaI0bZgbtrbUTXES++iDTYk83Wq2SY1MNQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AYzJONwx
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rtl8812au-aircrack-ng: bump
 to 2022-12-22 version of v5.6.4.2 branch
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Thu, 29 Dec 2022 18:52:21 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/4f6/4f65b521d5c6cffdf5f6294ce0257b9a19e441fc/
> 
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---

In the mean time, we merged "package/rtl8812au-aircrack-ng: bump to
2023-02-03 version to fix build failure with Linux 6.1", which updates
to a even newer version, and therefore should hopefully address the
same problems.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
