Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0425C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 22:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB694847CA;
	Thu, 10 Mar 2022 22:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYgzujjCYcMK; Thu, 10 Mar 2022 22:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34B5847C1;
	Thu, 10 Mar 2022 22:32:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 444101BF34D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7897161287
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GgjBd3G8hFVe for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 22:31:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28F5260BBC
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 22:31:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7A2AA83C6F; Thu, 10 Mar 2022 22:22:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 23:02:13 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9884d674d1788124194e0dc8757830ad832af320
X-Git-Newrev: 0879a8e26c3455f9c06f83266e2374c271a329fc
X-Patchwork-Hint: ignore
Message-Id: <20220310222247.7A2AA83C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-twisted:
 security bump to version 22.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0879a8e26c3455f9c06f83266e2374c271a329fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2022-21712: twisted is an event-driven networking engine written
in Python. In affected versions twisted exposes cookies and
authorization headers when following cross-origin redirects. This issue
is present in the `twited.web.RedirectAgent` and `twisted.web.
BrowserLikeRedirectAgent` functions. Users are advised to upgrade. There
are no known workarounds.

Update hash of license file (author added and update in year:
https://github.com/twisted/twisted/commit/13aa59746a73769b05a51c2198b28f5602dd382f
https://github.com/twisted/twisted/commit/adfdf23477abfcd09a867347993fc1d207cfb4dd
https://github.com/twisted/twisted/commit/7e65fbeed3d74a4eb1c40d7a6df5651782becbc8)

https://github.com/twisted/twisted/security/advisories/GHSA-92x2-jw7w-xvvx
https://github.com/twisted/twisted/releases/tag/twisted-22.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit af37e96f3d85a687503c85e7d2e37cfbd791dd18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index c633112e9d..8f0935e4f0 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  fc16d575730db7d0cddd09fc35af3eea  Twisted-20.3.0.tar.bz2
-sha256  d72c55b5d56e176563b91d11952d13b01af8725c623e498db5507b6614fc1e10  Twisted-20.3.0.tar.bz2
+md5  c818cb1ab241dc249517442e5a0e0412  Twisted-22.1.0.tar.gz
+sha256  b7971ec9805b0f80e1dcb1a3721d7bfad636d5f909de687430ce373979d67b61  Twisted-22.1.0.tar.gz
 # Locally computed sha256
-sha256  98426fd47315df70098e0d85efbb5d7dd8001c9c536386937354640d6d8d75b9  LICENSE
+sha256  686f6426a775450eb3afd00bc3a5c2621f305ddb9c8478ee9bf28a368ef2dece  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 49d97af097..8e867cfb58 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 20.3.0
-PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/4a/b4/4973c7ccb5be2ec0abc779b7d5f9d5f24b17b0349e23240cfc9dc3bd83cc
+PYTHON_TWISTED_VERSION = 22.1.0
+PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/77/b8/8108806ebf2b33654989fd1511281dc94a49fa7e03326d84fe5498ecfae4
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
