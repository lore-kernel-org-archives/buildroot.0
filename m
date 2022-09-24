Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C49C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 14:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B6A583ECF;
	Sat, 24 Sep 2022 14:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B6A583ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w0fRdQHKhUBJ; Sat, 24 Sep 2022 14:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DCCD83EC4;
	Sat, 24 Sep 2022 14:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DCCD83EC4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE6FA1BF325
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 14:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9BE883E2A
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 14:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9BE883E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EbQmT3aGo1pC for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 14:45:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F0A383E1C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F0A383E1C
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 14:45:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DDA6D1BF207;
 Sat, 24 Sep 2022 14:45:20 +0000 (UTC)
Date: Sat, 24 Sep 2022 16:45:19 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220924164519.7a23dc90@windsurf>
In-Reply-To: <20220813090014.2734188-1-yann.morin.1998@free.fr>
References: <20220813090014.2734188-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664030721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1dlU9BPTi5xaLLtCAOwhCiyFXYN5YECFqUhJWz9PbBQ=;
 b=BFppc/Zlhny5/bOTUtZpEkHMAxPVKWs7KprJEzjnaZgVUNOJUQhC1s5V/kfuFGOS32levZ
 YlVgKTiU5he/DEmi3lFqjauJbcB8Bsn11517+ACLfF1F0memtxgNIL5f/yuiItRnyjQBNv
 JnYA6hI31Sv4P2yvNfZl1R8SuR73/77Sts5qvXuFMPHxqGDw4iXhcIGvJXv6Y+fPo9wIOP
 isHYAFEAY2bmgUo4LFA0l4PPAPynUUc0WMcemgAzofIc/DpHhLGvtfNIXyHsxau2doLQ5/
 XdGLXP+tLcqTzHs+ETBhc/CQQFYcUcyeVPd8icgSjcm4oHexAL3ss4SBnOIOTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BFppc/Zl
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: don't exclude virtual
 packages from packages list
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

On Sat, 13 Aug 2022 11:00:14 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Currently, with a configuration with an internal toolchain, and no other
> package is selected [0], especially when one wants to generate an SDK or
> a pre-built, pre-installed toolchain, running 'make' will only build
> glibc (and its dependencies), and not the full toolchain, as one would
> have expected, so there would be no host-final-gcc.
> 
> The reason is that 'toolchain' is a virtual package, so it is excluded
> from PACKAGES, the list of packages enabled in the configuration. so it
> is not a dependency of target-finalize, and so nothing pulls it in the
> build.
> 
> The reason for excluding virtual packages from that list is not obvious.
> 
> When virtual packages were introduced in 743982441201 (packages: add
> infrastructure for virtual packages), there was no BR2_PACKAGE_FOO
> symbol for virtual packages (but there was BR2_PACKAGE_HAS_FOO), so
> there was no telling that the virtual package was enabled, like we had
> for the other kinds of packages (normal, bootloader, toolchain, or linux
> kernel).
> 
> That caused issues, so in f674c428c2ef (core/pkg-virtual: do not check
> they are neabled [sic]), and then 3e1b33a5349b (pkg-generic: improve
> incorrectly used package detection), we explicitly excluded the virtual
> packages from causing a build failure when something depended on them,
> as we could not yet now whether a virtual package was actually enabled
> or not.
> 
> Then, in 842ba7eceffb (pkg-generic: fix rdepends and phony targets of
> virtual packages), we eventually associated a virtual package to is
> BR2_PACKAGE_HAS_FOO, which allows treating virtual packages like the
> other kinds of packages. There, we explicitly kept virtual packages out
> of the list, though (the reasoning was that virtual packages install
> nothing in host/ or target/, so they do not directly contribute to the
> final content, so we do not need to rsync them, so this was an
> optimisation).
> 
> However, virtual packages are in fact actual generic packages, and it is
> possible for virtual packages to actually provide content for the final
> image. Even though we do not have any virtual package that has actual
> _INSTALL_CMDS, we still have udev that provides a user for example;
> virtual packages in br2-external trees may also very well provide
> install commands (e.g. to install files common to their various
> implementations).
> 
> So, there is currently no technical reason to exclude virtual packages
> from PACKAGES, the list of packages enabled in the configuration.
> 
> Drop the excluding condition, and always add enabled package, whatever
> their kind, to the list of enabled packages.
> 
> [0] defconfig to reproduce the issue:
>     BR2_INIT_NONE=y
>     BR2_SYSTEM_BIN_SH_NONE=y
>     # BR2_PACKAGE_BUSYBOX is not set
>     # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>     # BR2_TARGET_ROOTFS_TAR is not set
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/pkg-generic.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
