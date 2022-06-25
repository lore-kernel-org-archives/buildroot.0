Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9906C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 23:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B35060FCA;
	Sat, 25 Jun 2022 23:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B35060FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxtE9WiwSwV2; Sat, 25 Jun 2022 23:20:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B3B160FC7;
	Sat, 25 Jun 2022 23:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B3B160FC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8C41BF5B5
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 23:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A536E8341E
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 23:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A536E8341E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mRfWqJgVuubS for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 23:20:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 477FE831A9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 477FE831A9
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 23:20:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 73C3BFF804;
 Sat, 25 Jun 2022 23:20:26 +0000 (UTC)
Date: Sun, 26 Jun 2022 01:20:22 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20220626012022.48814280@windsurf>
In-Reply-To: <CA+h8R2rjW4aTmTObDpKyrdMX1e=CqGzyeGHSg5sB-eeonz3LTg@mail.gmail.com>
References: <CA+h8R2rjW4aTmTObDpKyrdMX1e=CqGzyeGHSg5sB-eeonz3LTg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1656199228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQu8vVa4jykXMGZeRc4I3nnDK6QFTyXBiQXw1zZ4vj0=;
 b=IrDRC6dV1d68o/a575SoWcfMggDJTMMTKF6ejqFSKrdYaHRtMvdQkdotoyjoEgaVH9xKBk
 H7kIqGMilTqiVKglem5BIqxu52t0Thil63eE+8sBNBELWnqN7sf0D/qsCqAaWhiFiIFjSI
 8cEwFB3NtcY7X/BSWCf1k0v/Ne68dJufCjXPL0EMp+Ryb6H0UhQGlSNd0A5AECTB7j5Saz
 QO0rZkKOJ/fRCDQzt0g6s8WZJxyTxTXW0tbJp2aTBPZYynAbrbSJGZC5B4fsMaCn9+VBC3
 PH2qyWvt4geVtlqKr/UtsTSiQbfAZWF3YcaVG39b3FOTEl0/p8oQ0v7mfvVqRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IrDRC6dV
Subject: Re: [Buildroot] go: patching dependency versions w/ go modules?
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 25 Jun 2022 15:37:36 -0700
Christian Stewart <christian@paral.in> wrote:

> There's a particular issue I've run into with the Go implementation
> while trying to fix the gocryptfs package.
> 
> Currently the process is:
> 
>  1. Download the package source code.
>  2. Run "go mod vendor" and re-bundle into a .tar.gz.
>  3. Hash the resulting .tar.gz
>  4. Extract it to the build/ tree
>  5. Apply any patches
>  6. Run the build.
> 
> The problem with this is, if we try to patch the versions of any
> dependencies, for example by editing go.mod and go.sum, this is after
> the download step at #2.
> 
> So currently it is not possible to change the version of dependencies
> with a patch.

Correct.

> Is there any clean way to fix this?

No, not with the current infrastructure indeed.

> The only thing I can think of is to add a new variable which contains
> a list of "go mod edit" commands to run just before "go mod vendor" in
> the download & extract step.
> 
> go mod edit -replace
> github.com/jacobsa/crypto=github.com/piggynl/jacobsa-crypto@xorblock-generic

I don't really have a good idea here, but whatever solution we come up
with should not be Go-specific, as it should also work for the Cargo
use-case (and possibly other similar situations in the future).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
