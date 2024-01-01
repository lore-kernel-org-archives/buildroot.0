Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47F2C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8205340A8A;
	Mon,  1 Jan 2024 21:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8205340A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OccsmH0VbfyI; Mon,  1 Jan 2024 21:19:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B10240A50;
	Mon,  1 Jan 2024 21:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B10240A50
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23B951BF3D5
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59EA84064F
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59EA84064F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZTFGJ3Z5kcy for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:05:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAC5A408CF
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC5A408CF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11CB660003;
 Mon,  1 Jan 2024 21:05:13 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:05:13 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240101220513.526090ad@windsurf>
In-Reply-To: <20231227162039.579880-1-peter@korsgaard.com>
References: <20231227162039.579880-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+ULxvVkfoYmMU5GxvoK0wazKUO8EUUHeDEoLLv1pO8=;
 b=h9FCEWKqamtOntuqbYlen/NnLRZ4eRUthjaTozyCHiIySxYvhGB5oHLvygnPxfqY4dLH3d
 ASOsJ4YQIpo38JY8XCV3orvJZbQxiFYjtVwK6NSErEq7Ih5NlYiGLjXPR3oOW7bV41pgYn
 +ug4hbfwnVuWoLmPs97Zs1j411WvK26oRL/bP+6hyvqYSWoFhay5ts89UiYg8GU9g0kxrk
 8b2tqXJJjFKuBz6/BWdm1Y8aoyoOl0XkvpHWx7H62YC5xPEFRMpCrEp0eBrbTTbQTTqH2R
 KNB1106J628oAvaro8zZSFjfJ0nEUEt4bD+NXc6QpTb3WVxy0EHXHsdStP3kPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h9FCEWKq
Subject: Re: [Buildroot] [PATCH] package/xserver_xorg-server: security bump
 to version 21.1.10
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

On Wed, 27 Dec 2023 17:20:38 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> 1) CVE-2023-6377: X.Org server: Out-of-bounds memory write in XKB button actions
> 
> A device has XKB button actions for each button on the device.  When a
> logical device switch happens (e.g.  moving from a touchpad to a mouse), the
> server re-calculates the information available on the respective master
> device (typically the Virtual Core Pointer).  This re-calculation only
> allocated enough memory for a single XKB action rather instead of enough for
> the newly active physical device's number of button.  As a result, querying
> or changing the XKB button actions results in out-of-bounds memory reads and
> writes.
> 
> This may lead to local privilege escalation if the server is run as root or
> remote code execution (e.g. x11 over ssh).
> 
> 2) CVE-2023-6478: X.Org server: Out-of-bounds memory read in
> RRChangeOutputProperty and RRChangeProviderProperty
> 
> This fixes an OOB read and the resulting information disclosure.
> 
> Length calculation for the request was clipped to a 32-bit integer.  With
> the correct stuff->nUnits value the expected request size was truncated,
> passing the REQUEST_FIXED_SIZE check.
> 
> The server then proceeded with reading at least stuff->nUnits bytes
> (depending on stuff->format) from the request and stuffing whatever it finds
> into the property.  In the process it would also allocate at least
> stuff->nUnits bytes, i.e.  4GB.
> 
> See also CVE-2022-46344 where this issue was fixed for other requests.
> 
> For more details, see the advisory:
> https://lists.x.org/archives/xorg-announce/2023-December/003435.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
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
