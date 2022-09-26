Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84695C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 16:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2F7160FBF;
	Mon, 26 Sep 2022 16:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2F7160FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sS-QBIFbk53M; Mon, 26 Sep 2022 16:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05E2760FB6;
	Mon, 26 Sep 2022 16:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05E2760FB6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5A761BF2BA
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 16:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 991E940BB3
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 16:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 991E940BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIKp41KhOuoh for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 16:27:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3E3640B9A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3E3640B9A
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 16:27:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9FBD61BF208;
 Mon, 26 Sep 2022 16:27:03 +0000 (UTC)
Date: Mon, 26 Sep 2022 18:27:02 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220926182702.3f4d6df8@windsurf>
In-Reply-To: <20220926154320.35494-1-tianyuanhao3@163.com>
References: <20220926154320.35494-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664209624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lfAg1Zq9KrNxqfWMm2cknpJwaXUDS5BdjKcPt+M7YYo=;
 b=B3xpbfU9TiGK1pv2JwN0lmq0ZyC0Wv6v4L+vq8xJvAjASHJRoRI+sveA4cdNHqGSgwE7cK
 yujEi+5iSHHWiBKECU0zwx0CheTzz8G8YwuB3e0h71vuJM4GnLJsKsW0mIKJa+qniii7lc
 mHkwBIzeaIFC27TH3VrqX/Jem+AlalGlOcyOlXC4/Nw5V9jtCGO+MMappKOPnUoEfCOEpz
 j1U1yDmqbjd/WLKOKDkGXeZM1yAmIxtELt+nHNYe7VZKMG0xejfknzztZYP0q9XklgbvBN
 AokM1s3UiiHsSN0PTM1fI3oAhte5Z1OFBrOv3b3wkVD6egDWG1SBr+w7Q3/9KQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B3xpbfU9
Subject: Re: [Buildroot] [PATCH 1/1] package/open-iscsi: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 26 Sep 2022 08:43:20 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks for this new patch! See comments below.


> +OPEN_ISCSI_CONF_OPTS = -Ddbroot=/var/lib/iscsi
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +OPEN_ISCSI_DEPENDENCIES += systemd
> +OPEN_ISCSI_CONF_OPTS += -Dno_systemd=false
> +else
> +OPEN_ISCSI_CONF_OPTS += -Dno_systemd=true
> +endif

Weird option "no_systemd". Why didn't they make that positive logic?

> +
> +ifeq ($(BR2_PACKAGE_OPEN_ISNS),)
> +define OPEN_ISCSI_DISABLE_ISNS
> +	$(SED) "/'isns'/s/^/#/" $(@D)/meson.build
> +	$(SED) "/'iscsid'/s/^/#/" $(@D)/usr/meson.build
> +	$(SED) "/'iscsiadm'/s/^/#/" $(@D)/usr/meson.build
> +endef

Isn't a bit annoying to have this kind of mess. Could you instead add
an option in meson.build to enable/disable isns support, and contribute
this improvement upstream?

> +OPEN_ISCSI_PRE_CONFIGURE_HOOKS += OPEN_ISCSI_DISABLE_ISNS
> +else
> +OPEN_ISCSI_DEPENDENCIES += open-isns
> +endif
> +
> +define OPEN_ISCSI_INSTALL_TARGET_CMDS
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib
> +	cp -dpf $(@D)/build/libopeniscsiusr.so{,.0,.0.2.0} \
> +		$(TARGET_DIR)/usr/lib/
> +	$(OPEN_ISCSI_INSTALL_ISCSID)
> +	$(OPEN_ISCSI_INSTALL_ISCSISTART)
> +endef
> +
> +ifeq ($(BR2_PACKAGE_OPEN_ISCSI_ISCSID),y)
> +define OPEN_ISCSI_INSTALL_ISCSID
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/sbin
> +	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/sbin \
> +		$(@D)/build/{iscsi-iname,iscsiadm,iscsid}
> +	$(INSTALL) -D -m 644 {$(@D)/etc,$(TARGET_DIR)/etc/iscsi}/iscsid.conf
> +endef
> +
> +define OPEN_ISCSI_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib/systemd/system
> +	$(INSTALL) -m 644 -t $(TARGET_DIR)/usr/lib/systemd/system \
> +		$(@D)/build/{iscsi,iscsi-init,iscsid}.service \
> +		$(@D)/etc/systemd/iscsid.socket

Why isn't that installed automatically by the meson build system when
systemd support is enabled?

> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPEN_ISCSI_ISCSISTART),y)
> +define OPEN_ISCSI_INSTALL_ISCSISTART
> +	$(INSTALL) -D -m 755 {$(@D)/build,$(TARGET_DIR)/usr/sbin}/iscsistart
> +endef
> +endif

It's also a bit annoying that you have to reimplement all the
installation logic. What about improving the meson.build with
additional options, and contribute these improvements upstream?

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
