Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A3FC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA524031F;
	Thu, 29 Dec 2022 09:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BA524031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIjwEEtxAxD0; Thu, 29 Dec 2022 09:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB25402D2;
	Thu, 29 Dec 2022 09:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB25402D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DCB41BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A26560D4C
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A26560D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tHHCdIk9gbkl for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:04:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A3160C31
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06A3160C31
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:04:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B7811C0012;
 Thu, 29 Dec 2022 09:04:04 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:04:03 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221229100403.4e7daf72@windsurf>
In-Reply-To: <20221228225021.784093-1-fontaine.fabrice@gmail.com>
References: <20221228225021.784093-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672304644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNw3PBpoAYl79flXb6XqAM6AdW2+JtYXBYugSMZw7IM=;
 b=Sm3dObmExKkAIGthBxqlYZhm/ld24LJJ+Kn2paD0qk3/USErCcbWhHqeufylpgF+FhoNrh
 lf0KVO40H9AfwFm0hdyJR/zLJj2uGZyXTg34DTwMJFvkHQwGdAQJRJXboy+nKNEmK0kUUm
 MiQc+3qrqbRNco9biQWDMR3ppFpffgttTeW4ojKWE4YPy8SMFKbFxbiyKfasDVJLr6v7oi
 6y9hrZYvBYMnAFpnJTJqZ+XjShe/JZLATASdFQhrQjaK0IUxhy3lw8H+Gmvz6zdBG3tRtn
 bJ4XdFC4xSXiHHrf61yhgQWq3AWDiC26q2D5LODn7Y2ynDjT75r4a8sxPvl8GQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sm3dObmE
Subject: Re: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.2.9
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

On Wed, 28 Dec 2022 23:50:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Mutt 2.2.9 was released on November 12, 2022. This is a bug-fix release,
> fixing a build issue with recent GPGME releases.
> 
> Mutt 2.2.8 was released on November 5, 2022. This is a bug-fix release,
> fixing a possible crash when using GPGME to view an application/pgp key
> block. It also makes some changes to resizing and window size logic, and
> enables batch-mode IMAP Fcc'ing.
> 
> https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-9-rel/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mutt/mutt.hash | 2 +-
>  package/mutt/mutt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
