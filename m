Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B18C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 23:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D780460AA9;
	Sat,  8 Jan 2022 23:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XM7IC4KqHHaG; Sat,  8 Jan 2022 23:16:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A62C60AC9;
	Sat,  8 Jan 2022 23:16:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 744971BF27E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D837881446
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UIZ7BbJGyZzE for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 331C281447
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EB8AA813AC; Sat,  8 Jan 2022 23:10:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 00:15:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12e3527fd97df9ae1b60b892c61d10ce291b7a00
X-Git-Newrev: bf0cc7d7b4fecde6c350bd886e7f60b95660ef10
X-Patchwork-Hint: ignore
Message-Id: <20220108231001.EB8AA813AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-extensions: add host
 variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf0cc7d7b4fecde6c350bd886e7f60b95660ef10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by a newer version of host-python-setuptools-rust.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typing-extensions/python-typing-extensions.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 46c2977cd7..407fe99b54 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -10,5 +10,7 @@ PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/ed/12/c5
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = setuptools
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
+HOST_PYTHON_TYPING_EXTENSIONS_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
