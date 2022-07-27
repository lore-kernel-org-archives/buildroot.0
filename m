Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC81C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 714A540498;
	Wed, 27 Jul 2022 10:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714A540498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wjl89qmb6AJi; Wed, 27 Jul 2022 10:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96B53403B8;
	Wed, 27 Jul 2022 10:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B53403B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E562E1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCD7D60B7D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCD7D60B7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXq9_u_1Y3GM for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:07:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8052760B6A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8052760B6A
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:07:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 184381BF20B;
 Wed, 27 Jul 2022 10:07:04 +0000 (UTC)
Date: Wed, 27 Jul 2022 12:07:04 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20220727120704.02128546@windsurf>
In-Reply-To: <20220727083730.3141497-1-buildroot@heine.tech>
References: <20220727083730.3141497-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658916425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8/bbIYJXmv2iCLcHyq7g5VpiqTkHBj4zHfiqo1ZyH4=;
 b=OhbUN0EcvKuCGKRNJ+5KEQZBeJhu3aXgbrx9dXM7zBC34Rc79TGQQHr5sFykQSoRqa6SWK
 r2qvi8L3oG3i5hYePdl51elzXc2xHG+dx5RNUK4JRfJSOx6kvnONK88Jurvc1LbasYk09y
 ezNDB0v20Dqd4m9YRaAlAdTu0VmjD52HXav61G6G3mGWLpeFBdp1VCnuu+I0/9tDYCj+Uq
 CcWTxR7jLGRSr04+oPd8/PS64lU/+nb0jVahYyng+YRnomNh7VVf4bkn2Ui/jXctKMrcpU
 K4e7dKdjrVXDAagCO6eqdJJ/LBz4KjK0Bst3eO5ecgrSjAzp5XBRF09QdA0uyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OhbUN0Ec
Subject: Re: [Buildroot] [PATCH] package/grpc: bump to version 1.48.0
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 10:37:30 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> - rework host-grpc-only-cpp-plugin.patch to match changed CMakeLists.txt
> - reintroduce patch to fix cross_compile with host grpc_cpp_plugin [1]
> - add patch to disable unconditionally downloading repos of 3rd party APIs not
>   used in build [2]
> 
> [1] https://github.com/grpc/grpc/pull/30378
> [2] https://github.com/grpc/grpc/issues/30385
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  ...h => 0003-host-grpc-only-cpp-plugin.patch} | 91 +++++++++----------
>  .../0004-fix-grpc-plugin-cross-compile.patch  | 43 +++++++++
>  ...nconditionally-downloading-api-repos.patch | 39 ++++++++
>  package/grpc/grpc.hash                        |  2 +-
>  package/grpc/grpc.mk                          |  2 +-
>  5 files changed, 125 insertions(+), 52 deletions(-)
>  rename package/grpc/{0004-host-grpc-only-cpp-plugin.patch => 0003-host-grpc-only-cpp-plugin.patch} (61%)
>  create mode 100644 package/grpc/0004-fix-grpc-plugin-cross-compile.patch
>  create mode 100644 package/grpc/0005-disable-unconditionally-downloading-api-repos.patch

Applied to master, thanks. I must say I really appreciate the fact that
you have submitted the patch upstream, and raised upstream the issue of
things being downloaded by the package. Good stuff!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
