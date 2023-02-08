Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5953C636D6
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 19:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B94C820C9;
	Wed,  8 Feb 2023 19:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B94C820C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yh3NTLiZjqXd; Wed,  8 Feb 2023 19:28:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 893D7820C8;
	Wed,  8 Feb 2023 19:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 893D7820C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 383C41BF2FE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F07F61174
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F07F61174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zhpKeaAcB6e for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 19:28:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7AC861166
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7AC861166
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 19:28:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C53EC40002;
 Wed,  8 Feb 2023 19:28:17 +0000 (UTC)
Date: Wed, 8 Feb 2023 20:28:16 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230208202816.3089d72d@windsurf>
In-Reply-To: <20221213211313.735422-1-giulio.benetti@benettiengineering.com>
References: <20221213211313.735422-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675884498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbpOei6j7clAHQS1oOj7QoA8qCM9Yc+hgpM7NDx6+Bk=;
 b=hp3yNtd/dirYkf7JetpsLmRjNyVsG0iSYTjToTn2rm/kfhIHoYFSEW+krG+YNIKbDuVNx8
 rA5Oy38nGRveh2cMdbAkW7ytpa3Z10JX8F1qqvdjlXgJ0q9VTTPpzV9pTcTsJtQpkNDSqB
 pTwoSMWNixavavUIY3/RAc+UcqA4D3+0EqL4GU+oZehDBnvC8x36zE5pk4VvcuSH1CmzjW
 0gzyQfda1q1pHg9pgYVfVRzFFN7Lr1Ub3l28IcxZ4e1KnzgdFu2MvDX2sS83i2gts+7lax
 Sixiqx+48I4nCUZt0bJ+kY7W1RAdzHDcb4D3QN4FB9wUgufRgC489V4YXxQ2qQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hp3yNtd/
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: change CFLAGS approach
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Dec 2022 22:13:13 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Instead of undefine endiannes CFLAGS let's change approach.
> Let's disable the CONFIG_PLATFORM_I386_PC that is set to y by default
> involving the endianness to be set to little. This way we can set the
> CFLAGS according to architecture with some default define like:
> -DCONFIG_IOCTL_CFG80211
> -DRTW_USE_CFG80211_STA_EVENT
> -Wno-error
> 
> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8723ds/rtl8723ds.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

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
