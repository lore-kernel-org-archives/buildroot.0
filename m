Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84703CD37BB
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 20:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE98D40B24;
	Wed, 12 Nov 2025 20:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3jomDDnBO1H; Wed, 12 Nov 2025 20:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C68A40A50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C68A40A50;
	Wed, 12 Nov 2025 20:17:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 441D6230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 367E740A46
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exdsGGhg7uCM for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 20:17:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32E9F40A50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E9F40A50
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32E9F40A50
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:17:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1653278090; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 20:17:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJHHJ-0001Xz-2D;
 Wed, 12 Nov 2025 21:17:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,  Romain Naour
 <romain.naour@gmail.com>
References: <20251107214009.403006-1-yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2025 21:17:17 +0100
In-Reply-To: <20251107214009.403006-1-yann.morin.1998@free.fr> (Yann E. MORIN
 via buildroot's message of "Fri, 7 Nov 2025 22:40:09 +0100")
Message-ID: <87346jrooi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KRlOPVhT9keuVekMTUL+/MIauYRHnZ93xaBitq81eTAT+YGhPAEaywbpH7FxkEOUoh+YnxwEVrc92BIdlO23QdEd3YJwaTOLgMwEIRnOdQSjjftoaDA/CD39PyQ8UpK7ap2zJeVKJz67CNTF+e7DLcZqe2Y1az3Nm6dgXA1+L7CUr/iMGS2WDvPdhoUr/prXbytKa6VZs5WSppAxlREGlZNQ1ZcxwbUHxKeZgY6wJU6be/Ayd3ViyTPmm/SYUhuRguU/avPFP05zy0kL3PQej7JzT5tjrP6ipMqIGjR7DletQFhLjpyUNa2UJ/VYp1uKYEez56Mw7TJRUzaB/u9YJg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=KsM12AKLysiixkSJdzEtOFMp266R4gLN890kAPfPiKE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=KRlOPVhT
Subject: Re: [Buildroot] [PATCH] docs/manual: add merged-bin details to
 customize rootfs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN via buildroot <buildroot@buildroot.org> writes:

 > As was done in dc7c6487cff0 (Makefile: check rootfs overlays with
 > BR2_ROOTFS_MERGED_USR enabled) to document how overlays should be
 > set up for the merged-usr case, and following 428ac6fcc4c2 (system:
 > add support for merged /usr/sbin (aka merged-bin), extend the
 > documentation to explain how rootfs overlays should be set up for
 > the merged-bin case.

 > Reported-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 >  docs/manual/customize-rootfs.adoc | 5 +++++
 >  1 file changed, 5 insertions(+)

 > diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
 > index d334093748..5d8bcba778 100644
 > --- a/docs/manual/customize-rootfs.adoc
 > +++ b/docs/manual/customize-rootfs.adoc
 > @@ -28,6 +28,11 @@ When +BR2_ROOTFS_MERGED_USR+ is enabled, then the overlay must not
 >    such a situation, should the overlay have any programs or libraries,
 >    they should be placed in '/usr/bin', '/usr/sbin' and '/usr/lib'.
 >  +
 > +Additionally, when +BR2_ROOTFS_MERGED_BIN+ is enabled, then the overlay
 > +  must not contain the '/usr/sbin' directory, as Buildroot will create
 > +  it as a symbolic link to '/usr/bin'. In such a situation, should the
 > +  overlay have any program, they should be placed in '/usr/bin'.

s/program/programs/. I will send a patch.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
