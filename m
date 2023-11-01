Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF6BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 12:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B931430E5;
	Wed,  1 Nov 2023 12:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B931430E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7nClfUk6kajy; Wed,  1 Nov 2023 12:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C176843102;
	Wed,  1 Nov 2023 12:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C176843102
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 371531BF388
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 12:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9E72408AB
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 12:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9E72408AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzALgHzi1PMM for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 12:10:06 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF33D40896
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 12:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF33D40896
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8341740007;
 Wed,  1 Nov 2023 12:10:03 +0000 (UTC)
Date: Wed, 1 Nov 2023 13:10:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101131001.78628c9c@windsurf>
In-Reply-To: <20231029193623.679637-1-fontaine.fabrice@gmail.com>
References: <20231029193623.679637-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698840603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDMu3QJg6nvnd7L4+hJrIZgtU2ifywC2zmzrFWKLVsc=;
 b=btwQ8+bWzKzbahy1bhB3ZepnP6gIkOM9PPVAFETJc2k7mJslhipicIen0VXlqi/bUA+B9p
 fbB5byhpybXoRc75zwmbQDqW4ucRKaRDRKBGZ6aMtClWEUOfpL7UKPJTvGu8X1Qigsp7fu
 /jVevZ7vaOiLeMogc6fbhUvpMG6tJNRrdXiHS+PACXcZWqcuO6y1wl0RGMLkrzaCKyOeFx
 sfHGvV+WWKHiNeWhZMjXQ8yKulHPmTOZzScsuYJae/+P1yckw6cgZ88SXrpmL20tFq6uf0
 +qbCgqdFuuztEH8YsKtC8mNkRVAYvcCFXvr/854ORXcmrLMSyHeWkraxvxb4cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=btwQ8+bW
Subject: Re: [Buildroot] [PATCH 1/1] package/aespipe: bump to version 2.4g
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

On Sun, 29 Oct 2023 20:36:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> aespipe-v2.4g     October 23 2023
>     - Added configure script autodetection for -fno-strict-aliasing compile
>       flag. This option is needed with some compilers that miscompile code
>       when link-time-optimization is used.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/aespipe/aespipe.hash | 8 ++++----
>  package/aespipe/aespipe.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
