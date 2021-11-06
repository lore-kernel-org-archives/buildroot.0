Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7DAC433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:47:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0091460E8B
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0091460E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8C5E401A3;
	Sat,  6 Nov 2021 10:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cW4ZO2tImMD; Sat,  6 Nov 2021 10:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4E884022A;
	Sat,  6 Nov 2021 10:47:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92CC81BF476
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82725405CF
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPpBGXAnfbdA for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:47:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B0BF405CD
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:47:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E92BD60009;
 Sat,  6 Nov 2021 10:46:58 +0000 (UTC)
Date: Sat, 6 Nov 2021 11:46:57 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211106114657.3eea0cae@windsurf>
In-Reply-To: <20211105221658.1163788-1-romain.naour@gmail.com>
References: <20211105221658.1163788-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/refpolicy: move patches to
 subdirectory
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Nov 2021 23:16:58 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> refpolicy patches are for 2.20210908 upstream version but when using a custom
> version from git they may fail to apply.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417630
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...001-policy-modules-services-samba.te-make-crack-optional.patch | 0
>  ...002-policy-modules-services-wireguard.te-make-iptables-o.patch | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/refpolicy/{ => 2.20210908}/0001-policy-modules-services-samba.te-make-crack-optional.patch (100%)
>  rename package/refpolicy/{ => 2.20210908}/0002-policy-modules-services-wireguard.te-make-iptables-o.patch (100%)

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
