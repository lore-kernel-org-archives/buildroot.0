Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1CDC19F2B
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68156414C5;
	Thu, 28 Jul 2022 20:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68156414C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 112LzG8mwR3f; Thu, 28 Jul 2022 20:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50D08410A4;
	Thu, 28 Jul 2022 20:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50D08410A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 482611BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2314C402F2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2314C402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XAr9cxJNBaCf for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:57:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1B6940327
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1B6940327
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:57:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B84711BF207;
 Thu, 28 Jul 2022 20:57:42 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:57:41 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728225741.5994aa1d@windsurf>
In-Reply-To: <20220728122839.2616590-1-fontaine.fabrice@gmail.com>
References: <20220728122839.2616590-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGaCQ0Xbl3XPW/JplFviiNS4ykgJcxZED2TL/Fdl2c0=;
 b=EdkcxhbIeSfSkhrOv8ZCuI8v6kaeppayEIZ1o97DgrgTjONF21Gq5Ec8Fwxwy58UTFSgpM
 lZg8aokKASg4svzgbpItLF4S8o3Axcuak3j1kThgF91Kj6pGwXYu233XgM4DABJ/1jBQI+
 33V3XOrWD6q+x28Im8IFYf5jyK2PgrJzGQH4XqacH0Ae7GK6VvucnraFyyQbvB1s82FTQs
 XMRyF6Vbe2+J9tRgV6+K+kcrPSLqgmCjrlypkNqyJjTimc9YZaGzG/rswgkY3JmDMH8qvC
 BjZr7nHByTBPOFZOSCBcyDir8QENOmMEZf9U4YJO+ZfP391+YoCo205g3qNq5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EdkcxhbI
Subject: Re: [Buildroot] [PATCH 1/1] package/wine: simplify alsa-lib feature
 selection
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
Cc: =?UTF-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 14:28:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Instead of having the user need to figure out that 2 alsa-lib features
> are needed for wine ALSA support, have the top-level wine option select
> the relevant alsa-lib features, when alsa-lib is enabled as already done
> for pulseaudio in commit 97cd3680a4cc4bc0c71bccccb1459eda4b880159
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wine/Config.in | 2 ++
>  package/wine/wine.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

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
