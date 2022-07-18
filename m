Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E474BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BEA783E69;
	Mon, 18 Jul 2022 10:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BEA783E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eA7enO0hQaSi; Mon, 18 Jul 2022 10:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E7C383E1C;
	Mon, 18 Jul 2022 10:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E7C383E1C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0617A1BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D41F1404F3
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D41F1404F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_GGsyavr9eS for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:11:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A6C40222
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81A6C40222
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:11:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0FEEBE000C;
 Mon, 18 Jul 2022 10:11:37 +0000 (UTC)
Date: Mon, 18 Jul 2022 12:11:37 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220718121137.007d90c8@windsurf>
In-Reply-To: <20220717222233.2926672-1-fontaine.fabrice@gmail.com>
References: <20220717222233.2926672-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658139098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jU2Sfv9S5dU4er3kyc9NLHIESg0VtVJxm+M5m7jreXo=;
 b=P0rQgKwsotVdmH9eKkElf7kCIjKZp8e3/Gx5wJ3YtVczduVgmFJgwF7Vp3SQ9UYp4Veu2x
 AgEOAXtExUR/vGe1HHAxg2EfzCvOyxu4//0ryEcFKC0JmvPl9bt3w4KTPnzqMjqmOcOAuw
 q6kxZfjGpIWke4XktiysoLmHyGRcI4Kn3gk429w1qYXwJ887nn0Pa/KWiIORjEpfAzXv7W
 Of5Ft7rIi9BY0yKbrMSBOb9uqI3/cx/I5QpH667I9eluY2gXZkex44MTarJ0xqDEeAwJtG
 l1oXyQSZ+dXq4o/MVEVQI0N4XHFwqAr9PCFmPbUxwMURhA1Zkybt5uMJoc2Khg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P0rQgKws
Subject: Re: [Buildroot] [PATCH 1/1] package/crucible: fix CRUCIBLE_VERSION
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Jul 2022 00:22:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Make CRUCIBLE_VERSION compatible with https://release-monitoring.org
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/crucible/crucible.hash | 2 +-
>  package/crucible/crucible.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
