Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177B2FA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 20:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64DFB81063;
	Tue, 25 Oct 2022 20:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64DFB81063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Knelsy9-L10P; Tue, 25 Oct 2022 20:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EA9B80F16;
	Tue, 25 Oct 2022 20:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EA9B80F16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD8F91BF3E3
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0C9180F16
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0C9180F16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0-_O_Tzq_Hz for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 20:06:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 851B980F04
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 851B980F04
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 20:06:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B248240005;
 Tue, 25 Oct 2022 20:06:03 +0000 (UTC)
Date: Tue, 25 Oct 2022 22:06:02 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221025220602.154d1807@windsurf>
In-Reply-To: <20221020174031.335520-1-giulio.benetti@benettiengineering.com>
References: <20221020174031.335520-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666728363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7Vp72hpQg9HWYijPqB6qZNgOskD1x6CY/GLlQ8E6nk=;
 b=Y5NapAlH3DMb5vzzOmQOwkmMd7AU+fwiJ18fZOWUBaTe0cXNciMt0wNKg6VxNSIBF9U4yI
 07Jh2vxFEfYBHuNJ6QGzfFsi0/ERziSf1y+exvycTCAuFIwZQlZALgnZQnQhZ0i3/GNMdk
 vxkYBFjPtNSycU5GNrHmy2ji3zrFMlwDH7eQXLy96zLnsxIhCQKQZMWVarMOKVzzlP6x4n
 tYrw902JbRBRGgWCvMoUY7ofVN6aLwQWA0LPq7OgeyHd3cbhB18D94Oci3i2p8qC5fr8LK
 mIihxholK4QZYSZ7qypvYSQRnHqtIWiiQFWRo6IRl3AnsgWZVsZSDGCovedZxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y5NapAlH
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 5.3.1
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

On Thu, 20 Oct 2022 19:40:31 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/harfbuzz/harfbuzz.hash | 2 +-
>  package/harfbuzz/harfbuzz.mk   | 2 +-
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
