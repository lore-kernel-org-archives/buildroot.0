Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32042C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1BFF4379C;
	Wed, 10 Jan 2024 21:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BFF4379C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKnCIGCSXm70; Wed, 10 Jan 2024 21:02:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 904C04377D;
	Wed, 10 Jan 2024 21:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 904C04377D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAD191BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5E4B42276
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5E4B42276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bu5N6n-PnTwH for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:02:35 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A1C24227C
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A1C24227C
Received: by mail.gandi.net (Postfix) with ESMTPSA id E42221C0002;
 Wed, 10 Jan 2024 21:02:33 +0000 (UTC)
Date: Wed, 10 Jan 2024 22:02:33 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240110220233.0858f03e@windsurf>
In-Reply-To: <20240106183608.3179343-1-fontaine.fabrice@gmail.com>
References: <20240106183608.3179343-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704920554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPKxt7eHgvNENhJ3Ujxu1U7H2345t6SHkvvO69DdILg=;
 b=O+UPehv6a6fg91PCA8flIAb4UxYBINh4iX+/GJeZK61dCkMtHH7llUZEAjMahPGmqKtUZq
 VwJGpSVRuZwou2ugka8jJ4Kc4ndKAuul+XMh6gVupU4dsidWprsEW3OR50U5ILCKyjNCV3
 +PtvaQCaPqTFjRPQw4Nth4FVzI3SjUBjePFM6is+mUeXXa6LCToMB3aPkWJlGpJ4mMS01g
 ObuFK+Vv98VJZY9s+UznurqYr5AfwgqavWMjwlnQ2sviFxnkPZNsLRAiBkO5C7N05dDLB5
 ap0MAtv7OmlKWNXi1/eE/w8ucM/lPzRXKzUPgx7CNio8Th+/L6ej1nutwqUu5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O+UPehv6
Subject: Re: [Buildroot] [PATCH 1/1] package/webrtc-audio-processing: bump
 to version 1.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jan 2024 19:36:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (not needed anymore)
> - Switch to meson-package
> - libabseil-cpp is a mandatory dependency
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  package/gstreamer1/gst1-plugins-bad/Config.in |  9 ++-
>  ...detection-of-cxxabi.h-and-execinfo.h.patch | 63 -------------------
>  package/webrtc-audio-processing/Config.in     | 10 ++-
>  .../webrtc-audio-processing.hash              |  2 +-
>  .../webrtc-audio-processing.mk                | 12 +---
>  6 files changed, 17 insertions(+), 80 deletions(-)
>  delete mode 100644 package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch

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
