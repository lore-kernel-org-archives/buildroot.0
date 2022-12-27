Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9DAC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 19:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D79D44045C;
	Tue, 27 Dec 2022 19:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D79D44045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZYEo_RAFxQz; Tue, 27 Dec 2022 19:58:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E3944018F;
	Tue, 27 Dec 2022 19:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E3944018F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD591BF5A4
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 19:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17C5D408E5
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 19:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C5D408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uoDaOBXvbw2X for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 19:58:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD611408C3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD611408C3
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 19:58:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8F031E0003;
 Tue, 27 Dec 2022 19:58:52 +0000 (UTC)
Date: Tue, 27 Dec 2022 20:58:49 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221227205849.4dfc0e38@windsurf>
In-Reply-To: <20221226225035.825216-1-fontaine.fabrice@gmail.com>
References: <20221226225035.825216-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672171132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwwKxeb2UWpHamA/4gTlh9bxNRAY9gS/0xmjs7Ge0Ww=;
 b=Z+P9uPtdX1U1u+ufg+jvnV3rMtvph90BTyzF3lajlCWtC5kUa2ouXugnGuya+M9n0c3MtP
 mK5iEywHn4TwPGPCQHX3KcWKYxHeZyClJgI3oGFxqLejMxYsc6cTUuYgrZo0Eb+vaUTYU1
 jmmpK0CElo3XdwRDkLQN2MfLkYDT8GKr+NX+FlnYDsnAoQFqePo56V3q8QuWKHMaU15Qb6
 DmI6GXLcIDAd3YLC+zVuCfLCK0blZhgOhJNiFQUNuPE6GcifknuSNs10x/obA3cNAaspAU
 9iYZWwnvzIDELDwF4HcVPt5LcMZ0qJZaeVJLiRg8UCrJ8BFzx36+24Q7VyTbYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z+P9uPtd
Subject: Re: [Buildroot] [PATCH 1/1] package/dump1090: bump to version 8.2
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

On Mon, 26 Dec 2022 23:50:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/flightaware/dump1090/compare/v7.2...v8.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dump1090/dump1090.hash | 2 +-
>  package/dump1090/dump1090.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
