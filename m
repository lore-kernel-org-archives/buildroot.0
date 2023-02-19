Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D544C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 21:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1A5E40B73;
	Sun, 19 Feb 2023 21:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1A5E40B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4Lbq6HTUuGB; Sun, 19 Feb 2023 21:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC68840B48;
	Sun, 19 Feb 2023 21:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC68840B48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70BFC1BF405
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A482415F4
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 21:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A482415F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1j7hOtel9Va for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 21:09:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E938D415ED
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E938D415ED
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 21:09:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4495F240006;
 Sun, 19 Feb 2023 21:09:50 +0000 (UTC)
Date: Sun, 19 Feb 2023 22:09:49 +0100
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20230219220949.4507fcc8@windsurf>
In-Reply-To: <20230218134059.53863-1-egorenar@linux.ibm.com>
References: <20230218134059.53863-1-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676840990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZBAmK7tDfoxbj4D/pxRvfcawD5dzIL6LivsAOlSTrQ=;
 b=HIbrtTBbaab9y12X0JFgUVd76RpZd9VXWjrDUknrpOg6vpdjqqrCatKFBMoiwUZ1v2gmne
 SAyYCq1rSUz1YgmQ58uG69PHT9d7zUCneh+rQr+UoTFxD+SXg97y+yCjx/RgJl2GfCotiV
 WnzD4kn0KVVFgc6wq1yepZ7i+Yjm6Yu+fQ8ei/6z31t81Z0wt0+ZC7P6IbPKgL96FJKqIy
 G2QWAAY/uX5mtJB7bh71RLX/LgGDFok2Mz9fxxMVZS4M+OuyTf++WdkIpZcUYkhRbuTGud
 /9BDAaW+f80txu2Lb5FpUyedkwcGCVPEiEet4hvHf3kQh2dAETFJ/t5Uy4NuGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HIbrtTBb
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version
 2.26.0
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

On Sat, 18 Feb 2023 14:40:59 +0100
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  package/s390-tools/s390-tools.hash | 2 +-
>  package/s390-tools/s390-tools.mk   | 2 +-
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
