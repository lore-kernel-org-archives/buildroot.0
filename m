Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA22EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4725417A9;
	Tue, 18 Jul 2023 21:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4725417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbbktTiR_y7s; Tue, 18 Jul 2023 21:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA804179C;
	Tue, 18 Jul 2023 21:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEA804179C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1487A1BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF6694148F
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF6694148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnXD0GZ4qLyU for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:19:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1554940280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1554940280
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1F5A87455; Tue, 18 Jul 2023 21:19:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:18:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 525cb6a8fbe04a959ea6e3a21a3f6f8828d7e9dc
X-Git-Newrev: 66d38cfcfdc1b09c7c1e80c71a9f8a7b7558a47b
X-Patchwork-Hint: ignore
Message-Id: <20230718211912.F1F5A87455@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysmb: add the missing
 runtime dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=66d38cfcfdc1b09c7c1e80c71a9f8a7b7558a47b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-tqdm dependency was introduced in 1.2.9 (bump occured in
Buildroot commit 1ffc7b4bb1241eb64272aa78448aac35d67ff4ba).

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
