Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A008C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 16:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11523419E4;
	Wed, 20 Jul 2022 16:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11523419E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoAthLZwC2fq; Wed, 20 Jul 2022 16:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFBE3408A5;
	Wed, 20 Jul 2022 16:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFBE3408A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7168F1BF352
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3240B408A5
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3240B408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGhGTJAZ2A2P for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 16:33:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DCFC40893
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DCFC40893
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 16:33:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E0651BF204;
 Wed, 20 Jul 2022 16:33:24 +0000 (UTC)
Date: Wed, 20 Jul 2022 18:33:23 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220720183323.0eb28663@windsurf>
In-Reply-To: <20220626084517.970430-1-fontaine.fabrice@gmail.com>
References: <20220626084517.970430-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658334804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62bPWX+e3L/VtOpYp+cH1DiuIZNGj1qf8mqLxQeiQgQ=;
 b=OCrvZv6nWtOFSMI/oozMM2H2SViIsjTONWoyWs+vRTgC6EMhgDjnniYAzh847llb3JXWYy
 f3DFflC/OMsB1uAZ/sQYpAVHY6xDw9BgULCPiPVUdzMY2dyCMDu2Imu6mLi4+kNVD2LvLf
 wFwzW2wr7AuU5DpoWXm5mOKYErPlWfeU1awRB+AL1bEvtTMjf3MgZ13pxGGMsRgzfmoNif
 7n++1OQK6cMQMcmygJAR6d1y0RQvZeIFPv6banAfOHTEbAEdkdCplMzujwRVTNLnbQC86p
 mGbObtfOsgldrdVsBKtgvcdyxi/TK21VJga0xOLue6G1pUbxjH5jJ5WOWYA8Ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OCrvZv6n
Subject: Re: [Buildroot] [PATCH 1/1] package/bayer2rgb-neon: fix build
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 26 Jun 2022 10:45:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure:
> 
> /home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/10.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: ./.libs/libbayer2rgb3.so: undefined reference to `__bayer2rgb_missing_convert_dumb_implementation'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/69a637b7f1422ce2bf04dda573abb09388b9a02d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-src-convert.c-remove-have_cplusplus.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch

I have applied to fix the immediate build issue, but I am not entirely
convinced this is the completely correct fix.

Indeed, the function __bayer2rgb_missing_convert_dumb_implementation()
is not implemented anywhere. So as soon as C++ support is not
available, bayer2rgb-neon doesn't build. So the correct fix would be
(IMO) to drop this logic, and make C++ a requirement in the
configure.ac script.

Normally, this call to
__bayer2rgb_missing_convert_dumb_implementation() gets optimized away
by the dead code elimination gcc optimizations. But when you build with
-Og as it is the case in the autobuilder failure you're pointing to,
such optimization does not take place, and the call to
__bayer2rgb_missing_convert_dumb_implementation() is preserved, even
though it is never invoked practically at runtime.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
