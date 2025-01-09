Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9652E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE83D401D1;
	Thu,  9 Jan 2025 09:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4kGNvSJe1U5; Thu,  9 Jan 2025 09:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F14F406F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F14F406F5;
	Thu,  9 Jan 2025 09:24:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FE9A940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1AFC80B14
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvatigLvcfTP for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DED0280526
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DED0280526
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF27283FA0; Thu,  9 Jan 2025 09:24:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 10:01:54 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 18fa9c60ef80d74c3ec626f90d64bb1bdfb909b7
X-Git-Newrev: 0ad5993c480f3b1c50f9a32d486e9d9f96f37bfc
X-Patchwork-Hint: ignore
Message-Id: <20250109092421.BF27283FA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/dependencies:
 remove confusing comment about host system python
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0ad5993c480f3b1c50f9a32d486e9d9f96f37bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Since commit 9c0c7846cdb6 (support/dependencies: don't check for python
on the host), we no longer check for a host python interpreter installed
on the system.

Drop the comment in support/dependencies/check-host-python3.sh, as it is
now confusing.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3722998a3d0b771154b5069798f55ff9ea2c81bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/check-host-python3.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/dependencies/check-host-python3.sh b/support/dependencies/check-host-python3.sh
index 17cafd2883..380b19ccf7 100755
--- a/support/dependencies/check-host-python3.sh
+++ b/support/dependencies/check-host-python3.sh
@@ -7,8 +7,6 @@ version_min="$(echo ${1} | awk '{ split($1, v, "."); print v[1] v[2] }')"
 
 shift
 
-# The host python interpreter is already checked by dependencies.sh but
-# it only check if the version is at least 2.7.
 # We want to check the version number of the python3 interpreter even
 # if Buildroot is able to use any version but some packages may require
 # a more recent version.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
