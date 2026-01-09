Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD643D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D2B860BF3;
	Tue, 13 Jan 2026 19:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzZC_7cq36Iu; Tue, 13 Jan 2026 19:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D11A60BFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768332998;
	bh=rySivY0mVkuLlPdt4iqEvfj16XZhYsJge3vR+iKYA9g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kUiHCXM3ss24kwLqpfkkbX/KPeYZHdYZ2t3cmyPnhuZRVgJJ/uXTYH2c3XP9XdzK5
	 4j58jY2Mj5yolJAgLx5w+AmXFscasui8JMr6mWqu8tOv+v5BK5QTOeQSaleazJk6dG
	 GJJO2C/OsmQHif+MouJimp7KmMFuzCm9YDIud/aYK0+C6MqlpsG8yypEL0LhAMlYDM
	 TjHk6jjnFNDkvlyBwbOY0IaDPS0tuabAkBLkgmy9jpcBIaOjRn3bdeAcz/FWkj8g80
	 ywbtGkeyajS6zx8LawYrIWSSp40a6tLyLb2o9eeE3zVSnONASkQyn3rKZ9AHvTOWay
	 KzIocFBunSong==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D11A60BFF;
	Tue, 13 Jan 2026 19:36:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E88231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70ABD82CB7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xctEQcvhRcnQ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69CDC82C5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69CDC82C5E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 679B78123D; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:17:44 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fdfd19dc15db492a55d7b2dc2618ff9ec3cd336a
X-Git-Newrev: 32dcee9454ea81c3be9b834a08d56f1df2b2ba04
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.679B78123D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pyqt5:
 disable qt5webkit module
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32dcee9454ea81c3be9b834a08d56f1df2b2ba04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Due to issues in the installation of qt5webkit, building the
corresponding Python binding fails:

Project ERROR: Unknown module(s) in QT: webkit
Error: /home/thomas/buildroot/br/output-all/host/bin/qmake failed to create a
makefile from PyQt5.pro.
make[1]: *** [package/pkg-generic.mk:263: /home/thomas/buildroot/br/output-all/build/python-pyqt5-5.15.6/.stamp_configured] Error 1
make: *** [Makefile:83: _all] Error 2

https://lore.kernel.org/buildroot/20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com/
was an attempt at fixing it, but this patch doesn't work and looks
weird.

So for the time being, disable the Webkit module in python-pyqt5. This
issue has indeed been around for as far as 2022.

Fixes:

  https://autobuild.buildroot.net/results/b9d69d21e734aa62a6e0b4d4124c2bcfc027ebe4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b3e9dc303e0fb883c42954f9eaf3fe70001bd714)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyqt5/python-pyqt5.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index bee0c529ca..1ab9cea4ad 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -91,13 +91,6 @@ PYTHON_PYQT5_DEPENDENCIES += qt5webchannel
 PYTHON_PYQT5_MODULES += QtWebChannel
 endif
 
-ifeq ($(BR2_PACKAGE_QT5WEBKIT),y)
-PYTHON_PYQT5_DEPENDENCIES += qt5webkit
-PYTHON_PYQT5_MODULES += \
-	QtWebKit \
-	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtWebKitWidgets)
-endif
-
 ifeq ($(BR2_PACKAGE_QT5WEBSOCKETS),y)
 PYTHON_PYQT5_DEPENDENCIES += qt5websockets
 PYTHON_PYQT5_MODULES += QtWebSockets
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
