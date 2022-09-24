Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FA4C6FA90
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 14:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25DEB40B68;
	Sat, 24 Sep 2022 14:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25DEB40B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6mEfWSi7Daz; Sat, 24 Sep 2022 14:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48AB14016F;
	Sat, 24 Sep 2022 14:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48AB14016F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF66F1BF325
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 14:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 985B2419BD
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 14:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 985B2419BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwG7AAIPCTWG for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 14:44:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DAAD419B3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DAAD419B3
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 14:44:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4692D20007;
 Sat, 24 Sep 2022 14:44:05 +0000 (UTC)
Date: Sat, 24 Sep 2022 16:44:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220924164404.696f152b@windsurf>
In-Reply-To: <20220913070008.1036079-1-tianyuanhao3@163.com>
References: <20220913070008.1036079-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664030646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLc3EddSKyFKXc+VncGBv3h1pum42X0MOK0IbL0KNAo=;
 b=GTPTXWSwM+4NYQsUwHbS2G6oMHsScq2L3367EX2muysnn2dbVyZQf0+8IBgmh4+V77mkuP
 GGyzxxdhGsv3DOaiikgQzMVoADqFWZWILRpm38ODsQf07XxVEkV7ikUJykwbIXfAKtbovF
 Q6JoAhcwYWeFEi/sEZLNlPso0kBVzSceQ3HqFlwdfYOOtywCgnqOWlZLwGQiLso9DGDSFp
 hyUhSeg7TzL8iYBhjpY0YtUvaw0XPWdxAlcdtuYNxj6dopVkk/E55bcAtv7AQ2CouJcqka
 LGTFvAYaY47CgRIMLqrBLQ7kagYyt3F6y7U+sduucGuUeJpDGYj6Yi9306AkFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GTPTXWSw
Subject: Re: [Buildroot] [PATCH v2 1/1] package/open-isns: new package
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

Hello,

On Tue, 13 Sep 2022 00:00:08 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

I have applied... but in fact applied the v1 because I'm seeing only
now that there was a v2. Anyway, not a big deal, because...

> - LGPL-2.1+

I had fixed that up.

> - Shorter install commands

And I dropped all the install commands. It's really not great to have
to re-implement all these install commands manually in the .mk file,
while the meson-based build system of open-isns already does all the
work nicely for us. In addition, the programs were really small, so it
didn't make a lot of sense to have an option to be able to disable them.

> +if BR2_PACKAGE_OPEN_ISNS
> +
> +config BR2_PACKAGE_OPEN_ISNS_PROGS
> +	bool "open-isns programs"
> +	help
> +	  This option tells open-isns to not only install the libraries,
> +	  but also the programs.
> +
> +endif

So, I dropped this option.

> diff --git a/package/open-isns/open-isns.hash b/package/open-isns/open-isns.hash
> new file mode 100644
> index 0000000000..653fabaa9f
> --- /dev/null
> +++ b/package/open-isns/open-isns.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  9611344733c0cdf14395f60880950ea4c3c7d6b765565b6493ad3e1afbe216de  open-isns-0.102.tar.gz
> +sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
> diff --git a/package/open-isns/open-isns.mk b/package/open-isns/open-isns.mk
> new file mode 100644
> index 0000000000..3db1271d4e
> --- /dev/null
> +++ b/package/open-isns/open-isns.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# open-isns
> +#
> +################################################################################
> +
> +OPEN_ISNS_VERSION = 0.102
> +OPEN_ISNS_SITE = $(call github,open-iscsi,open-isns,v$(OPEN_ISNS_VERSION))
> +OPEN_ISNS_LICENSE = LGPL-2.1+

Indeed adjusted the license to LGPL-2.1+ like you did in your v2.

> +OPEN_ISNS_LICENSE_FILES = COPYING
> +OPEN_ISNS_INSTALL_STAGING = YES
> +
> +OPEN_ISNS_CONF_OPTS = -Dslp=disabled
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +OPEN_ISNS_DEPENDENCIES += openssl
> +OPEN_ISNS_CONF_OPTS += -Dsecurity=enabled
> +else
> +OPEN_ISNS_CONF_OPTS += -Dsecurity=disabled
> +endif
> +
> +define OPEN_ISNS_INSTALL_STAGING_CMDS
> +	$(INSTALL) -d -m 755 $(STAGING_DIR)/usr/{include/libisns,lib}
> +	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/include/libisns \
> +		$(@D)/{,build/}include/libisns/*.h
> +	cp -dpf $(if $(BR2_STATIC_LIBS),$(@D)/build/libisns.a,$(@D)/build/libisns.so{,.0}) \
> +		$(STAGING_DIR)/usr/lib/
> +	$(INSTALL) -D -m 644 {$(@D),$(STAGING_DIR)/usr/lib/pkgconfig}/libisns.pc
> +endef
> +
> +define OPEN_ISNS_INSTALL_TARGET_CMDS
> +	$(OPEN_ISNS_INSTALL_LIBS)
> +	$(OPEN_ISNS_INSTALL_PROGS)
> +endef
> +
> +ifeq ($(BR2_STATIC_LIBS),)
> +define OPEN_ISNS_INSTALL_LIBS
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib
> +	cp -dpf $(@D)/build/libisns.so{,.0} $(TARGET_DIR)/usr/lib/
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPEN_ISNS_PROGS),y)
> +define OPEN_ISNS_INSTALL_PROGS
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/{etc/isns,usr/sbin}
> +	$(INSTALL) -d -m 700 $(TARGET_DIR)/var/lib/isns
> +	$(INSTALL) -m 555 -t $(TARGET_DIR)/usr/sbin \
> +		$(@D)/build/{isnsadm,isnsd,isnsdd}
> +	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc/isns $(@D)/etc/*.conf
> +endef
> +
> +define OPEN_ISNS_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib/systemd/system
> +	$(INSTALL) -m 644 -t $(TARGET_DIR)/usr/lib/systemd/system \
> +		$(@D)/isnsd.{service,socket}
> +endef
> +endif

Dropped all of that, and replaced it with just the removal of
isnsd.{service,socket} when systemd is not enabled. This would be a
potentially interesting contribution to the upstream project: have an
option to enable/disable the installation of the systemd unit files.

See the final commit:

  https://gitlab.com/buildroot.org/buildroot/-/commit/4052bad5adc47b9fe964548e7608e9b784acaf28

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
