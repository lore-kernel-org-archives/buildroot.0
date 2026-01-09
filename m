Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F327AD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A315483E60;
	Tue, 13 Jan 2026 19:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sKicr2Pa0It; Tue, 13 Jan 2026 19:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49F9583E4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333265;
	bh=JBXzqlCvG98PXZ8/iYS1AQl+HK3cxLvYKaXhgmxlIVA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZHlwX5PIjTh7I2rCso/N4rq7QQNxxOaHqdOHR4+v28147t/HGTcw+CZx8ZLnqsoUX
	 lEtLHcMFWYjjvv7qP9m8WAvLxLS6BcgP4Zuk9UzG9Uw+VtbbNub5Km5DEI0V9vrdTu
	 X8L3pwf9WUeXhhR0YP5a7B6gDgCJp6vCd6WU/rrh13J06ED0t39iGD1XM1I3QQYk3R
	 u6G4/Q2pAYcZyLDFv3JYeYHqgY4EWHRG2vc/AOS3695oDZcnzn2XDiiCeKMziK8/xV
	 xvZ0F0KdUcfFcBW0MFuN8oVvAA/wHxlkO+OAK6CIt5W4FyweH8u0f6aXGT+hcreGYN
	 oEvA2YxBY2WPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49F9583E4A;
	Tue, 13 Jan 2026 19:41:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02EAC1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAEBF82FBE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K28HeHTzUrCd for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C8382A72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35C8382A72
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 335548256D; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:17:46 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 127b327b997e1faa2e7dd2a4060d8f7207cba2e8
X-Git-Newrev: a82e419c3dd25355593180264e5dd998868964fb
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.335548256D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-pyqt5:
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

commit: https://git.buildroot.net/buildroot/commit/?id=a82e419c3dd25355593180264e5dd998868964fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
