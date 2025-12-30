Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23922EE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A8FE608A0;
	Tue, 30 Dec 2025 21:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZExFsYJIHAXE; Tue, 30 Dec 2025 21:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CA7F608E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767128785;
	bh=hFb+qYubUQ0EYC3X/rYDU63OgSzOs11k3MxasA6a9KY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EKSNSmzKKnFQ9V1tOzmVbAKnKN9/LfbhUMZr0s5OdLKf2SBZRTJCvcZrGRBNEOiGk
	 F7JPqWwNRSmGaPdBn0KwFwnBHlBvVIlvDmkmyojOOqQjytwONZnGYNta96jaQ/bZqn
	 rGKObygYQtO7ErgFUnSwW3EkgRSzc/2gAj3je5pHlAYwSfdCsYmz3a/ouabfrZRU5T
	 dZtSyhKUl1pTuKcAu6I50OmYweKBqf8llvYpKQrG8Qhy47h+/GYMqCIkCzgQ/Px9PF
	 udezqMiit7xfY5acudI47zuGCgWkpiOOLy9nRH64q6ARU0SbKv4zmIreBAGCwpEADQ
	 SdQNGZKbvHGoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CA7F608E3;
	Tue, 30 Dec 2025 21:06:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAD7A177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E778380B0A
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUWZPGJ1B9_N for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF0480970
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF0480970
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 076BA87CA5; Tue, 30 Dec 2025 21:06:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 21:51:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b79eb5a28f50b54078eff5c92fb2c00ac05a2882
X-Git-Newrev: b3e9dc303e0fb883c42954f9eaf3fe70001bd714
X-Patchwork-Hint: ignore
Message-Id: <20251230210622.076BA87CA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyqt5: disable qt5webkit
 module
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b3e9dc303e0fb883c42954f9eaf3fe70001bd714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
