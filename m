Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9ACC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 13:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C1B4097D;
	Sun, 19 Mar 2023 13:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C1B4097D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5x-sYj0LWfHP; Sun, 19 Mar 2023 13:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B63064098F;
	Sun, 19 Mar 2023 13:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B63064098F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD221BF577
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 13:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B43260FBC
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 13:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B43260FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IXVg3pRVlWlN for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 13:44:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C50BC60D4C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C50BC60D4C
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 13:44:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6ED07C0004;
 Sun, 19 Mar 2023 13:44:38 +0000 (UTC)
Date: Sun, 19 Mar 2023 14:44:36 +0100
To: Steve Hay via buildroot <buildroot@buildroot.org>
Message-ID: <20230319144436.3085aa75@windsurf>
In-Reply-To: <20230319021851.2593117-1-me@stevenhay.com>
References: <20230319021851.2593117-1-me@stevenhay.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679233478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcQdGQ+fUveMHIHKXdbMznJfud2clH2YPmqBDiCrJZM=;
 b=gYOPXWhCwWDXXDXvXvFPZaWk/Of6HHlZX/1y88B/UeM2b1tihw2QF2l5YdBSGFI2vCwc6b
 N9suvTGOpsD2b3mTeuX6CL4wsapQsxt+JPdquWltveuIp74vnql0WTrt5vtrIJfnqlUTzv
 bn0POop70+1Jvk8hDpzLG1sl/uaLiigcISoTSwy6tC4nFH64tQllz1IV3Hv0p0TnXQf+9a
 /qNEuGC9lxbwiYjSgRu/5z8B+wVXxoyvtFjCOtwaFzBTX4EIPQD8q9FeN+0r6b5KXOkKLB
 U2O7uck7tuwQ0Ei1vILI3RET3qMYNGaG7+A943TNyIrKYeL3T2ECCGERt49e5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gYOPXWhC
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump version to
 20230311
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
Cc: Martin Bark <martin@barkynet.com>, Steve Hay <me@stevenhay.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Steve,

On Sun, 19 Mar 2023 03:18:50 +0100
Steve Hay via buildroot <buildroot@buildroot.org> wrote:

> The impetus for this change was that wget fails to load pages signed by
> Let's Encrypt due to missing root certs. This version has the updated and
> correct certs.
> 
> 0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
> 
> Patch dropped because the fix is incorporated upstream.
> 
> Signed-off-by: Steve Hay <me@stevenhay.com>
> 
> ---
> Changes v1 -> v2
>     - Removed the extraneous comment in the make file.
>     - Fixed patch header.

Are you sure your generated the correct version of the patch?

> diff --git a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
> index b76c1bfd7f..ced593664e 100644
> --- a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
> +++ b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
> @@ -1,4 +1,10 @@
> -From bf18b564122e8f976681a2398862fde1eafd84ba Mon Sep 17 00:00:00 2001
> +From a4e468a2a0afa80df174831c2f422184820bb0fa Mon Sep 17 00:00:00 2001
> +From: Steve Hay <me@stevenhay.com>
> +Date: Sat, 18 Mar 2023 17:57:18 +0100
> +Subject: [PATCH] mozilla/certdata2pem.py: make cryptography module optional
> +
> +Modified for a newer version of the ca-certificates module.
> +
>  From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  Date: Thu, 6 Jan 2022 23:15:00 +0100
>  Subject: [PATCH] mozilla/certdata2pem.py: make cryptography module optional
> @@ -15,37 +21,36 @@ the check is skipped.

The header of the patch is still not correct.

> -CA_CERTIFICATES_VERSION = 20211016
> +# batocera / version bump

And the comment is still there in the .mk file.

Am I missing something here? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
