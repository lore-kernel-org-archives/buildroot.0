Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC79D59F7A
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B104606AA;
	Wed,  6 Nov 2024 22:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90X9IyLEK_wT; Wed,  6 Nov 2024 22:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BB15606B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BB15606B8;
	Wed,  6 Nov 2024 22:24:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8290CB8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD54D606BD
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pI4hfOle0KFK for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 211D060729
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 211D060729
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E34185EB6; Wed,  6 Nov 2024 22:24:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 23:22:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31fa513c25d7c426aa7cc60c52a6b5345a83ee6d
X-Git-Newrev: b350eba1fc0a5d08b7fd6a5c75832a2299c0f54d
X-Patchwork-Hint: ignore
Message-Id: <20241106222426.1E34185EB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bmap-tools: use poetry setup type
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=b350eba1fc0a5d08b7fd6a5c75832a2299c0f54d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bmap-tools/bmap-tools.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index 3455063e21..3c661cb9e2 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -8,9 +8,7 @@ BMAP_TOOLS_VERSION = 3.8.0
 BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
 BMAP_TOOLS_LICENSE = GPL-2.0
 BMAP_TOOLS_LICENSE_FILES = LICENSE
-BMAP_TOOLS_SETUP_TYPE = setuptools
-BMAP_TOOLS_DEPENDENCIES = host-python-poetry-core
-HOST_BMAP_TOOLS_DEPENDENCIES = host-python-poetry-core
+BMAP_TOOLS_SETUP_TYPE = poetry
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
