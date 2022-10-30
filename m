Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14B2ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58CB8812BA;
	Sun, 30 Oct 2022 21:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58CB8812BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUu2CS92PmSL; Sun, 30 Oct 2022 21:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF6B8109C;
	Sun, 30 Oct 2022 21:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CF6B8109C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86B471BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6268660A97
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6268660A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBPm2Wz59QUI for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:30:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F0060A70
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7F0060A70
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:30:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B73B91BF204;
 Sun, 30 Oct 2022 21:29:58 +0000 (UTC)
Date: Sun, 30 Oct 2022 22:29:57 +0100
To: Dimi Tomov <dimi@tpm.dev>
Message-ID: <20221030222957.2d4a2e0a@windsurf>
In-Reply-To: <20221012075423.14729-1-dimi@tpm.dev>
References: <20221012075423.14729-1-dimi@tpm.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667165399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVJ0VQdpB+foy/NArQQDHzpwjLrO2JhoodJMVgSMLjc=;
 b=Pju+9Xf1riN5E0KnvEzf0qPO/1YCD0XiUYMq8TQ/78cGxciq81oE1GkFWiIdCKEOs7nb3F
 y3YzezvwouHh2DocrKI+tmgGpVF+uiNnxCKrXdRo37tpEYRFz8X45gi+86Roal1cTd2WES
 kb8gSYVPV7u/QB79gdv/H4huW2CGnHoOuTPTCcmRcgxQMmkc2pnhyvsUAsAwQskWYoY72V
 BB4ObO08Ou/9QbUZeHPDo0qDglh6W4N2fCk7MBBzEGu8K441shuhBqgOtfdhmzZkjF37j4
 7NQgWfOBu2w1l4Xo32zZwTDRLfhdGlvxMd6HfMhT6MywYMP1SR0gcCXouL5e4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pju+9Xf1
Subject: Re: [Buildroot] [PATCH 1/2] package/wolftpm: Update version to
 v2.6.0
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

On Wed, 12 Oct 2022 10:54:22 +0300
Dimi Tomov <dimi@tpm.dev> wrote:

> From: Dimitar Tomov <dimi@tpm.dev>
> 
> This patch series bumps the wolftpm version to the latest available and
> adds one new config option for controlling debug messages in wolftpm.

The commit log of a patch should not describe the patch series, but
just the patch itself.

The commit title should be:

	package/wolftpm: bump to version v2.6.0

>  package/wolftpm/wolftpm.hash | 2 +-
>  package/wolftpm/wolftpm.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
> index d24df58eaa..e256967a01 100644
> --- a/package/wolftpm/wolftpm.hash
> +++ b/package/wolftpm/wolftpm.hash
> @@ -1,4 +1,4 @@
>  # Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.4.0.tar.gz

This link is no longer correct. And in fact it is useless. Having a
link here is useful when it's a link to a hash file provided by
upstream, which is not the case here. In this case, we just put
"Locally calculated".

> -sha256  31d1a5f5d60af14c4d07e14a9b0667404d4801fed32afd3fc0649749020ad17b  wolftpm-2.4.0.tar.gz
> +sha256  78331cc2d98339247857f5ceb3e7cd3c4f5773e3d81bf1d73e8df9446e37472b  wolfTPM-2.6.0.tar.gz

You clearly did not test this properly, as the file is not named
wolfTPM-2.6.0.tar.gz but wolftpm-2.6.0.tar.gz. So a simple build fails
with:

ERROR: No hash found for wolftpm-2.6.0.tar.gz

I've fixed those issues and applied. But the next time, instead of
pinging just one day after submitting your patch... could you rather
spend your time in actually testing your patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
