Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016DDC47079
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC2CD421AA;
	Fri,  5 Jan 2024 10:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC2CD421AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAXx4R_X05-3; Fri,  5 Jan 2024 10:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 029DC421A1;
	Fri,  5 Jan 2024 10:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 029DC421A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1F21BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6594383D9A
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6594383D9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPPw_iKnYp07 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A240F83DB3
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A240F83DB3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 909F78225F; Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 11:42:13 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: ae514155a16a9f5c075d8623f47ae8b323f687e7
X-Git-Newrev: c794ede3e9af773e2922f6593a9b3e6a4553a0be
X-Patchwork-Hint: ignore
Message-Id: <20240105105526.909F78225F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] doc/manual: rsync is not
 optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=c794ede3e9af773e2922f6593a9b3e6a4553a0be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

rsync is used in the infrastructure, mostly for the per-package infra,
and for the override-srcdir mechanism, but also to build the manual.
As such, it is not optional but mandatory, and already listed so.

Drop the reference to rsync from the list of optional packages.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b79fb3c224a5a8e687b0bc91dd221efcf7137ea8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.adoc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index 48be489f90..262a5153f5 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -69,7 +69,7 @@ development packages typically have a _-dev_ or _-devel_ suffix.
 In the official tree, most of the package sources are retrieved using
 +wget+ from _ftp_, _http_ or _https_ locations. A few packages are only
 available through a version control system. Moreover, Buildroot is
-capable of downloading sources via other tools, like +rsync+ or +scp+
+capable of downloading sources via other tools, like +git+ or +scp+
 (refer to xref:download-infra[] for more details). If you enable
 packages using any of these methods, you will need to install the
 corresponding tool on the host system:
@@ -78,7 +78,6 @@ corresponding tool on the host system:
 ** +cvs+
 ** +git+
 ** +mercurial+
-** +rsync+
 ** +scp+
 ** +sftp+
 ** +subversion+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
