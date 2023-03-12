Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F53C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 10:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3816B819C8;
	Sun, 12 Mar 2023 10:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3816B819C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 588Rs_Irn08U; Sun, 12 Mar 2023 10:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ECDB81BA9;
	Sun, 12 Mar 2023 10:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ECDB81BA9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEEEC1BF310
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 10:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C866360B26
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 10:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C866360B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xna3p1gjirXH for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 10:08:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC5E560B19
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC5E560B19
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 10:08:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 12667100003;
 Sun, 12 Mar 2023 10:08:09 +0000 (UTC)
Date: Sun, 12 Mar 2023 11:08:09 +0100
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230312110809.1772d71c@windsurf>
In-Reply-To: <20230309220414.4174769-1-marcus.folkesson@gmail.com>
References: <20230309220414.4174769-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678615690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Lr+nP7MVe9EPJN+4hjJh3dFFTQKny5Xmy0Hh183Hag=;
 b=fLhvOa+2bY+oC/w5TEdIWmITLRWix0QVJKnAhaeyKFD4koyjJMIKSC1kJ9dOxX0uQFC76X
 ObplhqFTBiA4g6jQsQ4h1MozxfAvzHx4td61kb+CZrikHhbmFF6QaMu552pWWyjz9hHxP2
 3VbWBZrsiJnv/XJ24UkxKRPuw12+fXwFzXQ8BWC79vDsFbab0BdDlAAR9P78nbGgo7tR4b
 IDHkUyM85rNI7GEYE9GTdsjPrDXKqF37O2pFw3ZaaUv/Ltld8w0wVW53+ntRIXt9/bONlP
 jX3MrdhclBWYNv5993SyFZQMYiOut/Lo9Gu5Q7rv5OqAF/SYDMRy2nEi23uNKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fLhvOa+2
Subject: Re: [Buildroot] [PATCH] package/libcamera-apps: bump to version
 1.1.2
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

On Thu,  9 Mar 2023 23:04:14 +0100
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  ...ass-VIDIOC_QUERYCAP-as-unsigned-long.patch | 35 -------------------
>  package/libcamera-apps/libcamera-apps.hash    |  2 +-
>  package/libcamera-apps/libcamera-apps.mk      |  2 +-
>  3 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644 package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
