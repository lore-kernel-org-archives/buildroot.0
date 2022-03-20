Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4F1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE8564049F;
	Sun, 20 Mar 2022 17:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OeaEvkTMRqA1; Sun, 20 Mar 2022 17:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B243403C5;
	Sun, 20 Mar 2022 17:08:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84C301BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7140C60670
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmpCSIfR-y1B for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:06:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 862AA60AB0
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:06:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD029FF802;
 Sun, 20 Mar 2022 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647796015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJyFbX760XGRNZxl24BxohvuwdEQ4P++dMc4aFDGs3A=;
 b=i9BuIcLVefS3dSFmOo9JWLTPAfwgatj82nG7WI1AO+M1sZ9oU0Gy31svMC+dxJeHfL4qbu
 dGDCTXgC/qDFBSvt4dnZR7IWhIVUOKBYvxhHVM491+VGF7t43tS/FSC/7a0rK+2a2K7VGL
 zOQxzsFOoI7RJGMvljBVghDVqLSjKpSrhYH3VFaj5RMfYay/WTazbyJKE4pJAUFmdSEOFT
 FCyWHdIOlrEkwjaoWVPpltI0V9IpLXY3rlcd+8Fd1d+etkaWBC8Y18JkhmmscgiS/q6j5s
 7ZQvoEcavLkyvJ/mSj6XX55+ODC32j5njOs01gu2WDE/RPYCp8mXr6NIkBoEbg==
Date: Sun, 20 Mar 2022 18:03:48 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220320180348.2e5ae37a@windsurf>
In-Reply-To: <20220320121836.3682323-1-bernd.kuhls@t-online.de>
References: <20220320121836.3682323-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 19.2.0-Matrix
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

On Sun, 20 Mar 2022 13:18:36 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
>  package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
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
