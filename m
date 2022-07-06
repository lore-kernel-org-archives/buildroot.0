Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CE4C43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F012340134;
	Wed,  6 Jul 2022 21:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F012340134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlmN1gg9jaEB; Wed,  6 Jul 2022 21:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11EB940C3D;
	Wed,  6 Jul 2022 21:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11EB940C3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55CB01BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F1C14049A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F1C14049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G83oecbUTAYH for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:28:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 038B440C3D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 038B440C3D
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:28:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8C3F9C0003;
 Wed,  6 Jul 2022 21:28:06 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:28:05 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220706232805.32ae9a98@windsurf>
In-Reply-To: <20220628203515.2842881-1-fontaine.fabrice@gmail.com>
References: <20220628203515.2842881-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657142886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LE/xzm1hgyuFJ9TZaiWmTYUC8Xf3kVBhJ7w4B4nThOk=;
 b=b7DQSzr0vbY1bgSiYXME8o5/FPm2Qdx22rMTG/jKh/xRo0oF1hw7BgDshIxEhhyTTBv1RC
 +lOOGezpQtVPYA8pXc6QxZVYmIBvr5HPvx0YQtX3pxWmL7n8LV0qpQh+AN1tTue0WqUEcC
 LI+2cOCHGMxJw+KNfhMnv/NtCmlVQBHnwQKCaft2mizt/UGIlkWJ5QrruW3WssCcuLgwsB
 dXjfFPwnHhFiPvgqXnTnnfu6LkOOqv7Sw85dxoQHoqupmU2AuwZ1Ff3Wp764sGE86qj5KX
 fwk7RArSG3WT+9I1m7V/vB74mIMlDDwx0vAfk3leUdhNz/+PEGIEYiG1kmQsyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b7DQSzr0
Subject: Re: [Buildroot] [PATCH 1/1] package/earlyoom: bump to version 1.7
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 28 Jun 2022 22:35:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/rfjakob/earlyoom/blob/v1.7/README.md#changelog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/earlyoom/earlyoom.hash | 2 +-
>  package/earlyoom/earlyoom.mk   | 2 +-
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
