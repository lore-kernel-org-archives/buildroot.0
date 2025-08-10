Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC32C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 18:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A84F82365;
	Sun, 10 Aug 2025 18:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PTVrhVEPQeM; Sun, 10 Aug 2025 18:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D0D82368
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D0D82368;
	Sun, 10 Aug 2025 18:17:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87DEA154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 797B28148A
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7itWDJ4qCoOH for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 18:17:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C3D582364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C3D582364
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C3D582364
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:17:51 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 34A45E00346; Sun, 10 Aug 2025 20:17:49 +0200 (CEST)
Date: Sun, 10 Aug 2025 20:17:49 +0200
From: Florian Larysch <fl@n621.de>
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	buildroot@buildroot.org
Message-ID: <20250810181749.43yrkmkud44pxwib@n621.de>
References: <20250725184609.3794-1-fl@n621.de>
 <20250728225205.2c22044b@windsurf>
 <20250728212043.uxfacpm3fovokhcq@n621.de>
 <3b344658-7e1d-43e9-89bf-c776ba0c39b6@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b344658-7e1d-43e9-89bf-c776ba0c39b6@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1754849869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BIZzIVwVeL/9r2JDCWYa/NBfFSXj4cZrxKGInoeSCU4=;
 b=XaPwt2voZj89nvZIOF1U0sjOhP+jg/hAG0uXSrsccNyHMNqepTccHTOYZXilX7ug5ZyV0F
 hwRKD5Yp7v+s2RAEHlzyf7U51Z54PECXJYZi9qU7ndFcUtal6wchB2qZ2ZH0WbqJzRDMBO
 EIEp7YPopcSnSuyb1gXhejNA5YAhqEY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=XaPwt2vo
Subject: Re: [Buildroot] [PATCH 1/1] package/libmbus: switch to git repo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Sun, Aug 10, 2025 at 08:00:58PM +0200, Romain Naour via buildroot wrote:
> Well, a working link is better than a broken one.

Fair. I'll change it.

> Actually there is a new release 0.9.0 from 2019

Yeah I wanted to separate the build fix from the version bump so that
the former could be backported to stable releases. I was going to send
that after this got merged. But I can also batch up both changes in a
series if I'm going to respin it anyway if that's better?

> but if this package is not used or updated it can be a candidate for
> removal.

This feels like the kind of package that is going to have a number of
downstream users in Buildroot. Also, there has been some activity on the
master branch recently[1]. All in all I'd lean towards keeping it around
unless it causes further problems.

Florian

[1] https://github.com/rscada/libmbus/commits/master
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
