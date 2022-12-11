Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E152AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7915960BDB;
	Sun, 11 Dec 2022 20:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7915960BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MikMKHwzBNf; Sun, 11 Dec 2022 20:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54D060BD8;
	Sun, 11 Dec 2022 20:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B54D060BD8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 224F91BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F033340743
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F033340743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7o1Wtb0JoFK for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:14:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A864F40339
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A864F40339
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:14:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B46DE1BF204;
 Sun, 11 Dec 2022 20:14:01 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:14:01 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221211211401.73283ed3@windsurf>
In-Reply-To: <20221211174029.1928619-1-james.hilliard1@gmail.com>
References: <20221211174029.1928619-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670789642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHsDrSHAPcaH2CGCsfcuV3fR2by1F/X/gQ3Yt4dh/Wk=;
 b=OHXtIWNlnk9eNCXcwPy4/8Qh5BhDeVGnv7qlplTrmeWUGLW1ZWVA9B3GCW0K2piC92rRDq
 b71vlQHvIJlS+UFZDdQv4SSLV+W4BuLEVd2Okm3l5F5FwME7OuauRwTBz8NUfmaejoQJyk
 WTAfd2M7xa2912dkF2n9XxxiqjUxtHGfOs0sFmv2gyJcGZSEbMxjb9E55OEByZOt0YjMgg
 uFmL6ZC/CSqo2/V47yFsMIyBG30aIXEWRhur0bUPSutGX/4kioc7KVd7KTUo2QoXSqPh+m
 C098lPcUo71e0Z//WRnZqs/WFeoyhPCu9kpc+GrvaFRvXl6Ab2ilugl9V8xutw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OHXtIWNl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tomli: drop
 flit-bootstrap for host package
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

On Sun, 11 Dec 2022 10:40:29 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> As tomli is no longer required for bootstrapping our pep517 toolchain
> we no longer need to use flit-bootstrap for the host package.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-tomli/python-tomli.mk | 1 -
>  1 file changed, 1 deletion(-)

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
