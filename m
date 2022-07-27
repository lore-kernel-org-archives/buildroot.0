Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C461C19F28
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0B9C4158B;
	Wed, 27 Jul 2022 14:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B9C4158B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5_doGp-4IT8; Wed, 27 Jul 2022 14:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68CE41571;
	Wed, 27 Jul 2022 14:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C68CE41571
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0ED1BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA69E81433
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA69E81433
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Smh-2h8Dk9n5 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:54:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DF7C81426
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DF7C81426
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:54:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE760FF809;
 Wed, 27 Jul 2022 14:54:12 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:54:12 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727165412.6c49b845@windsurf>
In-Reply-To: <20220727132630.1323856-1-fontaine.fabrice@gmail.com>
References: <20220727132630.1323856-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658933653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mwGL51/Vy3v1VBGU8uraTbK3umCnc+1q7El8FdTx7g=;
 b=Zw/NItnDqqyVEFrrAhWgeWo4IHReA9jVuY6ZQmV7DT9AgjvekexWxth5vOPFM9EwXsYmlL
 JqyN8vN60yjjC+mpjArMZEsBf7pjPCnXLQk9wMfmuXwCo537VuVjAO7IJmlGrX0NYzLSYA
 R2QqW+DTIaY8e0cLLrkIOIiR+/LWnA5QrTOnDoG03gOjqaw2TQOTzmsMOW8lnKCH01IxdM
 qwgZjsqnHCnjgzsf/wpACYH94EodnNkNL0+Gh5Djl3zAeI6hYcwLdqfW5Vv42IlI31uzS+
 DsCHkWcFgaWLUHCni23mcjVC7ZJSiThpCggNZ5lsxniQI3WuNeS1SNden9GVEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zw/NItnD
Subject: Re: [Buildroot] [PATCH 1/4] package/jack2: libsamplerate is
 optional, not mandatoy
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 15:26:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jack2/Config.in | 1 -
>  package/jack2/jack2.mk  | 9 ++++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
