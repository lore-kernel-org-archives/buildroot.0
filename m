Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1E6C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3B5081971;
	Mon, 20 Feb 2023 20:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3B5081971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5T0Z7QTG_rqO; Mon, 20 Feb 2023 20:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15FB581770;
	Mon, 20 Feb 2023 20:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15FB581770
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 334F41BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D59F400D1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D59F400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwS018x3l3IE for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:37:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE602400AF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE602400AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:37:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4407760008;
 Mon, 20 Feb 2023 20:37:42 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:37:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220213741.0f9cf741@windsurf>
In-Reply-To: <20230220142746.1935069-1-fontaine.fabrice@gmail.com>
References: <20230220142746.1935069-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676925462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/YVNBBiK1qY5uKfu81OsWir4pJXVc3wk/4cScpTTB0=;
 b=KYiOXfUowpgIflnIJjYbqxeL2ewYu4zP5kLnzwFQePIkMctSDqnge40hyDjPrEwbske32g
 Db9R9aK/CJ3B5NQyS9t8KyFiPNqER3t6fzwOO7+4qmuW7hLoSWyxgwYcaZ45WDtNLvE9ea
 AUlFO/l7KzyVGJii1CAwANr1ipqOwZL/b/++jyeCgx5ywZaCjiTRmuXfJD4DyPDYKQMOfT
 5rhLusDCUBIJlQKAoG8hCPVFwc5085txXKkY2wNuI/CUzkgK5UBQsxG1Fj9Ul7UDK1tReQ
 hyjwOIPnDWUiRoWd7t+nqcXKMRxh0BdPldJOUBTjYSlvvhCjCuOF872VObgWgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KYiOXfUo
Subject: Re: [Buildroot] [PATCH v2,1/1] package/libarchive: fix host build
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 15:27:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following host build failure raised since commit
> 9525bc7e64e8f44c31ab9dfd3f516ecb35982429:
> 
> configure.ac:140: error: possibly undefined macro: AC_MSG_FAILURE
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> configure.ac:328: error: possibly undefined macro: AC_CHECK_LIB
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/11868e9bc4916843a7fc76f7b5e4c251f89e33dc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Drop per-package from commit message

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
