Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E02EECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 18:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C31843EF;
	Sat, 17 Sep 2022 18:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C31843EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iI5C97EXQ0yG; Sat, 17 Sep 2022 18:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 965E6843D7;
	Sat, 17 Sep 2022 18:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 965E6843D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67CD51BF335
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BB00419D4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB00419D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRAF0iMPgAVG for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 18:52:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2222419CF
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2222419CF
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 18:52:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 67450E0005;
 Sat, 17 Sep 2022 18:52:54 +0000 (UTC)
Date: Sat, 17 Sep 2022 20:52:53 +0200
To: jwood+buildroot@starry.com
Message-ID: <20220917205253.3737d1c6@windsurf>
In-Reply-To: <20220908152330.2588951-1-jwood+buildroot@starry.com>
References: <20220908152330.2588951-1-jwood+buildroot@starry.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663440774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2FOpqJCztX6z2Ui2Mz3jItgN+3M6ty8qEyS//Haep0=;
 b=YkcAErLDZU3GlI5rnVzqYURu5I3ITjbt6fBxOOf19OomGU8lwKTA9P/sNjNMirziY7YWBn
 TUeKAx3mdqD6pK+TMC9U+Ag6IHaPmjr2xQ7gponZNNfErm/lN3fsO1S0/nlcp4IJdn5e/q
 5jvGYi3bP93V8Ee8pfIYtiORY5lBg5+BqdercE/ZKvMuPENMtZhVF5KkZRP06T4aCXdXHx
 UwY+mvVYDbxIN8I1KS0jKlNjEiVVyKUrS3ov95Ti+p2cGegLNFfE5MFX/clcFTWaJOQH5Y
 sNYa0khlkmtBy23mKwNDNBnQ5g8ymt5oZ3w+Rm7iPZr/7bO/TrTVskQL47qKXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YkcAErLD
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-download: add per package
 download fallback disable
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
Cc: Justin Wood <jwood@starry.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Justin,

On Thu,  8 Sep 2022 11:23:30 -0400
jwood+buildroot@starry.com wrote:

> From: Justin Wood <jwood+buildroot@starry.com>
> 
> This is useful in cases where a package is added without hashes (e.g. private packages)
> and you do not want to risk MITM attacks of the package itself.  While still allowing
> download of packages that are third party with hashes, from unreliable upstreams.
> 
> This adds a new ${PKG}_DISABLE_FALLBACK_DOWNLOAD that is checked when DOWNLOAD would be
> called to not include URIs from the backup site.
> 
> Additionally we use the new backup URIs if the new variable is unset in the json data
> URI list to ensure consistency for consumers who do not use this feature.
> 
> Signed-off-by: Justin Wood <jwood@starry.com>

We just had a discussion with Peter Korsgaard, and it seems like we
agree with the feedback from Yann. If you're really concerned about
MITM attacks, you should have hashes in your packages, and generally
speaking if you're concerned about "leaking" information about the fact
that you're building something, you should disable using
BR2_BACKUP_SITE.

However, instead of just saying no to this, we put a bit of thought
into it. What we don't like is that you're adding yet another very
specific variable that touches a very particular aspect of the package
behavior. Instead, we are thinking it might make sense to have a
variable that tells Buildroot the package is "private" or "internal"
(or some other similar naming), as opposed to the rest of the
open-source packages. This could tell Buildroot to not use the backup
site for this package, but also not mention the package in the
legal-info output. It should be noted that we already have the
<pkg>_REDISTRIBUTE = YES/NO boolean, but it only controls whether the
source code gets copied into the legal-info output: even with
<pkg>_REDISTRIBUTE = NO, the package gets listed in the legal-info
manifest. I personally believe it would make more sense to have a
variable that says the package is internal/private, and from that
derive the necessary tweaks to the download and legal-info behavior. I
don't have a good name for this variable though :-/

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
