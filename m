Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33088C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 19:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2CBB4194C;
	Wed,  4 May 2022 19:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pg2RcCFYCPnD; Wed,  4 May 2022 19:48:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85174418FC;
	Wed,  4 May 2022 19:48:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38DE31BF3BE
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A4160D88
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yPOyH8S2a5c0 for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 19:47:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64DB960BD1
 for <buildroot@buildroot.org>; Wed,  4 May 2022 19:47:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D4D8585784; Wed,  4 May 2022 19:36:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 May 2022 21:43:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cc46a07220091afb23228adf4bebb6dee39b64a
X-Git-Newrev: 1be0391f2ffa8cbe2a84cbd6b0919bbd511211f9
X-Patchwork-Hint: ignore
Message-Id: <20220504193655.D4D8585784@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-can: add missing
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=1be0391f2ffa8cbe2a84cbd6b0919bbd511211f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 4.0.0 python-can requires the following additional
packages:

- packaging
- typing_extensions

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-can/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index dc9eb0ae4e..e92d9668e0 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_PYTHON_CAN
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_AENUM # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
