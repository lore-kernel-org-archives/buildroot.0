Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B71606A325
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OxaPTUbr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAA5B60A58;
	Wed, 18 Nov 2026 12:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 255h2j91KKkM; Wed, 18 Nov 2026 12:10:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BF01E6067D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795003847;
	b=HTHMiKe88QoxE5PfIbiScx/2gtwD0IpwtgSmSSLUNqvslNqRFTP/k5RELD6qQHlO68QR
	 DqoJXvWUTHS2ao057syoNdV8aKZZ9n+x0zt+0JRJNbo68rOvB0L13ZwqhnA/RvNsd1KY2
	 EC21XdLzr4NKcUubbHmDrdA/ax6HvlbbhjoU64Jk4B6BmMEThg/X5rmqEVaw9MGcdCCbY
	 IKUMJBFTecXtqUr7EeeioxVK+r8s6OjBzM8TBx6On0FrDaCRqoSzMlCFyHPm598NcGzBR
	 2Cf8cl7E3OvOPHXCUTCqw1lxBRlB0UfCK9xAvzmS4l+ipOXe3fmamP6/ZwP0Vg0SJiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795003847;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:Date:To:
	 Cc:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=N8NyeRb0akISTK/gciC8Ei7Njrg9bI3Lm7yI1V8VFYA=;
	b=SaAsRXWY6mVKA/647SKr8FnNFXmVNRcA6OmTdBLfKnlJUp3JF1gPKKizN9VUMtdbgY7L
	 +Mv7whDwequ6/l6+3Ncq1k3jwfCO3xSeuqqg8O2LlgdglqZJuyYezQ3rPjNij5VPpISTv
	 LR/zUG4J2pnNx+vu5vUQhfQSu4MAAb95uI1Lx/tCQ0EbKSVYsB4d7nlNWg24wwp2Ogzlv
	 09AKD8mx1iT92CIR1xRvY4egthdS6MdhykTvFzi3kKaTwZ9BL/XQkdJFiTCwLmxbhix3+
	 i86VBRvbK4Lv9rm2OS62Z7gWesZcdYlzY99AJ26VcnLolCqX85iLOFcTuJJjz9gXC6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795003847;
	bh=N8NyeRb0akISTK/gciC8Ei7Njrg9bI3Lm7yI1V8VFYA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OxaPTUbrAlmCa8XPxubRo+OQJw7FpZTgnmNc3sp0idcVjqWWTOEWp29HYpEdhe2Io
	 Ai4bxpTdQPOin2obcLzqWY+P9OJf1I8MplCGAhlB/o311oZeHuCnSUkp0przDvCsIc
	 wDOemMZyyByrFgPqNw/fQrdjUcnwA5aBTWzOZb8sD2x1JnD2GF5ihYDVBAsGwWYyIh
	 KyRUshFiHlMBXgJBW6SocVLvt239glkWAjE/ktgKay8W9tIvLAIhqmIvZO76uQWO80
	 Kd+hjejAcbeqUygUID3oinMJchOnNJch7g86tBjcIRZpYccAG8KNd7s4rOUHL8ck20
	 xJfB1xXPz0FMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF01E6067D;
	Wed, 18 Nov 2026 12:10:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AB4349B
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 12:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4CD681137
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 12:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEbLCQY-XGcu for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 12:10:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 490398096D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 490398096D
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 12:10:43 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795003841; mf=PHBzLnJlcG9ydEBnbXgubmV0Pg==;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.net;
 s=s31663417:rsa-sha256:bC9LkurTuSnDUSb9GQjcy3Cqy5WJ
 idUvCYzYhc2lMRkqy/rFaAC0fS2ty2o7wQ2etFMX+AFhQd+gZF8jtEESMXv3j8SQZr0v9mk6KN0
 4sxNUCMnL5alCIcGmaBps6W6nNBhDwtCRsQ+/4mbPU8pjF81bEwdgos6SmSGISxtQhtv5ODyYEZ
 BBcKgMf07zVmryZTLppbmbwRgNZ3crRo62/2Su3U59rm4/nR5vLrqxlVgL2RHacIkn/UrquWb/q
 ZUj0fJcvx5ZKoxrcVxX7dAcxvWSk2yzegc5C66Jpd07GaBwtcwl3vvGOzKe+Nigz5Z1odQn/aJZ
 ps/ouf/dhkzs3g==;
