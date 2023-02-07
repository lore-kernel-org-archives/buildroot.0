Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE62AC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 09:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF93815CD;
	Tue,  7 Feb 2023 09:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF93815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhEtGjlD7ezi; Tue,  7 Feb 2023 09:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8688181516;
	Tue,  7 Feb 2023 09:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8688181516
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72FF91BF2C2
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A5E141754
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A5E141754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XavCBjL_4YdU for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 09:23:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCBFA41751
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCBFA41751
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 09:23:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8C85BFF814;
 Tue,  7 Feb 2023 09:23:27 +0000 (UTC)
Date: Tue, 7 Feb 2023 10:23:26 +0100
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230207102326.6d541a84@windsurf>
In-Reply-To: <a0e36432-a05a-6e7f-53c0-2d8f1055d26a@smile.fr>
References: <20220624221901.514921-1-mmayer@broadcom.com>
 <a0e36432-a05a-6e7f-53c0-2d8f1055d26a@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675761808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuO23K8BcBHmg+P+N5Tv+Xpn/Tiup+6RLhZG/7giDNA=;
 b=XrWsBASXui6Jgmac8wFNLePbxVaFpFczvsOO0VNgDv4ZUlHzO3rdfafwy5TMkNuJ1pSTpV
 STMq4LD9iaM2CD9izyCY1wcWcMJtkT4NzYXwFpGpinQRr8AXtSydOVkp66RwrwWmOzdHrL
 +VifI0+gmfQbkogkc5UK9qKZSAM0mm9ta3gSx+abLTy45j6TwbliZqOFxITtAz9ESO/QOn
 /uXnqSw/3QXvu5fQo5B5fsbeJbMvSlQNagGNh4oTPF+KnDyJ06/gdVm/bev8SUCsA0J/iV
 BO8P9jh58zzn3eyHhUcDNIEqiyMrluF2/OVcDIp/O98TTRUT69kDeymifO94xQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XrWsBASX
Subject: Re: [Buildroot] [PATCH] toolchain-external: handle case of dangling
 symlink
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
Cc: Markus Mayer <mmayer@broadcom.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Wed, 11 Jan 2023 15:47:50 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > +				if [ "$${LIBPATH}" = "" ]; then \
> > +					echo "LIBPATH empty after trying to resolve symlink $${OLD_LIBPATH}" 1>&2; \
> > +					exit 1; \
> > +				fi; \  
> 
> I'm not sure it's ok to fail here on a dangling symlink.
> Maybe add a check and ignore such dangling symlink with a warning for the user.
> 
> It's unlikely that such dangling symlink provided by the toolchain will be useful.

I hesitated a bit on this. But for now, I believe a toolchain with a
dangling symlink is badly broken, and we should not work with it. A
warning message with a build continuing will never be noticed by the
user, so if we don't abort with hard error, nobody will notice. So I
applied the patch of Markus as is for now.

We will see if people complain that this breaks with their toolchain,
and if it does, we will change the exit to a break to simply move on to
handle the next library.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
