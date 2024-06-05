Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98AFC27C52
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 862D741727;
	Wed,  5 Jun 2024 21:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxR7R02FMVq6; Wed,  5 Jun 2024 21:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1715E41797
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1715E41797;
	Wed,  5 Jun 2024 21:54:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F5511BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72F766117C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGfT2SPXUcfb for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BF6261144
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BF6261144
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:54:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1B0D87BCA; Wed,  5 Jun 2024 21:54:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Jun 2024 23:33:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86f6c7929e4afcdeff72bb475d31af9fb9f00f60
X-Git-Newrev: 84309d7071de9c54a3633967eb2abaa75b8dc9f9
X-Patchwork-Hint: ignore
Message-Id: <20240605215430.D1B0D87BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/cvs: fix shellcheck
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=84309d7071de9c54a3633967eb2abaa75b8dc9f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore  | 1 -
 support/download/cvs | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6799b027c6..d0bd179a5c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1650,7 +1650,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
 support/dependencies/dependencies.sh Shellcheck
 support/download/bzr Shellcheck lib_shellscript.ConsecutiveEmptyLines
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
