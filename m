Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498ABC001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 17:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E685B81E3A;
	Sun,  6 Aug 2023 17:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E685B81E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZbjMlPlaOtm; Sun,  6 Aug 2023 17:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3626481C11;
	Sun,  6 Aug 2023 17:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3626481C11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D64261BF286
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C557401F1
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C557401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T17W9XuMEFge for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3BDD4028D
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3BDD4028D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B04F78454E; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 18:06:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2182ae07235b90bd08999a3b070f4186bac9f2a5
X-Git-Newrev: f902f95e87d9a4bf030a130a7f6d7d9c35fc0ba0
X-Patchwork-Hint: ignore
Message-Id: <20230806172337.B04F78454E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-ptyprocess:
 switch from distutils to setuptools
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

commit: https://git.buildroot.net/buildroot/commit/?id=f902f95e87d9a4bf030a130a7f6d7d9c35fc0ba0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ptyprocess/python-ptyprocess.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ptyprocess/python-ptyprocess.mk b/package/python-ptyprocess/python-ptyprocess.mk
index d077fbb779..5266019562 100644
--- a/package/python-ptyprocess/python-ptyprocess.mk
+++ b/package/python-ptyprocess/python-ptyprocess.mk
@@ -9,6 +9,6 @@ PYTHON_PTYPROCESS_SITE = https://files.pythonhosted.org/packages/20/e5/16ff212c1
 PYTHON_PTYPROCESS_SOURCE = ptyprocess-$(PYTHON_PTYPROCESS_VERSION).tar.gz
 PYTHON_PTYPROCESS_LICENSE = ISC
 PYTHON_PTYPROCESS_LICENSE_FILES = LICENSE
-PYTHON_PTYPROCESS_SETUP_TYPE = distutils
+PYTHON_PTYPROCESS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
