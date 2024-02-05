Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4C8C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A11741953;
	Mon,  5 Feb 2024 15:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A11741953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bnTjDLc03Qd; Mon,  5 Feb 2024 15:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4312A4179C;
	Mon,  5 Feb 2024 15:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4312A4179C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 294D41BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0083A400D9
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0083A400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uy1t7cY27QvM for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:41:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91CF440022
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91CF440022
Received: by mail.gandi.net (Postfix) with ESMTPSA id A460720002;
 Mon,  5 Feb 2024 15:41:33 +0000 (UTC)
Date: Mon, 5 Feb 2024 16:41:32 +0100
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20240205164132.41ef9664@windsurf>
In-Reply-To: <20240116084826.917058-1-huth@tuxfamily.org>
References: <20240116084826.917058-1-huth@tuxfamily.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707147694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0h3KMgNtw4liNmMAARcK4UaXOm1dNuEcOB6epZiW+Q=;
 b=NyUsGTnI2NKut7SLoADW/4ahEtugAvv/VJ3adbbniGDxKyq5EPDZVgyAj7zbvuTITPuk3G
 ZvCOLceXIGenT9NaX7Zuo/f1et4l8N6fTeW5lLf1D9UVUUb36uQmPqFFn+bibroNFulHHY
 IJwfwnDxKiixlWEKQDc/rot8aL1D8BTXM9+4XIQwlQ6n3c9z0GB7iaHSCEjYS4bCOCfcJv
 OKPavxJ1RcgavCRolTGf+YlCRJ2SU602FkmpF1PTJ5dklpOfjUGNB3uPvbn8ulWafNRyo0
 jE8oZNhQgQjzWOQB4KJvBSsCNO5+uwShiRo9dG5zWPo3E9mgCF546i/2QGt50A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NyUsGTnI
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: bump to version
 2024-01-08
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
Cc: Cyril Bur <cyrilbur@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Jan 2024 09:48:26 +0100
Thomas Huth <huth@tuxfamily.org> wrote:

> A new kvm-unit-tests version has recently been tagged, so we can use this
> version now for buildroot. It ships now with a full version of the GPL v2
> license in the LICENSE file, thus we add a hash for that file, too.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  package/kvm-unit-tests/kvm-unit-tests.hash | 5 +++--
>  package/kvm-unit-tests/kvm-unit-tests.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

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
