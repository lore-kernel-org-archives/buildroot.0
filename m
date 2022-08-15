Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256BEC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08C841504;
	Mon, 15 Aug 2022 09:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08C841504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMenxk9M9vEH; Mon, 15 Aug 2022 09:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C16C410AB;
	Mon, 15 Aug 2022 09:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C16C410AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FC251BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AC7960AF7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC7960AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GB2flDXnnA_s for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:51:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 161856068D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 161856068D
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:51:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 763A624000A;
 Mon, 15 Aug 2022 09:51:33 +0000 (UTC)
Date: Mon, 15 Aug 2022 11:51:32 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220815115132.14410488@windsurf>
In-Reply-To: <20220813093627.369221-1-ju.o@free.fr>
References: <20220813093627.369221-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660557093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGQVg6XLtJNeDQ00kKYLaN+1b3GhYxOtKEy083nl6pg=;
 b=WgqqHXkmzERuYJRpR5R5n8bZK3CoCKaGB3asi/QpRLQ80T+03h3ITe+fwQpXYYAeLc3zqm
 VOWPK45h85urVHWZcIQkK2v3hMH2sMAYH4n89QTLOw0Fw+1nmHLmzZZ2wVGVzQYztnrHUC
 OSlGAYs24IumAXcm77ISjELjdqri0e6Wp4Pv+BwnJgwaEwqvUn8fctnhhq4ISxTc8VY5Bw
 fcL7F2Zjla7CmlAr+qQxFDTCsxuk2v3IWsw1V5irp+8HWWUmqxEfVxIbsywekHtwI2JdEZ
 mDkXY51x5ItLK1O4vykfHG52eKdEeN/B7yhG9mtCqdn64zXmiE6roE6lmJaAfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WgqqHXkm
Subject: Re: [Buildroot] [PATCH next 1/1] package/linux-backports: bump
 version to 5.15.58
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

On Sat, 13 Aug 2022 11:36:27 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This commit also change the minimal supported kernel version from 3.10
> to 4.4. See [1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/tree/README?h=v5.15.58-1#n11
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Tested with backports defconfig "ath10k" with a kernel 5.4.24.
> ---
>  package/linux-backports/Config.in            | 2 +-
>  package/linux-backports/linux-backports.hash | 4 ++--
>  package/linux-backports/linux-backports.mk   | 8 ++++----
>  3 files changed, 7 insertions(+), 7 deletions(-)

After discussing briefly with Yann, I think we would like to have a
version choice, to use either the latest linux-backports that is
compatible with 3.10, or the newest linux-backports (for now compatible
with Linux 4.4+).

Would you be willing to rework your patch with this change?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
