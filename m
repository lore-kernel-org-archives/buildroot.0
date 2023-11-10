Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4338CC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E849742844;
	Fri, 10 Nov 2023 21:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E849742844
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0uwyV1l42tQ; Fri, 10 Nov 2023 21:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD8F42696;
	Fri, 10 Nov 2023 21:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD8F42696
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0A7C1BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5E436F6FB
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E436F6FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6M5mnP2kIiur for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB0DC6101F
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB0DC6101F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B328586FCB; Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:01:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0799123742eb9b60ca109c0ea0cb1728c22bf0a
X-Git-Newrev: 257c88b75e129c28c15a7b60519e342856e36bcb
X-Patchwork-Hint: ignore
Message-Id: <20231110210507.B328586FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-calver: new host package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=257c88b75e129c28c15a7b60519e342856e36bcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-calver/python-calver.hash |  5 +++++
 package/python-calver/python-calver.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-calver/python-calver.hash b/package/python-calver/python-calver.hash
new file mode 100644
index 0000000000..ebc054e617
--- /dev/null
+++ b/package/python-calver/python-calver.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/calver/json
+md5  e1fd924b9bf953c0b28c49bdfe117d7a  calver-2022.6.26.tar.gz
+sha256  e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b  calver-2022.6.26.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-calver/python-calver.mk b/package/python-calver/python-calver.mk
new file mode 100644
index 0000000000..2fd5468ed4
--- /dev/null
+++ b/package/python-calver/python-calver.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-calver
+#
+################################################################################
+
+PYTHON_CALVER_VERSION = 2022.6.26
+PYTHON_CALVER_SOURCE = calver-$(PYTHON_CALVER_VERSION).tar.gz
+PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/b5/00/96cbed7c019c49ee04b8a08357a981983db7698ae6de402e57097cefc9ad
+PYTHON_CALVER_SETUP_TYPE = setuptools
+PYTHON_CALVER_LICENSE = Apache-2.0
+PYTHON_CALVER_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
