Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C22C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 13:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD24F61072;
	Wed,  1 Jun 2022 13:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQhXMK-mi4Wj; Wed,  1 Jun 2022 13:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3B7661062;
	Wed,  1 Jun 2022 13:25:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A52D01BF3E1
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 13:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1B974171E
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 13:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySmjUfvO9VxK for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 13:25:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BD8D41717
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 13:25:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19394200012;
 Wed,  1 Jun 2022 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654089914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGZF8ZpHk2c279p3d7d8ojam6nxMLxkm49zwWUYbsnc=;
 b=cnUQBLKX+AE279SIYz+pN9iLW8NXRbP7URkEM/Ixac7m2vxNj6xLaJosQkoU+1JZcR2mPc
 ajtD93WB9QeROyllxfIqdX1pWA4BCWod9gFen0Dp/34m10COLqhqObdTOsbPKJCQbjxekr
 n+TXuLnii0hOuJVlvfO3kaeMkJiC5MCC7PCN1Cwpi78G9/sp8g1aDtQZ6+8HVndNOhhXPf
 vAjZbKyi8S+m8YhfhlVe5NY7lLS/qo0cRVUikW0oE75XRQxt89JkajiHUDNb+uiaBA2/Nh
 uoPQIhjeHc4ZPtlYdgk3cqyn72F9nCTQqh9b+mxIFurKj5LByiRrNS89EJ46Zg==
Date: Wed, 1 Jun 2022 15:25:12 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220601152512.1faf25fd@windsurf>
In-Reply-To: <20220531163828.3865322-1-fontaine.fabrice@gmail.com>
References: <20220531163828.3865322-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: needs iconv.h
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 May 2022 18:38:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> samba4 needs iconv.h since bump to version 4.15.3 in commit
> d33ad03e75b89feb97a7edeba3156fa2ac417b06 and
> https://gitlab.com/samba-team/samba/-/commit/fc51b38ed8b7ff239db82d4d2d52f6332910ca97:
> 
> ../../source3/lib/netapi/examples/common.c:13:10: fatal error: iconv.h: No such file or directory
>    13 | #include <iconv.h>
>       |          ^~~~~~~~~
> 
> Strangely enough, there is no autobuilder failures.
> 
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=14821
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/samba4/Config.in | 1 +
>  package/samba4/samba4.mk | 5 +++++
>  2 files changed, 6 insertions(+)

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
