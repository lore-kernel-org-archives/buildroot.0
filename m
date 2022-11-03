Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D302C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 234924187A;
	Thu,  3 Nov 2022 21:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 234924187A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zTP98frnos5; Thu,  3 Nov 2022 21:28:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F9041893;
	Thu,  3 Nov 2022 21:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F9041893
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC0E1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65E8A40BF7
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65E8A40BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i5mdS0pv9ZD6 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:12:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E287B40BC0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E287B40BC0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:12:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B111C0006;
 Thu,  3 Nov 2022 21:12:16 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:12:15 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221103221215.19ba6939@windsurf>
In-Reply-To: <20221102120751.103984-1-fontaine.fabrice@gmail.com>
References: <20221102120751.103984-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzMze1UMsHyC9D2DtKzvdFXnwYGhKP4rU5FI35c2bcQ=;
 b=Sr1KhYYs1lOjS7lafyLZDH6C2KLrf8MhK2U08IMni9ggjBSHeNlFOW85BXN/MKXhpwNi4d
 GHqgaGAMR1FfLVqz2tgfFIinFODIzI7Cpnt/AbgknZpNL0/UE5qX8CDeotxze9UKfL6Bgj
 3PVL/hr2papnyMg0jYCl3XbiFQCLa3HXd7S1x9lOcyhwaRFJgeQa62kbgvQqeI4sMdYSy1
 GcPmOorbwX0S/GP+kRQKsO3ZjCPuFWa18iFbTL+MfUaKObBRq3+dRI61TzHGPVegip9XAv
 9MpzCoi9K8QvwPpvX8++JAew0XEETOmLacD1Vm8hWv88uubGCbVxcGkR03zUIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sr1KhYYs
Subject: Re: [Buildroot] [PATCH 1/1] package/makedumpfile: fix mips64 build
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Nov 2022 13:07:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following mips64 build failure raised since commit
> 0b389385666687ecfd09cdbce6c6ecfd74ce11ab:
> 
> makedumpfile.c: In function 'is_kvaddr':
> makedumpfile.c:1613:39: error: 'KVBASE' undeclared (first use in this function)
>   return (addr >= (unsigned long long)(KVBASE));
>                                        ^~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/94824fa8baa8edb99a5ca245e5561e0c4e430638
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../makedumpfile/0002-Handle-__mips64.patch   | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 package/makedumpfile/0002-Handle-__mips64.patch

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
