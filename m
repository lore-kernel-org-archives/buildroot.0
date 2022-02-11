Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F1CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 13:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F9BC4091E;
	Fri, 11 Feb 2022 13:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKvwkCQvuxbB; Fri, 11 Feb 2022 13:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9360A408FD;
	Fri, 11 Feb 2022 13:50:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 929161BF2CC
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 13:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8122360E32
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 13:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ygWfah-IHEg for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 13:50:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0B7160806
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 13:50:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CAB093;
 Fri, 11 Feb 2022 14:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644587402;
 bh=QR9BRldUeU1MHRQQd2zcYviDgxiSp4+BjYRWCJWBxAo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=b4pCSp/8WbkDIUHuh/+g5w30f76WFrdGNrJ3yxLZOST38eHHBKknGOTv37xOUtKS8
 Rs7CnRY2N2KD1JlcLzuVDY/B7j/ru6Rnj/luhnDA0Z3qp6TCFd8yW2wdNq83KchkmE
 5mbO61f/ajpHv6Wj9qDGknAE1AgUZID5B+LDM3Wo=
MIME-Version: 1.0
In-Reply-To: <20220211143742.1fdec542@gmx.net>
References: <20220211112245.1357817-1-kieran.bingham@ideasonboard.com>
 <20220211143742.1fdec542@gmx.net>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 11 Feb 2022 13:50:00 +0000
Message-ID: <164458740032.83878.10164451267230898478@Monstersaurus>
User-Agent: alot/0.10
Subject: Re: [Buildroot] [PATCH] package/libcamera bump to
 1966b9a58436fab51f8270aad6a228b935e4fac4
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

Hi Peter,

Quoting Peter Seiderer (2022-02-11 13:37:42)
> Hello Kieran,
> 
> one nitpick: the patch subject should be 'package/libcamera: bump to ...'
> (instead of 'package/libcamera bump to ...')....

Completely agreed, I think I'd call that a typo ... or a not-typoed ;-)

If it can be fixed while applying that's fine, otherwise I'll resend.

> On Fri, 11 Feb 2022 11:22:45 +0000, Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:
> 
> > Update to the latest libcamera commit.
> >
> > This incorporates fixes and improvements for Raspberry Pi which will be
> > needed to go along side the new libcamera-apps package.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> Tested-by: Peter Seiderer <ps.report@gmx.net>
> 

Thanks

Kieran


> Regards,
> Peter
> 
> > ---
> >  package/libcamera/libcamera.hash | 2 +-
> >  package/libcamera/libcamera.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> > index a7ca27a96b7f..8d5abf0e621c 100644
> > --- a/package/libcamera/libcamera.hash
> > +++ b/package/libcamera/libcamera.hash
> > @@ -1,4 +1,4 @@
> > -sha256  305e6f458d2bf3d4b697ffe33e104b696db6b1492bb5422e2cce1937e58516f1  libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8-br1.tar.gz
> > +sha256  3624c71ba492c602c5335aab3dc87798193f7596c6cc75f7cfb847165f180930  libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4-br1.tar.gz
> >
> >  # license files
> >  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > index 534d8d26371f..cf1af5aaf065 100644
> > --- a/package/libcamera/libcamera.mk
> > +++ b/package/libcamera/libcamera.mk
> > @@ -5,7 +5,7 @@
> >  ################################################################################
> >
> >  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> > -LIBCAMERA_VERSION = 40f5fddca7f774944a53f58eeaebc4db79c373d8
> > +LIBCAMERA_VERSION = 1966b9a58436fab51f8270aad6a228b935e4fac4
> >  LIBCAMERA_SITE_METHOD = git
> >  LIBCAMERA_DEPENDENCIES = \
> >       host-openssl \
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
