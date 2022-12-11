Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C829C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 425E34054A;
	Sun, 11 Dec 2022 17:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 425E34054A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxBYAEaoJnq3; Sun, 11 Dec 2022 17:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 370164090B;
	Sun, 11 Dec 2022 17:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 370164090B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C17661BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CB114047B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CB114047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I95TpBN0Gjxn for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:05:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D311240241
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D311240241
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1574864D5; Sun, 11 Dec 2022 17:05:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 18:05:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5dd4caaa011b1efffc522d0d313725a195cfee7f
X-Git-Newrev: 889c7815ed5fca418ca02dda9a8f5fcf8674fac4
X-Patchwork-Hint: ignore
Message-Id: <20221211170557.C1574864D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypa-build: drop
 host-python-tomli dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=889c7815ed5fca418ca02dda9a8f5fcf8674fac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-python-tomli dependency is not required on python version
3.11 and newer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pypa-build/python-pypa-build.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index b78aefe855..adc124b074 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -12,7 +12,6 @@ PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
 HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
 	host-python-packaging \
-	host-python-pep517 \
-	host-python-tomli
+	host-python-pep517
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
