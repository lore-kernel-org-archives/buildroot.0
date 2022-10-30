Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B0BFA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F17660ABD;
	Sun, 30 Oct 2022 11:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F17660ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o2OMo1e3L9c8; Sun, 30 Oct 2022 11:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6725F60A72;
	Sun, 30 Oct 2022 11:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6725F60A72
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 433361BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BA5C402A3
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA5C402A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 19E0o5o87twA for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:08:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 968A340103
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 968A340103
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:08:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CF3AF240004;
 Sun, 30 Oct 2022 11:08:26 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:07:28 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120728.4c4de507@windsurf>
In-Reply-To: <20221029204023.162302-1-fontaine.fabrice@gmail.com>
References: <20221029204023.162302-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2QWsPHqgC40p/a6Co6xF9Oe3m35piMwhnW+EACjHlaw=;
 b=h0AFBXzFli3OTRQkeeNLavef/wBIyF9uwwfy+/t8axPLGQyeL0rTb5qrRcEkC9iFPVLsXq
 IIgH7C/xMyiEGWLU+kj5z+hMN7hoac5uSI1VQ4TEWlYJj3clqAHHoWXjDkK4y9gCiQn4Xq
 xUu8NR0YLWuVru8oGEKg0jCrVWExLuoParK4vLN3XS/qHljb+LMa21G9lHoSwzSZ6AUzhp
 JYLl+mUsuzZw9rpybEavYDSRYZ/9WHiF5EP1A5znqpJFd7HzYseScOTySMgD7IjcRSWAsL
 8GdvLY5wgE8iyZAx4cVlxGLt3/OYdzsofUcezA0qXhrhqshnqmpYsdtAfdTrKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h0AFBXzF
Subject: Re: [Buildroot] [PATCH 1/1] package/lldpd: security bump to version
 1.0.15
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

On Sat, 29 Oct 2022 22:40:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix heap overflow when reading SONMP. CVE-2021-43612.
> - https://vincentbernat.github.io/lldpd/ is redirecting to
>   https://lldpd.github.io/
> 
> https://github.com/lldpd/lldpd/blob/1.0.15/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lldpd/Config.in  | 2 +-
>  package/lldpd/lldpd.hash | 4 ++--
>  package/lldpd/lldpd.mk   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

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
