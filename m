Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B810C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2691740BED;
	Thu,  3 Nov 2022 22:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2691740BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qdo4kMXJi8nF; Thu,  3 Nov 2022 22:13:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44E0E40BE7;
	Thu,  3 Nov 2022 22:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44E0E40BE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 685841BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41C884185C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41C884185C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibEh05djotH0 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:12:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04AF64185A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04AF64185A
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:12:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B6D3E0002;
 Thu,  3 Nov 2022 22:12:53 +0000 (UTC)
Date: Thu, 3 Nov 2022 23:12:52 +0100
To: Markus Mayer via buildroot <buildroot@buildroot.org>
Message-ID: <20221103231252.399a0411@windsurf>
In-Reply-To: <20221019233414.868133-1-mmayer@broadcom.com>
References: <20221019233414.868133-1-mmayer@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667513573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwuMNkC+nantnmZ61oOQq3X67GhJXJlhRZVTfFs2GPY=;
 b=auSh1P+m9rvZH9CSIoI3aUx/+HEiedObrajO2a4F1sqD27xeXT1WVBVqFz342eh+W8Nujy
 BRK0nbKpi9kh0mCQdAjo35+CrVYW8XVkXFP5kphD641RMlnDcFxT5ivg/5RWeP8N0da2mK
 +hu7S4/mY66mzikpM4lCpaHUfqvb+MsGzhkAsMb8O2Gnk2KwvzdCoW6oLAnad7xM9uohzi
 KZDGwMANz2wOeRQtQCTToke547EfqzGnwS7dWr/EXcfDWWPumKIcXfsFP0UrHKGFUUiTht
 +VJy+iWZcavU1tWNY7i04WO0N0MvlEO5sEDnSo0e9YXW66zvgqkbUqS0I0jYbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=auSh1P+m
Subject: Re: [Buildroot] [PATCH] package/rsync: force HAVE_C99_VSNPRINTF to
 "yes"
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 19 Oct 2022 16:34:14 -0700
Markus Mayer via buildroot <buildroot@buildroot.org> wrote:

> We know the system will have a modern-enough C library that implements
> the required snprintf() functionality. Since the configure stage can't
> detect the system's capabilities (because it is cross-compiling), let's
> hard-code the decision.
> 
> As a result, rsync won't be linking in its own copy of snprintf().
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/rsync/rsync.mk | 3 +++
>  1 file changed, 3 insertions(+)

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
