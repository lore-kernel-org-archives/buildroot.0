Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6ADCD1297
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 04:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B574140111;
	Thu, 11 Apr 2024 04:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ThtipktYlLM; Thu, 11 Apr 2024 04:23:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65FBF40117
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65FBF40117;
	Thu, 11 Apr 2024 04:23:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4131BF396
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BED740253
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBe1tNJUCMzb for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 04:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A0574018E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A0574018E
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 04:23:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53E3F8600B; Thu, 11 Apr 2024 04:23:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 06:23:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd960ddd3765ec5b883ba9c6f9d921453c3e327a
X-Git-Newrev: 9abe9f518c68c021057fa5f411af37f691dbbbd9
X-Patchwork-Hint: ignore
Message-Id: <20240411042339.53E3F8600B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: regenerate
 .checkpackageignore used in TestCheckPackage
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9abe9f518c68c021057fa5f411af37f691dbbbd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ccb4e5db5c ("utils/check-package: emit library name along with check function name")
updated the .checkpackageignore format but forgot to update
.checkpackageignore files used in TestCheckPackage.

Keep .checkpackageignore_outdated as is since it must be outdated.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786785

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/utils/br2-external/.checkpackageignore         | 2 +-
 support/testing/tests/utils/br2-external/package/.checkpackageignore | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/utils/br2-external/.checkpackageignore b/support/testing/tests/utils/br2-external/.checkpackageignore
index efb7680173..2a29916d08 100644
--- a/support/testing/tests/utils/br2-external/.checkpackageignore
+++ b/support/testing/tests/utils/br2-external/.checkpackageignore
@@ -1 +1 @@
-package/external/external.mk PackageHeader
+package/external/external.mk lib_mk.PackageHeader
diff --git a/support/testing/tests/utils/br2-external/package/.checkpackageignore b/support/testing/tests/utils/br2-external/package/.checkpackageignore
index 5f4a5e1187..a9368d1c1c 100644
--- a/support/testing/tests/utils/br2-external/package/.checkpackageignore
+++ b/support/testing/tests/utils/br2-external/package/.checkpackageignore
@@ -1 +1 @@
-external/external.mk PackageHeader
+external/external.mk lib_mk.PackageHeader
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
