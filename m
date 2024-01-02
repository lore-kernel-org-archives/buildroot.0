Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198EFC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C05D5409F1;
	Tue,  2 Jan 2024 20:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C05D5409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iw1P9_GCwgih; Tue,  2 Jan 2024 20:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01BA340A94;
	Tue,  2 Jan 2024 20:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01BA340A94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 087151BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5BDE81E66
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5BDE81E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mj5g20T7_5ol for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:18:15 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 964B181AD7
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 964B181AD7
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFB921C0008;
 Tue,  2 Jan 2024 20:18:11 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:18:11 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102211811.4556eecc@windsurf>
In-Reply-To: <20240102135741.1296172-1-fontaine.fabrice@gmail.com>
References: <20240102135741.1296172-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZOnDZ/k7XSybpJROn3MPisS6uwYGyMCVQZk3fVBencs=;
 b=aJd3LqTk0aEz/+DyIzhPeC+yFHVVHHPGDsDFTlvC+p5qcUXsE4PZ9lswmOIUQDCfs+Bp5E
 x9cbzGvTdrowttOIT8GMMrdIu545FYDKBKGfB6BsEjwNbccIAwcuvYX7wZ0ANxtDowXW3y
 ZN2//RP9Iq8RwsdR8dzcglV97JEdlfeH+uw+3aEMirkdbtvQWVaiatBzjkRa087N1PyiQ/
 dylVi8iuyOHvGGWGIgJqQ3Lqo6gn3chc+/PmzxLHV+ZbXkK151IHar+clXA3sjxGk0Q3bF
 UiyIWhX+QnqdDwrREtiM1MC8puXbjJHauJsUmD+L370JbEOdZvI1Coet/0ZMcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aJd3LqTk
Subject: Re: [Buildroot] [PATCH 1/1] package/glm: bump to version 0.9.9.8
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

On Tue,  2 Jan 2024 14:57:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> License is in a separate file since
> https://github.com/g-truc/glm/commit/347f422b9fda328a4eecfdc0e5bf5b19bc5c37e4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/glm/glm.hash | 4 ++--
>  package/glm/glm.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
