Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600CCC71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CA144051B;
	Sun, 10 Sep 2023 21:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CA144051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fg1iib-fIfK7; Sun, 10 Sep 2023 21:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6964540AEB;
	Sun, 10 Sep 2023 21:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6964540AEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 541C81BF8C7
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B3B940A17
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B3B940A17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hWcTFC16O9bD for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DE6040A21
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DE6040A21
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DDD286BF7; Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 23:14:05 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: ce1b80f27dc86d7b23aa221b7d1601dcd57e451e
X-Git-Newrev: 39d0bbf21d7fce021908b335a3744653040079f0
X-Patchwork-Hint: ignore
Message-Id: <20230910214436.6DDD286BF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/python-pylibfdt:
 add host python package
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

commit: https://git.buildroot.net/buildroot/commit/?id=39d0bbf21d7fce021908b335a3744653040079f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 05a0adea8355ba0901d5af02548a57657a2af89d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pylibfdt/python-pylibfdt.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index dc68de83b3..077c60c093 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -11,5 +11,7 @@ PYTHON_PYLIBFDT_SETUP_TYPE = setuptools
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
 PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
+HOST_PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
