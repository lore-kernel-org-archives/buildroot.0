Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E74E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1652A82A56;
	Sat, 30 Sep 2023 14:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1652A82A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjmfyiJEpClC; Sat, 30 Sep 2023 14:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA8783D9D;
	Sat, 30 Sep 2023 14:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EA8783D9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA3E1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4359D8184F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4359D8184F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mO-RsM1GdzzO for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:40:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36525817ED
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 14:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36525817ED
Received: by mail.gandi.net (Postfix) with ESMTPSA id C62E51BF205;
 Sat, 30 Sep 2023 14:40:08 +0000 (UTC)
Date: Sat, 30 Sep 2023 16:40:08 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230930164008.15858838@windsurf>
In-Reply-To: <20230930131506.3320394-1-francois.perrad@gadz.org>
References: <20230930131506.3320394-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696084809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/E4EBXB75qbcQkZspfFXngSO56SZtlPwCtJPgiYpJQw=;
 b=QMLwad8V99FfeK2mZkF8jzryHB3RFYrdFYc8rTzZGrJWkpIJXZtYBVuLZg5rjyrT5FEEvN
 3bSMrpzRIkd864g01Dpe3eZAkgerTRWbcBQBx1z0shRliqpG4RTIhWqrbBx78SAPHPZ2O0
 z8XNt4t4yHxU5SpgRSy5u2hf+FTr6f0jn7omRBuKKgci+rB5N9bKSJMDa/WLIvHJTyGHOK
 ZwRkxKBZIwCEOo/XR8xNb1zror0D8851vCPv+4oJ2/2BViOXu8ndFSZFiflhN2Oz63muTs
 77G9ffUiJjs3rMByZO4taAEbAcL3T7n2iVA9eCdDvkOhiQVRqkgyZlOcDMvyfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QMLwad8V
Subject: Re: [Buildroot] [PATCH 1/5] package/perl-convert-asn1: bump to
 version 0.34
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Sep 2023 15:15:02 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> LICENSE: update copyright years & switch to Perl Artistic
> see https://metacpan.org/release/TIMLEGGE/Convert-ASN1-0.34/diff/TIMLEGGE/Convert-ASN1-0.33#LICENSE
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-convert-asn1/perl-convert-asn1.hash | 8 ++++----
>  package/perl-convert-asn1/perl-convert-asn1.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Entire series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
