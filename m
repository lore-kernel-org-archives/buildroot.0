Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D05C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE96C4248A;
	Sat, 23 Jul 2022 20:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE96C4248A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DU8VTCtwLuN3; Sat, 23 Jul 2022 20:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A457342482;
	Sat, 23 Jul 2022 20:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A457342482
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0EF61BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7AAA4049B
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7AAA4049B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETnWiGTrkilP for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:29:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AE0C4019C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AE0C4019C
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:29:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1C4BD240009;
 Sat, 23 Jul 2022 20:29:10 +0000 (UTC)
Date: Sat, 23 Jul 2022 22:29:09 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220723222909.12b5a404@windsurf>
In-Reply-To: <20220128205201.2798205-2-fontaine.fabrice@gmail.com>
References: <20220128205201.2798205-1-fontaine.fabrice@gmail.com>
 <20220128205201.2798205-2-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658608150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UlD/1zmOMITxmjMZB/fsBZoEgigHghFZx1q5xYljvP8=;
 b=mZpibX15zRFDwGhkx8z5CQO3iz+zVM0G0o7CcWwnUvzPy/nWL3SnyYdwCBfvBB8hNgRAck
 rvUeupNCVgfjTQcnf0Thp0bNQ54MceyMorwsG0sAL/Z5UAbHZnrEfv47B+bgBp8iUyYvZm
 Ksdv2quIECLuqIb2w9Is6chvA8NP0E0JrzXwVtgYqfq/x00ayfdrvXjjBHoF9MTQD8FpnQ
 PqtFDX2LwJdtFstIwyIVbIowEuVZV5Yr7iV3ZwVaWfkRlWoU4iKzzB9vLihvhrHnhrvdkM
 7g8HPYnoKrl9ZtV0e3NT3ZtqDSzkrTqREmPh9Sy08/UYcTfduqJGC0cpU++eiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mZpibX15
Subject: Re: [Buildroot] [PATCH 2/2] package/libglvnd: bump to version 1.4.0
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jan 2022 21:52:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update hash of README.md (extra paragraph removed with
>   https://gitlab.freedesktop.org/glvnd/libglvnd/-/commit/a7bb6f4d19d1258d83c8800af885936a243e07bb)
> - Update hash of uthash license (year updated with
>   https://gitlab.freedesktop.org/glvnd/libglvnd/-/commit/b3a958feb03694e2f0df71482875684e45353964)
> 
> https://gitlab.freedesktop.org/glvnd/libglvnd/-/tags/v1.4.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libglvnd/libglvnd.hash | 6 +++---
>  package/libglvnd/libglvnd.mk   | 5 ++---
>  2 files changed, 5 insertions(+), 6 deletions(-)

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
