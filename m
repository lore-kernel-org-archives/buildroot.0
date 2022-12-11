Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE78C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C6CA813DA;
	Sun, 11 Dec 2022 13:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C6CA813DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5TjfhWvXoahn; Sun, 11 Dec 2022 13:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EBE7813B7;
	Sun, 11 Dec 2022 13:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EBE7813B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3ED01BF3AA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FAC940200
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FAC940200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTSfYLFTw7ox for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:34:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F82F4006F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F82F4006F
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:34:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 636E940003;
 Sun, 11 Dec 2022 13:34:35 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:34:34 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211143434.16fd1f03@windsurf>
In-Reply-To: <20221208212503.61937-1-fontaine.fabrice@gmail.com>
References: <20221208212503.61937-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670765675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiMvVV6TMFmhzoAcAJSy0dXrw69i7qutMihiqnQdIgE=;
 b=CyI56GO514+3kmO1p/rPXOr/xG8fHRRLxGCh8EwKyGnTVPKVOtCkNz8PruavGOG5GVBRUG
 oSn586l6d6RXg49yigbp5H6gltSinGVk/7kffCS+Z656HIV8jLajm+JhBDaOD0qDlD20TN
 xN6CK9KGV7qfj842UMWeinwQYZoPrH8MEn5MOgyLetJCurzpQENqHTyt9NUxDiwdrnInlU
 oTwa4/bRRUcxRzwUP8upcQK8hBfbI+3Go2G3Etw83cE86rfzuqp/SuaqGWyhAOp7eiCp+i
 HqfZCdZc++rVTcJrKMb3J29k830QY3gfFNXeL+WdQSn/ef/2pulQC/pAnKsjAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CyI56GO5
Subject: Re: [Buildroot] [PATCH 1/1] package/utf8proc: bump to version 2.8.0
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

On Thu,  8 Dec 2022 22:25:03 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/JuliaStrings/utf8proc/blob/v2.8.0/NEWS.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/utf8proc/utf8proc.hash | 2 +-
>  package/utf8proc/utf8proc.mk   | 2 +-
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
