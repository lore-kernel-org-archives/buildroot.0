Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38179C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 17:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D1F402E1;
	Sun, 30 Jan 2022 17:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sYgKzarXJH5C; Sun, 30 Jan 2022 17:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 356B6402C3;
	Sun, 30 Jan 2022 17:19:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EDF91BF57B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D1CE402C3
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6xjHpWPBCPe for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 17:19:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31C2E402B2
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 17:19:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1B086E0002;
 Sun, 30 Jan 2022 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643563158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLcymsJHe4bw4T2L0t4aHGlQ2H5qYRmwThIeIl96MIQ=;
 b=FJJ7D0LF/Aat9Ome2RqC2/hKl1MnTO1LcxZZ+kq5Cd3x4xkZ1HT7X2klNl7OZLKbEYtUV2
 9hU9HjopC1G+YgpHwH/p6RyApYm5P4rLDHCMETPtno5BhokyrlZ+e2IGw3XWYpsPlB/09+
 qbdBn0wHfNNc+ywi/xpCmXmaFvNLrRxusDKOF2yB9+z4Mei1efcPmj94VJg4AyjsG6ex/y
 imqx18soTTFAdDFwhUhso7VFKT4PaBe8+UWNtSbDGkKwqB48UcuLDs9nC/GchP+uS8iy4P
 jWq6aWUXZcRnOCJ4H0XD1BZ+21hCheQKma1eC0CfLCRDfsAYMTXfFBm1jV6zOA==
Date: Sun, 30 Jan 2022 18:19:17 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220130181917.3232550a@windsurf>
In-Reply-To: <20220128173204.2483569-1-fontaine.fabrice@gmail.com>
References: <20220128173204.2483569-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/midori: drop select of
 libsoup-gnome
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

On Fri, 28 Jan 2022 18:32:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libsoup-gnome is not used by midori since bump to version 9.0 in commit
> 42f19d49fb2da891be9266a2f843292d24847f18 and
> https://github.com/midori-browser/core/commit/0c2d8f0ea61f20476542e861bc1772a878a54d32
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/midori/Config.in | 1 -
>  1 file changed, 1 deletion(-)

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
