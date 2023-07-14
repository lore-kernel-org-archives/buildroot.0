Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8368EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E44B6141F;
	Fri, 14 Jul 2023 10:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E44B6141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZONE5vszjp4H; Fri, 14 Jul 2023 10:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 809B861435;
	Fri, 14 Jul 2023 10:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 809B861435
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3601BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 088D1841AB
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 088D1841AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvqwgeSynfLG for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:31:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E708E841A4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E708E841A4
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:31:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 145B340002;
 Fri, 14 Jul 2023 10:31:34 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:31:34 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230714123134.0e1493ce@windsurf>
In-Reply-To: <20230612162602.1528239-1-bernd.kuhls@t-online.de>
References: <20230612162602.1528239-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVFWKUhDUSekL9YN63HcwomcRql7NnwSjc7NTJKo5q4=;
 b=ZPYZBx2+IS88ASBQWECa5bhXdrRBHHaYg66uXUsOTkXeyma+zVlfA0KNkeNPq3ZrwWevHz
 Sp4hV3CLDNZ91eI2dFWX74AfDtPqYsF1QS/woSROLDw3MC6rDEgt4L/ncanKXlErrLEvVt
 UHtQp762pfWq0GX3T9f/t+yu19meoA4EXU7fhaeQWJvkmE14LVXEoFfHf2QPVy/LRT6/t4
 ua1u/0wJIgqUhM5GkzzQoCM3xrVnf3dP/JXkqKRXsDf07AJSngWW6L3eFlfuVuztD0PBDY
 o5kT6xCS9poftiVegodfZFMVlFMPzeKDr6G8+L5lzBwt0uwsQ+L7/g+BUliopQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZPYZBx2+
Subject: Re: [Buildroot] [PATCH 1/1] package/elfutils: bump version to 0.189
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

On Mon, 12 Jun 2023 18:26:02 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Rebased patch due to upstream commit
> https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=c9c055a6949702af57e46f4eac3355d4a4f94c5d
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch | 4 ++--
>  package/elfutils/elfutils.hash                                | 4 ++--
>  package/elfutils/elfutils.mk                                  | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
