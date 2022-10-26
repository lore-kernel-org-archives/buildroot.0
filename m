Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4174C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 11:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36DB4402E7;
	Wed, 26 Oct 2022 11:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36DB4402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HW5z6bX97eYV; Wed, 26 Oct 2022 11:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09A1402CE;
	Wed, 26 Oct 2022 11:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F09A1402CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B27DD1BF59A
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 11:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6022D60D4D
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 11:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6022D60D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZ741Tn-QvJy for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 11:36:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB84960C15
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB84960C15
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 11:36:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6185E000F;
 Wed, 26 Oct 2022 11:36:27 +0000 (UTC)
Date: Wed, 26 Oct 2022 13:36:26 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20221026133626.45a9cdb7@windsurf>
In-Reply-To: <20221025201400.3816183-1-thomas.petazzoni@bootlin.com>
References: <20221025201400.3816183-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666784188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRTbR0w6YBmeLD1qUKEEfqFaGmp6eTunYGGWPuvLP8I=;
 b=lvMV/9lORzPAujhd/0W8S1RySxYuV2GHH0mVGMrHJRqcpqwmHpAWn9kqRb0iw24Lzz9oR9
 sTimJibe2uOnvBYgMwhLcNcq5HSZXYSrNGb0UHTQJMPY1ZjTDRpdwILn7gsDCGEeAVp9IT
 2VRnO655I8J5Y+tYt0KXMawp2RErgKIm8WM612kaS0dsy8TsktYG4XuRzx91xGgpWybIlJ
 OV6QIQVQEFGLhGOhtY6UJd7XcKqM+oko/rvPupzs2U+JC2Qf1akgJHT+pMvc1+HWMboY65
 IYorvKYyK4p0Ixy2FPWwIBeCvwXSU5Sh41N1EC9dc9jmbnN1HlqT3qoJRyGm+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lvMV/9lO
Subject: Re: [Buildroot] [PATCH] package/gcc: add patch to fix glibc header
 conflict
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Oct 2022 22:13:59 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> This commit backports the patch "fixinc: don't "fix" machine names in
> __has_include(...)" from upstream GCC, which is needed to resolve a
> header conflict between glibc headers and kernel headers, which has
> appeared since we bumped glibc to version 2.36 in commit
> 80c8c15c8534a24382b900a07082a289a368f736.
> 
> The problem comes from the "fixinc" logic used by gcc to fixup some
> headers files, generated inside an include-fixed/ folder. This logic
> ended up replacing "linux/mount.h" by "__linux__/mount.h" in
> __has_include() invocation, like this:
> 
>  #ifdef __has_include
>  # if __has_include ("__linux__/mount.h")
>  #  include "linux/mount.h"
>  # endif
>  #endif
> 
> in
> build/host-gcc-final-11.3.0/build/gcc/include-fixed/sys/mount.h. With
> this fix in place, this "include-fixed" header is no longer generated,
> avoiding the problem.
> 
> This issue was visible in two different ways in glibc configurations:
> 
>  - As a build failure during the gcc build itself, for architectures
>    that support libsanitizer, as libsanitizer includes mount.h, and
>    would therefore encounter the header conflict.
> 
>  - As a build failure during another user-space package (such as
>    sysvinit for example), on architectures when libsanitizer isn't
>    used, and therefore for which the gcc build was successful, but the
>    header conflict shows up when building some "random" user-space
>    package.
> 
> The problem is already fixed in GCC 12.2.0, so no patch is
> required. The problem did not exist back in GCC 8.4.0, so this version
> does not need patching. Consequently, the patch is only needed for GCC
> 10.4.0, GCC 11.3.0 and the special ARC 2020.09-release version.
> 
> Fixes:
> 
>   (gcc build issue, on architecture that supports libsanitizer)
>   http://autobuild.buildroot.net/results/90fe4c3b8b72a2c28555674383de9bbd9e8ae09a/
> 
>   (sysvinit build issue, on architecture that does not support libsanitizer)
>   http://autobuild.buildroot.net/results/d7bf5795b7621a92be32f18794e3e67944fb96db/
> 
>   (crun)
>   http://autobuild.buildroot.net/results/e3e8da4f797dced48aedf8c636db983d36849850/
> 
>   (libarchive)
>   http://autobuild.buildroot.net/results/9fcbf0c036a97b2e9a4fcc6e173bcfa09e1b3dac/
> 
> Thanks a lot to Peter Seiderer for pointing the relevant GCC commit.
> 
> Fixes:
> 
>   https://bugs.busybox.net/show_bug.cgi?id=15021
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...-machine-names-in-__has_include-.-PR.patch | 124 ++++++++++++++++++
>  ...-machine-names-in-__has_include-.-PR.patch | 124 ++++++++++++++++++
>  ...-machine-names-in-__has_include-.-PR.patch | 124 ++++++++++++++++++
>  3 files changed, 372 insertions(+)
>  create mode 100644 package/gcc/10.4.0/0006-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
>  create mode 100644 package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
>  create mode 100644 package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch

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