Message-Instance: m=1; h=sha256: DsXUGbzAicpjn6QeIbSOKzZQT+bjGd7c1y+zYrh1shk=:
 NJagV2rvWmpW0DogY0jw+nrAXIQI5ChRDICNb/J9oQI=, sha512:
 udbL7ERVOiEi+j3W1fTed4nrAx0oQo5l2v5XnXul6Vd14e2Xq3tnPpkF1m2arPu20cygQy76FT5nv/9x0NzwKQ==:
 cH7KPHrJtMZmgxoZYnwrJa4Ajd9tJgDGPCPQY12eMtkSvfRoJXFhnO6ulzQB9Hx/9AcRpe4Sed+77mbk7/ys/A==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNNo-1wzUZe2VX8-00ULU1; Wed, 18
 Nov 2026 13:10:40 +0100
Date: Wed, 18 Nov 2026 13:10:28 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>
Message-ID: <20261118131028.4db44402@pc-1>
In-Reply-To: <297afb50-9c08-4c40-a4e1-fe8a541ff19b@gmx.de>
References: <20261117165244.2866822-1-ps.report@gmx.net>
 <297afb50-9c08-4c40-a4e1-fe8a541ff19b@gmx.de>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:mcF0IvPmN6omqcLtp/qDV3YaD8WlQlG07QTszJiMZlE/Z3Ec5G/
 SEG/FtFq2PIjzDBET2OYTg/P6YtODW1rNBvtvVo9OPzRVnHTkvX/yk3e4suyx/G4pB7OS9T
 gHhx8QJIspBzRvYxk+1BFs+G4CGXBKbb6Ny5pmY0ZTog7ZVilOUEKnG7rc3yF8D0rhoSGVi
 NAxH/CvtE/Kwy8lk4Sefg==
UI-OutboundReport: notjunk:1;M01:P0:4LKKL0wIEh0=;q72erLcMMlcPwW6eXHgEixHSDTK
 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
 Lif656UVskXt9UGrF/nPa/SqSYRQMI=
Subject: Re: [Buildroot] [PATCH v2] package/eudev: bump version to 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Fiona,

On Wed, 18 Nov 2026 00:12:52 +0100, Fiona Klute <fiona.klute@gmx.de> wrote:

