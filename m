Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC3BECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B3AF4014D;
	Sun, 30 Oct 2022 21:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B3AF4014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id revvWbev3A-K; Sun, 30 Oct 2022 21:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C95D7400DC;
	Sun, 30 Oct 2022 21:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C95D7400DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BFE91BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE1F1400DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE1F1400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vowrfqDU2uQW for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:32:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE5A4400CE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE5A4400CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:32:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E14271BF205;
 Sun, 30 Oct 2022 21:32:52 +0000 (UTC)
Date: Sun, 30 Oct 2022 22:32:51 +0100
To: Dimi Tomov <dimi@tpm.dev>
Message-ID: <20221030223251.7eb4a4cb@windsurf>
In-Reply-To: <20221012075423.14729-2-dimi@tpm.dev>
References: <20221012075423.14729-1-dimi@tpm.dev>
 <20221012075423.14729-2-dimi@tpm.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667165573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVlwfA6Dy6eXzXBLoqNT67+N5ztM3GB56aDC8y3Y4Bg=;
 b=DgD9BPga5KkMAnePqPs4nwzSjXPjZDx+CNfbYzD3ia6vCQwqa1+Kr6KohiQqtmzfc/LXoO
 tPMV2c5U71aCFrguSgcjvBv1UchpkVsHSGwrZLc5vwZJzUYSjOKeGaei+3Y6CUY31nYTMv
 TFgejJupMZuF3bge3kvQdoDaCky2ikPe/huuZtvRm7a4nIMIyJ6G+Oa+FsQdPFfy36GFYW
 XDvZ0ncKyer9yFVHcLWwRCuospNR6NlOg8xmj627D8rWuVIHZHtkS/yEvcOeRPn9KfiNVa
 9Dr5oiyicD7rRWebJujxwPIMG0LbylWT69bQJoXX+ZrV77rUvQ0E0th7Mawb6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DgD9BPga
Subject: Re: [Buildroot] [PATCH 2/2] package/wolftpm: Add new config option
 to enable debug output
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

On Wed, 12 Oct 2022 10:54:23 +0300
Dimi Tomov <dimi@tpm.dev> wrote:

> From: Dimitar Tomov <dimi@tpm.dev>
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
> ---
>  package/wolftpm/Config.in  | 5 +++++
>  package/wolftpm/wolftpm.mk | 6 ++++++
>  2 files changed, 11 insertions(+)

I hesitated a bit between adding this new option, or using
BR2_ENABLE_RUNTIME_DEBUG. In the end, I went for your proposal, a
package-specific option. We'll see if other maintainers complain :-)

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
