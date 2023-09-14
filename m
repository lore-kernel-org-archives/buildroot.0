Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B39EEDE99C
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D33610BA;
	Thu, 14 Sep 2023 09:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8D33610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VOehV_srFcm8; Thu, 14 Sep 2023 09:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2374C60D72;
	Thu, 14 Sep 2023 09:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2374C60D72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD04B1BF42E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89207416E6
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89207416E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgZSCU7hNy3Z for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:52:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2CED408D5
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2CED408D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2DDA86F2D; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:48:59 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 08d60b1c61177bc72a7813e76296a1faeaef21f1
X-Git-Newrev: efca66f637649bb1c9cc584123571fe786505a30
X-Patchwork-Hint: ignore
Message-Id: <20230914095229.E2DDA86F2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-ipython:
 ignore CVE-2023-24816
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

commit: https://git.buildroot.net/buildroot/commit/?id=efca66f637649bb1c9cc584123571fe786505a30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

It affects only Windows, so we don't care in the context of Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a9c74c5b7f4b2fb35ee32c2f1f8fffdd16d4db85)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ipython/python-ipython.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index f5a114c2f3..aa274314eb 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -11,6 +11,8 @@ PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
 PYTHON_IPYTHON_CPE_ID_PRODUCT = ipython
+# Affects only Windows. Can be dropped once we update to >= 8.10.0
+PYTHON_IPYTHON_IGNORE_CVES += CVE-2023-24816
 PYTHON_IPYTHON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
