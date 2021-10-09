Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC02EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7359260F6F
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7359260F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53E5F40729;
	Sat,  9 Oct 2021 12:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x0Brb5--jnCJ; Sat,  9 Oct 2021 12:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B19D740714;
	Sat,  9 Oct 2021 12:08:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B14C21BF95F
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE4254068E
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xoSP4sA3vEo for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:03:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1163240685
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:03:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A145947C3; Sat,  9 Oct 2021 12:00:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:48:28 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 780c26a1073fe01c82856443284446b8ce73a314
X-Git-Newrev: c387763d2f32968958bbb6b1b7cb8b63e20ce233
X-Patchwork-Hint: ignore
Message-Id: <20211009120036.4A145947C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/supervisor: drop
 python-meld3 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c387763d2f32968958bbb6b1b7cb8b63e20ce233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

python-meld3 is not a dependency since bump to version 4.1.0 in commit
5da3e1a3e6ccd3c0bfc7e3a9ebe0b14f903af518 and
https://github.com/Supervisor/supervisor/commit/d09d843493eb77cb8c3df52e1f7e636ad0e5b4dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cd5dc168e958a24cf3777d3936b3c69ce5f536b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supervisor/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index 623c3a836e..7ca3cae134 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_MELD3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime dependency
 	help
 	  A client/server system that allows its users to control a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
