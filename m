Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53332C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F178C60D7F;
	Sun, 26 Dec 2021 15:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjLdwKTqFnzq; Sun, 26 Dec 2021 15:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EB260C15;
	Sun, 26 Dec 2021 15:01:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 172AC1BF2F4
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0668E81457
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NA6TvC-3QTZ for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:01:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA55781455
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:01:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D26DE60002;
 Sun, 26 Dec 2021 15:00:59 +0000 (UTC)
Date: Sun, 26 Dec 2021 16:00:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211226160059.734d1a68@windsurf>
In-Reply-To: <20211226142922.611043-1-fontaine.fabrice@gmail.com>
References: <20211226142922.611043-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl_433: fix build with gcc 4.8
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

On Sun, 26 Dec 2021 15:29:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 4.8 raised since bump to
> version 21.12 in commit 84b29ef40baf408b8b22085b336967aca83212db:
> 
> arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bea144f267215cd2dc27f235d6e3fb0adedb33ea
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...inor-Fix-a-compiler-flag-needs-GCC-7.patch | 27 +++++++++++++++
>  ....c-fix-build-without-__has_attribute.patch | 34 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch
>  create mode 100644 package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch

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
