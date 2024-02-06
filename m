Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F52C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75365415C2;
	Tue,  6 Feb 2024 16:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75365415C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMC2J6EryLuy; Tue,  6 Feb 2024 16:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72105416D2;
	Tue,  6 Feb 2024 16:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72105416D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72ACE1BF2FE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D5B281B10
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRV9Z9754s8R for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACF9081AF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACF9081AF3
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96B118711A; Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:02:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbcdb086677e73a0f0b7ceb6919619c3712b60ee
X-Git-Newrev: fba40a9f39cbd6b3f662073d148aad371dc07964
X-Patchwork-Hint: ignore
Message-Id: <20240206160322.96B118711A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/readme.txt: expand check-package
 description
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

commit: https://git.buildroot.net/buildroot/commit/?id=fba40a9f39cbd6b3f662073d148aad371dc07964
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package does a lot more by now than checking .mk and
Config.in files. Add this to the description.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/readme.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utils/readme.txt b/utils/readme.txt
index 3e8833c4ea..d5cda70bfc 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -12,8 +12,11 @@ brmake
     nothing.
 
 check-package
-    a script that checks the coding style of a package's Config.in and
-    .mk files, and also tests them for various types of typoes.
+    a script that checks the coding style across the buildroot tree. It
+    checks package's Config.in and .mk files, runs shellcheck for all shell
+    scripts, flake8 for python files, checks for typoes, etc.
+    It checks the .checkpackageignore file if errors should be ignored and
+    errors if there's a file listed that doesn't produce an error.
 
 genrandconfig
     a script that generates a random configuration, used by the autobuilders
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
