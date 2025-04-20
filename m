Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B61C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 21:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9646E81092;
	Sun, 20 Apr 2025 21:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31lb2cleFE1Q; Sun, 20 Apr 2025 21:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8760B8108E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8760B8108E;
	Sun, 20 Apr 2025 21:32:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE82A1A0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3F8E8108C
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTcAa18m2gom for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 21:32:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 231BB8104B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 231BB8104B
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 231BB8104B
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:32:07 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id C7161E00348; Sun, 20 Apr 2025 23:32:05 +0200 (CEST)
Date: Sun, 20 Apr 2025 23:32:05 +0200
From: Florian Larysch <fl@n621.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20250420213205.zorogfzwxp6iiumy@n621.de>
References: <20250420204540.32264-1-fl@n621.de>
 <20250420231307.413d3108@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250420231307.413d3108@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1745184725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hx79Ik+jAM+c0luQRoXcUarCqX7rmwDgbG5VGzy6zLU=;
 b=bo0lnEr0ihAZEQxh58RVKf+u2ufoRr5ccR1jhwCfCDEl3X+HmKgIs6x5ypLPATxzn8+yhD
 oTZAuMne148h7mmdneQ6vhCy0Gyv0lf2HDc6EMMcE1c09bCbHBZY12NZtgBfhsLLzzxmst
 ghaSg8kCbBRQXI1/BXZvZA2mVjvzP4A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=bo0lnEr0
Subject: Re: [Buildroot] [PATCH 1/1] package/casync-nano: new package
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

Hello Thomas,

On Sun, Apr 20, 2025 at 11:13:07PM +0200, Thomas Petazzoni via buildroot wrote:
> > +config BR2_PACKAGE_CASYNC_NANO_CASYNC_SHIM
> I am wondering if we really need this option. What about simply
> installing this shim automatically if BR2_PACKAGE_CASYNC is disabled?

That would be an option too. Personally I'd err on the side of not
cluttering /usr/bin unnecessarily, but if you think that makes more
sense I can change it.
 
> 
> > +CASYNC_NANO_VERSION = 1.1.1
> > +CASYNC_NANO_SITE = $(call github,florolf,casync-nano,v$(CASYNC_NANO_VERSION))
> > +CASYNC_NANO_LICENSE = LGPL-2.1
> > +CASYNC_NANO_LICENSE_FILES = COPYING
> > +CASYNC_NANO_DEPENDENCIES = host-pkgconf openssl zstd libcurl
> > +
> > +ifeq ($(BR2_PACKAGE_CASYNC_NANO_CASYNC_SHIM),y)
> > +define CASYNC_NANO_INSTALL_CASYNC_SHIM
> > +	ln -sf csn $(TARGET_DIR)/usr/bin/casync
> > +endef
> > +endif
> > +
> > +define CASYNC_NANO_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m0755 $(@D)/csn $(TARGET_DIR)/usr/bin/csn
> > +	$(CASYNC_NANO_INSTALL_CASYNC_SHIM)
> > +endef
> > +
> > +HOST_CASYNC_NANO_DEPENDENCIES = host-pkgconf host-openssl
> > +HOST_CASYNC_NANO_CONF_OPTS = -DBUILD_CSN=Off -DBUILD_CSN_TOOL=On
> 
> Why aren't those same options set for the target variant? I'm not quite
> sure to understand why the host and target variant don't have the same
> dependencies. If zstd and libcurl are optional, then they should also
> be optional for the target variant.

The host variant of the package is only building a different sub-program
(csn-tool), which has different dependencies (namely it only needs
libcrypto from OpenSSL).

The reasoning for the split here is similar to other OTA tools like RAUC
where there is one component that is only really useful on the target
for installing the update and another component that is only useful on
the host for generating/manipulating that update.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
