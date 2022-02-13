Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08B7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 19:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795C3813CD;
	Sun, 13 Feb 2022 19:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dRMXfU6T_15L; Sun, 13 Feb 2022 19:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C45AC813BD;
	Sun, 13 Feb 2022 19:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E3521BF29A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 19:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1945660B94
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 19:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id looKVjA_l0iH for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 19:51:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EE7A607A8
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 19:51:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7F3C082582; Sun, 13 Feb 2022 19:44:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 20:50:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f93039e3a6f0177675a4f775d762d665204714c9
X-Git-Newrev: 35e2f68c30515598014a9ef4daf7c8f6134aeb74
X-Patchwork-Hint: ignore
Message-Id: <20220213194421.7F3C082582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-psutil: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=35e2f68c30515598014a9ef4daf7c8f6134aeb74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host variant to avoid the following build failure with mongodb since
drop of python3-psutil in commit
aab7bc4a1d499b3f926464290eee3d6459d0e816:

make: *** No rule to make target 'host-python-psutil', needed by '/home/buildroot/autobuild/instance-3/output-1/build/mongodb-4.2.18/.stamp_configured'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/3bce147b6b34d8854e54fc1102a047fcb2c19d01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-psutil/python-psutil.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 413fc8a391..3a2781c284 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -14,3 +14,4 @@ PYTHON_PSUTIL_CPE_ID_VENDOR = psutil_project
 PYTHON_PSUTIL_CPE_ID_PRODUCT = psutil
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
