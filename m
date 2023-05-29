Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19447C77B7A
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 14:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B86C1405B5;
	Mon, 29 May 2023 14:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B86C1405B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FuBqBqEpxxQ5; Mon, 29 May 2023 14:59:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC86440471;
	Mon, 29 May 2023 14:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC86440471
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A66C1BF215
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 14:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0D7B6115B
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 14:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0D7B6115B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80bFTZupVka7 for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 14:59:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 000B66111B
 for <buildroot@buildroot.org>; Mon, 29 May 2023 14:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 000B66111B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3BAF86A40; Mon, 29 May 2023 14:59:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 May 2023 16:57:58 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e69bd1179cae7e2008ca7bd63570e42ea1a35fd7
X-Git-Newrev: f1237f0429160e5c49a8869a72966aebd8d45968
X-Patchwork-Hint: ignore
Message-Id: <20230529145918.E3BAF86A40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-can: add
 missing setuptools runtime dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1237f0429160e5c49a8869a72966aebd8d45968
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The commit [1] removed setuptools from runtime dependencies
"Drop spurious setuptools runtime dependency.". Since then
the test TestPythonPy3Can fail with the following error:

  ModuleNotFoundError: No module named 'pkg_resources'

Add back setuptools to provide "pkg_resources".

Fixes
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819285

[1] 09c966af735ca53b447f52965d123c21e43ae522

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8ac1458e8162ab9d3ac3c5354c874a00bdf36d57)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-can/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 5d21e29d88..68a9ffca71 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_AENUM # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
