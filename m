Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260C7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 20:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4010812BD;
	Sun, 13 Feb 2022 20:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6eF5UvHeYj21; Sun, 13 Feb 2022 20:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3619481286;
	Sun, 13 Feb 2022 20:45:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FB8B1BF83E
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C3274026A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fe5edVDNo6QB for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 20:45:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B95C40193
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 20:45:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 266B0240006;
 Sun, 13 Feb 2022 20:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644785102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1pEPqLSx+V/v9mGqGfL84mJadSPpqtCi6sTHqPSLHM0=;
 b=ZA3BmQgDZast3RcPHxjjtPkCrze/KIyrszSEofLRULyQ8bCAwmWerZrOYpU8ZUu82Ve21E
 TrIjQChtkOoD9eBxnECocfmb1b/36/EpRTI5DGDQFlK8FYw1jCkTLg0+DoOehNgvREwsK8
 JCbiW7bI8MOfgKWc9iLXSe0MfO7mPfyZ4uF7XYVm87OY24ZnBVaKimH0JGHyIgmL9I3hpE
 +cGzft2eEeEx1EgAxtZ43Oydc5hHPiHG2s2298ljg45pIWC63DGZhp/N/KoYVEfuy3GxAy
 vY/IE8LL4NqqUUorH0Nz95GKrK/GAMo0mw7p4bEuX1GpYqeDLFZEgzf/81G3LQ==
Date: Sun, 13 Feb 2022 21:45:01 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220213214501.29dbc301@windsurf>
In-Reply-To: <Ygalu5jOo9skIxRc@waldemar-brodkorb.de>
References: <Ygalu5jOo9skIxRc@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/binutils: fixes glibc build
 compiled with -Os on x86
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

On Fri, 11 Feb 2022 19:06:51 +0100
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here:
> https://sourceware.org/bugzilla/show_bug.cgi?id=28870
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Is this patch also needed for binutils 2.38 ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
