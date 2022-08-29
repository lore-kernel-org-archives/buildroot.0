Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1622DECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 11:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8FC260AF4;
	Mon, 29 Aug 2022 11:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8FC260AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XDOc1ZuHrSu; Mon, 29 Aug 2022 11:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEBD960F54;
	Mon, 29 Aug 2022 11:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEBD960F54
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 997FB1BF9A4
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B5EB416D5
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B5EB416D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33CQf54t8vV1 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 11:36:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EBCE416D0
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 11:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EBCE416D0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6010687F38; Mon, 29 Aug 2022 11:21:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 13:11:42 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 977ffdb2005c1978930433be4b479667c1efdd40
X-Git-Newrev: cbc6b03ebc84571ba61c79ac974c2f603d1b477a
X-Patchwork-Hint: ignore
Message-Id: <20220829112105.6010687F38@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 docs/manual/prerequisite.txt: add diffutils
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
Content-Type: multipart/mixed; boundary="===============5964426776616871011=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5964426776616871011==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cbc6b03ebc84571ba61c79ac974c2f603d1b477a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The command `cmp` is used by `package/pkg-generic.mk` at commit
8623cc5deb5. This command is provided by `diffutils`, so it should be
installed on the host system.

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f3d5916a9fde5d1bd451b7705a17c3553ac43de2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 40071491f8..763fe79041 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -23,6 +23,7 @@ between distributions).
 ** +make+ (version 3.81 or any later)
 ** +binutils+
 ** +build-essential+ (only for Debian based systems)
+** +diffutils+
 ** +gcc+ (version 4.8 or any later)
 ** `g++` (version 4.8 or any later)
 ** +bash+

--===============5964426776616871011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5964426776616871011==--
