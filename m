Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FC7C0015E
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E8F41E67;
	Tue, 11 Jul 2023 21:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75E8F41E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvQEHKmHHv1i; Tue, 11 Jul 2023 21:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5885B41E84;
	Tue, 11 Jul 2023 21:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5885B41E84
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E6291BF32D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67B5C8361C
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B5C8361C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hXKaoJOFt4X for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:29:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 281768330B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 281768330B
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:29:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25C8AC0003;
 Tue, 11 Jul 2023 21:29:38 +0000 (UTC)
Date: Tue, 11 Jul 2023 23:29:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230711232936.33654562@windsurf>
In-Reply-To: <20230708150322.1353246-1-bernd@kuhls.net>
References: <20230708150322.1353246-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689110978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9W9NQN/q+ND/VQpCZDkDjCHw0I5WQfk94653UpK/cyI=;
 b=PSEZ+VRWBcdOm1Qg4ZXB/97xNzx+t/HXKPeeXsmaTjyl0oFMhN9XkIMob5mcq+gVMlBtIT
 05GK7v24lVN8V64qZcg7VFRM2rIMCoT4AF8PtruoM7WymvbrlnAIvwkfaYtzCUwROWHTzj
 fVJJbc/RW4ZRX0JAql0LWz7y9glbFryurHuMUiZxVq0yaCokETf/nOc8wO4cQpVm2y+5WW
 INoRWm/QgkwhqYlV7XEg4QCEjvLUiLNk2eYAhJVppWFMdzTLkpWtUtjgr3fw7pBjNUCOVj
 rMM4IGNJPdvhhaktK8rgRmwBYBdL0FE6HIwy5yuWVYBUCVyOxKx+XcIzuANG/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PSEZ+VRW
Subject: Re: [Buildroot] [PATCH 1/1] package/igh-ethercat: bump to latest
 Git commit
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

On Sat,  8 Jul 2023 17:03:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed_POST_PATCH_HOOKS, not needed anymore due to upstream commit
> https://gitlab.com/etherlab.org/ethercat/-/commit/3bc8703f5cf021d21730cd3ac3da839973b914e9
> 
> This bump will only fix kernel 6.3-related build errors by upstream
> commit
> https://gitlab.com/etherlab.org/ethercat/-/commit/e35f35b25c43b9f6fa967b2ae92462034a14bc8d
> 
> Fixes:
> http://autobuild.buildroot.net/results/ffc/ffc00cc9f949bfc692edc287867ca1e3c86edea1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/igh-ethercat/igh-ethercat.hash | 2 +-
>  package/igh-ethercat/igh-ethercat.mk   | 8 +-------
>  2 files changed, 2 insertions(+), 8 deletions(-)

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
