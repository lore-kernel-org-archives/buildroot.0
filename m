Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23A3C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 07:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 081D6401C1;
	Tue,  2 Aug 2022 07:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 081D6401C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doyYT4O-TaBZ; Tue,  2 Aug 2022 07:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A631C40193;
	Tue,  2 Aug 2022 07:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A631C40193
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D617D1BF263
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 07:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B147840497
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 07:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B147840497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VW2Rv41kyd3 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 07:46:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1144340195
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1144340195
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 07:46:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 99363240006;
 Tue,  2 Aug 2022 07:46:17 +0000 (UTC)
Date: Tue, 2 Aug 2022 09:46:16 +0200
To: Jesse T <mr.bossman075@gmail.com>
Message-ID: <20220802094616.2a60881c@windsurf>
In-Reply-To: <CAJFTR8SkMjAe1=V411g9BmdzYDZv+5mtLMQ29w=2BJj4LS1sWw@mail.gmail.com>
References: <20220730061219.3061864-1-Mr.Bossman075@gmail.com>
 <20220801225044.63ead8d4@windsurf>
 <CAJFTR8SkMjAe1=V411g9BmdzYDZv+5mtLMQ29w=2BJj4LS1sWw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659426378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6SeqBVhd1CXUN59knCI57U6cfBS1dJpa2xH0q53yoS8=;
 b=dzUbg3db4Frrq3Euy+pP6wfxPm+6urtW4uBacnqfXwx7S4TJ3qHKuzowsjoxmqUu8hxDBn
 k+CnrOfKpvSr6MLKZE0mxXOgYK1rHEV0IlmZG4ETaKaATuuqaopgWhzRjlAJGGGGdeocrz
 kKM21KIrlQVYhowGhz8WBTlrJugEoKrLaG+wZLtTQs4bXtnv8eLHhdRyf2CTVuexhM3rOp
 CmVx4bCUqx+JaD8FJhmxX2f1+z+GYOzrBN1wJiNkym77SvirU1SsI/nV2hAqA65WJTQLjH
 1Uw/7RQ9GCWC3VfknykW1AD9M0fa1QPhjsJfBwZIW8xtLvJB8BdasW7tfo9axQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dzUbg3db
Subject: Re: [Buildroot] [PATCH v2] configs/imxrt1050-evk: New defconfig
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 maeva.manuel@oss.nxp.com, stephane.viau@oss.nxp.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Mon, 1 Aug 2022 17:46:48 -0400
Jesse T <mr.bossman075@gmail.com> wrote:

> > Any reason to add Giulio here?  
> 
> We worked on Linux and U-Boot together.

Then I think it is worth mentioning in the commit log, as it is
surprising to see two people added in the DEVELOPERS file, without any
explanation.

> > Why is this test needed? The Image file will be produced by the kernel
> > build, so it should be there. If it's not, we should really error out
> > hard. So I think doing without the test is better.  
> 
> I was using board/nexbox/a95x/post-build.sh as a base, I can drop it.

Yes, I think this test doesn't make sense, so you can drop it.

> > > +# Filesystem
> > > +BR2_TARGET_ROOTFS_EXT2=y
> > > +BR2_TARGET_ROOTFS_EXT2_4=y
> > > +BR2_TARGET_ROOTFS_EXT2_LABEL="root"
> > > +BR2_TARGET_ROOTFS_EXT2_SIZE="3M"  
> >
> > Why limit to 3 MB ? Is there a strong reason?  
> 
> Because that's the nearest ceil(MB) size of the ext4 filesystem.
> I like dd-ing the images fast.

You can use bmap-tools to speed up writing a SD card image that is
large but mostly empty.

> https://patchwork.ozlabs.org/project/uboot/patch/20220712110023.3163770-1-andre.przywara@arm.com/
> 
> The patch above removes the need for binutils 2.36 and a U-Boot
> version hasn't been released with that commit yet.
> This is the reason for no U-Boot version.

As explained by Giulio, you should use a well-defined version of
U-Boot, and backport the U-Boot patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
