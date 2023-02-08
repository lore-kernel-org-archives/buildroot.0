Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A67C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12C9761107;
	Wed,  8 Feb 2023 15:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12C9761107
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fz66lhQf86Lc; Wed,  8 Feb 2023 15:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49472610F3;
	Wed,  8 Feb 2023 15:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49472610F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B88D1BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C648610F3
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C648610F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uH9njJabAEoM for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:15:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 985F8610EC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 985F8610EC
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:15:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3492BE0012;
 Wed,  8 Feb 2023 15:15:29 +0000 (UTC)
Date: Wed, 8 Feb 2023 16:15:27 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230208161527.31a28b3b@windsurf>
In-Reply-To: <20220607231211.533086-1-james.hilliard1@gmail.com>
References: <20220607231211.533086-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675869329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwv2eshBw3Y135xa7EExSxtyxDkElGxpuMX0awgKnB8=;
 b=DZsd92K2W+p6NrK1HZ57ax/uzthV/g52FS1/y1uYfZouEu7DesX/sBGAa2pE6Q9Du+JA0x
 9JAkhBuLDf/GaYzxA4ZF7i2aNpPqBrcfB6G9qIOMcoe8rbCK+xTmTBKJoD6mfSCunSzJC0
 6Ki5/SsLjz+sHwDrbsFhIturWRe5GRE7eee71i0a013eluHvwMFsoto/609ZDJs4SjBeiI
 hF8lwG+M5EgoQFh+NvYl3MwDZMhSXZ3taF48HoUM7d/U53S3y24i7itc5hD7SBhmJebAB0
 8qT7a3Z5ovfo4TGAh8KyHzNYwt8/LfZ0eQbjyC3gM+Mw0zskHeM2nn0+VwlnZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DZsd92K2
Subject: Re: [Buildroot] [PATCH buildroot-test 1/1] scripts/autobuild-run:
 add support for --branch option
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

On Tue,  7 Jun 2022 17:12:11 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> In some cases it only makes sense to run tests against a specific
> branch, such as when testing new genrandconfig flags.
> 
> Add a config option to override the branch selection.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  scripts/autobuild-run | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

We looked at this with Arnout, and we don't really see what this would
be needed, and actually it could be annoying to have people test
"random" branches. If you need extensions to genrandconfig, then the
autobuild-run script should be backward compatible with older versions
of genrandconfig to be able to support older branches for a certain
while.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
