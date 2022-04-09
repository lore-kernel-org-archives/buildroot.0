Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01344C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 14:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD4E843C5;
	Sat,  9 Apr 2022 14:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4St2bKFd7amB; Sat,  9 Apr 2022 14:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B06A3843FB;
	Sat,  9 Apr 2022 14:04:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56EA91BF592
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 449DA600C6
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVtSaF0j-hzT for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 14:03:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DC3D6058A
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 14:03:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1657B8344D; Sat,  9 Apr 2022 13:53:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 12:48:55 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0e8dd13bf892cbcec21d6845a9fa9c9a49fab24b
X-Git-Newrev: a591dafceaba29d1bd1771e50ed7dfa9265ad73d
X-Patchwork-Hint: ignore
Message-Id: <20220409135355.1657B8344D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-greenlet:
 disable cpp test
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

commit: https://git.buildroot.net/buildroot/commit/?id=a591dafceaba29d1bd1771e50ed7dfa9265ad73d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable cpp test to avoid the following build failure without C++ raised
since the addition of the package in commit
826ef33bedc0f2f39a38622f066978cd9cc05226 and
https://github.com/python-greenlet/greenlet/commit/d9cb12af26da2abbabe9f05101564866f25a74e2:

powerpc64-buildroot-linux-gnu-gcc.br_real: error: src/greenlet/tests/_test_extension_cpp.cpp: C++ compiler not installed on this system

Fixes:
 - http://autobuild.buildroot.org/results/1140463b8b2407c2a28b9a955efab6037ee7dbeb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b91bf2dbe6dc57ca85598730617b4eaccbe7433b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-greenlet/python-greenlet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 3b1ef7e314..72d2747970 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -10,6 +10,7 @@ PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/0c/10/754e21b5bea
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
+PYTHON_GREENLET_ENV = GREENLET_TEST_CPP=no
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
