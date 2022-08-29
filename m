Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBACECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 11:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70AF560FAF;
	Mon, 29 Aug 2022 11:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70AF560FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RHmLvodN4MaM; Mon, 29 Aug 2022 11:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90B2660B98;
	Mon, 29 Aug 2022 11:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90B2660B98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 657BA1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F41F41694
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F41F41694
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4dJptVk1CCx for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 11:36:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53FE24148F
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 11:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53FE24148F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4B63F87F51; Mon, 29 Aug 2022 11:21:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 13:11:15 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 54b27ca9590029e1ebae998b73fb3466370a0f75
X-Git-Newrev: 8657bd624385519fc457a66b126f5c72a452fcc4
X-Patchwork-Hint: ignore
Message-Id: <20220829112111.4B63F87F51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
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
Content-Type: multipart/mixed; boundary="===============6564092120417768507=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6564092120417768507==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8657bd624385519fc457a66b126f5c72a452fcc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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

--===============6564092120417768507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6564092120417768507==--
