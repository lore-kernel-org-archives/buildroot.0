Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F11BC19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D378819BE;
	Wed, 27 Jul 2022 07:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D378819BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CIwCrDxlu7-3; Wed, 27 Jul 2022 07:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 466E2817A3;
	Wed, 27 Jul 2022 07:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 466E2817A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8B31BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13148403E7
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13148403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8g-Eou4BrMxI for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:40:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB49D401C5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB49D401C5
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:40:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8A8F01BF205;
 Wed, 27 Jul 2022 07:40:54 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:40:53 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727094053.73cb4400@windsurf>
In-Reply-To: <20220727064601.248159-1-fontaine.fabrice@gmail.com>
References: <20220727064601.248159-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658907655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85C4E09jF/AcwreucpBuc5saevsFSFgrEH6ncdoQ1hU=;
 b=O56yn0ZDuju9oatUrrPGSYB74c7+umeqNN2k3QW5NSUoRcDFHA+QPoGsqKbfz1FeLt1fz6
 RbdIkSJryaGIJoynt5dZR+k0FB0pASRypMOGnq1nP4v9c6ADasgcTyvtZ0eK6PsG4LGY+r
 h9/YzgGmAF8ug9L3NQnrKTJRidVyjVYZ+5wl92sph3h2FeOavk823JQN00a9pU1Bo2iYzE
 ifjJY15fyCgLfKQFscjIIdTjiTZ6KjsyFTxILOpNPUbbfLRtH0ZPunxFqSLrIJQBnV5T4R
 pCdGEhwTUtdPiBVKPFj3/yE+hEudVbBKqrIBiHBuiGCbf7x/3sDt/CL3hGvVgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O56yn0ZD
Subject: Re: [Buildroot] [PATCH 1/1] package/gensio: add openipmi support
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 08:46:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gensio/gensio.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

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
