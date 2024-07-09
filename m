Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EC6C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9CDC409F1;
	Tue,  9 Jul 2024 09:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkE4NStZd7gT; Tue,  9 Jul 2024 09:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7352409F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7352409F2;
	Tue,  9 Jul 2024 09:42:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E43B11BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE9388146A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6s7NvXvFBKj for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:42:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B6A881469
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B6A881469
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 09:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12B70842E2; Tue,  9 Jul 2024 09:42:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 11:42:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99ec566bcf793d7abf55fd0b7e656abb6a4fcf95
X-Git-Newrev: a7e270bf65b3c8e6de3b419bd31f1dd8e770ea6b
X-Patchwork-Hint: ignore
Message-Id: <20240709094242.12B70842E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/paxtest: update the patches to be
 applied with fuzz 0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7e270bf65b3c8e6de3b419bd31f1dd8e770ea6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, paxtest fails to build with output:

    Applying 0001-genpaxtest-move-log-location.patch using patch:
    patching file genpaxtest
    Hunk #1 FAILED at 35.
    1 out of 1 hunk FAILED -- saving rejects to file genpaxtest.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/paxtest/0001-genpaxtest-move-log-location.patch | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/paxtest/0001-genpaxtest-move-log-location.patch b/package/paxtest/0001-genpaxtest-move-log-location.patch
index 6447d53c96..fa18815d6d 100644
--- a/package/paxtest/0001-genpaxtest-move-log-location.patch
+++ b/package/paxtest/0001-genpaxtest-move-log-location.patch
@@ -7,6 +7,8 @@ Move log location to /var/log instead of local directory.
 (For read-only filesystems)
 
 Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  genpaxtest | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
@@ -16,15 +18,14 @@ index 5a22e15..d62b15e 100644
 --- a/genpaxtest
 +++ b/genpaxtest
 @@ -35,7 +35,7 @@
-        exit 1
+ 	exit 1
  fi
-
+ 
 -LOG=\$HOME/paxtest.log
 +LOG=/var/log/paxtest.log
  [ -n "\$1" ] && LOG=\$1
  touch "\$LOG"
  if [ ! -e "\$LOG" ]; then
- 
 -- 
 1.9.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
