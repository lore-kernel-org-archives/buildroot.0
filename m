Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50FECF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B58D400D1;
	Sat, 12 Oct 2024 14:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IihHQc8XErUv; Sat, 12 Oct 2024 14:15:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35579402D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35579402D0;
	Sat, 12 Oct 2024 14:15:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A04C1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAAC740858
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STWOIm_13516 for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBEFF40781
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBEFF40781
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C938485CC4; Sat, 12 Oct 2024 14:15:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 16:12:42 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 920e7f06df2646a0f8b60876d3dbab284c01f479
X-Git-Newrev: 2b0dd4ca7e156815c338e253f8906cc46d3bd412
X-Patchwork-Hint: ignore
Message-Id: <20241012141536.C938485CC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 docs/manual/configure.adoc: fix location of Busybox inittab
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b0dd4ca7e156815c338e253f8906cc46d3bd412
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 89d39fc7a392 "initscripts: new package" moved the inittab
packaged for Busybox init from system/skeleton/etc to package/busybox.
The manual, however, still points to the old location, so let's fix it.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 99b1685fd8db8e63c37edac4e544f62ead245b90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/configure.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/configure.adoc b/docs/manual/configure.adoc
index d27cdf3eb9..e0358aa0f9 100644
--- a/docs/manual/configure.adoc
+++ b/docs/manual/configure.adoc
@@ -399,7 +399,7 @@ can be chosen from +System configuration+, +Init system+:
    BusyBox +inittab+ syntax is special: do not use a random +inittab+
    documentation from the Internet to learn about BusyBox
    +inittab+). The default +inittab+ in Buildroot is stored in
-   +system/skeleton/etc/inittab+. Apart from mounting a few important
+   +package/busybox/inittab+. Apart from mounting a few important
    filesystems, the main job the default inittab does is to start the
    +/etc/init.d/rcS+ shell script, and start a +getty+ program (which
    provides a login prompt).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
