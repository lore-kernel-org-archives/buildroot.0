Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46008C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F33DD4056D;
	Mon,  5 Feb 2024 17:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F33DD4056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwxItEtPsMg9; Mon,  5 Feb 2024 17:56:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9C0B4023F;
	Mon,  5 Feb 2024 17:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9C0B4023F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2881BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1F2381DF3
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F2381DF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvYQVQhOMsPX for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:56:19 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2DD281DF2
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2DD281DF2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1040CC0003;
 Mon,  5 Feb 2024 17:56:16 +0000 (UTC)
Date: Mon, 5 Feb 2024 18:56:16 +0100
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240205185616.13fb5202@windsurf>
In-Reply-To: <20240118222310.62234-1-brandon.maier@collins.com>
References: <20240118222310.62234-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707155777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07aQ9hLkkfn1PSW9S3tBo7FM77JGkbnjrhxJm3oqdLM=;
 b=aRfP4gC8OlsLAsPRQ95QyXsAnbpBNFFszqkoqlPW3ItM5Cb3WNE3mQvMC+23aJPYhnRyyR
 Dy5tQZALbK+StIX/1zYFdXCddHApYqfPxGwEz0mfCJF0xUEF+7pSnsIZX/n38710llHbo9
 acoL+/NRBtc4h2Yt2NwUyzHplVW9J5EGz8hIQKe8wIaC11JAfnzlHy0UWPrnj0opUttkWB
 mLgrjf8eJ6xlS5DirZdnEusVxXgUVE835jBY6NgqDgHYdOI27BiRwedHveAcb4X5xkXYrv
 nvghfmcAilP9i01u7q8UXpLEOnBkr23SkHRDwa6iwbPBcA48Wxofn6wWFW7Ajg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aRfP4gC8
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: fix build error on
 powerpc
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 18 Jan 2024 22:23:01 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Fixes the following error message introducted by OpenSSH v9.6p1.
> 
>   sshkey.c: In function 'sshkey_set_filename':
>   sshkey.c:3705:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
>    3705 | }
> 
> Fixes:
> http://autobuild.buildroot.org/results/ec7/ec780aed5b1c4fdf9b91f6e7be99e8d4c42efa58
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  ...ction-of-broken-fzero-call-used-regs.patch | 57 +++++++++++++++++++
>  package/openssh/openssh.mk                    |  3 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch

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
