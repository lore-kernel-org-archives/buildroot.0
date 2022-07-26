Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70D9C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 22:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460D980BBC;
	Tue, 26 Jul 2022 22:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460D980BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-7JD4XcSZ1K; Tue, 26 Jul 2022 22:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A7580BAA;
	Tue, 26 Jul 2022 22:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A7580BAA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5E91BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 011694018E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 011694018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6YeaKbBGP_uy for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 22:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30B5840012
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 22:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30B5840012
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 85B1C863FE; Tue, 26 Jul 2022 21:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 23:57:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69e84008abf87eaeeb3f2d53c880cf33492a3bf8
X-Git-Newrev: f3d5916a9fde5d1bd451b7705a17c3553ac43de2
X-Patchwork-Hint: ignore
Message-Id: <20220726214921.85B1C863FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/prerequisite.txt: add diffutils
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7665012790623671208=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7665012790623671208==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f3d5916a9fde5d1bd451b7705a17c3553ac43de2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The command `cmp` is used by `package/pkg-generic.mk` at commit
8623cc5deb5. This command is provided by `diffutils`, so it should be
installed on the host system.

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============7665012790623671208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7665012790623671208==--
