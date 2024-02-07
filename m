Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893B8C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52EE383C19;
	Wed,  7 Feb 2024 16:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sl6H19sHV1rD; Wed,  7 Feb 2024 16:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60F7583C30
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F7583C30;
	Wed,  7 Feb 2024 16:17:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C576C1BF3DF
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A604783C37
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQ35SKbt6n0u for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B4FF83BDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B4FF83BDF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B4FF83BDF
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:17:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF7F160002;
 Wed,  7 Feb 2024 16:17:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXkbc-001A7R-17;
 Wed, 07 Feb 2024 17:17:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20240205212300.3178519-2-thomas@devoogdt.com>
 <20240205213035.3180167-1-thomas@devoogdt.com>
Date: Wed, 07 Feb 2024 17:17:00 +0100
In-Reply-To: <20240205213035.3180167-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Mon, 5 Feb 2024 22:30:34 +0100")
Message-ID: <87le7wz1tv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v8 1/2] package/cairo: move to the meson
 build system
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
Cc: eric.le.bihan.dev@free.fr, fontaine.fabrice@gmail.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, aperez@igalia.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > - Moved BR2_PACKAGE_CAIRO_{SCRIPT,PS,PDF,XML} to Config.in.legacy
 >   since they are not selectable anymore in the meson-build options.
 >   BR2_PACKAGE_CAIRO_ZLIB serves for all of them now.

 > - Moved BR2_PACKAGE_CAIRO_SVG to Config.in.legacy since the PNG
 >   option already selects that one. This is now in sync with the
 >   meson build options.

 > - Note that the dependencies for the various options are slightly changed,
 >   but there is not much mentioned about that, the meson introduction is done
 >   in one big commit: [1].

 > - Added xlib_libXrender dependency, which was already required
 >   before meson, it just came to my attention since it's a hard
 >   error now.

In what configuration do you see that? I just did a test with current
master (commit 6008f2b1b901b) and the following defconfig without
issues:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_CAIRO=y
# BR2_TARGET_ROOTFS_TAR is not set

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
