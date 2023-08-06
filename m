Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA52C00528
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0975960E85;
	Sun,  6 Aug 2023 21:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0975960E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhbmBNoKDG-F; Sun,  6 Aug 2023 21:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72C9760FEF;
	Sun,  6 Aug 2023 21:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72C9760FEF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13D021BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCA17414E0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCA17414E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jQHLjqXIukB for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC8CF408F7
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC8CF408F7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9BAC84639; Sun,  6 Aug 2023 21:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 23:40:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b05a3948107670e9f6027fd1e7a41e3e91f98255
X-Git-Newrev: 0fe729f70ef695d0f355226d69b7ae7ab4a9b56b
X-Patchwork-Hint: ignore
Message-Id: <20230806215216.D9BAC84639@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pycups: switch
 from distutils to setuptools
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0fe729f70ef695d0f355226d69b7ae7ab4a9b56b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycups/python-pycups.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pycups/python-pycups.mk b/package/python-pycups/python-pycups.mk
index 41da3641a0..bf61400afe 100644
--- a/package/python-pycups/python-pycups.mk
+++ b/package/python-pycups/python-pycups.mk
@@ -7,7 +7,7 @@
 PYTHON_PYCUPS_VERSION = 2.0.1
 PYTHON_PYCUPS_SOURCE = pycups-$(PYTHON_PYCUPS_VERSION).tar.gz
 PYTHON_PYCUPS_SITE = https://files.pythonhosted.org/packages/0c/bb/82546806a86dc16f5eeb76f62ffdc42cce3d43aacd4e25a8b5300eec0263
-PYTHON_PYCUPS_SETUP_TYPE = distutils
+PYTHON_PYCUPS_SETUP_TYPE = setuptools
 PYTHON_PYCUPS_LICENSE = GPL-2.0+
 PYTHON_PYCUPS_LICENSE_FILES = COPYING
 PYTHON_PYCUPS_DEPENDENCIES = cups
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
