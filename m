Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC65C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 19:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFCA3600CD;
	Mon, 31 Jan 2022 19:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDfycCNcRQiv; Mon, 31 Jan 2022 19:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1204F606BF;
	Mon, 31 Jan 2022 19:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2C951BF973
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C191C82CCA
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYy2p7YO0KG7 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 19:57:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AD9B82CB7
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 19:57:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A035982825; Mon, 31 Jan 2022 19:50:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 20:55:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea8579141c1af9e3afc08e1d398e5187a67f38cd
X-Git-Newrev: bebeb772eb0b28ab1488ce91bc59a06a573ee6e5
X-Patchwork-Hint: ignore
Message-Id: <20220131195022.A035982825@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: build shared core
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

commit: https://git.buildroot.net/buildroot/commit/?id=bebeb772eb0b28ab1488ce91bc59a06a573ee6e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build JavaScriptCore and WebCore as shared libraries to avoid a build
failure

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5webkit/qt5webkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index de3c428fbe..565c57e813 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -42,6 +42,7 @@ QT5WEBKIT_CONF_OPTS += \
 	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
+	-DSHARED_CORE=ON \
 	-DUSE_LIBHYPHEN=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
