Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21B8C83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B73B40A5B;
	Sat, 26 Aug 2023 18:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B73B40A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZgr549iJfMJ; Sat, 26 Aug 2023 18:51:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C16C340A65;
	Sat, 26 Aug 2023 18:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C16C340A65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1528E1BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4956B4109B
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4956B4109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dONyr5d09cMp for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:49:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FFB8409FC
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FFB8409FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4004986417; Sat, 26 Aug 2023 18:49:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 19:22:36 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 29715b801e9deaca92929a2bd984b8dd3996de8f
X-Git-Newrev: 2ed983f7cec80577ca083209a7b099f207cd0660
X-Patchwork-Hint: ignore
Message-Id: <20230826184906.4004986417@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/python-pysmb: add
 the missing runtime dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ed983f7cec80577ca083209a7b099f207cd0660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

python-tqdm dependency was introduced in 1.2.9 (bump occured in
Buildroot commit 1ffc7b4bb1241eb64272aa78448aac35d67ff4ba).

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 66d38cfcfdc1b09c7c1e80c71a9f8a7b7558a47b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pysmb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pysmb/Config.in b/package/python-pysmb/Config.in
index 61d7c2a03e..bb935dddf1 100644
--- a/package/python-pysmb/Config.in
+++ b/package/python-pysmb/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_PYSMB
 	bool "python-pysmb"
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_PYTHON_PYASN1
+	select BR2_PACKAGE_PYTHON_TQDM
 	help
 	  pysmb is an experimental SMB/CIFS library written in Python.
 	  It implements the client-side SMB/CIFS protocol (SMB1 and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
