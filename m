Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEFDC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 19:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E5E5408A7;
	Sat, 15 Jun 2024 19:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qO54-20QiHOa; Sat, 15 Jun 2024 19:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CC26408EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CC26408EC;
	Sat, 15 Jun 2024 19:04:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E69B81BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97A016061B
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeae2M4tW3KM for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C631160659
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C631160659
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1C6187F16; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 20:29:39 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6ec2b2cad4c0bd45de77ef7290be79deb1b0cfaf
X-Git-Newrev: c091bd89cf58c19cdd49cb79f031effd1123e896
X-Patchwork-Hint: ignore
Message-Id: <20240615190415.C1C6187F16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/download/cvs: fix
 shellcheck
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

commit: https://git.buildroot.net/buildroot/commit/?id=c091bd89cf58c19cdd49cb79f031effd1123e896
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 84309d7071de9c54a3633967eb2abaa75b8dc9f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore  | 1 -
 support/download/cvs | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d7681a4db6..051287841e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1439,7 +1439,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
 support/dependencies/dependencies.sh Shellcheck
 support/download/bzr ConsecutiveEmptyLines Shellcheck
 support/download/cargo-post-process Shellcheck
-support/download/cvs Shellcheck
 support/download/dl-wrapper Shellcheck
 support/download/file Shellcheck
 support/download/go-post-process Shellcheck
diff --git a/support/download/cvs b/support/download/cvs
index 0c079e2403..b771caf280 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -40,12 +40,13 @@ shift $((OPTIND-1)) # Get rid of our options
 # 10 minutes should do the trick.
 _cvs() {
     if [ -z "${quiet}" ]; then
-        printf '%s ' timeout 10m ${CVS} "${@}"; printf '\n'
+        printf '%s ' timeout 10m "${CVS}" "${@}"; printf '\n'
     fi
     _plain_cvs "$@"
 }
 # Note: please keep command below aligned with what is printed above
 _plain_cvs() {
+    # shellcheck disable=SC2086  # We really want word splitting in CVS
     eval timeout 10m ${CVS} "${@}"
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
