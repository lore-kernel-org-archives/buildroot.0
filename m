Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F73C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D7B84013F;
	Fri,  5 Jan 2024 10:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D7B84013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6UyypTceSr9; Fri,  5 Jan 2024 10:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95ECC4009E;
	Fri,  5 Jan 2024 10:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95ECC4009E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53A961BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F2B8421CC
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F2B8421CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJ3VPwa9_2r4 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D7C042176
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D7C042176
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C9F1843FA; Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 11:42:30 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 830d78fee44892592d054cd5c06f049e38651fa9
X-Git-Newrev: 8d163a8a9651f8bd1f06ccc9b042bab9ebd9db40
X-Patchwork-Hint: ignore
Message-Id: <20240105105642.3C9F1843FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] doc/manual: rsync is not
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d163a8a9651f8bd1f06ccc9b042bab9ebd9db40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

rsync is used in the infrastructure, mostly for the per-package infra,
and for the override-srcdir mechanism, but also to build the manual.
As such, it is not optional but mandatory, and already listed so.

Drop the reference to rsync from the list of optional packages.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b79fb3c224a5a8e687b0bc91dd221efcf7137ea8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 48be489f90..262a5153f5 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
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
