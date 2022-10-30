Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF83C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1932060ADC;
	Sun, 30 Oct 2022 11:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1932060ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rd7KZnnl7L9s; Sun, 30 Oct 2022 11:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C4B60A74;
	Sun, 30 Oct 2022 11:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33C4B60A74
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 433C61BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AD3C402E1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AD3C402E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qz9AN48Jq35Z for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:08:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E362640022
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E362640022
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:08:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22794240004;
 Sun, 30 Oct 2022 11:08:33 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:08:08 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120808.440eb7a2@windsurf>
In-Reply-To: <20221030095228.59110-1-fontaine.fabrice@gmail.com>
References: <20221030095228.59110-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nf3tqgoSb9NEPPwf+rSYxX8EfngM4FY0JiX+lrVrUc8=;
 b=EDSfWJQwqswPuzAldbbMEaAY59EYxsqV8iIp/h017O5d9e6ULlLKL2w5z6IgVKxyC30Gza
 CLxA08/t1f6tGzt0pQUSpIy24L3f0rmYADfJunu59kkxzriMFMIenOqmh5o56/vU+cyesd
 Hhe5EUsfffEGc8w1vnHtpb1DSIPd+i4tLXgh6qbbC+rMTm8c5gbCamKTjtTk9rE/IQZtFu
 EBrqJfqnp2LMf8J+799/+XGLPNCKvZsYMf9XA1+oCvmMXhGMlW68leihCr1sZacLiUi3YO
 OY3xIochfS0pAl+YyJZhBsEBKtmElpujj3WdGkye8Keq3uHyLnydX3gPqZnEcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EDSfWJQw
Subject: Re: [Buildroot] [PATCH 1/1] package/liblinear: bump to version 2.45
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Oct 2022 10:52:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Version 2.45 released on August 11, 2022. Some minor bugs are fixed.
> 
> Drop first patch (not needed since
> https://github.com/cjlin1/liblinear/commit/7cf5d6e1c05d3147ee7890865c900757fc42d9ef)
> 
> https://github.com/cjlin1/liblinear/compare/v244...v245
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0001-blas-don-t-overwrite-ar-options.patch | 36 -------------------
>  ...-lib.patch => 0001-build-static-lib.patch} |  0
>  package/liblinear/liblinear.hash              |  2 +-
>  package/liblinear/liblinear.mk                |  2 +-
>  4 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
>  rename package/liblinear/{0002-build-static-lib.patch => 0001-build-static-lib.patch} (100%)

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
