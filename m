Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0016C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 08:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C25540573;
	Thu, 29 Dec 2022 08:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C25540573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qk37Dwbf9E6m; Thu, 29 Dec 2022 08:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C9A840480;
	Thu, 29 Dec 2022 08:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C9A840480
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC271BF20D
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78B8260C29
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78B8260C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weilocTUxolS for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 08:59:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FA2F605B7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FA2F605B7
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:59:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EAA7E1C0004;
 Thu, 29 Dec 2022 08:59:18 +0000 (UTC)
Date: Thu, 29 Dec 2022 09:59:18 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221229095918.502de806@windsurf>
In-Reply-To: <20221228220044.260042-1-fontaine.fabrice@gmail.com>
References: <20221228220044.260042-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672304359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0HtipLvWALbCokK10CfkgQZRTMXpqM5b0gwo/SGBOI=;
 b=itoTrsH2i7rMuA/gc3w8YMxFSyCVVrg9+IaQeOILt0WLQpvk71CH4cmlHkk/oAhlCM4LgA
 iz260Ol+kJ/GpvCGmGkLif6pA9ZbCjkwZRLnqwrvYSOkTkubY6zdbW/3ssuRkt7dxTvh17
 r548I61fLBeyltzs3AnPQD4oPxOFqpaEZxy+5TrCvxJwjtK1Ns5E5N1m9S7P7MS7sms13s
 bf3jTqw6GWqrxWDQHITa7B1EJ0T+6BPXX+4fX4IlGgOUw/IUBZmt8LfR7EdCyUUsqrz7rd
 CAIttNDYCiongLx3UZRXDIooaRyPO6IrvZoEd2x8+l0SjJ47GOJMKvBQflb1dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=itoTrsH2
Subject: Re: [Buildroot] [PATCH 1/1] package/libdnet: fix python build
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

On Wed, 28 Dec 2022 23:00:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised with python >= 3.11 by
> backporting a patch and adding libbsd dependency as suggested by
> upstream in https://github.com/ofalk/libdnet/issues/74:
> 
> ./dnet.c: In function '__Pyx_AddTraceback':
> ./dnet.c:456:62: error: invalid use of incomplete typedef 'PyFrameObject' {aka 'struct _frame'}
>   456 |   #define __Pyx_PyFrame_SetLineNumber(frame, lineno)  (frame)->f_lineno = (lineno)
>       |                                                              ^~
> ./dnet.c:25190:5: note: in expansion of macro '__Pyx_PyFrame_SetLineNumber'
> 25190 |     __Pyx_PyFrame_SetLineNumber(py_frame, py_line);
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/78dff4b514fb7c510f5a745ee6cbbc049ceb2794
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...02-Correct-path-to-string-h-from-bsd.patch | 26 +++++++++++++++++++
>  package/libdnet/Config.in                     | 11 ++++++++
>  package/libdnet/libdnet.mk                    |  2 +-
>  3 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch

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
