Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A997C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C7E612E2;
	Wed, 20 Jul 2022 21:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0C7E612E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwKNdzqb2y9X; Wed, 20 Jul 2022 21:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE30B612D9;
	Wed, 20 Jul 2022 21:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE30B612D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 885511BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B0A341029
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B0A341029
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTDkan_zp6N6 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:20:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CBD34015A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CBD34015A
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:20:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9E000240004;
 Wed, 20 Jul 2022 21:20:30 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:20:29 +0200
To: SmartCross Developer <andreadaoud6@gmail.com>
Message-ID: <20220720232029.2de1f472@windsurf>
In-Reply-To: <20220630035823.3098231-1-dev@smartcross.io>
References: <20220630035823.3098231-1-dev@smartcross.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658352031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jweUmMVAvu6RC98HNJ1f5bZtVGZ83iZqp01JP7Q9Nj4=;
 b=R0JsM13ihbRXeJMVNZIyQwYYGZZ32+4cx5mwdZ2md3fIL3eoYEQrSly/TF/RPBuE/4tQ8D
 MsqLdsx6pJbCK0UO3rSu1dtkcYVcP6Q3/SellNDe7jsPUYDrsoTfSlwuTYCBfOOCaRF+CH
 DulTNH8S5kKCqhLDmMg1OzZ3GkMCStjf+0hoTT7P4GWh6PEpcsG+dh3k7lX/uwvF1SlGkT
 Ub3H7XSSZuPnguxC21sQtkeC6cWU+yuaZ2tsj9lRmNrq9z9Kdaz90IyJUKbOlSBZ2f7VP2
 a6FZibmGna2CDKOhhqVYEqXJF9iVTZnaF6Ols1IzLviBvO/+rFQa7yfY10Mcag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R0JsM13i
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez-alsa: bump to version
 4.0.0
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
Cc: =?UTF-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Jun 2022 11:58:23 +0800
SmartCross Developer <andreadaoud6@gmail.com> wrote:

> From: Andrea Daoud <andreadaoud6@gmail.com>
> 
> Version 4.0.0 contains various changes and fixes, including LC3
> support and dbus changes.
> 
> Signed-off-by: Andrea Daoud <andreadaoud6@gmail.com>
> ---
>  package/bluez-alsa/bluez-alsa.hash | 2 +-
>  package/bluez-alsa/bluez-alsa.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks for your patch! You had forgotten to update the hash of the
license file, as the contents of the license file has changed. I've
done that, explained the change in the commit log, and applied your
patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
