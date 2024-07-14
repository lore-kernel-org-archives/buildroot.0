Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C04C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA77813FF;
	Sun, 14 Jul 2024 09:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APiX72Q2E1po; Sun, 14 Jul 2024 09:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38D7C8142F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38D7C8142F;
	Sun, 14 Jul 2024 09:08:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19EF41BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE15781375
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDPdkr9sEOo2 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E604E8137A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E604E8137A
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D378886735; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 10:16:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7dc2ccdb085447c9c3c9d94014bd4ca518acc19
X-Git-Newrev: 2cbcc0f7709976dec45aeefba9434b74a86682e2
X-Patchwork-Hint: ignore
Message-Id: <20240714090820.D378886735@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/cargo-post-process: fix
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2cbcc0f7709976dec45aeefba9434b74a86682e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                 | 1 -
 support/download/cargo-post-process | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d36a70c18f..8f039962a0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1527,7 +1527,6 @@ support/dependencies/check-host-tar.sh Shellcheck
 support/dependencies/check-host-xzcat.sh Shellcheck
 support/dependencies/dependencies.sh Shellcheck
 support/download/bzr Shellcheck lib_shellscript.ConsecutiveEmptyLines
-support/download/cargo-post-process Shellcheck
 support/download/file Shellcheck
 support/download/go-post-process Shellcheck
 support/download/hg Shellcheck
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 3f4666c006..b94b160315 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -2,6 +2,7 @@
 
 set -e
 
+# shellcheck source=helpers source-path=SCRIPTDIR
 . "${0%/*}/helpers"
 
 while getopts "n:o:" OPT; do
@@ -28,7 +29,7 @@ mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
-    --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
+    --manifest-path "${BR_CARGO_MANIFEST_PATH-Cargo.toml}" \
     --locked VENDOR \
     > .cargo/config
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
