Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D466AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 11:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 789FC419BD;
	Wed, 20 Apr 2022 11:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lj2rC-tSQH_N; Wed, 20 Apr 2022 11:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F99A4195C;
	Wed, 20 Apr 2022 11:25:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CE3B1BF5A3
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 11:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79BAD81A58
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 11:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osktWcOXx1sg for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 11:25:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 398B2823C6
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 11:25:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2DCCAC0002;
 Wed, 20 Apr 2022 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650453948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zazNzwpnpYs5UE949qXjT4GINb88Jg87xFWT+5Wy/5U=;
 b=ZVhEyYoqC11iS6Wb0c81ai2Djbz6TKg3Hf2slLkQzWWhZHqnFkl5NnPiXqnpihLza4itrZ
 j55Sy3lL2GHQM+7ozfTxVn/wfO3Dsn1d/kgFEM6StzlXWX9XbzSMdr0egt6Vqb6RBv0gfs
 F6N/TJPFz0O5lX9DFxH4fLxef4TuR0reH26N3C6RKfjy7gQ2p6wX72VDXjua6AHiNlAxOy
 5KpDDDr+qnfQUQtXUQuU6C3I15+dRTtTBYFcTQMIzxN5kHvSXi4Sgtx1zHmRAmvABvv3ch
 E4K7NzE6zwjewVfG6vhM78mi43X7HtGJPWc7FN8zKVcjiryF4+kv87SuD26Sqw==
Date: Wed, 20 Apr 2022 13:25:47 +0200
To: Thomas Perrot <thomas.perrot@bootlin.com>
Message-ID: <20220420132541.7aad1182@windsurf>
In-Reply-To: <aa8ded3d92323550b31ac24dd2ad283d13307a0e.camel@bootlin.com>
References: <20220419092151.91638-1-thomas.perrot@bootlin.com>
 <20220419092151.91638-3-thomas.perrot@bootlin.com>
 <20220419142635.008ac004@windsurf>
 <aa8ded3d92323550b31ac24dd2ad283d13307a0e.camel@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/imx-cst: add new package
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

Hello,

On Wed, 20 Apr 2022 10:39:16 +0200
Thomas Perrot <thomas.perrot@bootlin.com> wrote:

> > What is this location? Just someone who put the NXP code online? Or a
> > separate implementation?  
> 
> NXP code has been put by Debian maintainers.

OK.

> I think it is correct because from source the file
> "Software_Content_Register_CST.txt" indicates that the outgoing license
> is BSD-3-Clause, and Debian also use this BSD license.

Indeed, it seems OK.

Maybe it would have been useful to have those details somewhere (in the
commit log perhaps)? But it's probably not worth sending another
iteration just for this.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
