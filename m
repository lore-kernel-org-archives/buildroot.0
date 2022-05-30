Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74B3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77D9282DDE;
	Mon, 30 May 2022 21:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9EPSebCHdXAY; Mon, 30 May 2022 21:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CD3482D75;
	Mon, 30 May 2022 21:32:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99F191BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9795E82BED
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLBF-XPA_nXN for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:32:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9674982D57
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:32:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B9681BF204;
 Mon, 30 May 2022 21:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653946346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ScItTCELKWPEVQYD12/JolRMehQci6RE31lcNMxBH8=;
 b=ABd1MDIkNOFpcSVLleSo4GgKV42pNS3B69gvndJwG4wwcE5gRhyeKKe9l6kBSs8+u05RGl
 boiIAmcBOPmOFPy65VwfKS06uTA3n27+4W7nV5pPTkXkmdZvHOKWn5VDbyEGqQQvvEGWS8
 4thntxmsZzRqrkbDnUYjaEAauoYdgznfy43lUC6MgLFvf8b8gFMkNEEvTGUaY/UllMsTsB
 n4oX7FBSsawC9dqdT+D9bs/H9ARjK3ZzGjnI6wPcbGfkmK2nMQYSsN4UANbJQBA5jvuuqP
 49pNN3FAQn1PSWrTPXIK4AjdDrn4tWgiM16whmaJk2EMkHhfjNfihHkRB1Nrxw==
Date: Mon, 30 May 2022 23:32:25 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220530233225.3d7d7003@windsurf>
In-Reply-To: <20220530210243.3055759-1-fontaine.fabrice@gmail.com>
References: <20220530210243.3055759-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gcr: put back
 BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS dependency
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

On Mon, 30 May 2022 23:02:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 5452b5887005298a87650ff4003ecfaecfd9aca0 wrongly removed
> BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS dependency resulting in the
> following build failure:
> 
> Makefile:576: *** libgpg-error is in the dependency chain of libgcrypt that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/261a137824109342fd83b766a299c1eeda6ff401
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gcr/Config.in    | 2 ++
>  package/midori/Config.in | 1 +
>  2 files changed, 3 insertions(+)

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
