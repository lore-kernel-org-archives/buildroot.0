Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BF3C61DA4
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 22:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A4E81A6A;
	Mon, 13 Mar 2023 22:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0A4E81A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3WndjV9sDvu; Mon, 13 Mar 2023 22:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 282CA8105C;
	Mon, 13 Mar 2023 22:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 282CA8105C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4830C1BF397
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 22:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E520417A8
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 22:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E520417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChG-gcvKRtKE for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 22:00:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE8E141761
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE8E141761
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 22:00:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EAACCFF808;
 Mon, 13 Mar 2023 22:00:20 +0000 (UTC)
Date: Mon, 13 Mar 2023 23:00:20 +0100
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20230313230020.55b2c69a@windsurf>
In-Reply-To: <20230313052626.159262-1-fido_max@inbox.ru>
References: <20230313052626.159262-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678744821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdItbi284adJAnhqnvUCgETsyfdAyhL83tlu4R2zPIQ=;
 b=LaP3A+dgeZLfHdhB1N8GAt1qssvu9fuc6PiK4BBQ6fsYlWQfz3fxbl81mN5hDGxsBRmv5R
 1kEfBGvG0ywJwAXPhYlV4MmfNXsZfp2D1SM1yjn7TAyeTKov0I4C168YOY+ZAjlUzMV5pP
 AwyNJzu1GOy9OhiEepZtgQdsjX68e70bCS+6wHJJSjDsNEYSyVp2bJJUCmYLT9KhpNBK4p
 yBOuGb+73g16w4oE0oXmWC57OtzzdiZB+P+X2E0167aCubFnFO1KqIUez/9c0PiXgMQ4Jz
 /cb21xj7yugrOPfAPRuBC1Pn1poN9fAhCTWYTe/r9QD/oVZVn8Xxwn5u3bO20g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LaP3A+dg
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.10.1
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

On Mon, 13 Mar 2023 08:26:26 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Release notes: https://github.com/timescale/timescaledb/blob/2.10.1/CHANGELOG.md
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
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
