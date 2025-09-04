Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D14CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B263A6073A;
	Thu,  4 Sep 2025 16:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YP8VzHPC7Vyv; Thu,  4 Sep 2025 16:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 503F86072E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 503F86072E;
	Thu,  4 Sep 2025 16:34:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 419CBAE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6F6040075
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 807QMs2fuOjd for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85A8E40098
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85A8E40098
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83D6A87E99; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:06:14 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 3b818043e950511b1a413cd5f0e20c0aed712c7f
X-Git-Newrev: b92aa4d392de96fa4f10c857c81e7d7d2a2c4c61
X-Patchwork-Hint: ignore
Message-Id: <20250904163335.83D6A87E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] docs/manual: mention
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

commit: https://git.buildroot.net/buildroot/commit/?id=b92aa4d392de96fa4f10c857c81e7d7d2a2c4c61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
