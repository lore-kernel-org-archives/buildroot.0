Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1B2C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEE1840A69;
	Tue,  2 Jan 2024 20:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEE1840A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AvvfVJosInFz; Tue,  2 Jan 2024 20:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2556340948;
	Tue,  2 Jan 2024 20:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2556340948
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 743811BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D40440A5F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D40440A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHvHUM3qrh5T for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:18:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA19740A69
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA19740A69
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5BF6FF806;
 Tue,  2 Jan 2024 20:18:30 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:18:30 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102211830.1847bf31@windsurf>
In-Reply-To: <20240102173750.982955-1-fontaine.fabrice@gmail.com>
References: <20240102173750.982955-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKqzKh8gVm26wSpu12dlPyurpdlFIZW96cwiPGaZen8=;
 b=Gy0Ml9wYwImLCeXkh16b7Ng7w/rIjtcD6i9pfsY6JmOy+oA0rag3a22zb+H0mrraYuzfMg
 AciDVbXOEYyMY3bhmhe1PI6SMlUhR8L1gADo83JcCRlypTIIIC9kgKF/RWoW9cfKPsAxJh
 RNt7meQmRWnjJtBWGomvK9jhmjASLtuCsUku7UZr8ooQ3JlxU8kDoZwjkR0zaNqtDpgcMv
 vLDQQM8VZ7sbxtoQX6pGKvVapAgwFozkRMG6b7Uan3QjeRDYDfQxIHBX+5ap6+PQk+tTW9
 0l1N6m9aPF7kXimPxiaq/zedq7QF27r13CpDYhwzOY+7RQfhHfPg5kY9BGssXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gy0Ml9wY
Subject: Re: [Buildroot] [PATCH 1/1] package/pax-utils: bump to version 1.3.7
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 18:37:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site to get latest release
> - autotools has been replaced by meson since
>   https://gitweb.gentoo.org/proj/pax-utils.git/commit/?id=063fcaeaa05074a9d90acec2f68b25dfb8ecd279
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pax-utils/pax-utils.hash |  2 +-
>  package/pax-utils/pax-utils.mk   | 23 +++++++++++++----------
>  2 files changed, 14 insertions(+), 11 deletions(-)

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
