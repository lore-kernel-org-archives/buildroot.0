Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A65C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E95DA40237;
	Tue,  6 Feb 2024 10:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95DA40237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XBX0g1LMvhn; Tue,  6 Feb 2024 10:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D04241F29;
	Tue,  6 Feb 2024 10:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D04241F29
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AE2A1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73ABF41E81
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73ABF41E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9gTbmiWb8-H for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:35:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C0B341E9D
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C0B341E9D
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3D91FF80A;
 Tue,  6 Feb 2024 10:35:45 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:35:45 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113545.230a4c6a@windsurf>
In-Reply-To: <20240109080546.4062850-1-james.hilliard1@gmail.com>
References: <20240109080546.4062850-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDJfdS17b+PqD4iQX8OydqtVP0nTRubMtQm+EtOqKCk=;
 b=d8X8CivWbRBoUUUyAeCdimPxgs2SYC80H2nfYQ98dTjaN9Rf7HF6jZZzNVsV66ngvKhA0A
 ibIwiIDYgDv9nBPxDclbn/pZjxwIKSK3udnguduQct+BT16+VeeqCFxPr6BHT27oNZSh9B
 UY6H8U59t5wcoGJOAHChjxTZmSgApe4vHetPJPq+PtJ7QsgVUth5PmQfzTgnXrRPiiAPU0
 tMFtM8lpCuHrqQkz6Wftdc558d5L0Iy7QOd+qtc06/uy+eAaMTsk1rmOEIAYtMLNYw+s+T
 NZ9ZQEsMSbXVw5O43OBW8Tzir03vG/E2QRhzgtEo9Ww4/u+lfQ6ePjsjo/Yo9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d8X8CivW
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hatchling: bump to
 version 1.21.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 01:05:46 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-hatchling/python-hatchling.hash | 4 ++--
>  package/python-hatchling/python-hatchling.mk   | 4 ++--
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
