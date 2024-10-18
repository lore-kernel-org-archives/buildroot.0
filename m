Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6986ED3C55E
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 07:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DB7E6063A;
	Fri, 18 Oct 2024 07:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZXULe9VWwuG; Fri, 18 Oct 2024 07:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 009596063F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 009596063F;
	Fri, 18 Oct 2024 07:44:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 785182804
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 07:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B01A6063F
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 07:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tH1KqKF-x45 for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 07:43:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59FFA6063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59FFA6063A
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59FFA6063A
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 07:43:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92F6C59C;
 Fri, 18 Oct 2024 09:42:11 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <172838723775.532453.9517032522765059116@ping.linuxembedded.co.uk>
References: <20240620134959.1673948-1-kieran.bingham@ideasonboard.com>
 <172164155656.2376022.12341161125478720243@ping.linuxembedded.co.uk>
 <Zp9WhgqZZdj_etR-@gmail.com>
 <172838723775.532453.9517032522765059116@ping.linuxembedded.co.uk>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Oct 2024 08:43:52 +0100
Message-ID: <172923743227.532453.15027870640285914457@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1729237331;
 bh=XpnbFiVRiUu2o6Vg89PtFjmjV2Q7aNjJo9L7yr3O40c=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qeiky0GvOCFNLJbI4yTCuvM9P+8t1WaEbcWM4/pzr9jfPNXAtgkMJVW8zL26TYy8i
 i3uljfanLwxMlk7/W8wdpvKQLvPUSyN8Emjw1fatrBIL8eccDDGGIJWOwVWI5KlgWd
 XaF3K7fbO7eTENUc4gcCec6miIWRLSgSUid4SOYg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=qeiky0Gv
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: Enable python bindings
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

Hi all,

Is there anything I can do to help get this patch merged?

Regards
--
Kieran


Quoting Kieran Bingham (2024-10-08 12:33:57)
> Hi all,
> 
> Quoting Marcus Folkesson (2024-07-23 08:06:46)
> > Hi Kieran,
> > 
> > On Mon, Jul 22, 2024 at 10:45:56AM +0100, Kieran Bingham wrote:
> > > Hi Marcus,
> > > 
> > > Quoting Kieran Bingham (2024-06-20 14:49:59)
> > > > Since libcamera commit f513fd70ba1a ("subprojects: Drop leftovers of
> > > > pybind11"), merged before libcamera v0.1.0, libcamera has no longer
> > > > relied on an external subproject branch of pybind to build the python
> > > > bindings.
> > > > 
> > > > Provide a new package option to allow enabling the python bindings on
> > > > libcamera when python3 is available in the buildroot configuration.
> > > > Enabling the python bindings will select and bring in pybind as a
> > > > dependency.
> > > 
> > > Sorry for not adding you to Cc on the first send.
> > > Could you review or test this patch for me please?
> > 
> > No worries!
> > 
> > > 
> > > --
> > > Regards
> > > 
> > > Kieran
> > > 
> > > > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > > ---
> > > >  package/libcamera/Config.in    | 7 +++++++
> > > >  package/libcamera/libcamera.mk | 8 +++++++-
> > > >  2 files changed, 14 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> > > > index e84b8d342eea..4699e382c760 100644
> > > > --- a/package/libcamera/Config.in
> > > > +++ b/package/libcamera/Config.in
> > > > @@ -24,6 +24,13 @@ menuconfig BR2_PACKAGE_LIBCAMERA
> > > >  
> > > >  if BR2_PACKAGE_LIBCAMERA
> > > >  
> > > > +config BR2_PACKAGE_LIBCAMERA_PYTHON
> > > > +       bool "python bindings"
> > > > +       depends on BR2_PACKAGE_PYTHON3
> > > > +       select BR2_PACKAGE_PYTHON_PYBIND
> > > > +       help
> > > > +         Enable libcamera python bindings
> > > > +
> > > >  config BR2_PACKAGE_LIBCAMERA_V4L2
> > > >         bool "libcamera v4l2 compatibility layer"
> > > >         help
> > > > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > > > index dfcd340b75a0..100934a97d6f 100644
> > > > --- a/package/libcamera/libcamera.mk
> > > > +++ b/package/libcamera/libcamera.mk
> > > > @@ -19,7 +19,6 @@ LIBCAMERA_CONF_OPTS = \
> > > >         -Dandroid=disabled \
> > > >         -Ddocumentation=disabled \
> > > >         -Dtest=false \
> > > > -       -Dpycamera=disabled \
> > > >         -Dwerror=false
> > > >  LIBCAMERA_INSTALL_STAGING = YES
> > > >  LIBCAMERA_LICENSE = \
> > > > @@ -45,6 +44,13 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
> > > >  LIBCAMERA_CXXFLAGS = -faligned-new
> > > >  endif
> > > >  
> > > > +ifeq ($(BR2_PACKAGE_LIBCAMERA_PYTHON),y)
> > > > +LIBCAMERA_DEPENDENCIES += python3 python-pybind
> > > > +LIBCAMERA_CONF_OPTS += -Dpycamera=enabled
> > > > +else
> > > > +LIBCAMERA_CONF_OPTS += -Dpycamera=disabled
> > > > +endif
> > > > +
> > > >  ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
> > > >  LIBCAMERA_CONF_OPTS += -Dv4l2=true
> > > >  else
> > > > -- 
> > > > 2.34.1
> > > >
> > 
> > LGTM.
> > I've currently no hardware available to test it, but at least it
> > seems to build as it should.
> > 
> > Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> 
> Could this patch be collected please? It enables Python bindings for
> libcamera, and we now have visualisation tools (camshark) which uses
> them.
> 
> Camshark does not need to be packaged in buildroot, it's just a
> tool to run on the host directly.
> 
> --
> Kieran
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
