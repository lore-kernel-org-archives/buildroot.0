Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F96CC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 22:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F25A6FA4A;
	Fri,  8 Dec 2023 22:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F25A6FA4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LRioVTpbdiN0; Fri,  8 Dec 2023 22:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D1376FA1E;
	Fri,  8 Dec 2023 22:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D1376FA1E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED9311BF995
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 22:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3122417F6
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 22:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3122417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRao9igKW2yx for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 22:42:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22525417E0
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 22:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22525417E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01DB48797E; Fri,  8 Dec 2023 22:42:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 8 Dec 2023 23:41:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50ae5ea963b7ed34b1511d4d2487bef083f5b1a7
X-Git-Newrev: 41cc3b3a3f338068924a197745fdc3587218cadc
X-Patchwork-Hint: ignore
Message-Id: <20231208224244.01DB48797E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=41cc3b3a3f338068924a197745fdc3587218cadc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6b915358babe introduced PKG_PYTHON_MATURIN_INSTALL_CMD while
it should be HOST_PKG_PYTHON_MATURIN_INSTALL_CMD.

Adding any new host python package using maturin setup type will
fail during the install step.

Fixes: 6b915358babe37a721b4f6e032ec884174bd6e0b

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index bda79116c8..4bed5a1835 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -258,8 +258,8 @@ HOST_PKG_PYTHON_MATURIN_ENV = \
 HOST_PKG_PYTHON_MATURIN_BUILD_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
 
-PKG_PYTHON_MATURIN_INSTALL_CMD = \
-	$(PKG_PYTHON_PEP517_INSTALL_CMD)
+HOST_PKG_PYTHON_MATURIN_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
 
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
