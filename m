Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091BDC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 17:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7491341C3D;
	Wed,  3 Aug 2022 17:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7491341C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Se9_qwMU4glS; Wed,  3 Aug 2022 17:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B385441C33;
	Wed,  3 Aug 2022 17:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B385441C33
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3C0F1BF281
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 17:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66420827A5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 17:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66420827A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b6dZxZ_fTXwO for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 17:19:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BC418274E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BC418274E
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 17:19:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F47B2000D;
 Wed,  3 Aug 2022 17:19:14 +0000 (UTC)
Date: Wed, 3 Aug 2022 19:19:13 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220803191913.108e3b61@windsurf>
In-Reply-To: <YqGyLxqxwd94KHVS@waldemar-brodkorb.de>
References: <YqGyLxqxwd94KHVS@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659547154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdBdnwKm+9BhpYOEOse66T69HfbcIOyz8NKjzmzuuGw=;
 b=gDAmoyKhrADnzmHTsb0SefMI/aX5FHXJB8XIdAbNNEKy0XBOEP0lgo4SIHMNFjFN64LXo1
 igtz5evCPOvYujge23PvpimMvoNT+dzmsmNAEoAFerszQLTXSOjBIUYswk+JyskeHTKj4v
 LTrQdfzLhNmAJlHEHvHe2u51i5LejNrSdt1X+T9Fmtk5Rkr0nu3DR/o13WWr8tFsKIctqD
 b1/HoA8wUnxfGoQZuVHKZht6x9C1p58TQkLaTOlAA0BOQgiP4xIHDbjtf4LHy6iygjClXQ
 gLh/3nJ5puHThn/PsmN5aarXTmfabkrzple5RBps4s9R5wdXvvkVptEaMcFExg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gDAmoyKh
Subject: Re: [Buildroot] [PATCH] package/openswan: allow uClibc build
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

On Thu, 9 Jun 2022 10:41:19 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> uClibc-ng 1.0.41 added ns_t_tkey
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/openswan/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Since it was annoying to wait for uClibc-ng 1.0.41 to be deployed in
all toolchains, I have applied your change + a work-around patch on the
Openswan source code that removes the need for ns_t_tkey, by using
directly an hardcoded value. Not nice, but it works and we can drop
this workaround in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
