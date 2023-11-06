Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645ACC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1031A61244;
	Mon,  6 Nov 2023 19:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1031A61244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oerkTKnmVYZT; Mon,  6 Nov 2023 19:32:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3A676123E;
	Mon,  6 Nov 2023 19:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3A676123E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39EA91BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1302A8242D
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1302A8242D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYyGnMWE6gJ3 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:32:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2AB8820C3
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2AB8820C3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DBB31BF209;
 Mon,  6 Nov 2023 19:32:04 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:32:02 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106203202.2804bfb3@windsurf>
In-Reply-To: <20231106171616.495795-1-fontaine.fabrice@gmail.com>
References: <20231106171616.495795-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abAuOlEmIXUaybhF5JxzxmKxlyfdmTR88G6y1Ef5Iqc=;
 b=aSFSdl8Jra1v9FhjcZ4IwNUak2Ywnn7szJxPfgnkwBgk+ZW0r0tx8bhKe+kAaaJrcp38XA
 q923emLhx30uK0996yrJw1/KK7TStw4A4UILKZQWm7igdth4QF8US6CJ0LFSzlgaGMG5yo
 nF3dWJVFZgPZXdE9BmHCqmbnUsAzmsC4+PzUrwnZ/cp/bH7kItbrecH9/nOc+D/f1f9rCu
 FIUjc/BEjIQH9xbZsukt3twIwg+krx8RcS8j3kxlRkE7ZhceydIc6Xc5GrF63P0ilFpSGn
 NWjYuVQakgC3KM0Y9I3oobYC8FN2OA6xlUajaTbJsiyt9osJyuZKF8DcZR7BbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aSFSdl8J
Subject: Re: [Buildroot] [PATCH 1/1] package/libpam-tacplus: fix
 --disable-werror
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

On Mon,  6 Nov 2023 18:16:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -Werror is unconditionally set since version 1.6.2 and
> https://github.com/kravietz/pam_tacplus/commit/649e6f2efb2f3278c55d4c9704bb48cb9f74cb73
> resulting in the following build failure since bump to version 1.7.0 in
> commit 160f0e4b5f161d1966a70ad36679a9f5e9dfa9d3:
> 
> In file included from /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
>                  from /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/stdlib.h:26,
>                  from ./lib/stdlib.h:36,
>                  from ./libtac/include/libtac.h:35,
>                  from support.h:25,
>                  from support.c:28:
> /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:413:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
>   413 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
>       |    ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9b5ece5d01eac8a760ed9ca331a902d1c47387a7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-fix-disable-werror.patch             | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/libpam-tacplus/0002-fix-disable-werror.patch

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
