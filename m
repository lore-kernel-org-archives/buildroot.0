Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8B4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 15:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A6084B99;
	Fri, 14 Jan 2022 15:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bZpsolEVE2Wh; Fri, 14 Jan 2022 15:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53CB383E3A;
	Fri, 14 Jan 2022 15:57:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44C2D1C115D
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D367404A8
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oz1jfdsqYSES for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 15:56:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DFEF400FE
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 15:56:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 72C8D835B1; Fri, 14 Jan 2022 15:50:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 16:25:26 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 391ef106dd2ec69d56b059c095d1b97bf08a5382
X-Git-Newrev: ad12d3f7a3861540c154b0750494babdc6934cb3
X-Patchwork-Hint: ignore
Message-Id: <20220114155011.72C8D835B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/python-urllib3:
 add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad12d3f7a3861540c154b0750494babdc6934cb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

A host variant of the python-urllib3 package will be needed for the
host-python-requests package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit dccfefafd442f908acd44f521b2311281d18ca13)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-urllib3/python-urllib3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index a1d22e023a..9580d9b6b9 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -12,5 +12,7 @@ PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
 PYTHON_URLLIB3_CPE_ID_PRODUCT = urllib3
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
+HOST_PYTHON_URLLIB3_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
