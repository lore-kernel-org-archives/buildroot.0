Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C1DC7619A
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 21:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4B381E8A;
	Sun, 26 Mar 2023 21:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C4B381E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXfahjghO1EB; Sun, 26 Mar 2023 21:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D44181E88;
	Sun, 26 Mar 2023 21:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D44181E88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 435471BF309
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DADC81E53
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DADC81E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BzKgXACGEy5 for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 21:11:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E35A181E7C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E35A181E7C
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 21:11:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88C8660003;
 Sun, 26 Mar 2023 21:11:03 +0000 (UTC)
Date: Sun, 26 Mar 2023 23:11:02 +0200
To: Simon Rowe <simon.rowe@nutanix.com>
Message-ID: <20230326231102.70def2c4@windsurf>
In-Reply-To: <20230323141327.18684-2-simon.rowe@nutanix.com>
References: <20230316113615.138847-1-simon.rowe@nutanix.com>
 <20230323141327.18684-1-simon.rowe@nutanix.com>
 <20230323141327.18684-2-simon.rowe@nutanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679865064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+eC0pvk57/NldC9kMQa4S+ZxlZRQ3SiHf1pq8mg1yg=;
 b=BG8qEUYE5UbSfNe+UDMCUvB7jj1NZCSsWJTC5DsaaY6r3PSEJdrQTpq/d0uWLzKF+3a1yt
 /U3Zo+28RCgCTfkevwJ0j3kMxfPYGEXQz258pMF1o6hD2Hq0OwirqQxhoAueu3+9B2vSUA
 SpZWi+2Zh9YHZoY0ccb2bHUJmuA+svhM03mC7nJwuPsbC/IlSIqRkBtftZ6LHEbsMGcgmE
 g/4wCCc133IvsEMzPYKzjphHq842iUGxy4dN/8uXKFHOvg3zYpV9ONnykOhMGAzB2YLb2I
 T+C0dPcs/Y+rVQMdYcnXRxO3WPQaKtwTtDcuXYb+vkC6Rf9e0yjSeIJpR0wzMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BG8qEUYE
Subject: Re: [Buildroot] [PATCH v2 2/2] package/multipath-tools: enable with
 musl
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 23 Mar 2023 14:13:27 +0000
Simon Rowe <simon.rowe@nutanix.com> wrote:

> Now LVM2 can be built using musl drop the toolchain config
> restriction.
> 
> Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
> ---
>  package/multipath-tools/Config.in | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

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
