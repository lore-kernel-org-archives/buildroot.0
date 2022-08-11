Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4161AC25B06
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C0F82771;
	Thu, 11 Aug 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7C0F82771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voMjtsPrN9BF; Thu, 11 Aug 2022 20:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86E5D824EF;
	Thu, 11 Aug 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86E5D824EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 022581BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D19A04013D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D19A04013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oX0dfbga65Km for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:55:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8427B400E2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8427B400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:55:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8A21520002;
 Thu, 11 Aug 2022 20:55:05 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:55:04 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220811225504.1e00963e@windsurf>
In-Reply-To: <CAPi7W83tLTuFGd6MB2uLDip5fhmEkFZx7xQOzaJ5qNaOKPF4Xw@mail.gmail.com>
References: <20220809162714.1915094-1-fontaine.fabrice@gmail.com>
 <20220810230744.6b3b8bc7@windsurf>
 <CAPi7W83tLTuFGd6MB2uLDip5fhmEkFZx7xQOzaJ5qNaOKPF4Xw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660251305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQZ79p+Ep8yJqVzlr7REcTJCtBmSOycplcrQR6kPZ3Y=;
 b=ok/tuUOlOAL740NJsqclrjOLzW+pgYufvNQ2JfoCmgiwsf9aw4imvoQFj76i67scCLodaX
 /WR9A3AHw33eMQYN4Racr4BV7vqriypJBB5b4JFT7e+Dava51V92aPhIK08xUuMgSvJYZL
 qaqw+wri47wleMhihQx8xXeI58wjid22jR3wRpaedtAu+0O/+mmWl6GjzKLbhDVTKOf3BB
 We7wHGsVycNWQg0/vFPBt82jDwgKNk9b1BBv50PcJ9ORUvwjKaiBvomyAMlKyDvT2vZnbd
 nFDBTFSdEaVqy4VXy0hP3ZH0RpbWZAlePS3wtbXa4iFobdidKJr/2Vh3iU074Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ok/tuUOl
Subject: Re: [Buildroot] [PATCH v2,
 1/1] utils/genrandconfig: disable libopenssl without atomics
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Aug 2022 23:17:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Indeed, but libatomic is not available/enabled on all those autobuilder
> build failures.
> For example, BR2_TOOLCHAIN_HAS_LIBATOMIC can't be found in
> http://autobuild.buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539/config

Gah, indeed, configurations without threads, or with FLAT binaries
don't have libatomic. And indeed, propagating this dependency to all
reverse dependencies of openssl seems like a nightmare...

On the other hand, openssl is really a base library, one could see it
being enabled on a noMMU system. So real users could encounter this
build issue, if we simply avoid the problem at the autobuilder level.

I don't really have a clever idea here :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
