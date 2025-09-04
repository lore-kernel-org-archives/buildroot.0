Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A52ECA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AEA180786;
	Thu,  4 Sep 2025 16:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQ9-50ca2ami; Thu,  4 Sep 2025 16:14:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F23C80791
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F23C80791;
	Thu,  4 Sep 2025 16:14:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D371106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2F014006D
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlWrqj_HVS3y for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FAB94005E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FAB94005E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D96F8617D; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: de2acc9071fb2c32a1bd95a75635d21f93685819
X-Git-Newrev: 608a20d7f36b815968ceb40697b6d7d9fbf15ffc
X-Patchwork-Hint: ignore
Message-Id: <20250904161348.9D96F8617D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] docs/manual: mention
 checkpackageignore file
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=608a20d7f36b815968ceb40697b6d7d9fbf15ffc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Currently, the manual doesn't mention the checkpackageignore file at
all, leaving the user under the assumption that running "make
check-package" and running utils/check-package directly on the package
they have touched would be equivalent, when the former evaluates the
checkpackageignore file while the latter does not. This could cause them
to forget to remove stale entries from that file.

Point out this difference in behavior.

Signed-off-by: Florian Larysch <fl@n621.de>
[Arnout: add that stale lines should be removed from
.checkpackageignore]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 47181a164cbfc888d81931e6e3950c379db2f786)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/manual/contribute.adoc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index ffaff6f857..f77aff9d6c 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -321,9 +321,12 @@ Now check the coding style for the changes you committed:
 $ utils/docker-run make check-package
 ----
 
-Now, you are ready to generate then submit your patch set.
+This command (unlike calling +utils/check-package+ directly) will also warn
+about any stale entries in the +.checkpackageignore+ file that your patches
+might have resolved. If this is the case, make sure to remove those lines
+from +.checkpackageignore+ as well.
 
-To generate it, run:
+Now, you are ready to generate then submit your patch set. To generate it, run:
 
 ----
 $ git format-patch -M -n -s -o outgoing origin/master
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
