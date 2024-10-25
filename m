Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87070D149F2
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 21:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31974412AC;
	Fri, 25 Oct 2024 21:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVQZV3XW6qTL; Fri, 25 Oct 2024 21:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F216F412B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F216F412B0;
	Fri, 25 Oct 2024 21:09:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D17552318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B37AA82098
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KU-yV8e60nAS for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 21:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC30982095
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC30982095
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:09:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96AE983874; Fri, 25 Oct 2024 21:09:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 22:52:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4ba07505d7bdc5b1a6509a025f84001f3501fe4
X-Git-Newrev: 44fafcc41aca4c32ecd937c4b7ae93b7a713d9f2
X-Patchwork-Hint: ignore
Message-Id: <20241025210930.96AE983874@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xenomai: bump to version 3.2.5
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=44fafcc41aca4c32ecd937c4b7ae93b7a713d9f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous download URL does not contain the most recent versions, so
it was necessary to change it to bump to the current version.

No license file has been changed.

[Romain:
  - remove 3.0.10 patches
  - Update XENOMAI_AUTORECONF comment]
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...rser-Allow-building-with-GCC-10-2-2020101.patch | 1721 --------------------
 .../0002-Add-disable-demo-testsuite-options.patch  |   94 --
 ...e-valid-addresses-for-pthread_setspecific.patch |   57 -
 ...atency-Use-corresponding-pclose-for-popen.patch |   30 -
 ...01-lib-psos-task.c-fix-build-with-gcc-12.patch} |    0
 .../3.2.5/0002-smokey-fix-build-failure.patch      |   55 +
 package/xenomai/Config.in                          |    2 +-
 package/xenomai/xenomai.hash                       |    2 +-
 package/xenomai/xenomai.mk                         |    4 +-
 9 files changed, 59 insertions(+), 1906 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
