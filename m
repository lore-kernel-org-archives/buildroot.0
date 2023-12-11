Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BCAC4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 08:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2B02416AB;
	Mon, 11 Dec 2023 08:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B02416AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id APfRVYj0cJTV; Mon, 11 Dec 2023 08:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5012416A3;
	Mon, 11 Dec 2023 08:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5012416A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCE8F1BF3A4
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2A328218F
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2A328218F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbHviWCKMDSx for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 08:24:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63B6B8216C
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63B6B8216C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EFD587A9D; Mon, 11 Dec 2023 08:24:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Dec 2023 09:21:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aaa9438b96f88b1ecbf5eb9a1aebef8010835b8d
X-Git-Newrev: b79fb3c224a5a8e687b0bc91dd221efcf7137ea8
X-Patchwork-Hint: ignore
Message-Id: <20231211082412.3EFD587A9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] doc/manual: rsync is not optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=b79fb3c224a5a8e687b0bc91dd221efcf7137ea8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rsync is used in the infrastructure, mostly for the per-package infra,
and for the override-srcdir mechanism, but also to build the manual.
As such, it is not optional but mandatory, and already listed so.

Drop the reference to rsync from the list of optional packages.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
