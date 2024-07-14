Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D13C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B225480EBF;
	Sun, 14 Jul 2024 09:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGnBUAnWzeXi; Sun, 14 Jul 2024 09:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70C180B96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D70C180B96;
	Sun, 14 Jul 2024 09:08:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5391BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D13F81376
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMPNH6sYux8e for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CAE08138E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CAE08138E
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5979881D7D; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 10:50:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19c76b190dec4e569baee16efcda33183536370c
X-Git-Newrev: 804edd8683d5e7413dd4ec3715c2f7b8bb742684
X-Patchwork-Hint: ignore
Message-Id: <20240714090821.5979881D7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: rephrase end of vendoring
 section
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

commit: https://git.buildroot.net/buildroot/commit/?id=804edd8683d5e7413dd4ec3715c2f7b8bb742684
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current phrasing is not entirely clear: one could read it as if
Buildroot will detect if there's an update available in one of the
dependencies, which is quite the reverse of what we do. Rephrase the
sentence in a way that hopefully makes it clearer that we're just making
a hash of the dependencies.

While we're at it, also extend the sentence about offline builds a
little.

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-packages-cargo.adoc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
index 1d476589f8..4df758537b 100644
--- a/docs/manual/adding-packages-cargo.adoc
+++ b/docs/manual/adding-packages-cargo.adoc
@@ -93,7 +93,9 @@ takes care of downloading such dependencies as part of the download
 step of packages that use the +cargo-package+ infrastructure. Such
 dependencies are then kept together with the package source code in
 the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
-the package's tarball includes such dependencies.
-
-This mechanism ensures that any change in the dependencies will be
-detected, and allows the build to be performed completely offline.
+the package's tarball doesn't only cover the source of the package
+itself, but also covers the sources of the dependencies. Thus, a change
+injected into one of the dependencies will also be discovered by the
+hash check. In addition,  this mechanism allows the build to be
+performed completely offline since cargo will not do any downloads
+during the build. This mechanism is called vendoring the dependencies.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
