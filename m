Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AABCA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 20:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5434183F09;
	Thu, 28 Aug 2025 20:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfpsfaETv2tt; Thu, 28 Aug 2025 20:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33A4183EEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33A4183EEC;
	Thu, 28 Aug 2025 20:35:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B436C92E
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A57FE83ED9
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toZeRYMFVfnb for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 20:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0014783ED7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0014783ED7
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E685A87C72; Thu, 28 Aug 2025 20:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 22:22:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bd88146ee355109faf55f73133dc8d8632d8ba1
X-Git-Newrev: 47181a164cbfc888d81931e6e3950c379db2f786
X-Patchwork-Hint: ignore
Message-Id: <20250828203527.E685A87C72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: mention checkpackageignore
 file
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47181a164cbfc888d81931e6e3950c379db2f786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
