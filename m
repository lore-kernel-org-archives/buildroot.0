Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE09C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47CAE84BFB;
	Wed,  1 Nov 2023 17:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47CAE84BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3D4Twr-QCrj; Wed,  1 Nov 2023 17:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A497D84CB0;
	Wed,  1 Nov 2023 17:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A497D84CB0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9FAB1BF280
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCDA9431E8
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCDA9431E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EaHvc4d27kt7 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:50:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8370F431D8
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8370F431D8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77FDEFF805;
 Wed,  1 Nov 2023 17:50:18 +0000 (UTC)
Date: Wed, 1 Nov 2023 18:50:17 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101185017.53d4fbb8@windsurf>
In-Reply-To: <20231101154350.541223-1-fontaine.fabrice@gmail.com>
References: <20231101154350.541223-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698861018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IvLBG7c8sl0poJswts5tg7iicKNFPkTI8ak0n9dm+vc=;
 b=S9GnGzJ0yIEB2daS7nZ8TIHE3I744cCDZ0DJLSm652KRrBDw0ennUjjFbKy7DpiM3V7l13
 n6zpSqNsy51p7Gqwl2aexNO66viw48tL2/MKUxTD05ZNTH0178sjJDdfhISfCJishbvtyC
 vSSLr6wqtzoIAkBSrV7DoyjVTGa8yAO7xVDfafJ0iKwdyFOgR8w9zZNJFPLdXyH7VNMFsP
 m/c1BS2VHL9R0pOmOAiLKt8xnzcwuh3rvhZiPpY1OdzbZyPX1ObU90vxT0uTyI60Iz1OXy
 OjhRDVbemi/1G7y0z5dFmRBt8QTEh9TwnEe0LlbPK3iSm4Z7825Bm9GYdLPXdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S9GnGzJ0
Subject: Re: [Buildroot] [PATCH 1/1] package/conmon: seccomp needs headers
 >= 5.0
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  1 Nov 2023 16:43:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> conmon unconditionally uses seccomp_notif_sizes which is only available
> since kernel 5.0 and
> https://github.com/torvalds/linux/commit/6a21cc50f0c7f87dae5259f6cfefe024412313f6
> resulting in the following build failure since the addition of the
> package in commit 06f50ff1bf066feb6cf6ed512113773f87c884fb:
> 
> In file included from src/seccomp_notify.h:4,
>                  from src/seccomp_notify.c:26:
> src/seccomp_notify_plugin.h:33:78: warning: 'struct seccomp_notif_sizes' declared inside parameter list will not be visible outside of this definition or declaration
>    33 | typedef int (*run_oci_seccomp_notify_handle_request_cb)(void *opaque, struct seccomp_notif_sizes *sizes, struct seccomp_notif *sreq,
>       |                                                                              ^~~~~~~~~~~~~~~~~~~
> src/seccomp_notify.c:47:36: error: field 'sizes' has incomplete type
>    47 |         struct seccomp_notif_sizes sizes;
>       |                                    ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cbfa2f3a585b7feecd902137bc589a1ec15cbefe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/conmon/conmon.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
