Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B77C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 12:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D382C81363;
	Fri, 29 Jul 2022 12:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D382C81363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvccb2v1KB5A; Fri, 29 Jul 2022 12:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0957381315;
	Fri, 29 Jul 2022 12:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0957381315
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 597111BF3F9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DF0940D9A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DF0940D9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJYNlMiH5FP0 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 12:33:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F37D640D0F
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F37D640D0F
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 12:33:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8D4F24000B;
 Fri, 29 Jul 2022 12:33:41 +0000 (UTC)
Date: Fri, 29 Jul 2022 14:33:40 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220729143340.18a16873@windsurf>
In-Reply-To: <b24dfe19-b57b-23fc-8822-3fd87d2b0e05@benettiengineering.com>
References: <20220729121055.168510-1-giulio.benetti@benettiengineering.com>
 <20220729141205.2bde03b3@windsurf>
 <b24dfe19-b57b-23fc-8822-3fd87d2b0e05@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659098023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tM12Gd0eAChyDJIUka8xSDa+5mV0Fm9cMN4XvGDRzIg=;
 b=bSND0grhSB0HXeVGObthyFeCX3LJ6gNeZoayT6aIl0/I8Wrfgf0x4dyTc64Y7wVeeZEJdM
 gAzHwe613vusUqBaZg97bt2h4Kky+mtNrT26kbvATVCHvDzB23RtKYG4n6SCGTzo0tfoLT
 f7Pn30DW324m1LrAdB9v/VV3YG5Vx4OukbsCeNdID5HnIhTUVfqK8k+4ElUyuZ0zIoVpx5
 a+HROZT22g0HASeFeFmVYDtP4fcpIxm9cdQpzR9xhu9d0u3KKaaGeFBB6CezqU0BZ4VC5n
 fF9Sf3+ujmfsFi2Bh4bV43eaeTfA1Xl5ksdaHKmJIJURmu6KXK2N1JSNzmOecw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bSND0grh
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: update gcc version
 for gcc bug 68485
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 14:29:53 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> On 29/07/22 14:12, Thomas Petazzoni via buildroot wrote:
> > On Fri, 29 Jul 2022 14:10:54 +0200
> > Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> >   
> >>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
> >> -# exists in gcc 9.x
> >> +# exists in gcc 11.x  
> > 
> > What about the recently introduced gcc 12.x ? :-)  
> 
> You're right, gcc 12.x is still affected, do you want me to re-send?

Not needed, will fix when applying. Thanks!


-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
