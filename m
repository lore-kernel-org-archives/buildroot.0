Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F922C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAC6A405D9;
	Thu, 28 Apr 2022 21:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xk3ndZZQ67sp; Thu, 28 Apr 2022 21:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE6644049A;
	Thu, 28 Apr 2022 21:55:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB1C41BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D93B960B58
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zijdazKYzcna for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:55:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D167E60B4A
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:55:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A30CD240002;
 Thu, 28 Apr 2022 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651182938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Sb5GPOUGjFhCcUF620mBxNxRMLhxJ2O4Bn/Pdv5Usw=;
 b=PPG1m7HRQR1ZVpnG8q7wkVmtLEORbSNF6N3ClV3kgiOq0jndGDLYzxTrbc4ZARjZ2NQ8ai
 TLePNAnDkpd21HmrUhpM57fFJLfMlZVzbuuy9+iTLO+yqASVYtIfKeCInGJn+lzuxhpwrf
 zSYyu6au57qTJAE2QD3XX7gN0m2Te09S/HR5/3FqswaNEaVe1aXBqvzPVkFuRO9o8dpuJI
 HgfDCs1oGGS1jirmosgqeVuLJWUg130E1o9t2Qs/92yovGdri1OP0UpOSi81OnQpJBmIbq
 GPnXM9cIUaxD2h4yA/SXc6si4HGOT1zxdq2o8UL2g+prDICj3wL+2Py6Bh4Y1g==
Date: Thu, 28 Apr 2022 23:55:36 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220428235536.73948423@windsurf>
In-Reply-To: <20220428215003.GG3624965@scaer>
References: <20220428212011.534725-1-thomas.petazzoni@bootlin.com>
 <20220428215003.GG3624965@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Revert "toolchain/toolchain-external: error
 if BR2_TOOLCHAIN_EXTERNAL_PATH is not set"
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Kristof Havasi <havasiefr@gmail.com>, Buildroot List <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Apr 2022 23:50:03 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2022-04-28 23:20 +0200, Thomas Petazzoni via buildroot spake thusly:
> > This reverts commit 8945ba49480a7885d104445ca855ef7681a374ff.  
> 
> This is a commit on the 2022.02.x branch; it is a backport of
> 8e91385a2cb81c5f8114354f4494230e2aebb93a on master.
> 
> Did you meant this patch to be applied only to 2022.02.x?

No.

> I would believe it should be applied to master and backported to 2022.02
> instead, no?

Yes, absolutely. I referred to 8e91385a2cb81c5f8114354f4494230e2aebb93a
because that's what the bug reporter pointed to as the offending
commit, as the bug report is on the 2022.02.x branch.

Though I agree the commit log should probably refer to the commit in
master. I can send a v2 if needed.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
