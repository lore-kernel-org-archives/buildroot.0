Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A774FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 461ED40445;
	Wed, 26 Jan 2022 22:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yl6aju3WYOxt; Wed, 26 Jan 2022 22:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60FEA4015A;
	Wed, 26 Jan 2022 22:09:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7B11BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CB5682605
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pFsB-QsyzTSz for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:09:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B86D82572
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:09:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7BB36E0004;
 Wed, 26 Jan 2022 22:09:27 +0000 (UTC)
Date: Wed, 26 Jan 2022 23:09:26 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220126230926.7b02ffda@windsurf>
In-Reply-To: <20220124221657.2629467-1-fontaine.fabrice@gmail.com>
References: <20220124221657.2629467-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: bump to version 1.6.9
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

On Mon, 24 Jan 2022 23:16:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patches (already in version) and so autoreconf
> 
> https://github.com/chu11/freeipmi-mirror/blob/freeipmi-1-6-9/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freeipmi/0001-fix-build-on-musl.patch | 49 ------------------
>  .../0002-check-for-inb-and-outb.patch         | 50 -------------------
>  ...ure.ac-use-pkg-config-to-find-gcrypt.patch | 50 -------------------
>  package/freeipmi/freeipmi.hash                |  2 +-
>  package/freeipmi/freeipmi.mk                  |  4 +-
>  5 files changed, 2 insertions(+), 153 deletions(-)
>  delete mode 100644 package/freeipmi/0001-fix-build-on-musl.patch
>  delete mode 100644 package/freeipmi/0002-check-for-inb-and-outb.patch
>  delete mode 100644 package/freeipmi/0003-configure.ac-use-pkg-config-to-find-gcrypt.patch

This patch was not applying on master, because it was assuming that
"package/freeipmi: fix static build with  libgcrypt" was applied, which
isn't in master. Since the patch added by "package/freeipmi: fix static
build with  libgcrypt" is not in upstream freeipmi, I applied the
version bump, but without the removal of patch 0003.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
