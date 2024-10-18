Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70715D3C55E
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 07:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D5F40723;
	Fri, 18 Oct 2024 07:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OH2O-w_l32Er; Fri, 18 Oct 2024 07:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B4640707
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B4640707;
	Fri, 18 Oct 2024 07:41:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8AF82072
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 07:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A145380DF4
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 07:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHAfzRfnavuK for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 07:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7381980B9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7381980B9B
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7381980B9B
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 07:41:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C22B659C;
 Fri, 18 Oct 2024 09:39:42 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <172838727715.532453.9966379310142996785@ping.linuxembedded.co.uk>
References: <20241007192950.448350-1-ju.o@free.fr>
 <172838727715.532453.9966379310142996785@ping.linuxembedded.co.uk>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Julien Olivain <ju.o@free.fr>
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Date: Fri, 18 Oct 2024 08:41:22 +0100
Message-ID: <172923728286.532453.7342561185071865247@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1729237182;
 bh=Oifv4FLP/lzIatKcFaGcm9c4aZkp8k9RF4ElnhaJzvA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=GNDTdFhWS0y76ZaYnk7WxwSCfjLigIi/tKyCeFI+MogIookFJqjL9GuMy737q/R2i
 kuLyq9BkwtJKLS0pCKeF+FmqOwbJtdlipGehJZVJF22myuNrDLRwyNRJAvfIkrcexC
 AXKEfKIRA9mgDiduG0Dy/aUnuqvPdMOZTFoDRIuQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=GNDTdFhW
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: bump to version 0.3.2
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

Quoting Kieran Bingham (2024-10-08 12:34:37)
> Quoting Julien Olivain (2024-10-07 20:29:50)
> > For change log since 0.3.0, see:
> > https://git.libcamera.org/libcamera/libcamera.git/tag/?h=v0.3.2
> > https://git.libcamera.org/libcamera/libcamera.git/tag/?h=v0.3.1
> > 
> > Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Is there anything more I need to do to help this patch from Julien get merged?

Regards
--
Kieran


> 
> > ---
> > Patch tested in:
> > https://gitlab.com/jolivain/buildroot/-/jobs/8014299351
> > ---
> >  package/libcamera/libcamera.hash | 2 +-
> >  package/libcamera/libcamera.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> > index 1566356b99..d4554af190 100644
> > --- a/package/libcamera/libcamera.hash
> > +++ b/package/libcamera/libcamera.hash
> > @@ -1,4 +1,4 @@
> > -sha256  1e0a3feff93577a30bcd4e67aa4c1969aecabcd90f78f540a637bb77553c5a7d  libcamera-v0.3.0-git4.tar.gz
> > +sha256  d396bebe49aa7f605403594be3a9e970173d4c98061033c75f816946ff907eb8  libcamera-v0.3.2-git4.tar.gz
> >  
> >  # license files
> >  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > index dfcd340b75..0273cd2b17 100644
> > --- a/package/libcamera/libcamera.mk
> > +++ b/package/libcamera/libcamera.mk
> > @@ -5,7 +5,7 @@
> >  ################################################################################
> >  
> >  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> > -LIBCAMERA_VERSION = v0.3.0
> > +LIBCAMERA_VERSION = v0.3.2
> >  LIBCAMERA_SITE_METHOD = git
> >  LIBCAMERA_DEPENDENCIES = \
> >         host-openssl \
> > -- 
> > 2.46.2
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
