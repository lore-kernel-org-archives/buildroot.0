Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0B5C47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 15:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F08D60B05;
	Tue, 16 Jan 2024 15:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F08D60B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YblvgPmKWei4; Tue, 16 Jan 2024 15:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1B45607E1;
	Tue, 16 Jan 2024 15:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1B45607E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 384F31BF3B5
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 15:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10B9482662
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 15:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10B9482662
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4IzQQMkKuhM for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 15:37:56 +0000 (UTC)
X-Greylist: delayed 311 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 16 Jan 2024 15:37:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0489E82542
Received: from office2.cesnet.cz (office2.cesnet.cz [78.128.248.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0489E82542
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 15:37:55 +0000 (UTC)
Received: from localhost (unknown
 [IPv6:2a07:b241:1002:700:a0a2:fe43:b8a0:b714])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by office2.cesnet.cz (Postfix) with ESMTPSA id 52F0B1180072
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 16:32:40 +0100 (CET)
To: <buildroot@buildroot.org>
Date: Tue, 16 Jan 2024 16:32:37 +0100
MIME-Version: 1.0
Message-ID: <ee6bc481-faaf-4d84-a450-d9a2730f9fda@cesnet.cz>
In-Reply-To: <20240111105621.2321957-1-peter@korsgaard.com>
References: <20240111105621.2321957-1-peter@korsgaard.com>
Organization: CESNET
User-Agent: Trojita/unstable-2022-08-22; Qt/5.15.11; wayland; Linux; 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cesnet.cz; s=office2-2020; t=1705419161;
 bh=KuVx0t/B9Lu8cP637uR3uA7ABv6IFPfJe/1zYEVCjf4=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=P9AAwMKIaHRLpAwujiWsGsPMrj6qw94ba54aUvKiwpkTiIzXgaPlIDuszuA/p2zwx
 3XZvcXSJQxid+bIbcf0EBcYZi0bwm2dhKEyiXJjBWIj0+YFZEy04HgdW8hwIiA20PW
 FB4mY/0jbQOj4K0x46lLg3zjXp9IW4/qQc1Ojy1PXB9mi0X/fXIFmLJjVBLAtuAN77
 dUyVqPPC6KxLwmj0kORqLYa9pR3P7yt+UFvYHGK+XuzRZrDzVHVoWMraMhsBtlzGyP
 o3TzaJd0o/ZVO8sFFRKiwELSLq4rKDIoVDVJVtCJ/i8uFH2w9vAQG9Fmzmn++vB8/N
 fsoZZ7jdf0fyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=cesnet.cz header.i=@cesnet.cz
 header.a=rsa-sha256 header.s=office2-2020 header.b=P9AAwMKI
Subject: Re: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_1/2=5D_package/Makefile=2Ein?=
 =?iso-8859-1?q?=3A_set_GIT=5FDIR=3D=2E_in_=7BHOST=2C_TARGET=7D=5FMAKE=5FE?=
 =?iso-8859-1?q?NV?=
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
From: =?utf-8?q?Jan_Kundr=C3=A1t_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> In the context of Buildroot the packages are never built in their own git
> checkout, so pass GIT_DIR=.  to ensure git doesn't walk back up the
> directory tree and finds the Buildroot git repo, which fixes the rauc (and
> similar) issues.

This has caused a regression for us.

We're using Zuul CI [1] which is set up so that any patch that's uploaded 
for review in any of our internal projects also triggers a test build 
through Buildroot. Some of these builds would use sequences of yet-unmerged 
patches, so tracking version info of each component is crucial, which is 
why we're puting all that into the target's /etc/os-release, as well as 
relaying on the build system to call an equivalent of a `git describe` for 
each of our projects.

For this feature, we're relying on a few hooks:

- Zuul itself produces the correct content as a git checkout in a scratch 
directory,

- Buildroot is configured via `local.mk` to use that checkout as a source 
[2]

- a custom hook sets up the redirection via the `gitdir` statement in the 
buidlroot's copy of the source directory [3], this redirection however  
takes effect at runtime (see [4])

- the build script of each app then simply runs `git describe` with a few 
flags for output formatting; the apps currently do not have a way of 
accepting some externally provided version strings.

Some of our projects use git submodules, which means that manipulating 
.gitdir has to be done carefuly. The TL;DR version is that this is a bit 
more complex than just putting a version override into a file. In short, 
there's already a git checkout that's been prepared with accurate version 
info, and it makes sense to use that info as-is -- or it has worked well 
for us in the past three years :), up until this commit.

How are you guys solving this problem in your CI systems? Is there a chance 
of undoing this global GIT_DIR which, unfortunately, takes precedence over 
the projects' own .gitdir mechanism?

With kind regards,
Jan

[1] https://zuul-ci.org/
[2] 
https://gerrit.cesnet.cz/plugins/gitiles/CzechLight/br2-external/+/b1066e39fe136c4996f7d13b6003a958c1ea40a2/dev-setup-git.sh#10
[3] 
https://gerrit.cesnet.cz/plugins/gitiles/CzechLight/br2-external/+/b1066e39fe136c4996f7d13b6003a958c1ea40a2/dev-setup-git.sh#31
[4] 
https://gerrit.cesnet.cz/plugins/gitiles/CzechLight/br2-external/+/7a9d8b0d8f3cefedf708368bba463c89556dfa9e%5E%21/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
