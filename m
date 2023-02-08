Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD00C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC90840C22;
	Wed,  8 Feb 2023 15:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC90840C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1m_gigp94pMS; Wed,  8 Feb 2023 15:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7A1F40BAA;
	Wed,  8 Feb 2023 15:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7A1F40BAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A820A1BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CCFE610C9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CCFE610C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LziplR_NusLG for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:53:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F336F60AC6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F336F60AC6
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:53:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CBD4640007;
 Wed,  8 Feb 2023 15:53:31 +0000 (UTC)
Date: Wed, 8 Feb 2023 16:53:30 +0100
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230208165330.43c145f3@windsurf>
In-Reply-To: <3f3d266c-2f21-197c-29b7-fff3e230e97a@smile.fr>
References: <3f3d266c-2f21-197c-29b7-fff3e230e97a@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675871612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4MvzMKTSEID8ERrb9P0XfW8gs03wTTK4SyGRsGrhIw=;
 b=SWhuVfFVDNXFZQKrOIYgXagqtVZ4GYUnpkdJW86GPzm4lk5qnZTioC4dgq26qa3JiBP2Nx
 BBpZ5cVRW74kx8pZbGj//Oetu7KF1r2vYMAX8WBwFynPgucBScfPTk7vjVhqyamAYTS2JH
 /teqWNTM/DDYMEsvIbjg5lLNT/nCg7GCQDitUgK0eLQEMCCGvNzcpG/PLHnZv5X4C0RBBm
 cm5SPu21Ky0c53JZwclG4kn8ZiOisI1eSp0NUicb0j0G2QZjraEeO0bf/TSbqAjgWEC34V
 XujFKCzWTC9uWBZ4RYhepwC+xAXp2tUbh6C6wq+xJB0HsP70GGBURBdSM2fPBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SWhuVfFV
Subject: Re: [Buildroot] outdated libiberty and prelink-cross support
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Yann and Adam, with questions/help needed below :)

On Wed, 2 Nov 2022 14:05:26 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> I was looking at host-binutils-2.38 issue in the autobuilder [1].
> The issue appear only when host-libiberty is built before host-binutils
> (Binutils 2.38 only).
> 
> It seems that libiberty package is still based on binutils 2.32 release and
> seems to be updated.
> 
> host-libiberty is currently used by host-gdb and host-prelink-cross packages.
> 
> About the prelink-cross package, it come from the Yocto project [2] but the
> support seems halted. Also the Glibc project will remove prelink support for the
> upcoming 2.37 release [3].
> 
> The annoying part is "Prelink-cross emulates a runtime linker for a given
> sysroot. This is necessary to allow gobject-introspection to build its typelib
> files during cross-compiling." [4]
> 
> host-prelink-cross is currently used by dracut and gobject-introspection packages.

I had a look, and there are things at two different levels that can be
done.

First, we need to remove the package/libiberty/ package. libiberty is
currently used by host-gdb and host-prelink-cross:

* For host-gdb, the commit log says that the host libiberty might be
  picked up so we need to build our own. This is weird because
  libiberty is shipped in the gdb tarball. Yann, when you applied
  f0a583ddc4c2cab121330284e316f54229dee492, do you remember if you
  looked at why GDB wasn't picking up its own libiberty? Also, there is
  no autobuilder failure, so we don't really know under what conditions
  the problem can be reproduced.

* For host-prelink-cross, it in fact doesn't need host-libiberty. It
  links against it, but apparently, the only functions it uses from
  libiberty are htab_find_slot() and htab_try_create(), and both are
  provided by src/hashtab.c in prelink-cross, which was copy/pasted
  from libiberty, most likely to avoid the dependency. So with a bit of
  effort in host-prelink-cross, the dependency on host-libiberty could
  be removed.

Then, the second level is about host-prelink-cross itself. It is used
by only two packages, so let's have a look:

* For gobject-instrospection, it is no longer needed: openembedded-core
  stopped using it in
  https://github.com/openembedded/openembedded-core/commit/767e0880d4d729e659e859dd99c1cdb084b8ba51.
  It simply uses "objdump -p" instead. It also allows to remove a patch
  from gobject-introspection, so overall it seems like a good thing.

* For dracut, the usage is pretty much the same, and a small wrapper
  around objdump -p would most likely be able to emulate the behavior
  lf prelink-rtld to list the libraries that a binary depends on.

So there's a bit of work for sure, but this work would allow to remove
both host-libiberty and host-prelink-cross, which are both weird
packages that will inevitably cause problems.

My main concerns are:

(1) How to reproduce the host-gdb issue that caused the addition of the
    host-liberty dependency

(2) How to test gobject-introspection in a simple way. There is no
    runtime test for it, I have no idea what is the simplest test that one
    can do to verify the proper functionality of gobject-introspection
    after we do the above changes.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
