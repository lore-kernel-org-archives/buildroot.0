Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C2CEC8735
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 14:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5262408F0;
	Thu,  7 Sep 2023 14:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5262408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Q2SZeU57mB4; Thu,  7 Sep 2023 14:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C350E403D8;
	Thu,  7 Sep 2023 14:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C350E403D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCA131BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE7508225A
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE7508225A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKXORD4RLjGB for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB4EB81FFD
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB4EB81FFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D92FA86A27; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 18:06:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97688e4258862aa8b602f7ec51ec1bce7391e84c
X-Git-Newrev: 78ba3e6f2d26cdd488f9f845e1169d46b70f2912
X-Patchwork-Hint: ignore
Message-Id: <20230907145126.D92FA86A27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyalsa: switch from
 distutils to setuptools
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

commit: https://git.buildroot.net/buildroot/commit/?id=78ba3e6f2d26cdd488f9f845e1169d46b70f2912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyalsa/python-pyalsa.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
index cc5e2ec9a0..1661fe47b4 100644
--- a/package/python-pyalsa/python-pyalsa.mk
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -7,7 +7,7 @@
 PYTHON_PYALSA_VERSION = 1.2.7
 PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
 PYTHON_PYALSA_SITE = https://www.alsa-project.org/files/pub/pyalsa
-PYTHON_PYALSA_SETUP_TYPE = distutils
+PYTHON_PYALSA_SETUP_TYPE = setuptools
 PYTHON_PYALSA_LICENSE = LGPL-2.1+
 PYTHON_PYALSA_DEPENDENCIES = alsa-lib
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
