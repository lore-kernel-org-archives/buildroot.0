Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8734FC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33E8160B95;
	Thu,  6 Jan 2022 22:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id geq8D6vxzW4H; Thu,  6 Jan 2022 22:59:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9640D60625;
	Thu,  6 Jan 2022 22:59:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CED741BF215
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD1F6408E7
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5sSHtLtJXwm for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:59:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A27E940493
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:59:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 549E4200003;
 Thu,  6 Jan 2022 22:59:27 +0000 (UTC)
Date: Thu, 6 Jan 2022 23:59:26 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220106235926.012b8ca8@windsurf>
In-Reply-To: <CA+h8R2rnx_wLmqtetBofM=PcxAV2qiyWUug9gjWxwawJ8CtD3g@mail.gmail.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-9-thomas.petazzoni@bootlin.com>
 <CA+h8R2qv7gBPc2KcgT=5tjDr475haSYMZwLzu4RbYFO3xV4-HQ@mail.gmail.com>
 <20220106232913.370ee876@windsurf>
 <CA+h8R2rnx_wLmqtetBofM=PcxAV2qiyWUug9gjWxwawJ8CtD3g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 08/11] package/sentry-cli: re-add package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 6 Jan 2022 14:38:06 -0800
Christian Stewart <christian@paral.in> wrote:

> I'm running an up-to-date Gentoo system at version 2.33.
> 
> Currently 2.34 is masked:
> 
> https://packages.gentoo.org/packages/sys-libs/glibc
> 
> I guess the host-rust packages expect at least glibc 2.34.

Seems unlikely, because I just built the following configuration in the
buildroot/base:20200814.2228 container, which is very old Debian with
glibc 2.24 (yes 2.24).

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_SENTRY_CLI=y

$ dpkg -l | grep libc6
ii  libc6:amd64                2.24-11+deb9u1                 amd64        GNU C Library: Shared libraries
ii  libc6:i386                 2.24-11+deb9u1                 i386         GNU C Library: Shared libraries

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
