Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E245C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 17:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD938176B;
	Sun,  6 Aug 2023 17:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBD938176B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Md9b98gfTlfx; Sun,  6 Aug 2023 17:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B9718193E;
	Sun,  6 Aug 2023 17:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B9718193E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 395291BF2BE
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AD6760B8B
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AD6760B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOR08olDycL9 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96DAC60B21
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96DAC60B21
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 850ED84552; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 18:06:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6f372eb8ecb00a06be53ab3c131e57e2d8d6e24b
X-Git-Newrev: 52c87da4a4cbc9bd78460d0227e1b1fbf95f4844
X-Patchwork-Hint: ignore
Message-Id: <20230806172337.850ED84552@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-ipython-genutils: switch from distutils to setuptools
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

commit: https://git.buildroot.net/buildroot/commit/?id=52c87da4a4cbc9bd78460d0227e1b1fbf95f4844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ipython-genutils/python-ipython-genutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ipython-genutils/python-ipython-genutils.mk b/package/python-ipython-genutils/python-ipython-genutils.mk
index 4e8cc287fe..08a0b8ba9a 100644
--- a/package/python-ipython-genutils/python-ipython-genutils.mk
+++ b/package/python-ipython-genutils/python-ipython-genutils.mk
@@ -9,6 +9,6 @@ PYTHON_IPYTHON_GENUTILS_SOURCE = ipython_genutils-$(PYTHON_IPYTHON_GENUTILS_VERS
 PYTHON_IPYTHON_GENUTILS_SITE = https://pypi.python.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
 PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_GENUTILS_LICENSE_FILES = COPYING.md
-PYTHON_IPYTHON_GENUTILS_SETUP_TYPE = distutils
+PYTHON_IPYTHON_GENUTILS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
