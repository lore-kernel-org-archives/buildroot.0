Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0748C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 07:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5583740CD1;
	Sun,  5 Jun 2022 07:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W92jAHU6i4RG; Sun,  5 Jun 2022 07:06:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 779B7404A0;
	Sun,  5 Jun 2022 07:06:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 812D71BF3FB
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 07:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F34D40875
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 07:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I4R8nU6QbVXt for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 07:06:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 702114086E
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 07:06:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD5EE60003;
 Sun,  5 Jun 2022 07:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654412782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13hwxPDelKcrHXTutJhE7wlgldX+VVdzvC4nPy7UKPM=;
 b=aIhxrlbXtkFdMEGY8/oLEZHuM4Tj+vTtQHMlca8edJ+HholJ0PSaz4jQz/Nxiv9fsXoH2y
 KCQ0JCvNA5LAz7dwCuVUwViXwSgAOkbMQXHfktlDQfeHJhLY1H9bIfSIaMqHs3Ce63qaX2
 zojmCYhWXTaWBV/nC3nUKIUxV/yOhgwf03VMjx8caAqGvdiqTpPZZKjxifRC8ByrOq7pn4
 GdjWLR9CJPNJAneL2ieDHU5L+Me4AGYKehcBrWK0kRvzo2xGi9L/XUhXKq0reE+ipBjSoi
 tMOcN5zFH8f+5aiVIRvWoPwMOvCH2W1rEvFeBZmdVRJCnFKJGzvtL7ku7Uebkg==
Date: Sun, 5 Jun 2022 09:06:20 +0200
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20220605090620.63a7375c@windsurf>
In-Reply-To: <190f6507af24e5ee5e8797fbfaa3b7e3@umbiko.net>
References: <mailman.2413.1654341347.130377.buildroot@buildroot.org>
 <190f6507af24e5ee5e8797fbfaa3b7e3@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] ulog compilation issue with buildroot 2022.02.2
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
Cc: Herve Codina <herve.codina@bootlin.com>, Tim Hammer <Tim.Hammer@orolia.com>,
 Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Sun, 05 Jun 2022 06:05:09 +0000
Andreas Ziegler <br015@umbiko.net> wrote:

> This is the environment when alchemy is called from Buildroot:
> 
> ALCHEMY_TARGET_ENV = \
> 	$(TARGET_MAKE_ENV) \
> 	ALCHEMY_HOME=$(ALCHEMY_HOME) \
> 	ALCHEMY_WORKSPACE_DIR="$(@D)" \
> 	ALCHEMY_TARGET_OUT=alchemy-out \
> 	PKGCONFIG_BIN=$(PKG_CONFIG_HOST_BINARY) \
> 	TARGET_OS=linux \
> 	TARGET_OS_FLAVOUR=buildroot \
> 	TARGET_CROSS="$(TARGET_CROSS)" \
> 	TARGET_ARCH=xxx \
> 	TARGET_GLOBAL_CXXFLAGS="$(TARGET_CXXFLAGS)" \
> 	TARGET_GLOBAL_LDFLAGS="$(TARGET_LDFLAGS)" \
> 	                       ^ LDFLAGS are usually empty
> 	TARGET_GLOBAL_FFLAGS="$(TARGET_FCFLAGS)" \
> 	TARGET_GLOBAL_FCFLAGS="$(TARGET_FCFLAGS)"
> 
> Alchemy adds more settings to LDFLAGS, this is the final content:
> 
> + TARGET_GLOBAL_LDFLAGS = -O2 -Wl,-O1 
> -Lalchemy-out/staging/lib/arm-linux-gnueabihf -Lalchemy-out/staging/lib 
> -Lalchemy-out/staging/usr/lib/arm-linux-gnueabihf 
> -Lalchemy-out/staging/usr/lib 
> -Wl,-rpath-link=alchemy-out/staging/lib/arm-linux-gnueabihf 
> -Wl,-rpath-link=alchemy-out/staging/lib 
> -Wl,-rpath-link=alchemy-out/staging/usr/lib/arm-linux-gnueabihf 
> -Wl,-rpath-link=alchemy-out/staging/usr/lib
> 
> Adding the Buildroot staging library path to LDFLAGS makes the build 
> succeed:
> 
> 	...
> 	TARGET_GLOBAL_LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \

Thanks for your investigation!

-L$(STAGING_DIR)/usr/lib should normally not be needed, because
$(STAGING_DIR)/usr/lib is in the default search path of the
cross-compiler, as the compiler has $(STAGING_DIR)/usr as its sysroot.

So from a cross-compiler perspective, -L$(STAGING_DIR)/usr/lib should
normally not be needed, and that's why it's not in $(TARGET_LDFLAGS).

Also, there is a curious thing in the report from Nicolas: the error
happens when systemd is enabled, but doesn't happen when systemd is
disabled.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
