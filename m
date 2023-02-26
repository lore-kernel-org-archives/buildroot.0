Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6489EC6FA8E
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 11:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20A5405E7;
	Sun, 26 Feb 2023 11:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B20A5405E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_dHnbN8jsj2; Sun, 26 Feb 2023 11:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B11554085E;
	Sun, 26 Feb 2023 11:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B11554085E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4251BF3CA
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 11:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D39A1415A9
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 11:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D39A1415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnKAzGF6JPC3 for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 11:04:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13857415D5
Received: from mail.xogium.me (mail.xogium.me [IPv6:2604:6280:10e::3])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13857415D5
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 11:04:07 +0000 (UTC)
Received: from localhost (2a02-8428-324d-2201-5ccf-c338-3098-6959.rev.sfr.net
 [IPv6:2a02:8428:324d:2201:5ccf:c338:3098:6959])
 by mail.xogium.me (Postfix) with ESMTPSA id A0421F40210;
 Sun, 26 Feb 2023 06:04:06 -0500 (EST)
Mime-Version: 1.0
Date: Sun, 26 Feb 2023 12:04:00 +0100
Message-Id: <CQSG0QPAKLJD.1UPCF83BWCY1I@ganimede>
From: "Casey R." <casey@xogium.me>
To: "Baruch Siach" <baruch@tkos.co.il>
X-Mailer: aerc 0.14.0
References: <20230225112838.4061103-1-casey@xogium.me>
 <20230225132927.4067626-1-casey@xogium.me> <87mt51ez6l.fsf@tarshish>
In-Reply-To: <87mt51ez6l.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=xogium.me; s=xogium-mail; t=1677409447;
 bh=o/GoyKExeB7i9C4r/Z0fukqXzpx1D2+ACq+tBeFct3g=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To;
 b=hbvByAyP+vZzUoPTPVfiMT+jabCAQ812Wr3KyBKaCx3/UHss6q3p4nCJMZ+U/mygJ
 eu8haCg2Y9uvRmdNT/vvuNvWST1xsmgN+ajEc83TzJHPhTx2Wn8bz8dW3v2v99i1xn
 MgwgGa1QzalnL9fdigjHq/ZUJjhSVFZQxSRrZa8sY4iCPK5zjY4Aapq9NkWmFKMeHJ
 GLCsUEcFPrJDDm6NYkIji/+vfG1CYgIDtgmYnPkiwoT4kq4PSQB/pGByRojj/gZGhc
 OQ5bLFQkPAdzj7XsHB1wXQZNfIrjsfzvld/herhE2tk+yBmVXugBl00HZUua6EkgZN
 Q9TFPxF7xggEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=xogium.me header.i=@xogium.me
 header.a=rsa-sha256 header.s=xogium-mail header.b=hbvByAyP
Subject: Re: [Buildroot] [PATCH v2] package/lzop: bump to version 1.04
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
damn. I forgot to remove my commented out hook definition. More accurately I forgot to git add the file again after I did that. Ugh. Time for a v3, I guess ? Unless someone is kind enough to just take that out ?

Thanks.







On Sun Feb 26, 2023 at 7:07 AM CET, Baruch Siach wrote:
> Hi Casey,
>
> On Sat, Feb 25 2023, Casey Reeves wrote:
> > diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
> > index 55157c4d48..056d724a7b 100644
> > --- a/package/lzop/lzop.mk
> > +++ b/package/lzop/lzop.mk
> > @@ -4,13 +4,22 @@
> >  #
> >  ################################################################################
> >  
> > -LZOP_VERSION = 1.03
> > +LZOP_VERSION = 1.04
> >  LZOP_SITE = http://www.lzop.org/download
> >  LZOP_LICENSE = GPL-2.0+
> >  LZOP_LICENSE_FILES = COPYING
> >  LZOP_DEPENDENCIES = lzo
> >  HOST_LZOP_DEPENDENCIES = host-lzo
> >  
> > +LZOP_LIBTOOL_PATCH=NO
> > +#LZOP_POST_PATCH_HOOKS += LZOP_LIBTOOL_FIXUP
>
> This commit looks redundant.
>
> baruch
>
> > +
> > +define LZOP_LIBTOOL_FIXUP
> > +	patch -i support/libtool/buildroot-libtool-v2.4.4.patch $(@D)/autoconf/ltmain.sh
> > +endef
> > +
> > +LZOP_POST_PATCH_HOOKS += LZOP_LIBTOOL_FIXUP
> > +
> >  $(eval $(autotools-package))
> >  $(eval $(host-autotools-package))
>
>
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -



--
Casey Reeves
they/them
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
