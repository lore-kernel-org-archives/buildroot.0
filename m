Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D46C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 18:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D165D60B3F;
	Sun, 12 Mar 2023 18:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D165D60B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jVQGK8fzs65; Sun, 12 Mar 2023 18:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26F5860B32;
	Sun, 12 Mar 2023 18:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26F5860B32
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69F791BF20D
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43DA681308
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43DA681308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Be-p4fq2OFMc for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 18:02:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1301E81345
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1301E81345
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 18:02:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 949ECE0004;
 Sun, 12 Mar 2023 18:02:11 +0000 (UTC)
Date: Sun, 12 Mar 2023 19:02:10 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230312190210.41b7b49d@windsurf>
In-Reply-To: <20230312160909.921651-1-giulio.benetti@benettiengineering.com>
References: <20230312160909.921651-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678644132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XNRyvzGgWv2UhtlU0bWhpxxNggpsRv3AFOLMeymmRdM=;
 b=ENgixQG2zMUS0pZJHSremEuuh3B0rN/YPDbHa9Dy7bfJPcLw9hW7hW5cvX7w3SvmxTfoLH
 I4QphxyUwSnIxM0XtqzmYPB2tWcn1pKdf5heYK/z4xONr4IozgzVW1cSco/Z5m7EdrIPeI
 xpmvKBjN6eNyRer9b+KXxdO5dfR7CY/D1Pmn1Dr9UJ4XQTVf3QLxtEfsCNkaFFLdMV+ziU
 nU3xHZiaCDYiZ/p1H8Bu/M1Sy7CYmhWfEzp5X4deFIugb9iu7X/ppV+3ZGrFHgN/XUDrA+
 IHuqD3yoyhjKUG+bAVIVGjkfXRVvDJQsnNsI+TnggeWv6x2q89uzd2mL/EvFFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ENgixQG2
Subject: Re: [Buildroot] [PATH for-next] package/rtl8192eu: bump to version
 2023-03-12 on branch 5.11.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 12 Mar 2023 17:09:09 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Drop local patch that has been upstreamed.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...02-Fix-conflicting-get_ra-on-PowerPC.patch | 124 ------------------
>  package/rtl8192eu/rtl8192eu.hash              |   2 +-
>  package/rtl8192eu/rtl8192eu.mk                |   2 +-
>  3 files changed, 2 insertions(+), 126 deletions(-)
>  delete mode 100644 package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
