Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54CEC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 21:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 609B240614;
	Sat, 14 Jan 2023 21:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 609B240614
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIzuXbXOObzE; Sat, 14 Jan 2023 21:14:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5122405AB;
	Sat, 14 Jan 2023 21:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5122405AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10A831BF3C2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C322B41578
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C322B41578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWAch5tlkypm for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 21:14:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57829414C2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57829414C2
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 21:14:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E6400240003;
 Sat, 14 Jan 2023 21:14:30 +0000 (UTC)
Date: Sat, 14 Jan 2023 22:14:29 +0100
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230114221429.2438fa43@windsurf>
In-Reply-To: <20230113225425.3301420-2-vfazio@xes-inc.com>
References: <20230113225425.3301420-1-vfazio@xes-inc.com>
 <20230113225425.3301420-2-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673730871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b570cLWLd/zRddOjo9ZsizcJF/2yHpGN+uliWpQeubY=;
 b=BySPtICoJYxj2MxYUcBvVawQuBmtTZHnK3XNHyWSNiUzoKyz10b9vko8D+xTg2s1A0ve8H
 9s3fEdkhHU6QzJ2IwG4pRoEV6ePhrr0fqEJp7sNJMeMHzBJ/WzWKzMa/qnwU7yXWqz5P51
 DEwueVZlo2diS6/YJP6yHFXW4rPD6e0sHIUs8lNSxNghS8GnUIlCxQqnf9cAU6bwJ9BPeR
 GMhOPeR4547ItiNIp16bCNp6dEmRYfG9wQ0QrTfefHf1XtHUU0i+vXzOq+TNhY5XBp12L7
 /ge5lcfbZKcjrtyIaV7fOwmdb94JJgs/I9lEu48vzWULKZEkNSkh4VydfNnlFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BySPtICo
Subject: Re: [Buildroot] [PATCH 2/2] package/ipmitool: use the standard
 github helper
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 13 Jan 2023 16:54:25 -0600
Vincent Fazio <vfazio@xes-inc.com> wrote:

> From: Vincent Fazio <vfazio@gmail.com>
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  package/ipmitool/ipmitool.hash | 2 +-
>  package/ipmitool/ipmitool.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)

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
