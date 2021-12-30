Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5571C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8557560BE9;
	Thu, 30 Dec 2021 12:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kAMYCL9o3nNX; Thu, 30 Dec 2021 12:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7EBB60BE0;
	Thu, 30 Dec 2021 12:34:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85B681BF3EF
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7406D812FD
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFIPKXR7aRUK for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:34:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CFD0812CE
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:34:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DFC9CE0007;
 Thu, 30 Dec 2021 12:34:51 +0000 (UTC)
Date: Thu, 30 Dec 2021 13:34:50 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211230133450.6da85e86@windsurf>
In-Reply-To: <20211229234520.2957740-1-aduskett@gmail.com>
References: <20211229234520.2957740-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5location: Fix build
 failures without opengl
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Dec 2021 15:45:20 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> Backport a patch that fixes several "const marked override but does not
> override" compilation errors when openGL is not enabled.
> 
> Patch fetched from: https://codereview.qt-project.org/c/qt/qtlocation/+/340353
> 
> Fixes:
> http://autobuild.buildroot.net/results/6378e43d50dfad13a45522492f14c9df7acd64e4
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...fix-compilation-for-no-opengl-builds.patch | 528 ++++++++++++++++++
>  1 file changed, 528 insertions(+)
>  create mode 100644 package/qt5/qt5location/0002-fix-compilation-for-no-opengl-builds.patch

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
