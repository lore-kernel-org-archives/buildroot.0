Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF43C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA0C240579;
	Thu, 29 Dec 2022 09:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA0C240579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNOauO7H8FUa; Thu, 29 Dec 2022 09:36:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1088840102;
	Thu, 29 Dec 2022 09:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1088840102
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C32931BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB6EC60D50
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB6EC60D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_m_5pgWA9ym for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:35:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D1FE60D4D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D1FE60D4D
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:35:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D67BE0008;
 Thu, 29 Dec 2022 09:35:07 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:35:06 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221229103506.58ae1da9@windsurf>
In-Reply-To: <20221229092541.236778-1-fontaine.fabrice@gmail.com>
References: <20221229092541.236778-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672306507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqebBazui/5tSJYKvaPVDw/C5uAkVV3yAfMz0cnlfn4=;
 b=Xt+LJoMV+Qzu+/vag2f9sRXoVmJdaNGgk2U8M0FaRylffypLyEj494sUaGndQ1QV23JES+
 9vvX7jDEV8td9z/7bjAd9hwD1yuJi7U4aqrxhttjLJB3wJ4Ow7FwDzTX+DDLiok9FKtJnX
 BnH2GuykUARnRnngCNj9BEK31Wkw6v8IF8Br1SNceJD1UtL/jEYFsmQ35dRYRCBx5Vk+sE
 Q0qrCMz4vQrDiJQh/60EGqTXCjfrLb5AIdYnFis4cpT7cWf5uhUDSS9oStFIY/StPuk1c3
 b50xJOTOkmkcTC6UccOej4EIyF7rSX2GN8XzZFTq++yWvoWKhWHgzMWgU6JLQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xt+LJoMV
Subject: Re: [Buildroot] [PATCH 1/3] package/rsync: add zstd support
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

On Thu, 29 Dec 2022 10:25:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rsync/rsync.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
