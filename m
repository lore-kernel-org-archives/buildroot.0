Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B64C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68D96405CA;
	Sat, 26 Aug 2023 18:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D96405CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wA5g20L-rq7; Sat, 26 Aug 2023 18:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7F4F409E3;
	Sat, 26 Aug 2023 18:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F4F409E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBEDB1BF867
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AA1341488
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AA1341488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcXmuEe1KzDj for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFC2041484
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC2041484
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E2C3863F6; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 19:22:23 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a856114c6b1337fa81cf4390d4fbddccc1b9e0da
X-Git-Newrev: b7c0e5fb01b198760dc989638fe18eb8e63f2e54
X-Patchwork-Hint: ignore
Message-Id: <20230826184802.9E2C3863F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-pysmb: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7c0e5fb01b198760dc989638fe18eb8e63f2e54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