> Am 17.11.26 um 17:52 schrieb Peter Seiderer:
> > - bump version to 3.3.0 (for details see [1] and [2])
> > - disable new/optional systemd-hwdb (not needed on target/host)
> > - add '--enable-tpm2' for target and '--disable-tpm2' for host compile
> > - add new group 'clock' to common udev package ([3], [4])
> > 
> > [1] https://github.com/eudev-project/eudev/releases/tag/v3.3.0
> > [2] https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md
> > [3] https://github.com/eudev-project/eudev/commit/bce05987bfea5cda8060f59159becb7de7353a46
> > [4] https://github.com/eudev-project/eudev/commit/82956a47e9191f4c1d8a8ceacaeaf1a9d7581847
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - disable systemd-hwdb
> >   - add '--enable-tpm2' for target and '--disable-tpm2' for host compile
> >     (as suggested by Fiona Klute)
> >   - add new group 'clock' to common udev package
> >     (as suggested by Fiona Klute)
> > 
> > Notes:
> >   - This version bump increases the target install size from 11.8 MB to
> >     14.0 MB (according to graph-size). See following (uncomplete) list of
> >     installed file size values:
> > 
> >     eudev-3.2.15                        eudev-3.3.0
> > 
> >     /lib/libudev.so.1.6.4  199K         /lib/libudev.so.1.7.15  339K
> >     /sbin/udevd            435K         /sbin/udevd             927K
> >     /usr/bin/udevadm       459K         /usr/bin/udevadm        979K
> >     /lib/udev/scsi_id      139K         /lib/udev/scsi_id       275K
> >     /lib/udev/cdrom_id     139K         /lib/udev/cdrom_id      271K
> > ---
> >   package/eudev/eudev.hash |  2 +-
> >   package/eudev/eudev.mk   | 10 +++++++---
> >   package/udev/udev.mk     |  1 +
> >   3 files changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
> > index 0e24957621..58aa19b695 100644
> > --- a/package/eudev/eudev.hash
> > +++ b/package/eudev/eudev.hash
> > @@ -1,3 +1,3 @@
> >   # Locally calculated
> > -sha256  eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3  eudev-3.2.15.tar.gz
> > +sha256  8fba6e4f49ea4b1938828a3c2e7cc48874816c68621386e527076b6477f5d6ef  eudev-3.3.0.tar.gz
> >   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> > diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> > index 0deb0e53c6..94634f4405 100644
> > --- a/package/eudev/eudev.mk
> > +++ b/package/eudev/eudev.mk
> > @@ -4,7 +4,7 @@
> >   #
> >   ################################################################################
> >   
> > -EUDEV_VERSION = 3.2.15
> > +EUDEV_VERSION = 3.3.0
> >   EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
> >   EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
> >   EUDEV_LICENSE_FILES = COPYING
> > @@ -14,7 +14,9 @@ EUDEV_CONF_OPTS = \
> >   	--disable-manpages \
> >   	--libexecdir=/lib \
> >   	--enable-kmod \
> > -	--enable-blkid
> > +	--enable-blkid \
> > +	--disable-systemd-hwdb \
> > +	--enable-tpm2  
> 
> I'm surprised there don't seem to be any dependencies, but it seems 
> correct. If it doesn't add much size I don't think we need a separate 
> option. :-)
> 
> >   # eudev requires only the util-linux libraries at build time
> >   EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
> > @@ -79,7 +81,9 @@ HOST_EUDEV_CONF_OPTS = \
> >   	--disable-manpages \
> >   	--disable-rule-generator \
> >   	--disable-selinux \
> > -	--enable-hwdb
> > +	--enable-hwdb \
> > +	--disable-systemd-hwdb \
> > +	--disable-tpm2
> >   
> >   define HOST_EUDEV_INSTALL_CMDS
> >   	$(INSTALL) -D -m 0755 $(@D)/src/udev/udevadm \
> > diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> > index 3518e874a5..507c1b8022 100644
> > --- a/package/udev/udev.mk
> > +++ b/package/udev/udev.mk
> > @@ -6,6 +6,7 @@
> >   
> >   # Required by default rules
> >   define UDEV_USERS
> > +	- - clock -1 * - - - RTC/PTP device group
> >   	- - input -1 * - - - Input device group
> >   	- - kvm -1 * - - - kvm nodes
> >   	- - render -1 * - - - DRI rendering nodes  
> 
> That's not quite what I meant: Currently the clock group is defined by 
> package/systemd (see SYSTEMD_USERS in package/systemd/systemd.mk) for 
> systemd-udevd. Now eudev needs it, too. So it should be *moved* to the 
> shared UDEV_USERS definition, to avoid duplicating the definition 
> between package/eudev and package/systemd. Having it in both udev and 
> systemd would lead to a duplicate definition when using systemd as udev 
> provider.

Missed the package/systemd/systemd.mk entry for clock (was looking at
the 2026.08.x branch), will fix it...

> 
> So one patch that adds "clock" to UDEV_USERS (as above) and removes it 
> from SYSTEMD_USERS, and then the eudev update in a second patch.

Hope doing it in one patch (same as the last time see [1]) is o.k. too?

Regards,
Peter

[1] https://github.com/buildroot/buildroot/commit/f6c2c6a086ae1a5857f99514324ebf4038dab31a

> 
> Could you change that, please?
> 
> Best regards,
> Fiona
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
