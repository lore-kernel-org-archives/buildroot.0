Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EB1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D251410C9;
	Thu, 30 Dec 2021 16:26:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJIUX8atvdY0; Thu, 30 Dec 2021 16:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AC2B410C3;
	Thu, 30 Dec 2021 16:26:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D15ED1BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE9F960C00
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1doOwvMnNnDa for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:26:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B134A60BF4
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:26:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8D61C200010;
 Thu, 30 Dec 2021 16:26:28 +0000 (UTC)
Date: Thu, 30 Dec 2021 17:26:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211230172627.6ab26b1e@windsurf>
In-Reply-To: <20200315102111.2731422-1-fontaine.fabrice@gmail.com>
References: <20200315102111.2731422-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/owfs: enable back php
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

On Sun, 15 Mar 2020 11:21:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> owfs supports PHP7 since version 3.2p3 and
> https://github.com/owfs/owfs/commit/a9a79b330e334ba80c305905b51e8886b40772d9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/owfs/owfs.mk | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)

I'm afraid this no longer works: we have switched to PHP 8.x, and OWFS
doesn't have PHP 8.x support for now. See
https://github.com/owfs/owfs/issues/89.

However, while looking into this, I noticed a 3.2p4 release is out,
which includes the gcc 10.x fix for which we have a patch. So perhaps a
version bump would be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
