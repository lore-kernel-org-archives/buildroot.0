Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53347C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 19:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD684181D;
	Tue, 19 Apr 2022 19:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9FXWuiZ5zpI; Tue, 19 Apr 2022 19:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D30C417D7;
	Tue, 19 Apr 2022 19:38:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4000C1BF867
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C7A660A8D
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AwiLCLR11ISd for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 19:38:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 194B66080B
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 19:38:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D6B2D20005;
 Tue, 19 Apr 2022 19:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650397095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBiSfMG9fF7cbz7S2KtPohYo6vJeN4Sp0ENOY7Sa/g4=;
 b=TnwHeR5/ojQg62KIGsFds6TKURvdLrWb4VWTG56CNXunxc3rTX7gkPugpLsoet9DPeh1lK
 6+6F00rBfrzoUucl5lxVfdODAeNGYHMbRRn3v2/2dfqyxA16dDdfdiFfz0QUK1Ww1em41Q
 8aMf56fX9Y//EFRdUziaO4kA+HFBqzLg4Zx7fgjVJYjbMyVEvm1qNT5OojBU8466WRmwKH
 Yk2BrHrfBnjUMnUwitbkLL85RYrv0k2CjUOrO6p/X7lhuNe18UK/Btr1SMl76gXbK3mHT/
 eknrK+XO0dvFPNZhGHuRv5ARIsmMmn3YMnmZR2hRfPfjeYTP0cORwK6GJ/KkUw==
Date: Tue, 19 Apr 2022 21:38:13 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20220419213813.018a7601@windsurf>
In-Reply-To: <20220419142635.008ac004@windsurf>
References: <20220419092151.91638-1-thomas.perrot@bootlin.com>
 <20220419092151.91638-3-thomas.perrot@bootlin.com>
 <20220419142635.008ac004@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/imx-cst: add new package
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
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Apr 2022 14:26:35 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> This looks strange. Flags are normally passed using CFLAGS, and $(CC)
> in Buildroot doesn't exist, it's $(HOSTCC) that should be used.
> 
> Also, I think the list of header paths is properly set with:
> 
> CINCLUDES := $(SUBSYS:%=-I$(CST_CODE_PATH)/%/hdr)
> 
> but it gets overridden by the fact that you override CFLAGS.
> 
> I believe there's a better way, let me have a look.

Here is what I could come up with:

ifneq ($(filter %64,$(HOSTARCH)),)
HOST_IMX_CST_OSTYPE = linux64
else
HOST_IMX_CST_OSTYPE = linux32
endif

# We don't use HOST_CONFIGURE_OPTS when building cst, because we need
# to preserve the CFLAGS/LDFLAGS used by their Makefile.
define HOST_IMX_CST_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) \
		OSTYPE=$(HOST_IMX_CST_OSTYPE) \
		ENCRYPTION=yes \
		AR="$(HOSTAR)" \
		CC="$(HOSTCC)" \
		LD="$(HOSTCC)" \
		OBJCOPY="$(HOSTOBJCOPY)" \
		RANLIB="$(HOSTRANLIB)" \
		EXTRACFLAGS="$(HOST_CFLAGS) $(HOST_CPPFLAGS)" \
		EXTRALDFLAGS="$(HOST_LDFLAGS)" \
		PWD=$(@D)/code/cst \
		-C $(@D)/code/cst \
		build
	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
		COPTS="$(HOST_CFLAGS) $(HOST_CPPFLAGS) $(HOST_LDFLAGS)" \
		-C $(@D)/code/hab_csf_parser
endef

define HOST_IMX_CST_INSTALL_CMDS
	$(INSTALL) -D -m 755 $(@D)/code/cst/code/obj.$(HOST_IMX_CST_OSTYPE)/cst $(HOST_DIR)/bin/cst
	$(INSTALL) -D -m 755 $(@D)/code/cst/code/obj.$(HOST_IMX_CST_OSTYPE)/srktool $(HOST_DIR)/bin/srktool
	$(INSTALL) -D -m 755 $(@D)/code/hab_csf_parser/csf_parser $(HOST_DIR)/bin/csf_parser
endef

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
